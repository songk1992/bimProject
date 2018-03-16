<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/include/common.jsp" %>
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function() {



});

$(function(){
	
	$("#writeComment").on('click',function() {
		 $.ajax({
		        url : "${pageContext.request.contextPath }/comment/writeCommentAjax.bim",
		        type: "POST",
		        data: 
		        		{ 
		        		"parentIdx" : "${sessionScope.articleInfo.idx}",
						"contents" : $("#writeCommentContents").val(),
						"writeId" : "${sessionScope.loginInfo.id}"
						},
		        success : function(data){
		         if ( data.result == "success") {
					console.log("댓글 작성 완료");
				}
		        },
		        error : function(error){
		        	alert("댓글 등록 실패");
		        },
		        complete : function(){
					getCommentList();
		        }
		    });
	});
	
	
	function getCommentList(){
		
		var num = getParameters('num');
		var data = { num : num };
			$.ajax({
		        type : "POST",
		        url : "${pageContext.request.contextPath }/comment/getCommentList.bim",
		        data : data,
		        dataType : "html",
		        success : function(data){
		           	$("#commentContent").html(data);
		        },
		        error : function(data){
		            alert(' 실패!!');
		        }
			});
		}

	function editCommentInit(idx) {
		var editDiv = $('div[id=editDiv][data-idx='+idx+']');
		editDiv.show();
		
		var selectComment= $('p[data-idx='+idx+']');
		var selectCommentValue = selectComment.text();
		
		var beforeComment = $('#editCommentContents[data-idx='+idx+']');
		var beforeCommentValue = beforeComment.val();
		beforeComment.focus();
		console.log(selectCommentValue);
		console.log(beforeCommentValue);
	}
	function editComment(idx){
		
		 $.ajax({
		        url : "${pageContext.request.contextPath }/comment/editCommentAjax.bim",
		        type: "post",
		        data: { 
		        		"idx" : idx, 
		        		"contents" : $("#editCommentContents").val(),
						"writeId" : "${sessionScope.loginInfo.id}"
						},
		        success : function(data){
		         if ( data.result == "success") {
					editCommentAction(idx);
				}else {
					alert("댓글 수정 실패");
				}
		         
		        },
		        error : function(error){
		        	alert("댓글 수정 실패");
		        },
		        complete : function(){
					getCommentList();
		        }
		    });
		 
	}
	function editCommentAction(idx){
		var selectComment= $('p[data-idx='+idx+']');
		var selectCommentValue = selectComment.text();
		
		var beforeComment = $('#editCommentContents[data-idx='+idx+']');
		var beforeCommentValue = beforeComment.val();
		
		console.log(selectCommentValue);
		console.log(beforeCommentValue);
	};
	function deleteComment(idx){
		 $.ajax({
		        url : "${pageContext.request.contextPath }/comment/deleteCommentAjax.bim",
		        type: "post",
		        data: { 
		        		"idx" : idx,
						"writeId" : "${sessionScope.loginInfo.id}"
						},
		        success : function(data){
		         if ( data.result == "success") {
					console.log("댓글 삭제 완료");
				}else {
					alert("댓글 삭제 실패");
				}
		         
		        },
		        error : function(error){
		        	alert("댓글 삭제 실패");
		        },
		        complete : function(){
					getCommentList();
		        }
		    });
		 
	}
});


 
 
</script>
</head>
<body>


<h4>댓글</h4>
	<c:forEach items="${commentList}" var="comment">
		<p data-idx=${comment.idx }>
			작성자 : ${comment.writeId} 댓글번호 : ${comment.idx}  
			내용 :${comment.contents}
			<c:set var="writeCommentId" value="${comment.writeId}" />
			<c:set var="sessionId" value="${sessionScope.loginInfo.id}" />
			
			<c:if test="${writeCommentId == sessionId}">
			   <input type="button" id="editCommentInit" value="댓글수정" onclick="editCommentInit(${comment.idx})" data-idx="${comment.idx}">
			   <input type="button" id="deleteComment" value="댓글삭제" onclick="deleteComment(${comment.idx})">
			    
			</c:if>
		</p>
			<div id="editDiv"  data-idx="${comment.idx}" style="display:none; margin: 50px 1px 50px 1px">
				<p>
			<input type="text" size="40" id="editCommentContents" value="${comment.contents}" data-idx="${comment.idx}" placeholder="댓글을 수정하세요"> 
			<input type="button" onclick="editComment(${comment.idx})" value="댓글수정">
				</p>
			</div> 
	</c:forEach>

		<c:if test="${!empty sessionScope.loginInfo}">
			<table border="2">
				<tbody>
					<tr>
						<th>댓글 내용</th>
						<td colspan="5" width="250" height="50"><input type="text" size="40" id="writeCommentContents" placeholder="댓글을 입력하세요"></td>
						<td><input type="button" id="writeComment" value="댓글작성"></td>
					</tr>
				</tbody>
			</table>
		</c:if>


</body>
</html>