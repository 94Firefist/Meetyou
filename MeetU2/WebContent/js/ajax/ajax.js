// 전역변수 ajax 선언
var ajax = null;

// 함수 정의 (createAjax())
function createAjax()
{
	// 객체를 생성하는 방식의 차이일 뿐이지
	// 두 가지 모두 XMLHttpRequest 객체를 생성하는 구문이다. (→ AJAX 활용)
	if(window.ActiveXObject)	// IE 8 이하 버전이라면
	{
		return new ActiveXObject("Msxml2.XMLHTTP");
		// ActiveXObject객체를 생성하여 반환하겠다.
	}
	else	// 그 외 브라우저
	{
		if(window.XMLHttpRequest)	// XMLHttpRequest 객체 활용 가능여부 확인
		{
			return new XMLHttpRequest();
			// XMLHttpRequest() 객체를 생성하여 반환하겠다.
		}
		else	// XMLHttpRequest 객체 활용 불가 확인
		{
			return null;
			// Ajax 지원 안함
		}
	}
}