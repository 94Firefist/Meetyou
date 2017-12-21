package com.test.personal;

import java.util.ArrayList;

public interface IPersonalHomeDAO
{
	// 개인 소개
	public String userContent(String userNumber);
	
	// 내가 주최한 이벤트
	public ArrayList<PersonalHomeDTO> userEvent(String userNumber);
	
	// 참가 예정 이벤트								<< 그룹번호 알아와야행~
	public ArrayList<PersonalHomeDTO> goEvent(String userNumber);
	
}
