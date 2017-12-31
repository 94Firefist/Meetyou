package com.test.dao;

import java.util.ArrayList;

import com.test.dto.NoticeDTO;

public interface INoticeListDAO
{
	// 공지사항 리스트 
	public ArrayList<NoticeDTO> noticeAll();
	
	// 상세 내용
	public NoticeDTO noticeList(String noticeId);
	
}
