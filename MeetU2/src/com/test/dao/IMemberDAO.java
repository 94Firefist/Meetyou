package com.test.dao;

import com.test.dto.MemberDTO;

public interface IMemberDAO
{

	// 해당 멤버의 Realid를 가져오는 메소드
	public MemberDTO getMemberOfRealid(String name);
	
}
