package com.test.footer;

import java.util.ArrayList;

public interface IFAQListDAO
{
	// FAQ 리스트 
	public ArrayList<FAQDTO> faqAll();
	
	// 내용 뽑기
	public FAQDTO faqList(String faqId);
	
	// 1:1 문의
	public int qnaAdd(FAQDTO faq);
	
}
