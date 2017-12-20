package com.test.friend;

import java.sql.SQLException;
import java.util.ArrayList;

public interface Friend_IDAO
{
	//내가 신청해서 친구된 친구 리스트
	public ArrayList<Friend_DTO> msgFriendList(String keynumber) throws SQLException, ClassNotFoundException;

}
