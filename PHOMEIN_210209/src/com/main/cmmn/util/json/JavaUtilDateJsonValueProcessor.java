package com.main.cmmn.util.json;

import java.text.SimpleDateFormat;
import java.util.Date;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsDateJsonValueProcessor;

public class JavaUtilDateJsonValueProcessor extends JsDateJsonValueProcessor {

	private static final SimpleDateFormat formatter_date = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");

	public JavaUtilDateJsonValueProcessor() {

	}

	@Override
	public Object processArrayValue(Object value, JsonConfig jsonConfig) {
		return process(value, jsonConfig);
	}

	@Override
	public Object processObjectValue(String key, Object value,
			JsonConfig jsonConfig) {
		return process(value, jsonConfig);
	}

	private Object process(Object value, JsonConfig jsonConfig) {
		if (value instanceof java.util.Date) {
			return formatter_date.format((Date) value);
		} else {
			return value == null ? null : value.toString();
		}
	}	
}
