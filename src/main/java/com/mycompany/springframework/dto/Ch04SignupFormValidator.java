package com.mycompany.springframework.dto;

import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class Ch04SignupFormValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		log.info("실행");
		return Ch04SignupForm.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		log.info("실행");
		Ch04SignupForm signupForm = (Ch04SignupForm) target;
		
		String mid = signupForm.getMid();
		String regId = "[a-zA-z0-9]{3,12}";
		if(mid.length() ==0 || mid.equals("")) {
			errors.rejectValue("mid", null, "아이디를 입력해주세요.");
		}
		else if(!Pattern.matches(regId,mid)) {
			errors.rejectValue("mid", null,"3자 이상 12자이하로 작성해주세요.");
		}
		
		String mpassword = signupForm.getMpassword();
		String regPassword = "(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}";
		if(mpassword.length() ==0 || mpassword.equals("")) {
			errors.rejectValue("mpassword", null, "비밀번호를 입력해주세요.");
		}else if(!Pattern.matches(regPassword,mpassword)) {
			errors.rejectValue("mpassword", null, "대, 소문자를 포함한 8자이상 15자이하 입력해주세요.");
		}
		
		String mname = signupForm.getMname();
		String regName = "^[가-힣]{2,4}";
		if(mname.length() ==0 || mname.equals("")) {
			errors.rejectValue("mname", null, "성함을 입력해주세요.");
		}else if(!Pattern.matches(regName,mname)) {
			errors.rejectValue("mname", null, "공백 없이 한글, 영문, 숫자만 입력가능(한글 2자, 영문 4자 이상)");
		}
		
		String memail = signupForm.getMemail();
		String regEmail = "[A-Za-z0-9_\\.\\-]+@[A-Za-z0-9\\-]+\\.[A-za-z0-9\\-]+";
		if(memail.length() ==0 || memail.equals("")) {
			errors.rejectValue("memail", null, "이메일을 입력해주세요.");
		}else if(!Pattern.matches(regEmail,memail)) {
			errors.rejectValue("memail", null, "이메일 형식에 맞게 입력해주세요.");
		}
		
		String mphonenumber = signupForm.getMphonenumber();
		String regPhonenumber = "(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}";
		if(mphonenumber.length() ==0 || mphonenumber.equals("")) {
			errors.rejectValue("mphonenumber", null, "전화번호를 입력해주세요.");
		}else if(!Pattern.matches(regPhonenumber,mphonenumber)) {
			errors.rejectValue("mphonenumber", null, "전화번호 형식이 올바르지 않습니다.");
		}
	}
}
