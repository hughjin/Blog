package com.hughjin.util.redis;

import com.hughjin.core.exception.RedisException;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * abstractKEY规则组成(见BaseRedisConstant.java)：keytype+业务关键字+后缀 KeyType：由KeyType取得 中部：自定义，业务功能单词 后缀：条件+排序+过期时间三部分组成，
 * {by:字段名=?,字段名=?} {by...}结构开头的为条件，其中?代表具体数值 {order:?ASC|DESC,?_ASC|DESC} {order:}结构，?换成字段名,ASC|DESC为排序方式（二选一）。
 * {exp(expire)=?:过期时间} :过期时间=0永不过期。exp=240，代表240秒。
 * <p>
 * 例子：key最后的格式:list_product_{by:catId=123}{order:catId_asc,name_desc}{exp=300}
 * <p>
 * redis使用总结：1.带翻页的可用List操作。 Lists 2.集合类型的用list与set操作，可不要用里面的排序功能。 Lists.java与Sets.java
 */
public class RedisConstant extends BaseRedisConstant {

    private static final Logger LOGGER = LoggerFactory.getLogger(RedisConstant.class);

    /**
     * 生成实体对象key，实体吸的规则是Entity_[实体名]_{id=?}
     *
     * @param abstractKey :为BaseRedisConstant定义的含规则的key key中的过期时间不能去掉。
     * @param keyId       ：实际传入的id值。
     * @return
     */
    public static <T> String getEntityRedisKey(String abstractKey, T keyId) {
        String prefix = getKeyPrefix(abstractKey);
        String factKey = prefix + "{by:id=" + keyId + "}";
        String expireRule = getExpireRule(abstractKey);
        factKey += expireRule;
        return factKey;
    }

    /**
     * 得到集合等非实体对象的Key key中的过期时间不能去掉。
     *
     * @param <T>
     * @param abstractKey :含有规则的名称
     * @param bys         :条件：key为字段名，value为具体的值
     * @param orders      ：排序：格式:orders:key为字段名，value为asc或desc
     * @return
     */
    public static <T> String getRedisKey(String abstractKey, Map<String, T> bys, Map<String, String> orders) {
        String factKey = getKeyPrefix(abstractKey);
        String where = getConditions(abstractKey, bys);
        String order = getOrders(abstractKey, orders);
        if (StringUtils.isNotBlank(where)) {
            factKey += "{by:" + where + "}";
        }
        if (StringUtils.isNotBlank(order)) {
            factKey += "{order:" + order + "}";
        }
        String expireRule = getExpireRule(abstractKey);
        factKey += expireRule;

        return factKey.toLowerCase();
    }

    /**
     * 返回key的前缀
     *
     * @param key
     */
    public static String getKeyPrefix(String abstractKey) {
        if (abstractKey == null)
            return "";
        String vabstractKey = abstractKey.toLowerCase().replaceAll(" ", "");
        String tag = "{";
        if (vabstractKey.indexOf("{") > -1) {
            vabstractKey = vabstractKey.substring(0, vabstractKey.indexOf(tag));
        }
        return vabstractKey.toLowerCase();
    }

    /**
     * 含有条件的key的取法
     *
     * @param abstractKey
     * @param bys
     * @return
     */
    public static <T> String getRedisKey(String abstractKey, Map<String, T> bys) {
        try {
            if (abstractKey.toLowerCase().indexOf("{order") > -1) {
                throw new RedisException("规则不符！原定key含有排序要求:" + abstractKey);
            }
            return getRedisKey(abstractKey, bys, null);
        } catch (RedisException e) {
            LOGGER.error("规则不符！原定key含有排序要求:" + abstractKey + ":异常信息", e);
        }
        return null;
    }

    /**
     * 不含任何条件的key的取法
     *
     * @param abstractKey
     * @param bys
     * @return
     */
    public static String getRedisKey(String abstractKey) {
        try {
            if (abstractKey.toLowerCase().indexOf("{by") > -1 || abstractKey.toLowerCase().indexOf("{order") > -1) {
                throw new RedisException("规则不符！原定key含有条件或排序要求:" + abstractKey);
            }
            return getRedisKey(abstractKey, null, null);
        } catch (RedisException e) {
            LOGGER.error("规则不符！原定key含有排序要求:" + abstractKey + ":异常信息", e);
        }
        return null;
    }

