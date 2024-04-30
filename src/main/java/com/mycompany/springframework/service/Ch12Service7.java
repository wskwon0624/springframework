package com.mycompany.springframework.service;

import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class Ch12Service7 {
	private List<String> list;
	private Set<Object> set;
	private Map<String,String> map;
	private Properties prop;
	
	public void setList(List<String> list) {
		log.info(""+list.size());
		this.list = list;
	}
	
	public void setSet(Set<Object> set) {
		log.info(""+set.size());
		this.set = set;
	}
	
	public void setMap(Map<String,String> map) {
		log.info(""+map.size());
		this.map = map;
	}
	
	public void setProp(Properties prop) {
		log.info(""+prop.size());
		this.prop = prop;
	}
}
