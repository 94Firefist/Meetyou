function aform(obj, action)
{
	$(obj).append("<form action="+ action + " method='post' class='writeform'>" +
			"<textarea name='content' rows='6' cols='' maxlength='300' class='txt_comment' placeholder='주제와 무관한 댓글, 악플은 삭제될 수 있습니다.'></textarea>" +
			"<div class='btnspace'><span><span class='txt_write'>0</span>/ 300자</span>" +
			"<button type='submit' class='commentbtn'>등록</button></div></form>");
}

function createform(obj, id, type, lev, seq)
{
	var action = "";
	
	
	// type = 0 리뷰 인서트, type = 1 코멘트 인서트
	if(type==0)
		action = "insertre.action?levent_id="+ id + "&page="+location.href;
	else
		action = "insertco.action?lreview_id="+ id + "&lev=" + lev + "&seq=" + seq + "&page="+location.href;

	aform(obj, action);
}