package org.svnadmin.common.annotation;

import java.lang.annotation.*;

/**
 * @描述: 用户未登录可访问资源标识.
 * @作者: Zoro.
 * @创建时间: 2016-04-21 22:24.
 * @版本: 1.0.0.
 */
@Documented
@Inherited
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface AuthPassport {
    boolean validate() default true;
}