package com.test.admin;

import org.springframework.stereotype.Service;

@Service("AdminPage")
public class AdminPage
{
	public int[] StartEndPage(int page, int totalCount, int countPage, int countList)
	{
		// countList 한 페이지에 출력될 게시물 수
		
		// 뿌려지는 페이지 갯수
		int totalPage = totalCount / countList;
		
		// 페이지가 딱 맞아떨어지는지 확인
		if(totalCount % countList > 0)
			totalPage++;
		
		// 현재 페이지가 총 페이지보다 클경우 강제 치환
		if (totalPage < page)
		    page = totalPage;
		
		int startPage = ((page - 1) / 10) * 10 + 1;

		int endPage = startPage + countPage - 1;
		
		if (endPage > totalPage)
		    endPage = totalPage;
		
		int[] sePage = {startPage, endPage, totalPage};
		
		return sePage;
	}
}
