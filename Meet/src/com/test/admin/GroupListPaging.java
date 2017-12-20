package com.test.admin;

public class GroupListPaging
{
		//전체 페이지 수를 구하는 메소드
		//--numPerPage : 한 페이지에 표시할 데이터(게시물)의 수
		//--dataCount  : 전체 데이터 수
		public int getPageCount(int numPerPage, int dataCount)
		{
			//전체페이지 수
			int pageCount = 0;
			pageCount =  dataCount / numPerPage;
			
			if(dataCount % numPerPage !=0)
				pageCount++;
				
			return pageCount;
		}
		//--한 페이지에 10개의 게시물을 출력할 때
		//  총 32개의 게시물을 페이지로 구성하기 위해서는
		//	32/10의 연산을 수행하면 결과 3을 얻을 수 있다.
		//	『pageCount =  dataCount / numPerPage』
		//	그런데 이 때 나머지 2개의 게시물을 출력하기 위해서는
		//	페이지가 하나 더 필요하다.
		//	『pageCount++』
		
		
		//페이징 처리 기능의 메소드
		//--currentPage : 현재 표시할 페이지
		//--totalPage   : 전체 페이지 수
		//--listUrl 	: 링크를 설정할 URL
		public String pageIndexList(int currentPage, int totalPage, String listUrl)
		{
			//실제 페이징을 저장할 StringBuffer 변수
			StringBuffer strList = new StringBuffer();
			
			int numPerBlock = 5 ;	//페이징 처리 시 게시물 리스트 하단의 숫자를 10개씩 보여주겠다.
			int currentPageSetup;	//현재 페이지(이 페이지를 기준으로 보여주는 숫자가 달라져야하니까)
			int page;
			int n;					//이전 페이지 블럭과 같은 처리에서 이동하기 위한 변수(얼만큼...)
			
			//페이징 처리가 별도로 필요하지 않은 경우
			//--데이터가 없거나 데이터수가 1 페이지도 못 채울 경우는
			//	페이징 처리를 할 필요가 없다.
			if(currentPage==0)
				return "";
			
	 
			
			//Get 방식으로 처리하는 과정에서
			//URL 경로의 패턴에 대한 처리
			if(listUrl.indexOf("?")!=-1)	//listUrl에 ?가 있다면과 같은 의미
				listUrl = listUrl+"&";	//링크 설정할 URL에 『?』가 들어있으면?
			else
				listUrl = listUrl+"?";	//링크 설정할 URL에 『?』가 없으면?
			//검색값이 존재하면 이미 request에 searchKey값과 searchValue값이
			//들어있는 상황이므로 『&』를 붙여서 추가해 주어야 한다.
			
			
			
			//currentPageSetup = 표시할 첫 페이지 -1
			currentPageSetup = (currentPage / numPerBlock) * numPerBlock;
			//--만약 현재 페이지가 5페이지고 (currentPage==5)
			//	리스트 하단에 보여줄 페이지 갯수가 10이면 (numPerBlock==10)
			//	『(5/10) = 0』이며...여기에 『* 10』(10을 곱해도) 하더라도 0이다.
			//	하지만 현재 페이지가 11페이지라면(currentPage==11)
			//	『(11/10) = 1』이며...여기에 『* 10』(10을 곱하면) 을 하면 10이다.
			//	그러면 currentPageSet은 10이 되는 것이다.
			
			
			if (currentPage % numPerBlock ==0) 
				currentPageSetup = currentPageSetup - numPerBlock;
			//	만약 위의 처리에서 현재페이지가 20페이지였다면(currentPage==20)
			//	『20/10==2』이며...여기에 『* 10』(10을 곱하면) 을 하면 20이 되는데
			//	이러한 경우라면 다시 10을 빼서 10으로 만들어 준다.
			
			
			
			//처음으로
			if((totalPage>numPerBlock)&&(currentPageSetup>0))
				strList.append("<a href = '"+ listUrl + "pageNum=1' >1</a>");
			
			
			//이전으로...// n : 해당페이지만큼 앞으로 가기위한 변수
			n = currentPage - numPerBlock;
			if((totalPage>numPerBlock)&&(currentPageSetup>0))
				strList.append("<a href = '"+ listUrl + "pageNum=" +n+ "' > Prev </a>");
			//--currentPageSetup 이 0보다 큰 경우는
			//  이미 페이지가 10이상이라는 의미이며
			//  이때, 현재 페이지(currentPage)가 11페이지 이상일 경우
			//	『Prev』를 붙이기 위한 내용이 된다.
			//--『Prev』를 클릭할 경우(링크이동)
			//  n 변수 페이지로 이동하게 되는데 12에서 Prev할 경우 2페이지가 된다.
			
			
				
			
			//선택된 페이지 바로가기
			page = currentPageSetup+1;
			
			//--『+1』을 하는 이유는 
			//	앞에서 currentPageSet에서 10을 가져왔다면
			//	10부터 시작하는 것이 아니라 11부터 시작해야 하기 때문이다.
			while((page<=totalPage)&&(page<=currentPageSetup + numPerBlock))
			{
				if(page==currentPage)
					strList.append("<font color='blue'> " +page + " </font>");
				else
					strList.append("<a href = '"+ listUrl + "pageNum=" +page+ "' > "+page+" </a>");
				page++;
			}
				
			
			//다음으로...
			n = currentPage + numPerBlock;
			if((totalPage-currentPageSetup)>numPerBlock)
				strList.append("<a href='"+ listUrl + "pageNum=" + n +"'> Next </a>");
			
			
			//마지막페이지
			if((totalPage > numPerBlock) && (currentPageSetup+numPerBlock)<totalPage)
				strList.append("<a href='"+ listUrl + "pageNum=" +totalPage+ "' >"+totalPage + "</a>");
			
			
			
			
			return strList.toString();
			
		}
		
		
		
		//
		public String checkNull(String str)
		{
			if(str==null)
				str="";
			//null상태값 null이 아니게 바꾸기 위함.
			
			return str;
			
		}
}
