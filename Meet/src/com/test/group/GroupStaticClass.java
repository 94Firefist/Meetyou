package com.test.group;

import java.util.HashMap;

public class GroupStaticClass
{
	public static HashMap<String, Object> getGroupJoin(String groupId, String memberId, int grpower)
	{
		HashMap<String, Object> grjoinMap = new HashMap<String, Object>();
		
		grjoinMap.put("groupId", groupId);
		grjoinMap.put("memberId", memberId);
		grjoinMap.put("grpower", grpower);
		return grjoinMap;
	}


	public static HashMap<String, Object> getGrlist(String groupId, String powerId)
	{
		HashMap<String, Object> grlistMap = new HashMap<String, Object>();
		
		grlistMap.put("groupId", groupId);
		grlistMap.put("powerId", powerId);
		
		return grlistMap;
	}
	
	public static HashMap<String, Object> getGroupAndTargetMap(String groupId, String target) {
		HashMap<String, Object> grlistMap = new HashMap<String, Object>();
		
		grlistMap.put("groupId", groupId);
		grlistMap.put("target", target);
		
		return grlistMap;
	}
	
	public static HashMap<String, Object> getEventUesd(String eventId, String memberId) {
		HashMap<String, Object> EventUesd = new HashMap<String, Object>();
		
		EventUesd.put("eventId", eventId);
		EventUesd.put("memberId", memberId);
		
		return EventUesd;
	}
	
	public static HashMap<String, Object> getEalist(String eventId, String attendtype, int minnum, int maxnum) {
		HashMap<String, Object> ealistMap = new HashMap<String, Object>();
		
		ealistMap.put("eventId", eventId);
		ealistMap.put("attendtype", attendtype);
		ealistMap.put("minnum", minnum);
		ealistMap.put("maxnum", maxnum);
		return ealistMap;
	}
	
	public static HashMap<String, Object> getSingupMap(String groupId, int singupVal) {
		HashMap<String, Object> ealistMap = new HashMap<String, Object>();
		
		ealistMap.put("groupId", groupId);
		ealistMap.put("singupVal", singupVal);
		return ealistMap;
	}
	
	public static HashMap<String, Object> getGroupOptionMap(String groupId, String public_gr, String public_gra, String public_grl) {
		
		HashMap<String, Object> groupOptionMap = new HashMap<String, Object>();
		
		groupOptionMap.put("groupId", groupId);
		groupOptionMap.put("public_gr", public_gr);
		groupOptionMap.put("public_grl", public_grl);
		groupOptionMap.put("public_gra", public_gra);
		
		return groupOptionMap;
	}
	
	public static HashMap<String, Object> getGroupBlackMap(String memberId, String groupId, String targetId, String blackText) {
		HashMap<String, Object> groupBlackMap = new HashMap<String, Object>();
		groupBlackMap.put("memberId", memberId);
		groupBlackMap.put("groupId", groupId);
		groupBlackMap.put("targetId", targetId);
		groupBlackMap.put("blackText", blackText);
		
		return groupBlackMap;
	}
	
	public static HashMap<String, Object> getGroupAndCountMap(String groupId, int count) {
		HashMap<String, Object> groupBlackMap = new HashMap<String, Object>();
		groupBlackMap.put("groupId", groupId);
		groupBlackMap.put("count", count);
		
		return groupBlackMap;
	}
	
	public static HashMap<String, Object> getGroupAndEventAndMemberMap(String groupId, String eventId, String memberId)
	{
		HashMap<String, Object> groupAndEventAndMemberMap = new HashMap<String, Object>();
		groupAndEventAndMemberMap.put("groupId", groupId);
		groupAndEventAndMemberMap.put("eventId", eventId);
		groupAndEventAndMemberMap.put("memberId", memberId);
		
		return groupAndEventAndMemberMap;
	}
	
	public static HashMap<String, Object> getGrlistAndEventMap(String grlistId, String eventId)
	{
		HashMap<String, Object> grlistAndEventMap = new HashMap<String, Object>();
		grlistAndEventMap.put("grlistId", grlistId);
		grlistAndEventMap.put("eventId", eventId);
		
		return grlistAndEventMap;
	}
	

	public static HashMap<String, Object> getEventPictureMap(String albumId, String eveattendId, String pictureUrl)
	{
		HashMap<String, Object> grlistAndEventMap = new HashMap<String, Object>();
		grlistAndEventMap.put("albumId", albumId);
		grlistAndEventMap.put("eveattendId", eveattendId);
		grlistAndEventMap.put("pictureUrl", pictureUrl);
		
		return grlistAndEventMap;
	}
	
	
	public static HashMap<String, Object> getEventAndMemberAndAttendMap(String eventId, String memberId, String attendId)
   {
      HashMap<String, Object> eventAndMemberAndAttendMap = new HashMap<String, Object>();
      eventAndMemberAndAttendMap.put("eventId", eventId);
      eventAndMemberAndAttendMap.put("memberId", memberId);
      eventAndMemberAndAttendMap.put("attendId", attendId);
      
      return eventAndMemberAndAttendMap;
   }
}
