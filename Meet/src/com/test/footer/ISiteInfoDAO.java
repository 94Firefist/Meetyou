package com.test.footer;

import java.util.ArrayList;

public interface ISiteInfoDAO
{
	// 사이트 정보
	
	// 사이트 소개 - 1, 이용약관 - 5
	public ArrayList<SiteInfoDTO> siteInfoContent(String typeId);
	// 여러 내용 들어갈수 있어서 이리함....

}
