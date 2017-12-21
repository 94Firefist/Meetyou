package com.test.personal;

import java.util.ArrayList;

public interface IPersonalTimelineDAO
{
	// 타임라인
	// 개인 주최 이벤트
	public ArrayList<PersonalTimelineDTO> hostEventList(String hostId);
	
	// 개인 참여 예정 이벤트
	public ArrayList<PersonalTimelineDTO> hostInEventList(String hostId);
}
