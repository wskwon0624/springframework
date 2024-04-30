package com.mycompany.springframework.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class Ch12Service10 {
	@Value("${prop1}") private int field1;
	@Value("${prop2}")private double field2;
	private boolean field3;
	private String field4;
	
	//@Value("${prov3}") 생성자 주입 안됨
//	public Ch12Service10(boolean field3) {
//		this.field3 = field3;
//	}
//	
	@Value("${prop3}")
	public void setField3(boolean field3) {
		this.field3 = field3;
	}
	
	@Value("${prop4}")
	public void setField4(String field4) {
		this.field4 = field4;
		log.info(field1 + " " + field2 + " " + field3 + " "+this.field4);
	}
}
