package com.main.cmmn.util.json;

import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

public class SiteJsonConfig extends JsonConfig {

	public SiteJsonConfig() {
		super();
		this.registerJsonValueProcessor(java.util.Date.class,
				new JavaUtilDateJsonValueProcessor());
		this.registerJsonValueProcessor(java.sql.Date.class,
				new JavaUtilDateJsonValueProcessor());
		this.registerJsonValueProcessor(java.sql.Timestamp.class,
				new JavaUtilDateJsonValueProcessor());
		this.setExcludes(new String[] { "login", "password" });

		this.setJsonPropertyFilter(new PropertyFilter() {
			public boolean apply(Object source, String name, Object value) {
				if (name.indexOf("search") > -1) {
					return true;
				} else {
					return false;
				}
			}
		});
	}

}
