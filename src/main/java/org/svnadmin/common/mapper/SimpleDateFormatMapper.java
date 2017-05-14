package org.svnadmin.common.mapper;

import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.JsonSerializer;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.SerializerProvider;
import org.codehaus.jackson.map.ser.CustomSerializerFactory;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 解决SpringMVC使用@ResponseBody返回json时，
 * 日期格式默认显示为时间戳的问题。需配合<mvc:message-converters>使用
 * @author Zoro
 * @date 2016-02-29 下午04:17:52
 */
@Component("simpleDateFormatMapper")
public class SimpleDateFormatMapper extends ObjectMapper {

	private final static String DATETIME_FORMAT = "yyyy-MM-dd HH:mm:ss";

	public SimpleDateFormatMapper() {
		CustomSerializerFactory factory = new CustomSerializerFactory();
		factory.addGenericMapping(Date.class, new JsonSerializer<Date>() {
			@Override
			public void serialize(Date value, JsonGenerator jsonGenerator,
					SerializerProvider provider) throws IOException, JsonProcessingException {
				SimpleDateFormat sdf = new SimpleDateFormat(DATETIME_FORMAT);
				jsonGenerator.writeString(sdf.format(value));
			}
		});
		this.setSerializerFactory(factory);
	}
}