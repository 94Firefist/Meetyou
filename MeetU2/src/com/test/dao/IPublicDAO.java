package com.test.dao;

import java.util.ArrayList;

import com.test.dto.FilterDTO;
import com.test.dto.OptionDTO;

public interface IPublicDAO
{
	ArrayList<OptionDTO> getCategorys();
	ArrayList<OptionDTO> getCity_types();
	ArrayList<OptionDTO> getGroupPublic();
	
	ArrayList<com.test.admin.GroupDTO> getGroupList(FilterDTO filterDTO);
	
	String getCity_name(String groupCity);
	String getCategory_content(String category_code);
	String getGrPublic_name(String grPublic_id);
	
	int getGroupCount(FilterDTO filterDTO);
}
