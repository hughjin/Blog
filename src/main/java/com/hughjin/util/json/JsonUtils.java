
package com.hughjin.util.json;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Collections;
import java.util.List;

public class JsonUtils {
    private static final Logger LOGGER = LoggerFactory.getLogger(JsonUtils.class);

    private JsonUtils() {
    }

    public static <T> T parseJsonStrToBean(String jsonStr, Class<T> t) {
        if (StringUtils.isEmpty(jsonStr)) {
            return null;
        } else {
            try {
                return JSONObject.parseObject(jsonStr, t);
            } catch (Exception var3) {
                LOGGER.error("parseJsonStrToBean Exception", var3);
                return null;
            }
        }
    }

    public static String formatBeanToJsonStr(Object o) {
        if (o == null) {
            return null;
        } else {
            try {
                return o.getClass().isArray() ? JSONArray.toJSONString(o) : JSONObject.toJSONString(o);
            } catch (Exception var2) {
                LOGGER.error("formatBeanToJsonStr Exception", var2);
                return null;
            }
        }
    }

    public static <T> List<T> jsonToList(String jsonStr, Class<T> c) {
        return StringUtils.isEmpty(jsonStr) ? (List<T>) Collections.emptyList() : JSONArray.parseArray(jsonStr, c);
    }


}
