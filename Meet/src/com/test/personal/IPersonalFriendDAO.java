package com.test.personal;

import java.util.ArrayList;
import java.util.HashMap;

public interface IPersonalFriendDAO
{
	// 친구 리스트
	public ArrayList<PersonalFriendDTO> friendList(String hostId);
	
	// 블랙 리스트
	public ArrayList<PersonalFriendDTO> blackList(String hostId);
	
	// 친구신청중
	public ArrayList<PersonalFriendDTO> friendSend(String hostId);

	// 친구신청받음
	public ArrayList<PersonalFriendDTO> friendReceive(String hostId);
	
	// 친구신청취소(본인)
	public int friendnoSend(String friendNum);
	
	// 친구신청거절(본인)
	public int friendnoReceive(String friendNum);
	
	// 친구 추가(승낙)
	public int friendAdd(String friendNum);
	
	// 친구 삭제(절교)
	public int friendRemove(String friendNum);
	
	// 블랙리스트추가
	public int blackAdd(HashMap<String, String> blackMap);
	
	// 블랙리스트삭제
	public int blackRemove(String blackNum);
	
	
	
}
