package com.test.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.test.dto.CommentDTO;
import com.test.dto.ReviewDTO;


public interface ICommentDAO
{
	// 이벤트 코맨트 가져오기
	public ArrayList<CommentDTO> getComment(String levent_id);
	
	// 이벤트 코맨트 가져오기
	public ArrayList<ReviewDTO> getReview(String levent_id);
	
	// 글쓰기 권한 확인하기
	public String canWrite(String id);
	
	// 리뷰 쓸 권한 확인하기
	public String writeReview(HashMap<String, String> ids);
	
	// 리뷰 쓰기
	public void insertReview(ReviewDTO dto);
	
	// 댓글 쓰기
	public void insertComment(CommentDTO dto);
}
