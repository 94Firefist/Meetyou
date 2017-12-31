package com.test.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.test.dto.Message_DTO;
import com.test.dto.QNADTO;
import com.test.dto.ReceiveMessageDTO;

public interface Message_IDAO
{
	// 받은 개인 메시지 리스트 확인하기
	public Message_DTO receiveMsgnew(String lmbtextsend_id) throws SQLException, ClassNotFoundException;

	// 받은 그룹메시지 확인하기
	public Message_DTO getGMsg(HashMap<String, Object> hashMap) throws SQLException, ClassNotFoundException;

	// 개인 메시지 수신 확인 데이터 넣기 
	public int readMsg(String lmbtextsend_id) throws SQLException, ClassNotFoundException;

	// 그룹메시지 수신 확인 데이터 넣기 
	public int readGMsg(HashMap<String, Object> hashMap) throws SQLException, ClassNotFoundException;
	
	// 메시지 발신 리스트 출력
	public ArrayList<Message_DTO> sendMsgList(HashMap<String, Object> hashMap) throws SQLException, ClassNotFoundException;

	// 개인 메시지 보내기 
	public void sendMemberMsg(HashMap<String, Object> memberTextMap) throws SQLException, ClassNotFoundException;
	
	// 그룹 메시지 보내기 
	public void sendGroupMsg(HashMap<String, Object> groupTextMap) throws SQLException, ClassNotFoundException;
		
	// 받은 메시지함에서 삭제
	public int removeMsg(String lmbtextsend_id) throws SQLException, ClassNotFoundException;
	
	// 받은 메시지함에서 삭제(그룹)
	public int removeGMsg(HashMap<String, Object> hashMap) throws SQLException, ClassNotFoundException;

	// 보낸 메시지함에서 삭제
	public int removesendMsg(String lmbtextsend_id) throws SQLException, ClassNotFoundException;
	
	// 메시지 확인하기(받은)
	public Message_DTO getMsg(String lmbtextsend_id) throws SQLException, ClassNotFoundException;

	// 메시지 확인하기(보낸)
	public Message_DTO getsendMsg(String lmbtextsend_id) throws SQLException, ClassNotFoundException;

	// 메시지 검색하기(받은 쪽지함) --미완
	public ArrayList<Message_DTO> searchInfo(String keynumber, String searchKey, String searchValue)
			throws SQLException, ClassNotFoundException;

	// 메시지 검색하기(보낸 쪽지함) --미완
	public ArrayList<Message_DTO> searchsendInfo(String keynumber, String searchKey, String searchValue)
			throws SQLException, ClassNotFoundException;

	// 쪽지번호로 타입 받아오기 
	public String msgType(String messageId);
	
	// 나의 받은 메시지 번호, 타입 리스트 받아오기
	public ArrayList<ReceiveMessageDTO> getUesrReceiveMessage(HashMap<String, Integer> stMap);
	
	// 페이징처리 갯수
	public int pageCount();
	
}
