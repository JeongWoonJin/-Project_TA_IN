<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>관리자</title>
<link href="${pageContext.request.contextPath}/resources/css/reset.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/header.css"
	rel="stylesheet" type="text/css">
<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
	type="text/javascript"></script>
<script src="https://kit.fontawesome.com/2409d81413.js"
	crossorigin="anonymous"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
* {
	margin: 0;
}

#mManage {
	width: 1000px;
	margin: 0 auto;
	padding: 0;
}

#menu {
	float: left;
	width: 20%;
}

#menulist {
	list-style: none;
	padding-left: 0;
}

#menulist>li {
	text-align: left;
	padding: 20px 0px 20px 0px;
}

#menulist>li>a {
	color: black;
	text-decoration: none;
}

#menulist>li:hover {
	background-color: #F6F6F6;
	border-left: 2px solid #D5D5D5;
}

#contentmanage {
	display: inline-block;
	float: right;
	width: 78%;
	height: 100%;
	text-align: center;
}

.tit {
	font-size: 25px;
}

#table_top {
	line-height: 45px;
	vertical-align: middle;
	border-bottom: 1px solid gray;
}

#table_top td {
	padding: 0 20px;
}

.table_body {
	line-height: 45px;
	text-align: center;
	border-bottom: 1px solid gray;
}

.table_bottom {
	line-height: 50px;
	text-align: center;
}

a {
	text-decoration: none;
}

a.moveid {
	color: rgb(207, 3, 3);
}

a:hover {
	cursor: pointer;
}

.btn-action {
	text-align: center;
	padding: 3px 10px;
	border: 1px solid #1a1b1d;
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
		$('form[name=rbblistForm]').on(
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
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="mManage">
		<div id="menu">
			<ul id="menulist">
				<li><a href="membermanagelist.do">일반회원</a></li>
				<li><a href="bsmemberManagelist.do">비지니스회원</a></li>
				<li><a href="boardManagelist.do">일반게시글</a></li>
				<li><a href="bsboardManagelist.do">비지니스게시글</a></li>
				<li><a href="reportmemberManagelist.do">신고회원</a></li>
				<li><a href="reportBoardManagelist.do">신고(일반게시글)</a></li>
				<li><a href="reportBsboardManagelist.do">신고(비지니스게시글)</a></li>
			</ul>
		</div>
		<div id="contentmanage">
			<div id="head_aticle">
				<h2 class="tit">비지니스 게시글 신고 목록</h2>
				<br> <br>
			</div>
			<table align="center" cellpadding="10" cellspacing="0" width="100%">
				<tr id="table_top">
					<td colspan="3" align="left">
						<form method="get" name="rbblistForm"
							action="reportBsboardManagelist.do">
							<input type="hidden" name="page" value="${currentPage}">
							<input type="text" name="keyword"> <input
								class="btn-action" type="submit" value="검색">
						</form>
					</td>
					<td align="right" colspan="5" cellspacing="0"><input
						class="btn-action" type="button" value="전체목록"
						onclick="window.location='reportBsboardManagelist.do'"></td>
				</tr>
				<tr class="table_body">
					<td align="center" width="60">번호</td>
					<td align="center" width="150">신고 게시글</td>
					<td align="center" width="100">신고자</td>
					<td align="center" width="300">신고사유</td>
					<td align="center" width="100">신고날짜</td>
				</tr>
				<!-- 글이 없을 경우 -->
				<c:if test="${rbblistCount eq 0}">
					<tr class="table_body">
						<td colspan="5" align="center"><br> <br> 신고된 게시글이
							없습니다.<br> <br></td>
					</tr>
				</c:if>
				<c:if test="${rbblistCount ne 0}">
					<c:forEach var="rbb" items="${rbblist}" varStatus="rbbstatus">
						<tr class="table_body">
							<td align="center">${rbbstatus.count}</td>
							<td align="center"><a class="moveid"
								href="bsboardManagelist.do?bb_id=${rbb.bb_id}&page=${currentPage}">
									&nbsp;${rbb.bb_id} </a></td>
							<td align="center">${rbb.m_id}</td>
							<td align="center">${rbb.rbb_reason}</td>
							<td align="center">${rbb.rbb_date}</td>
						</tr>
					</c:forEach>
				</c:if>
				<!-- 앞 페이지 번호 처리 -->
				<tr class="table_bottom">
					<td colspan="5"><c:if test="${currentPage <= 1}">
				 [이전]&nbsp;
				 </c:if> <c:if test="${currentPage > 1}">
							<c:url var="rblistST" value="reportBsboardManagelist.do">
								<c:param name="page" value="${currentPage-1}" />
							</c:url>
							<a href="${rblistST}">[이전]</a>
						</c:if> <!-- 끝 페이지 번호 처리 --> <c:set var="endPage" value="${maxPage}" />
						<c:forEach var="rb" begin="${startPage+1}" end="${endPage}">
							<c:if test="${rb eq currentPage}">
								<font color="black" size="4"><b>[${rb}]</b></font>
							</c:if>
							<c:if test="${rb ne currentPage}">
								<c:url var="rbblistchk" value="reportBsboardManagelist.do">
									<c:param name="page" value="${rb}" />
								</c:url>
								<a href="${rbblistchk}">${rb}</a>
							</c:if>
						</c:forEach> <c:if test="${currentPage >= maxPage}">
					 [다음]
					 </c:if> <c:if test="${currentPage < maxPage}">
							<c:url var="rbblistEND" value="reportBsboardManagelist.do">
								<c:param name="page" value="${currentPage+1}" />
							</c:url>
							<a href="${rbblistEND}">[다음]</a>
						</c:if></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>