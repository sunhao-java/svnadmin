package org.svnadmin.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.JavaType;
import org.svnadmin.common.util.HttpUtils;

/**
 * 操作Json数据工具类
 * 
 * @author daybreak
 * @since 2014-12-29
 */
public class JSONUtils {

	private static Logger logger = Logger.getLogger(JSONUtils.class);

	/**
	 * 将Json对象字符串转化为Map对象
	 * 
	 * @param jsonStr
	 *            JSON字符串
	 * @return 转换成功返回Map对象，失败则返回null
	 */
	public static Map<String, String> JsonToMap(String jsonStr) {
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			Map<String, String> params = objectMapper.readValue(jsonStr, Map.class);
			return params;
		} catch (Exception e) {
			logger.error("JsonToMap Error " + jsonStr, e);
			return null;
		}
	}

	/**
	 * 将Json对象字符串转化为Map<String, Object>对象
	 * 
	 * @param jsonStr
	 *            JSON字符串
	 * @return 转换成功返回Map对象，失败则返回null
	 */
	public static Map<String, Object> readJson2Map(String jsonStr) {
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			Map<String, Object> params = objectMapper.readValue(jsonStr, Map.class);
			return params;
		} catch (Exception e) {
			logger.error("JsonToMap Error " + jsonStr, e);
			return null;
		}
	}

	/**
	 * 将Json对象字符串转化为JavaBean类对象
	 * 
	 * @param jsonStr
	 *            JSON字符串
	 * @param clazz
	 *            类类型
	 * @return 转换成功返回JavaBean类对象，失败则返回null
	 */
	public static <T> T readJson2Bean(String jsonStr, Class<T> clazz) {
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			T t = objectMapper.readValue(jsonStr, clazz);
			return t;
		} catch (Exception e) {
			logger.error("readJson2Bean Error " + jsonStr, e);
			return null;
		}
	}

	/**
	 * 将Json对象字符串转化为List<Map>对象
	 * 
	 * @param jsonStr
	 *            JSON字符串
	 * @return 转换成功返回Map对象，失败则返回null
	 */
	public static List<HashMap<String, Object>> JsonToMapList(String jsonStr) {
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			List<HashMap<String, Object>> params = objectMapper.readValue(jsonStr, List.class);
			for (int i = 0; i < params.size(); i++) {
				Map<String, Object> map = params.get(i);
				Set<String> set = map.keySet();
				for (Iterator<String> it = set.iterator(); it.hasNext();) {
					String key = it.next();
				}
			}
			return params;
		} catch (Exception e) {
			logger.error("JsonToMap Error " + jsonStr, e);
			return null;
		}
	}

	/**
	 * 返回类型的集合
	 * 
	 * @param json
	 * @param cls
	 * @return
	 */
	public static List<?> jsonToList(String json, Class<?> cls) {
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			JavaType javaType = objectMapper.getTypeFactory().constructParametricType(ArrayList.class, cls);
			return objectMapper.readValue(json, javaType);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("将json字符串转换成List对象时发生异常");
		}
	}

	/**
	 * 将传入能够整除2的数量的参数序列化为Json对象
	 * 
	 * @return
	 */
	public static String WriteToJson(Object... paramObjs) {
		try {
			if (paramObjs == null || paramObjs.length == 0) {
				logger.error("参数实例为空");
			}
			Map<String, Object> paramMap = new HashMap<String, Object>();
			for (int i = 0; i < paramObjs.length; i += 2) {
				paramMap.put((String) paramObjs[i], paramObjs[i + 1]);
			}
			ObjectMapper objectMapper = new ObjectMapper();
			return objectMapper.writeValueAsString(paramMap);
		} catch (Exception e) {
			return "";
		}
	}

	/**
	 * 将传入能够整除2的数量的参数序列化为Json对象，并进行UrlDecode操作
	 * 
	 * @param result
	 * @return
	 */
	public static Map<String, String> JsonToMapAndDecode(String result) {
		Map<String, String> params = JsonToMap(result);
		for (String key : params.keySet()) {
			params.put(key, HttpUtils.urlDecode(params.get(key), "UTF-8"));
		}
		return params;
	}

	public static String toJson(Object target) {
		String result = null;
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			result = objectMapper.writeValueAsString(target);
		} catch (Exception e) {
			logger.error("convert to Json Str Fail !");
			e.printStackTrace();
		}
		return result;
	}
}
