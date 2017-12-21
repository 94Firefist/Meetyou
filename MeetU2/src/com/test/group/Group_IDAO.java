package com.test.group;

import java.sql.SQLException;
import java.util.ArrayList;

import com.test.group.Group_DTO;

public interface Group_IDAO
{	
	//운영자이상의 메시지창에서 그룹 리스트 뿌려주기  
	public ArrayList<Group_DTO> msgGrouplist(String keynumber) throws SQLException, ClassNotFoundException;
}
