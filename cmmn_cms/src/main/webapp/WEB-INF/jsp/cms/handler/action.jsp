<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<body>
<script type="text/javascript" src="/js/cmmn/json2.js"></script>
<script>
var returnURL = "<c:out value='${returnURL}'/>";

while(returnURL.indexOf("&amp;") != -1) {
	returnURL = returnURL.replace('&amp;', '&');
}

var status = "<c:out value='${status}'/>";
var msg = "<c:out value='${msg}'/>".replace(/&lt;br&gt;/gi,"\n");
var method = "<c:out value='${method}'/>";

if(status == null || status == undefined || status == '') {}
else if(status == 0) alert('저장되었습니다.');
else if(status == 1) alert('수정되었습니다.');
else if(status == 2) alert('삭제되었습니다.');
else if(status == 3) alert(msg);

var form = document.createElement("form");
if(!method || method == 'post') form.setAttribute("method", "post");
else form.setAttribute("method", "get");
form.setAttribute("action", returnURL);

var obj = '${params}';
if(obj != '') {
	obj = JSON.parse(obj);
	for(var key in obj) {
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", key);
		hiddenField.setAttribute("value", obj[key]);
		form.appendChild(hiddenField);
	}
}

document.body.appendChild(form);
form.submit();
</script>
</body>
</html>