package com.mycompany.springframework.service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class Ch12Service2 {
	private Ch12Service2() {
	}
	
	public static Ch12Service2 getInstance() {
		log.info("run");
		return new Ch12Service2();
	}
	
}
