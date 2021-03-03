package com.main.cmmn.vo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * <pre>
 * 로그를 사용하는 모든 객체는 이 Object를 상속 받는다.
 * 해당 로그 기능 중에 필요한 메소드만 정리
 */
public class CommonObject {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private Logger getLogger(){
		return this.logger;
	}
	
	public void logInfo(String log){
		getLogger().info(log);
	}
	
	public void logInfo(String log, Object object){
		getLogger().info(log, object);
	}
	
	public void logInfo(String format, Object[] argArray){
		getLogger().info(format, argArray);
	}
	
	public void logDebug(String log){
		getLogger().debug(log);
	}
	
	public void logDebug(String format, Object object){
		getLogger().debug(format, object);
	}
	 
	public void logError(String log){
		getLogger().error(log);
	}
	public void logError(String format, Object object){
		getLogger().error(format, object);
	}
	
	public void logDebug(String format, Object[] argArray){
		getLogger().debug(format, argArray);
	}
	
	public void logTrace(String log){
		getLogger().trace(log);
	}
	
	public void logTrace(String format, Object object){
		getLogger().trace(format, object);
	}
	
	public void logWarn(String log){
		getLogger().warn(log);
	}
	
	public void logWarn(String format, Object object){
		getLogger().warn(format, object);
	}
	
}