    /**
     * 得到实际key的某个条件的值
     *
     * @param key      :实际的redis的eky
     * @param whereKey :条件参数
     * @return
     * @author nianxiaoling[14110310]
     * @date 2015年3月31日
     */
    public static String getConditionValue(String key, String whereKey) {
        String tmp = key.substring(key.indexOf("{by:") + 4);
        String where = tmp.substring(0, tmp.indexOf("}"));

        if (StringUtils.isNotBlank(where)) {
            String[] ary = where.split(",");
            for (String v : ary) {
                String by = v.substring(0, v.indexOf("=")).trim();
                String value = v.substring(v.indexOf("=") + 1);
                if (by.equalsIgnoreCase(whereKey)) {
                    return value;
                }
            }
        }
        return null;
    }

    /**
     * 生成条件，以','号分隔，前面无"by"
     *
     * @param <T>
     * @param abstractKey
     * @param bys
     * @return
     */
    public static <T> String getConditions(String abstractKey, Map<String, T> bys) {
        try {
            String whererule = RedisConstant.getConditionRule(abstractKey);
            if (bys == null || whererule == null || bys.size() == 0)
                return null;

            StringBuilder where = new StringBuilder("");
            whererule = whererule.replace(" ", "").toLowerCase();
            for (Map.Entry<String, T> entry : bys.entrySet()) {
                String field = entry.getKey();
                if (field != null && whererule.indexOf(field.toLowerCase() + "=") > -1) {
                    getConditionsConst(where, entry, field);
                } else {
                    throw new RedisException("条件不符！原定条件:" + whererule + ",传入参数:" + bys.toString());
                }
            }
            return where.toString();
        } catch (RedisException e) {
            LOGGER.error("条件不符！原定条件:异常信息", e);
        }
        return null;
    }

    public static <T> void getConditionsConst(StringBuilder where, Map.Entry<String, T> entry, String field) {
        if (where != null && StringUtils.isNotBlank(where.toString())) {
            where.append(",");
            String value = entry.getValue() == null ? "" : String.valueOf(entry.getValue()).trim();
            where.append(field + "=" + value);
        }
    }

    /**
     * 得到条件个数
     *
     * @param keyRule
     * @return
     */
    public static int getConditionCount(String where) {
        if (where == null)
            return 0;
        String[] rules = where.split(",");
        return rules.length;
    }

    /**
     * 生在排序
     *
     * @param abstractKey
     * @param orders
     * @return
     */
    public static <T> String getOrders(String abstractKey, Map<String, T> orders) {
        String orderrule = RedisConstant.getOrderRule(abstractKey);
        StringBuilder order = new StringBuilder("");
        if (orders != null && orders.size() > 0 && orderrule != null) {
            for (Map.Entry<String, T> entry : orders.entrySet()) {
                String field = entry.getKey();
                if (StringUtils.isNotBlank(order.toString())) {
                    order.append(",");
                }
                order.append(field + "_" + entry.getValue());
            }
        }
        return order.toString();
    }

    /**
     * 得到排序条件，全部小写
     *
     * @param key
     */
    public static String getOrderRule(String abstractKey) {
        if (abstractKey == null)
            return null;
        String vabstractKey = abstractKey.toLowerCase().replaceAll(" ", "");
        String tag = "{order:";
        if (vabstractKey.indexOf(tag) > -1) {
            vabstractKey = vabstractKey.substring(vabstractKey.indexOf(tag));
            vabstractKey = vabstractKey.substring(0, vabstractKey.indexOf("}") + 1);
            vabstractKey = vabstractKey.replace("order:", "");
            return vabstractKey.toLowerCase();
        }
        return null;
    }

    /**
     * 得到查询条件，全部小写,中间用逗 号隔开
     *
     * @param key
     */
    public static String getConditionRule(String abstractKey) {
        if (abstractKey == null)
            return null;
        String vabstractKey = abstractKey.toLowerCase().replaceAll(" ", "");
        String tag = "{by:";
        if (vabstractKey != null && vabstractKey.indexOf(tag) > -1) {
            vabstractKey = vabstractKey.substring(vabstractKey.indexOf(tag));
            vabstractKey = vabstractKey.substring(0, vabstractKey.indexOf("}") + 1);
            vabstractKey = vabstractKey.replaceAll("by:", "");
            String c = vabstractKey.substring(1, vabstractKey.length() - 1);
            return c;
        } else if (vabstractKey.toLowerCase().startsWith(KeyType.PO.name().toLowerCase())) {
            vabstractKey = vabstractKey.substring(vabstractKey.indexOf("{"));
            vabstractKey = vabstractKey.substring(0, vabstractKey.indexOf("}") + 1);
            String c = vabstractKey.substring(1, vabstractKey.length() - 1);
            return c;
        }
        return null;
    }

