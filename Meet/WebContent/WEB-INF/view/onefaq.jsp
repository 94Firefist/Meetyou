<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 보내기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>

<div class="container" style="border: 1px solid black; margin: 5px; height: 500px; width: 500px;">
<!-- <div class="col-md-5"> -->
    <div class="form-area">  
        <form role="form">
        <br style="clear:both">
                    <h3 style="margin-bottom: 25px; text-align: center;">1:1 문의하기</h3>
					
					<div class="form-group">
						<input type="text" class="form-control" id="subject" name="subject" placeholder="제목" required>
					</div>
                    <div class="form-group">
                    <textarea class="form-control" id="message" placeholder="내용" maxlength="140" rows="7"></textarea>
                        <span class="help-block">※ 답변은 메일로 전송됩니다.</span>    
                         <br>                
                  		 <button type="button" id="submit" name="submit" class="btn btn-primary pull-right">메시지 보내기</button>
                  		 <br><br>   	
                    </div>
        </form>
        
    </div>
<!-- </div> -->
</div>

</body>
</html>