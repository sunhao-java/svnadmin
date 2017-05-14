package org.svnadmin.util.place;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;
import org.svnadmin.common.util.PropUtils;

import java.util.Properties;

/**
 * @ClassName: SystemPropertyPlaceholderConfigurer
 * @Description: 系统配置文件的属性加载
 * @author zyj
 * @date 2015年9月17日 下午1:55:39
 * @version V1.0
 */
public class SystemPropertyPlaceholderConfigurer extends PropertyPlaceholderConfigurer {

	protected void processProperties(ConfigurableListableBeanFactory beanFactory, Properties props) throws BeansException {
		PropUtils.initConfigProperties(props);
	}

}