    /**
     * 默认的过期时间是5分钟
     */
    public static String getExpireRule(String key) {
        if (key == null)
            return "{exp=" + FIVE_MIN + "}";
        String vkey = key.toLowerCase().replaceAll(" ", "");

        String tag1 = "{exp=";
        String tag2 = "{exp:";
        try {
            String expireRule = "";
            if (vkey.indexOf(tag1) > -1 || vkey.indexOf(tag2) > -1) {
                if (vkey.indexOf(tag1) > -1) {
                    expireRule = vkey.substring(vkey.indexOf(tag1));
                } else if (vkey.indexOf(tag2) > -1) {
                    expireRule = vkey.substring(vkey.indexOf(tag2));
                }
                expireRule = expireRule.substring(0, expireRule.indexOf("}") + 1);
                return expireRule.toLowerCase();
            } else {
                return "{exp=" + FIVE_MIN + "}";// 默认都5分钟过期
            }
        } catch (Exception e) {
            LOGGER.error(e.getMessage(), e);
            return "{exp=" + FIVE_MIN + "}";
        }
    }

    /**
     * 得到过期时间,如果出现异常，默认五分钟过期
     *
     * @param key
     * @throws ParseException
     */
    public static int getExpire(String key) {
        if (key == null)
            return FIVE_MIN; // key不存在，那么5秒钟过期。
        try {
            String vkey = getExpireRule(key);

            String tag1 = "{exp=";
            String tag2 = "{exp:";
            if (vkey.indexOf(tag1) > -1 || vkey.indexOf(tag2) > -1) {
                if (vkey.indexOf(tag1) > -1) {
                    vkey = vkey.substring(vkey.indexOf(tag1) + tag1.length());
                }
                if (vkey.indexOf(tag2) > -1) {
                    vkey = vkey.substring(vkey.indexOf(tag2) + tag2.length());
                }

                vkey = vkey.substring(0, vkey.indexOf("}"));
                if (vkey.startsWith("to:")) {
                    int time_sec = getExpireToConstructs(vkey);
                    return time_sec;
                    // 到整点小时过期，加上随机数防止并发压力，时间紧简单写，以后整理
                } else if (vkey.startsWith("every:1h")) {
                    int time_sec = getExpireEveryOneConstructs();
                    return time_sec;
                } else if (vkey.startsWith("every:2h")) {
                    int time_sec = getExpireEveryTwoConstructs();
                    return time_sec;
                } else {
                    return Integer.parseInt(vkey);
                }
            } else {
                return FIVE_MIN;
            }
        } catch (Exception e) {
            // 出异常默认为5分钟过期
            LOGGER.error(e.getMessage(), e);
            return FIVE_MIN;
        }
    }

    public static int getExpireEveryTwoConstructs() {
        Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        cal.add(Calendar.HOUR_OF_DAY, 2);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        int time_sec = Math.round((float) (cal.getTimeInMillis() - System.currentTimeMillis()) / 1000);
        if (time_sec <= 0) {
            time_sec = FIVE_MIN;
        }
        return time_sec;
    }

    public static int getExpireEveryOneConstructs() {
        Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        cal.add(Calendar.HOUR_OF_DAY, 1);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, new Random().nextInt(30));
        int time_sec = Math.round((float) (cal.getTimeInMillis() - System.currentTimeMillis()) / 1000);
        if (time_sec <= 0) {
            time_sec = FIVE_MIN;
        }
        return time_sec;
    }

    public static int getExpireToConstructs(String vkey) {
        int toDay = Integer.parseInt(vkey.substring(3, vkey.indexOf("/")));
        String time = vkey.substring(vkey.indexOf("/") + 1);
        if (time.indexOf(":") == time.lastIndexOf(":")) {
            time += ":00";
        }
        SimpleDateFormat onlyDate = new SimpleDateFormat("yyyy-MM-dd");
        String strToDate = onlyDate.format(DateUtils.addDays(new Date(), toDay)) + " " + time;

        Timestamp toDate = Timestamp.valueOf(strToDate);

        long toTime = toDate.getTime();
        int time_sec = Math.round((float) (toTime - System.currentTimeMillis()) / 1000);

        if (time_sec <= 0) {
            time_sec = FIVE_MIN;
        }
        return time_sec;
    }

    //-----------------------生成KEY值--------------------------

    /**
     * 生成Redis的key
     *
     * @param indexKey
     * @param keyNameType
     * @return
     */
    public static String getIndexKey(KeyNameTypeEnum keyNameType) {
        Map<String, String> bys = new LinkedHashMap<String, String>();
        bys.put("indexKey", keyNameType.getIndexKey());
        return RedisConstant.getRedisKey(keyNameType.getTypeCode(), bys);
    }


}
