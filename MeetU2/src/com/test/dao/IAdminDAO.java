package com.test.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.test.dto.FAQDTO;
import com.test.dto.NoticeDTO;
import com.test.dto.PaymentDTO;
import com.test.dto.QNADTO;

public interface IAdminDAO
{
	//=============FAQ==================
	// 리스트
	public ArrayList<FAQDTO> faqList(HashMap<String, Integer> stMap);
	// 페이징처리 갯수
	public int faqPageCount();
	// 추가
	public int faqAdd(FAQDTO faq);
	// 내용 수정
	public int faqModify(FAQDTO faq);
	// 삭제
	public int faqRemove(String faqId);
	// 내용 가져오기??
	public FAQDTO getFAQContent(String faqId);
	//===================================
	
	//===========공지 (notice)===========
	// 리스트
	public ArrayList<NoticeDTO> noticeList(HashMap<String, Integer> stMap);
	// 페이징처리 갯수
	public int noticePageCount();
	// 추가
	public int noticeAdd(NoticeDTO notice);
	// 내용 수정
	public int noticeModify(NoticeDTO notice);
	// 삭제
	public int noticeRemove(String noticeId);
	// 내용 가져오기??
	public NoticeDTO getNoticeContent(String noticeId);
	//===================================
	
	//===========내역 리스트=============
	// 리스트
	public ArrayList<PaymentDTO> paymentList(HashMap<String, Integer> stMap);
	// 페이징처리 갯수
	public int paymentPageCount();
	// 수정
	public int paymentModify(String paymentId);
	//===================================
	
	//=================상품===============
	// 리스트
//	public ArrayList<ProductDTO> productList();
	// 수정
	//public int productModify(ProductDTO product) throws SQLException, ClassNotFoundException;
	//====================================
	
	//==================QnA=================
	// 리스트
	public ArrayList<QNADTO> qnaList(HashMap<String, Integer> stMap);
	// 페이징처리 갯수
	public int pageCount();
	// 내용 가져오기
	public String qnaContent(String qnaId);
	// 추가 (답변)
	public int qnaAdd(QNADTO qna);
	//======================================
}
