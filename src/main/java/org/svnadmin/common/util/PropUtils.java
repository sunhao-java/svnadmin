package org.svnadmin.common.util;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;


/**
 * @ClassName: PropUtils
 * @Description: 常用配置文件操作
 * @author hpboys
 * @date 2015年7月8日 下午5:12:38
 * @version V1.0
 */
public class PropUtils {

	private static Map<String, String> properties = new HashMap<String, String>();

	public static void initConfigProperties(Properties props) {
		for (Object key : props.keySet()) {
			String keyTemp = String.valueOf(key);
			String valueTemp = props.getProperty(keyTemp);
			properties.put(keyTemp, valueTemp);
		}
	}

	public static Map<String, String> getProperties() {
		return properties;
	}

	public static String getProperty(String key) {
		return properties.get(key);
	}

	public static String get(String key) {
		return properties.get(key);
	}
}
