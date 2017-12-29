package com.test.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.test.dto.AlbumDTO;
import com.test.dto.PictureDTO;

public interface IAlbumDAO
{
	
	// 특정 앨범의 모든 사진을 가져오는 메소드
	public ArrayList<PictureDTO> getGroupAlbumPictures(String albumId);

	// 특정 앨범에 사진을 추가하는 메소드
	public void addEventPicture(HashMap<String, Object> eventPictureMap);
	
	// 특정 앨범의 정보를 가져오는 메소드
	public AlbumDTO getAlbumInfo(String albumId);
}
