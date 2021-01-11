<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a{
	text-decoration: none;
}
a#moveid {
	color: rgb(207, 3, 3);
}
a:hover { 
	cursor:pointer; 
}
.btn-action{
	text-align: center;
	padding: 3px 10px;
	border:1px solid #1a1b1d;
	border-radius: 3px;
	box-shadow: 2px 2px 3px #022d72;
	background-color: #1a1b1d;
	color: #fff;
}
</style>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('form[name=listForm]').on(
				'submit',
				function(e) {
					if ($('input[name=keyword]').val() == null
							|| $('input[name=keyword]').val() == "") {
						alert("검색어를 입력해 주세요");
						e.preventDefault();
					} else {
						return true;
					}
				});
	});
</script>
</head>
<body>
<div style="text-align: center; margin-top:70px;"><h2>회원 신고 목록</h2></div>
<table align="center" cellpadding="10" cellspacing="0" border="1" width="60%">
	<tr>
		<td colspan="4" style="border: none;">
			<form method="get" name="listForm" action="reportmemberManagelist.do">
			<input type="hidden" name="page" value="${currentPage}"> 
			<input type="text" name="keyword"> <input class="btn-action" type="submit" value="검색">
			</form></td>
		<td align="right" colspan="6" cellspacing="0" style="border: none;"><input class="btn-action" type="button" value="전체목록"
				onclick="window.location='reportmemberManagelist.do'"> </td>
	</tr>

	<tr>
		<td align="center" width="60">번호</td>
		<td align="center" width="100">피신고자</td>
		<td align="center" width="100">신고자</td>
		<td align="center" width="300">신고사유</td>
		<td align="center" width="100">신고날짜</td>
	</tr>
	<!-- 글이 없을 경우 -->
		<c:if test="${listCount eq 0}">
			<tr>
				<td colspan="5" align="center"><br> <br> 신고된 회원이 
					없습니다.<br> <br></td>
			</tr>
		</c:if>	
		<c:if test="${listCount ne 0}">
			<c:forEach var="vo" items="${list}" varStatus="status">
				<tr>
					<td align="center">${status.count}</td>
					<td align="left"><a id="moveid"
						href="memberManageDetail.do?m_id=${vo.m_id1}&page=${currentPage}">
							&nbsp;${vo.m_id1} </a></td>
					
					<td align="center">${vo.m_id2}</td>
					<td align="center">${vo.rm_reason}</td>
					<td align="center">${vo.rm_date}</td>
				</tr>
			</c:forEach>
		</c:if>	
		<!-- 앞 페이지 번호 처리 -->
		<tr align="center" height="20">
			<td colspan="5"><c:if test="${currentPage <= 1}">
				 [이전]&nbsp;
				 </c:if> <c:if test="${currentPage > 1}">
					<c:url var="blistST" value="reportmemberManagelist.do">
						<c:param name="page" value="${currentPage-1}" />
					</c:url>
					<a href="${blistST}">[이전]</a>
				</c:if> <!-- 끝 페이지 번호 처리 --> <c:set var="endPage" value="${maxPage}" /> <c:forEach
					var="p" begin="${startPage+1}" end="${endPage}">
					<c:if test="${p eq currentPage}">
						<font color="black" size="4"><b>[${p}]</b></font>
					</c:if>
					<c:if test="${p ne currentPage}">
						<c:url var="blistchk" value="reportmemberManagelist.do">
							<c:param name="page" value="${p}" />
						</c:url>
						<a href="${blistchk}">${p}</a>
					</c:if>
				</c:forEach> <c:if test="${currentPage >= maxPage}">
					 [다음]
					 </c:if> <c:if test="${currentPage < maxPage}">
					<c:url var="blistEND" value="reportmemberManagelist.do">
						<c:param name="page" value="${currentPage+1}" />
					</c:url>
					<a href="${blistEND}">[다음]</a>
				</c:if></td>
		</tr>
</table>
</body>
</html>