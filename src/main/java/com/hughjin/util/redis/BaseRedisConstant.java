package com.hughjin.util.redis;

/**
 * redis过期时间常量 key规则： 各种业务前缀+条件({by:id=?})+过期时间({exp="+ QUARTY_HOUR +"}"或{exp=to:n/hh:mm:ss") 过期时间：0代表当当天 1代表明天，2代表后天。
 */
public abstract class BaseRedisConstant {
    /**
     * 用于区分key是集合类的还是单个实体类的。
     */
    public static final String PLACEHOLDER = "######";//占位

    public static final String KEY_COMMON_PREFIX_BLOG = "REDIS:BLOG:";

    public static enum KeyType {
        PO, // 单个实体对像[对象对应个表记录]
        LIST, // LIST集合
        HASH, // 哈希集合
        PAGELIST, // 带翻页的集合
        PAGEINFO, // 带翻页的集合的翻页信息记录，格式{totalcount=?,persize=?,getedpagesize=?,pagesize=?},与PAGELIST一定是成对出现
        TOTAL, // 累计汇总类的
        EXIST, // 判断
        STRING, // string
        BO, // 业务对象
        SET, // SET对象
    }

    // ------------------------------------过期时间设置----------------------------
    private static final int FIVE_SEC = 5; //5秒
    protected static final int FIVE_MIN = 300; // 5分钟
    private static final int QUARTY_HOUR = 900; // 四分之一小时
    private static final int HALF_HOUR = 1800;
    // 1小时
    private static final int ONE_HOUR = 3600;
    // 2小时
    private static final int TWO_HOUR = 7200;
    // 1天
    private static final int ONE_DAY = 24 * ONE_HOUR;
    // 2天
    private static final int TWO_DAY = 48 * ONE_HOUR;
    //1.5天
    private static final int ONE_HALF_DAY = 36 * ONE_HOUR;
    //一周
    private static final int WEEK = 7 * 24 * ONE_HOUR;
    // 半天
    private static final int HALF_DAY = 12 * ONE_HOUR;

    // 18小时
    private static final int PASS_HALF_DAY = 18 * ONE_HOUR;
    // 10分钟
    private static final int TEN_MIN = 600;
    // 1分钟
    private static final int ONE_MIN = 60;
    // 2分钟
    private static final int TWO_MIN = 120;
    // 半分钟
    private static final int HALF_MIN = 30;
    // 10秒
    private static final int TEN_SEC = 10;
    // 永不过期
    private static final int NEVER_EXPIRE = 0;
    //半年
    private static final int HALF_YEAR = 180 * ONE_DAY;

    // ------------------------------------------【单个对象】：数据操作时自更新【状态为无效/删除时移除key】规则:exp=dd:hh:mm 指绝对时间 0:23:30 每天晚上23点执行
    // 至 1:01:00 第二天的凌晨1点执行 |相对时间"+ ONE_HOUR +"}?号为对应的id值------------------------

    //// List集合
    public static final String LIST_ACTIVITY_PRODUCT_KEY = KEY_COMMON_PREFIX_BLOG + KeyType.LIST.name() + "_ACTIVITY_PRODUCT_{by:activityId=?}{exp=" + ONE_DAY + "}";

}
