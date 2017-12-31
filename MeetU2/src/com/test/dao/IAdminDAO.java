package com.test.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.test.dto.AFAQDTO;
import com.test.dto.ANoticeDTO;
import com.test.dto.PaymentDTO;
import com.test.dto.QNADTO;

public interface IAdminDAO
{
	//=============FAQ==================
	// 리스트
	public ArrayList<AFAQDTO> faqList(HashMap<String, Integer> stMap);
	// 페이징처리 갯수
	public int faqPageCount();
	// 추가
	public int faqAdd(AFAQDTO faq);
	// 내용 수정
	public int faqModify(AFAQDTO faq);
	// 삭제
	public int faqRemove(String faqId);
	// 내용 가져오기??
	public AFAQDTO getFAQContent(String faqId);
	//===================================
	
	//===========공지 (notice)===========
	// 리스트
	public ArrayList<ANoticeDTO> noticeList(HashMap<String, Integer> stMap);
	// 페이징처리 갯수
	public int noticePageCount();
	// 추가
	public int noticeAdd(ANoticeDTO notice);
	// 내용 수정
	public int noticeModify(ANoticeDTO notice);
	// 삭제
	public int noticeRemove(String noticeId);
	// 내용 가져오기??
	public ANoticeDTO getNoticeContent(String noticeId);
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
