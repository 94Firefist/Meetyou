package com.test.java;
/**
 * vi:set ts=4 sw=4 expandtab fileencoding=utf-8:
 * Copyright(C) 2008, 2010 D&SOFT
 * http://open.coolsms.co.kr
 *
 * Usage)
 *
 * SMS sms = new SMS();     // 객체생성
 * sms.setuser("coolsms-id", "coolsms-pass");   // 사용자 아이디 및 비밀번호 설정
 * sms.add("01600000000", "020000000", "문자내용"); // 메세지 추가
 * ...              // 여러건 추가 가능
 * ...
 * sms.send();      // 문자 전송
 * sms.printr();    // 결과 출력
 * sms.emptyall();  // 메모리 정리
 **/

import java.io.*;
import java.util.Random;

import org.springframework.stereotype.Service;

@Service("SendSMS")
public class ExampleUTF8SendSMS
{
	public String SendSMS(String address)
	{
		SMS sms = new SMS();
		
        /**
         * 프로그램명과 버젼을 입력합니다. (생략가능합니다.)
         * 형식: 프로그램명/버젼 (프로그램명: 반드시 영어로, 버젼: x.x.x 와 같은 형식)
         * 입력예: TEST/1.0
         **/
        sms.appversion("TEST/1.0");

        // 한글 인코딩 방식을 설정합니다. (utf8 혹은 euckr으로 설정, 생략시 기본 euckr로 설정됨)
        sms.charset("utf8");

        // 아이디/비밀번호를 설정합니다. (쿨에스엠에스(www.coolsms.co.kr)에서 가입하신 아이디, 비밀번호를 넣어줍니다.)
        sms.setuser("miy1205", "asd123");

        /**
         * 문자 추가
         * 1) 최대 보낼 수 있는 문자의 길이는 80바이트이며 초과시 80바이트 이내 문자만 전송됩니다.
         * 2) 갯수에 제한없이 add 호출로 보낼 문자목록에 계속 추가할 수 있습니다.(send 호출시 모두 전송됩니다.)
         **/
        
        Random rd = new Random();
		String checknum = "";
        for(int i=0; i<6; i++)
        	checknum += rd.nextInt(10);
        
        SmsMessagePdu pdu = new SmsMessagePdu();
        pdu.type = "SMS";                        // SMS, LMS, MMS
        pdu.destinationAddress = address;  // 수신번호
        pdu.scAddress = "01092842586";           // 발신번호
        pdu.text = "인증번호 "+checknum+" 입니다.";
        sms.add(pdu);

        // 추가된 메세지 전송
        try {
            sms.connect();
            sms.send();
            sms.disconnect();
        } catch (IOException e) {
        	System.out.println(e.toString());
        	return "fail";
        }

        // 전송 결과 출력
        sms.printr();

        // 추가된 메세지 및 전송결과 데이터를 메모리에서 제거합니다.
        sms.emptyall();
		
		return checknum;
	}
}
