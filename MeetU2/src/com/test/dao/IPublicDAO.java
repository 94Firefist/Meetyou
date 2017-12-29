package com.test.dao;

import java.util.ArrayList;

import com.test.dto.OptionDTO;

public interface IPublicDAO
{
	ArrayList<OptionDTO> getAllCategorys();
	ArrayList<OptionDTO> getAllCitytypes();
}
