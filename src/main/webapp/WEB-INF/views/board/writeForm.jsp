<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/includeHeader.jsp" %>
 
<title>Home</title>
<script type="text/javascript">

$(document).ready(function(){

}); 

$(function(){
	$("#write").on("click", function(e) {
		e.preventDefault();
		$("form").submit();
		
		/* 
		var paramIdValue = getParameters('id');
		var paramTitleValue = $("#title").val();
		var paramContentsValue = $("#contents").val();
		
		 $.ajax({
		        url : "${pageContext.request.contextPath }/board/writeArticle.bim",
		        type: "post",
		        data : { 
		        	"boardName" : paramIdValue,
		        	"title" : paramTitleValue,
		        	"contents" : paramContentsValue
		        },
		        success : function(data){
		         if ( data.result == "success") {
		     		location.href=  "${pageContext.request.contextPath }/board/viewList.bim?id="+paramIdValue;
				}
		        }
		    });
		 
		 */ 
		
	});

	
	$("#list").click(function() {
		if (confirm("정말로 글쓰기를 취소 하시겠습니까?")) {
     		location.href=  "${pageContext.request.contextPath }/board/viewList.bim?id="+paramIdValue;
		}
	});

});

</script>
</head>
<body>
    <h1>writeForm.jsp</h1>
     <form id="writeForm" action="${pageContext.request.contextPath }/board/writeArticle.bim" method="post" enctype="multipart/form-data">
        <table>
            <tbody>
                <tr>
                    <th>제목</th>
                    <td><input type="text" id="title" name="title" class="wdp_90" size="98"/></td>
                </tr>
                
                <tr>
					<th>내용</th>                   
                       <td> <textarea rows="20" cols="100"  id="contents" name="contents"></textarea></td>
                </tr>
                <tr>
                <th rowspan="5">첨부파일</th>
                <td><input type="file" name="files1"></td>
                </tr>
                <tr>
                		<td><input type="file" name="files2"></td>
                </tr>
                <tr>
                		<td><input type="file" name="files3"></td>
                </tr>
                <tr>
                		<td><input type="file" name="files4"></td>
                </tr>
            </tbody>
        </table>
 <input type="button" id="write" value="글쓰기"/>
 <input type="button" id="list" value="목록"/>
 <input type="hidden" id="boardName" name="boardName" value="${param.id }"/>
 
    </form>


 
</body>
</html>


