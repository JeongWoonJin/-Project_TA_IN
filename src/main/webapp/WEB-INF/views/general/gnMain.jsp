<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>TA_IN</title>
            <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
            <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
            <script src="https://kit.fontawesome.com/2409d81413.js" crossorigin="anonymous"></script>
            <style>
                body {
                    width: 100%;
                    height: 100%;
                }
                
                #content_con {
                    display: flex;
                    justify-content: center;
                    width: 100%;
                }
                
                #general_con {
                    width: 1000px;
                }
                
                #profile_con_top {
                    width: 100%;
                    height: 150px;
                }
                
                #profile_photo {
                    width: 150px;
                    height: 150px;
                    background-color: beige;
                    margin-left: 50px;
                    border-radius: 50%;
                    float: left;
                    cursor: pointer;
                }
                
                #profile_left {
                    margin-left: 80px;
                    width: 720px;
                    float: left;
                }
                
                #profile_left_top_con {
                    height: 40px;
                }
                
                #profile_name {
                    height: 40px;
                    font-size: 28px;
                    line-height: 40px;
                    float: left;
                }
                
                .profile_btn {
                    float: left;
                    margin-left: 20px;
                    margin-top: 5px;
                    height: 18px;
                    padding: 5px 9px 5px 9px;
                    border: 1px solid black;
                    font-size: 14px;
                    line-height: 18px;
                    cursor: pointer;
                }
                
                .setting_icon {
                    width: 20px;
                    height: 20px;
                    font-size: 20px;
                    margin-left: 15px;
                    margin-top: 10px;
                    float: left;
                    cursor: pointer;
                }
                
                #profile_middle {
                    height: 18px;
                    width: 100%;
                    margin-top: 20px;
                }
                
                #profile_intro {
                    width: 100%;
                    margin-top: 20px;
                    font-size: 16px;
                }
                
                #highlight_con {
                    margin-top: 44px;
                    margin-bottom: 44px;
                    height: 130px;
                    width: 100%;
                }
                
                .highlight_small_con {
                    width: 87px;
                    height: 100%;
                    float: left;
                    padding: 0px 20px 0px 20px;
                }
                
                .highlight_photo {
                    height: 87px;
                    width: 87px;
                    background-color: green;
                    border-radius: 50%;
                    margin-top: 10px;
                    cursor: pointer;
                }
                
                .highlight_title {
                    height: 18px;
                    width: 100%;
                    text-align: center;
                    font-size: 14px;
                    margin-top: 15px;
                    cursor: pointer;
                }
                
                #hidden_follow_rec {
                    width: 988px;
                    height: 280px;
                    white-space: nowrap;
                    border: 1px solid black;
                    box-sizing: border-box;
                    padding: 20px 0px 20px 12px;
                    margin-bottom: 28px;
                    overflow-x: auto;
                    overflow-y: hidden;
                }
                
                #rec_title {
                    width: 975px;
                    height: 18px;
                    margin-left: 13px;
                    font-size: 14px;
                    line-height: 18px;
                }
                
                .each_rec_con {
                    margin-top: 14px;
                    width: 134px;
                    height: 156px;
                    padding: 20px;
                    border: 1px solid black;
                    margin-right: 24px;
                    text-align: center;
                    display: inline-block;
                }
                
                .each_rec_photo {
                    width: 54px;
                    height: 54px;
                    background-color: burlywood;
                    border-radius: 50%;
                    margin-bottom: 20px;
                    margin-left: 40px;
                }
                
                .each_rec_id {
                    height: 18px;
                    font-size: 14px;
                    line-height: 18px;
                }
                
                .each_rec_name {
                    height: 18px;
                    font-size: 14px;
                    line-height: 18px;
                    margin-top: 5px;
                }
                
                .each_rec_followbtn {
                    width: 114px;
                    height: 18px;
                    padding: 5px 9px 5px 9px;
                    border: 1px solid black;
                    font-size: 14px;
                    line-height: 18px;
                    margin-top: 12px;
                }
                
                #line {
                    margin: 0px;
                }
                
                #cate {
                    width: 100%;
                    height: 53px;
                    display: flex;
                    justify-content: center;
                }
                
                .cate_1 {
                    width: 52px;
                    height: 53px;
                    line-height: 53px;
                    font-size: 12px;
                }
                
                .cate_con {
                    float: left;
                    margin-top: 20px;
                }
                
                .category {
                    float: right;
                }
                
                #photo_con {
                    width: 100%;
                    display: flex;
                    flex-wrap: wrap;
                    justify-content: space-between;
                }
                
                .each_photo {
                    width: 312px;
                    height: 312px;
                    background-color: beige;
                    margin-bottom: 32px;
                    cursor: pointer;
                }
                
                .nocursor {
                    cursor: auto;
                }
                
                .small_con {
                    margin-right: 40px;
                    float: left;
                    font-size: 16px;
                    line-height: 18px;
                }
                
                footer {
                    width: 100%;
                    height: 78px;
                    margin-bottom: 52px;
                    text-align: center;
                }
                
                #post_back {
                    position: fixed;
                    width: 100%;
                    height: 100%;
                    background-color: black;
                    opacity: 0.5;
                    display: none;
                    z-index: 5;
                }
                
                #post_modal {
                    position: fixed;
                    width: 100%;
                    height: 100%;
                    display: none;
                    z-index: 6;
                }
                
                #post_con {
                    position: absolute;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                    width: 1000px;
                    height: 600px;
                    background: #fff;
                    z-index: 7;
                    text-align: center;
                    font-size: 14px;
                    background: #fff;
                    display: inline;
                }
                
                #for_stay_left {
                    width: 600px;
                    height: 600px;
                    float: left;
                }
                
                #slide_photo_con {
                    max-width: 600px;
                    height: 100%;
                    position: relative;
                    overflow: hidden;
                }
                
                #photo {
                    /* width: 600px;
                    height: 600px;
                    background-color: beige;
                    float: left; */
                    display: flex;
                    position: absolute;
                    top: 0px;
                    left: 0px;
                }
                
                .photo_all {
                    width: 600px;
                    height: 600px;
                    background-color: beige;
                }
                
                #post_right {
                    width: 400px;
                    height: 600px;
                    float: left;
                }
                
                #post_right_top {
                    width: 368px;
                    height: 40px;
                    background-color: white;
                    padding: 16px;
                }
                
                #post_profile_photo {
                    width: 40px;
                    height: 40px;
                    background-color: black;
                    border-radius: 50%;
                    float: left;
                }
                
                #post_profile_id {
                    margin-left: 14px;
                    height: 40px;
                    float: left;
                    font-size: 14px;
                    line-height: 40px;
                }
                
                #followbtn {
                    margin-left: 18px;
                    line-height: 40px;
                    float: left;
                    font-size: 14px;
                    cursor: pointer;
                }
                
                .fa-bars_post {
                    font-size: 16px;
                    float: right;
                    margin-top: 12px;
                }
                
                #post_right_middle {
                    width: 100%;
                    height: 364px;
                    padding-top: 13px;
                    overflow: auto;
                }
                
                .each_reply_con {
                    padding: 12px 13px 16px 16px;
                    width: 371px;
                    overflow: hidden;
                    height: auto;
                }
                
                .reply_com_con {
                    width: 371px;
                    overflow: hidden;
                    height: auto;
                }
                
                .reply_profile_photo {
                    width: 40px;
                    height: 40px;
                    border-radius: 50%;
                    float: left;
                }
                
                .reply_right {
                    margin-left: 14px;
                    min-height: 47px;
                    width: 313px;
                    float: right;
                    text-align: left;
                    font-size: 14px;
                    line-height: 17px;
                }
                
                .reply_right_com {
                    margin-left: 14px;
                    min-height: 47px;
                    width: 277px;
                    float: left;
                    text-align: left;
                    font-size: 14px;
                    line-height: 17px;
                }
                
                .icon_com {
                    width: 12px;
                    height: 12px;
                    float: right;
                    cursor: pointer;
                }
                
                .icon {
                    width: 24px;
                    height: 24px;
                    float: left;
                    cursor: pointer;
                    margin-right: 16px;
                }
                
                .save_icon {
                    margin: 0px;
                    float: right;
                }
                
                .like_icon {
                    background-image: url('${pageContext.request.contextPath}/resources/images/002-heart.svg');
                    background-size: 24px;
                }
                
                .like_icon:hover {
                    background-image: url('${pageContext.request.contextPath}/resources/images/001-like.svg');
                    background-size: 24px;
                }
                
                .unlike_icon {
                    background-image: url('${pageContext.request.contextPath}/resources/images/001-like.svg');
                    background-size: 24px;
                    display: none;
                }
                
                .share_icon {
                    background-image: url('${pageContext.request.contextPath}/resources/images/001-share-1.svg');
                    background-size: 24px;
                }
                
                .share_icon:hover {
                    background-image: url('${pageContext.request.contextPath}/resources/images/002-share.svg');
                    background-size: 24px;
                }
                
                .write_icon {
                    background-image: url('${pageContext.request.contextPath}/resources/images/002-speech-bubble-1.svg');
                    background-size: 24px;
                }
                
                .write_icon:hover {
                    background-image: url('${pageContext.request.contextPath}/resources/images/001-speech-bubble.svg');
                    background-size: 24px;
                }
                
                .save_icon {
                    background-image: url('${pageContext.request.contextPath}/resources/images/001-tag.svg');
                    background-size: 24px;
                }
                
                .save_icon:hover {
                    background-image: url('${pageContext.request.contextPath}/resources/images/006-price-tag.svg');
                    background-size: 24px;
                }
                
                .comment_lcon {
                    background-image: url('${pageContext.request.contextPath}/resources/images/002-heart.svg');
                    background-size: 12px;
                }
                
                .comment_lcon:hover {
                    background-image: url('${pageContext.request.contextPath}/resources/images/001-like.svg');
                    background-size: 12px;
                }
                
                .comment_unlcon {
                    background-image: url('${pageContext.request.contextPath}/resources/images/001-like.svg');
                    background-size: 12px;
                    display: none;
                }
                
                .reply_con {
                    width: 313px;
                }
                
                .reply_date {
                    height: 14px;
                    margin-top: 16px;
                }
                
                .rebot {
                    margin-right: 12px;
                    float: left;
                    cursor: pointer;
                }
                
                .show_re_re {
                    padding: 16px 0px 0px 58px;
                    height: 18px;
                    width: 303px;
                    text-align: left;
                }
                
                #post_right_bottom {
                    width: 100%;
                    height: 151px;
                }
                
                #post_icon_box {
                    width: 368px;
                    height: 32px;
                    padding: 12px 16px 0px 16px;
                }
                
                #post_like {
                    width: 384px;
                    height: 20px;
                    background-color: white;
                    padding: 0px 0px 0px 16px;
                    text-align: left;
                    font-size: 14px;
                    line-height: 20px;
                }
                
                #post_date {
                    width: 384px;
                    height: 19px;
                    margin-top: 4px;
                    background-color: white;
                    font-size: 10px;
                    line-height: 19px;
                    text-align: left;
                    padding: 0px 0px 0px 16px;
                }
                
                #reply_box {
                    width: 368px;
                    height: 37px;
                    margin-top: 8px;
                    background-color: white;
                    padding: 18px 16px 0px 16px
                }
                
                #commentbox {
                    outline: none;
                    border: none;
                    background-color: none;
                    float: left;
                    font-size: 14px;
                    line-height: 18px;
                    width: 343px;
                    padding: 0px;
                }
                
                #sendbtn {
                    float: right;
                    cursor: pointer;
                }
                
                .cancel {
                    position: absolute;
                    right: 0px;
                }
                
                #report_back {
                    position: fixed;
                    width: 100%;
                    height: 100%;
                    background-color: black;
                    opacity: 0.5;
                    display: none;
                    z-index: 5;
                }
                
                #report_modal {
                    position: fixed;
                    width: 100%;
                    height: 100%;
                    display: none;
                    z-index: 6;
                }
                
                #report_choose,
                #report_write,
                #report_result,
                #report_already,
                #pre_report_choose,
                #unfollowchk,
                #askunfollow,
                #cantunfollow,
                #share_con,
                #share_con_result {
                    position: absolute;
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                    width: 400px;
                    background: #fff;
                    z-index: 7;
                    border-radius: 20px;
                    text-align: center;
                    font-size: 14px;
                }
                
                .modal_in {
                    width: 100%;
                    height: 48px;
                    line-height: 48px;
                    cursor: pointer;
                    border-bottom: 1px solid #8E8E8E;
                    color: #262626;
                }
                
                #etc_write_con {
                    height: 192px;
                }
                
                #etx_write_space {
                    margin-top: 5px;
                    margin-left: 16px;
                    width: 364px;
                    height: 182px;
                    padding: 0px;
                    border: none;
                    outline: none;
                }
                
                .modal_title {
                    height: 42px;
                }
                
                #report {
                    color: #ED4956;
                }
                
                .modal_nocursor {
                    cursor: default;
                }
                
                .modal_result {
                    height: 96px;
                }
                
                .fa-bars_title {
                    display: block;
                    margin-right: 16px;
                    float: right;
                    line-height: 60px;
                    height: 14px;
                }
                
                .lcount {
                    outline: none;
                    border: none;
                    background-color: transparent;
                    padding: 0px;
                }
            </style>
        </head>

        <body>
            <input type="hidden" class="m_id" value="${my_name }">
            <input type="hidden" class="post_id" value="${id_img_fwr.m_id }">
            <div id="report_back"></div>
            <div id="report_modal">
                <div id="share_con" style="display: none;">
                    <div class="modal_in modal_title modal_nocursor">게시물 공유하기</div>
                    <div id="url_con" class="modal_in">
                        <textarea id="url" readonly></textarea>
                    </div>
                    <div id="share_chk" class="modal_in">복사하기</div>
                    <div id="cancel_9" class="modal_in cancel">취소</div>
                </div>
                <div id="share_con_result" style="display: none;">
                    <div class="modal_in modal_title modal_nocursor">게시물의 주소가 복사됐습니다.</div>
                    <div id="cancel_10" class="modal_in cancel">화면으로 돌아가기</div>
                </div>
            </div>
            <div id="post_back"></div>
            <div id="post_modal">
                <input type="hidden" id="for_fuc">
                <div id="post_con" style="display: none;">
                    <div id="for_stay_left">
                        <button type="button" class="slide_btn_prev" class="buttons">Prev</button>
                        <div id="slide_photo_con">
                            <div id="photo"></div>
                        </div>
                        <button type="button" class="slide_btn_next" class="buttons">Next</button>
                    </div>
                    <div id="post_right">
                        <div id="post_right_top">
                            <div id="post_profile_photo">${id_img_fwr.m_img }</div>
                            <div id="post_profile_id">${id_img_fwr.m_id }</div>
                            <c:if test="${id_img_fwr.m_id eq my_name}">
                                <i class="fas fa-bars fa-bars_post"></i>
                            </c:if>
                            <c:if test="${id_img_fwr.m_id ne my_name}">
                                <div id="followbtn">팔로잉</div>
                                <i class="fas fa-bars fa-bars_post"></i>
                            </c:if>
                        </div>
                        <div id="post_right_middle">
                            <div class="each_reply_con">
                                <div class="reply_profile_photo">${id_img_fwr.m_img }</div>
                                <div class="reply_right re_main_con" id="re_main_con">
                                </div>
                                <div class="reply_right" id="hashtag_con">
                                </div>
                            </div>
                        </div>
                        <div id="post_right_bottom">
                            <div id="post_icon_box">
                                <div class="icon like_icon likechk" onclick="pressLike();"></div>
                                <div class="icon unlike_icon unlikechk" onclick="pressUnLike();"></div>
                                <div class="icon write_icon"></div>
                                <div class="icon share_icon" onclick="shareurl();"></div>
                                <div class="icon save_icon"></div>
                            </div>
                            <div id="post_like"></div>
                            <div id="post_date"></div>
                            <div id="reply_box">
                                <input type="text" id="commentbox" placeholder="댓글 달기..">
                                <div id="sendbtn" class="comment_upload">게시</div>
                            </div>
                        </div>
                    </div>
                </div>
                <input type="button" class="cancel">
            </div>
            <jsp:include page="../header.jsp"></jsp:include>
            <div id="content_con">
                <div id="general_con">
                    <div id="profile_con_top">
                        <div id="profile_photo" onclick="goStory('${id_img_fwr.m_id }');">${id_img_fwr.m_img }</div>
                        <input type="hidden" id="storychk" value="${storychk.story }">
                        <div id="profile_left">
                            <div id="profile_left_top_con">
                                <div id="profile_name">${id_img_fwr.m_id }</div>
                                <c:if test="${id_img_fwr.m_id eq my_name}">
                                    <div id="setting" class="profile_btn">프로필 편집</div>
                                    <i class="fas fa-cog setting_icon"></i>
                                </c:if>
                                <c:if test="${id_img_fwr.m_id ne my_name}">
                                    <div id="send_message" class="profile_btn">메시지 보내기</div>
                                    <div id="followchk" class="profile_btn">
                                        <c:if test="${followchk.follow ne 0}">
                                            <i class="fas fa-user-check"></i>
                                        </c:if>
                                        <c:if test="${followchk.follow eq 0}">
                                            팔로우
                                        </c:if>
                                    </div>
                                    <label for="rf">
										<div id="recom_follow" class="profile_btn">
											<i class="fas fa-caret-down"></i>
										</div>
									</label>
                                    <input type="checkbox" id="rf" style="display: none;">
                                    <i class="fas fa-bars setting_icon"></i>
                                </c:if>
                            </div>
                            <div id="profile_middle">
                                <div class="small_con">게시물 ${gboard.post }+${bboard.post }</div>
                                <div class="small_con">팔로워 ${id_img_fwr.follower }</div>
                                <div class="small_con">팔로우 ${fw.follow }</div>
                            </div>
                            <div id="profile_intro">${id_img_fwr.m_intro }</div>
                        </div>
                    </div>
                    <div id="highlight_con">
                        <c:if test="${not empty highlight }">
                            <c:forEach var="vo" items="${highlight }" varStatus="s">
                                <div class="highlight_small_con">
                                    <div class="highlight_photo">${vo.h_img }</div>
                                    <div class="highlight_title">${vo.h_name }</div>
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>
                    <div id="hidden_follow_rec" style="display: none;">
                        <div id="rec_title">
                            <div id="title1">추천계정</div>
                            <c:if test="${not empty recomFow }">
                            <c:forEach var="vo" items="${recomFow }" varStatus="s">
                            <div class="each_rec_con">
                                <div class="each_rec_photo">${vo.m_img }</div>
                                <div class="each_rec_id">${vo.r_mid }</div>
                                <div class="each_rec_name">${vo.m_name }</div>
                                <div class="each_rec_followbtn">팔로우</div>
                            </div>
                            </c:forEach>
                            </c:if>
                        </div>
                    </div>
                    <hr id="line">
                    <div id="cate">
                        <c:if test="${id_img_fwr.m_id ne my_name}">
                            <div class="cate_1">
                                <i class="fas fa-border-all cate_con"></i>
                                <div class="category">게시물</div>
                            </div>
                        </c:if>
                        <c:if test="${id_img_fwr.m_id eq my_name}">
                            <div class="cate_1" style="margin-right: 60px;">
                                <i class="fas fa-border-all cate_con"></i>
                                <div class="category">게시물</div>
                            </div>
                            <div class="cate_1">
                                <i class="fas fa-tags cate_con"></i>
                                <div class="category">저장됨</div>
                            </div>
                        </c:if>
                    </div>
                    <div id="photo_con">
                        <c:if test="${not empty showpost }">
                            <c:forEach var="vo" items="${showpost }" varStatus="s">
                                <div class="each_photo" onclick="showpost('${vo.b_id }','${vo.b_type }');">${vo.b_id } ${vo.b_img }</div>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
            </div>
            <footer> dddd </footer>
        </body>
        <script>
            var memId = $(".m_id").val();
            $(function() {

                // flex 화면 맞추기
                var postcount = $(".each_photo").length;
                var forflex = postcount % 3;
                if (forflex == 1) {
                    $("#photo_con").append('<div class="each_photo nocursor"></div>');
                    $("#photo_con").append('<div class="each_photo nocursor"></div>');
                } else if (forflex == 2) {
                    $("#photo_con").append('<div class="each_photo nocursor"></div>');
                }
            });

            // 스토리로 이동
            function goStory(m_id) {
                var storychk = $("#storychk").val();
                if (storychk != 0) {
                    var url = "${pageContext.request.contextPath}/eachstory?id=" + m_id;
                    $(location).attr('href', url);
                } else {}
            }

            // 게시글 상세페이지
            function showpost(t_id) {
                $("#post_back").css("display", "block");
                $("#post_modal").css("display", "block");
                $("#post_con").css("display", "block");

                $.ajax({
                    url: "${pageContext.request.contextPath}/hiddenShowLike.do",
                    method: "POST",
                    data: {
                        b_id: t_id,
                        m_id: memId
                    },
                    dataType: "json",
                    success: function(hLike) {
                        console.log("hlike" + hLike);
                        if (hLike >= 1) {
                            $(".likechk").css("display", "none");
                            $(".unlikechk").css("display", "block");
                        }
                    },
                    error: function(request,
                        status, error) {
                        console.log("code:" +
                            request.status +
                            "\n" +
                            "message:" +
                            request.responseText +
                            "\n" + "error:" +
                            error);
                    }
                });

                $.ajax({
                    url: "${pageContext.request.contextPath}/showeachpost.do",
                    method: "POST",
                    data: {
                        b_id: t_id
                    },
                    dataType: "json",
                    success: function(data) {
                        var b_id = data.showeachpost.b_id;
                        var m_id = data.showeachpost.m_id;
                        var b_date = data.showeachpost.b_date;
                        var likecount = data.showeachpost.likecount;
                        var b_content = data.showeachpost.b_content;
                        var b_img = data.showeachpost.b_img.split(",");

                        $("#for_fuc").val(b_id);
                        for (i = 0; i < b_img.length; i++) {
                            if (b_img[i] != "" && b_img[i] != " ") {
                                console.log(b_img[i]);
                                //$("#photo").append('<img class="photo_all" src="${pageContext.request.contextPath}/resources/uploadFiles/' + b_img[i] + '">');
                                $("#photo").append('<div class="photo_all">' + b_img[i] + '</div>');
                            }
                        }
                        if (b_content == null) {
                            b_content = "";
                            document.getElementById("re_main_con").innerHTML = m_id + "&nbsp;" + b_content;
                        } else {
                            document.getElementById("re_main_con").innerHTML = m_id + "&nbsp;" + b_content;
                        }
                        document.getElementById("post_like").innerHTML = "<input type='button' id='lCount' value='" + likecount + "'>" + "명이 좋아합니다";
                        document.getElementById("post_date").innerHTML = b_date;

                        // 게시물 슬라이드
                        var slideWrapper = document.querySelector('#slide_photo_con');
                        var slides = document.querySelectorAll('.photo_all');
                        var totalSlides = slides.length;
                        var sliderWidth = slideWrapper.clientWidth;
                        var slideIndex = 0;
                        var slider = document.querySelector('#photo');
                        slider.style.width = sliderWidth * totalSlides + 'px';

                        function showSlides(n) {
                            slideIndex = n;
                            if (slideIndex == -1) {
                                slideIndex = totalSlides - 1;
                            } else if (slideIndex === totalSlides) {
                                slideIndex = 0;
                            }
                            slider.style.left = -(sliderWidth * slideIndex) + 'px';
                        }

                        function plusSlides(n) {
                            showSlides(slideIndex += n);
                        }

                        function currentSlide(n) {
                            showSlides(slideIndex = n);
                        }
                        var nextBtn = document.querySelector('.slide_btn_next');
                        var prevBtn = document.querySelector('.slide_btn_prev');
                        nextBtn.addEventListener('click', function() {
                            plusSlides(1);
                        });
                        prevBtn.addEventListener('click', function() {
                            plusSlides(-1);
                        });
                    },
                    error: function(request, status, error) {
                        alert("code:" +
                            request.status +
                            "\n" +
                            "message:" +
                            request.responseText +
                            "\n" + "error:" +
                            error);
                    }
                });


                $.ajax({
                    url: "${pageContext.request.contextPath}/showHashTag.do",
                    method: "POST",
                    dataType: "json",
                    data: {
                        t_id: t_id
                    },
                    success: function(hashtag) {
                        var count = hashtag;
                        if (count.hashtag == undefined) {} else {
                            for (var i = 0; i < count.hashtag.length; i++) {
                                var hashtag1 = count.hashtag[i].h_tag;

                                // 해쉬태그 append - hashtag
                                $(".reply_right").append('<a href="${pageContext.request.contextPath}/explore?hashtag=' + hashtag1 + '">#' + hashtag1 + '</a>&nbsp;');
                            }
                        }
                    },
                    error: function(request, status, error) {
                        alert("code:" +
                            request.status +
                            "\n" +
                            "message:" +
                            request.responseText +
                            "\n" + "error:" +
                            error);
                    }
                });

                $.ajax({
                    url: "${pageContext.request.contextPath}/hiddenShowAllCo.do",
                    method: "POST",
                    data: {
                        t_id: t_id
                    },
                    dataType: "json",
                    success: function(hComment) {
                        var count = hComment;
                        console.log(count.hComment.length);
                        if (count.hComment.length == undefined) {} else {
                            for (var i = 0; i < count.hComment.length; i++) {
                                var id = count.hComment[i].m_id;
                                var b_content = count.hComment[i].b_content;
                                var b_id = count.hComment[i].b_id;
                                var b_type = count.hComment[i].b_type;
                                var countr = count.hComment[i].count;
                                var b_date = count.hComment[i].b_date;
                                var m_img = count.hComment[i].m_img;
                                console.log(i + "는" + b_id);
                                console.log(i + "는 " + countr);
                                $("#post_right_middle").append('<div class="each_reply_con">' +
                                    '<input type="hidden" class="chkCoLike" onclick="chkCoLike(\'' + b_id + '\');">' +
                                    '<div class="reply_com_con">' +
                                    '<div class="reply_profile_photo">' + m_img + '</div>' +
                                    '<div class="reply_right_com">' +
                                    '<div class="reply_con">' + id + '&nbsp;' + b_content + '</div>' +
                                    '<div class="reply_date">' +
                                    '<div class=" rebot">' + b_date + '</div>' +
                                    '<div class="rebot">좋아요 ' + '<input type="button" class="lcount" value="">' + '개</div>' +
                                    '<div class="rebot moreCoW" onclick="writeMoreCo(\'' + b_id + '\');">답글 달기</div>' +
                                    '</div>' +
                                    '</div>' +
                                    '<i class="fas fa-bars fa-bars_reply_title"></i>' +
                                    '<div class="icon_com like_icon comment_lcon likechk' + b_id + '" onclick="pressLike_co(\'' + b_id + '\');"></div>' +
                                    '<div class="icon_com unlike_icon comment_unlcon unlikechk' + b_id + '" onclick="pressUnLike_co(\'' + b_id + '\');"></div>' +
                                    '</div>' +
                                    '<div class="show_re_re show_re_re' + b_id + '" onclick ="show_re_re(\'' + b_id + '\');" style="display:none;">답글 보기 (' + countr + ')개</div>' +
                                    '</div><div class="re_con re_con' + b_id + '"></div>' +
                                    '<div class="com_detail replyCo replyCo' + b_id + '" style="display:none;"><div class="commentRId post_id" style="color:transparent;">' +
                                    id + '</div><input type="text" class="replyCoWri write_space" placeholder="답글 작성..."><button class="rep_comment_upload">게시</button></div>'
                                );
                                if (countr != 0) {
                                    $(".show_re_re" + b_id).css("display", "block");
                                }



                            }
                            $(".chkCoLike").trigger('click');

                        }


                    },
                    error: function(request, status, error) {
                        alert("code:" +
                            request.status +
                            "\n" +
                            "message:" +
                            request.responseText +
                            "\n" + "error:" +
                            error);
                    }
                });
            }

            // 좋아요 체크
            function chkCoLike(b_id) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/hiddenShowLike.do",
                    method: "POST",
                    data: {
                        b_id: b_id,
                        m_id: memId
                    },
                    dataType: "json",
                    success: function(hLike) {
                        console.log("hlike" + hLike);
                        if (hLike >= 1) {
                            $(".likechk" + b_id).css("display", "none");
                            $(".unlikechk" + b_id).css("display", "block");
                        }
                    },
                    error: function(request,
                        status, error) {
                        console.log("code:" +
                            request.status +
                            "\n" +
                            "message:" +
                            request.responseText +
                            "\n" + "error:" +
                            error);
                    }
                });
            }

            // 답글 좋아요
            function pressLike_co(b_id) {
                console.log(memId);
                console.log(b_id);
                $.ajax({
                    url: "${pageContext.request.contextPath}/pressLike.do",
                    method: "POST",
                    data: {
                        m_id: memId,
                        t_id: b_id
                    },
                    async: false,
                    success: function(data) {
                        console.log("memId : " +
                            memId +
                            " b_id : " +
                            b_id);
                        $(".likechk" + b_id).css("display", "none");
                        $(".unlikechk" + b_id).css("display", "block");
                    },
                    error: function(request, status, error) {
                        alert("code:" +
                            request.status +
                            "\n" +
                            "message:" +
                            request.responseText +
                            "\n" + "error:" +
                            error);
                    }
                });
            }

            // 답글 좋아요 취소
            function pressUnLike_co(b_id) {
                console.log(memId);
                console.log(b_id);
                $.ajax({
                    url: "${pageContext.request.contextPath}/pressUnLike.do",
                    method: "POST",
                    data: {
                        m_id: memId,
                        t_id: b_id
                    },
                    success: function(data) {
                        console.log("memId : " +
                            memId +
                            " b_id : " +
                            b_id);
                        $(".likechk" + b_id).css("display", "block");
                        $(".unlikechk" + b_id).css("display", "none");
                    },
                    error: function(request, status, error) {
                        alert("code:" +
                            request.status +
                            "\n" +
                            "message:" +
                            request.responseText +
                            "\n" + "error:" +
                            error);
                    }
                });
            }


            // 답글 보기
            function show_re_re(t_id) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/hiddenShowAllCo.do",
                    method: "POST",
                    data: {
                        t_id: t_id
                    },
                    dataType: "json",
                    success: function(hComment) {
                        var count = hComment;

                        for (var i = 0; i < count.hComment.length; i++) {
                            var id = count.hComment[i].m_id;
                            var b_content = count.hComment[i].b_content;
                            var b_id = count.hComment[i].b_id;
                            var b_date = count.hComment[i].b_date;
                            var m_img = count.hComment[i].m_img;

                            $(".re_con" + t_id).append('<div class="each_reply_con">' +
                                '<input type="hidden" class="chkCoLike" onclick="chkCoLike(\'' + b_id + '\');">' +
                                '<div class="reply_com_con">' +
                                '<div class="reply_profile_photo">' + m_img + '</div>' +
                                '<div class="reply_right_com">' +
                                '<div class="reply_con">' + id + '&nbsp;' + b_content + '</div>' +
                                '<div class="reply_date">' +
                                '<div class=" rebot">' + b_date + '</div>' +
                                '<div class="rebot">좋아요 ' + '<input type="button" class="lcount" value="">' + '개</div>' +
                                '</div>' +
                                '</div>' +
                                '<i class="fas fa-bars fa-bars_reply_title"></i>' +
                                '<div class="icon_com like_icon comment_lcon likechk' + b_id + '" onclick="pressLike_co(\'' + b_id + '\');"></div>' +
                                '<div class="icon_com unlike_icon comment_unlcon unlikechk' + b_id + '" onclick="pressUnLike_co(\'' + b_id + '\');"></div>' +
                                '</div>' +
                                '</div>');
                        }

                        $(".chkCoLike").trigger('click');

                    },
                    error: function(request, status, error) {
                        alert("code:" +
                            request.status +
                            "\n" +
                            "message:" +
                            request.responseText +
                            "\n" + "error:" +
                            error);
                    }
                });
            }

            // 답글 달기 
            function writeMoreCo(b_id) {
                $(".replyCo" + b_id).css("display", "block");

                $(".rep_comment_upload").on('click', function() {
                    var r_comment = $(this).prev().val();
                    console.log(memId);
                    console.log(b_id);
                    console.log(r_comment);
                    if (r_comment == "" || r_comment == null) {
                        console.log("reply comment won't be uploaded");
                        $(".replyCo").css("display", "none");
                        $('.rep_comment_upload').off('click');
                    } else {
                        $.ajax({
                            url: "${pageContext.request.contextPath}/insertReplyComment.do",
                            method: "POST",
                            data: {
                                m_id: memId,
                                t_comment: r_comment,
                                t_id: b_id
                            },
                            success: function(data) {
                                console.log("memId : " +
                                    memId +
                                    " comment : " +
                                    r_comment +
                                    " postid : " +
                                    b_id);
                                $(".write_space").val('');
                                $(".replyCo").css("display", "none");
                                $('.show_re_re').off('click');
                            },
                            error: function(request, status, error) {
                                alert("code:" +
                                    request.status +
                                    "\n" +
                                    "message:" +
                                    request.responseText +
                                    "\n" + "error:" +
                                    error);
                            }
                        });
                    }
                });
            }


            // 게시물 좋아요
            function pressLike() {
                var lcount = $("#lCount").val();
                var b_id = $("#for_fuc").val();
                lcount++;
                console.log(b_id);


                $.ajax({
                    url: "${pageContext.request.contextPath}/pressLike.do",
                    method: "POST",
                    data: {
                        m_id: memId,
                        t_id: b_id
                    },
                    success: function(data) {
                        console.log("memId : " +
                            memId +
                            " b_id : " +
                            b_id);
                        $(".likechk").css("display", "none");
                        $(".unlikechk").css("display", "block");
                        $("#lCount").val(lcount);
                    },
                    error: function(request, status, error) {
                        alert("code:" +
                            request.status +
                            "\n" +
                            "message:" +
                            request.responseText +
                            "\n" + "error:" +
                            error);
                    }
                });

            }

            // 게시물 좋아요 취소
            function pressUnLike() {
                var lcount = $("#lCount").val();
                var b_id = $("#for_fuc").val();
                lcount--;
                $.ajax({
                    url: "${pageContext.request.contextPath}/pressUnLike.do",
                    method: "POST",
                    data: {
                        m_id: memId,
                        t_id: b_id
                    },
                    success: function(data) {
                        console.log("memId : " +
                            memId +
                            " b_id : " +
                            b_id);
                        $(".likechk").css("display", "block");
                        $(".unlikechk").css("display", "none");
                        $("#lCount").val(lcount);
                    },
                    error: function(request, status, error) {
                        alert("code:" +
                            request.status +
                            "\n" +
                            "message:" +
                            request.responseText +
                            "\n" + "error:" +
                            error);
                    }
                });
            }

            // url 공유
            function shareurl() {
                var b_id = $("#for_fuc").val();
                $("#post_back").css("display", "none");
                $("#post_modal").css("display", "none");
                $("#post_con").css("display", "none");
                $("#report_modal").css("display", "block");
                $("#report_back").css("display", "block");
                $("#share_con").css("display", "block");
                $("#url").val(b_id);
                $("#share_chk").on('click', function() {
                    var curl = document.getElementById("url");
                    curl.select();
                    document.execCommand('copy');
                    curl.setSelectionRange(0, 0);
                    $("#share_con").css("display", "none");
                    $("#share_con_result").css("display", "block");
                });
            }

            // 모달 닫기
            //모달 초기화 수정 필요
            $(".cancel").on('click', function() {
                var post_id = $(".post_id").val();
                //$("#post_back").css("display", "none");
                //$("#post_modal").css("display", "none");
                //$("#post_con").css("display", "none");
                //$("#report_modal").css("display", "none");
                //$("#report_back").css("display", "none");
                //$("#share_con").css("display", "none");
                //$("#share_con_result").css("display", "none");
                //$(".each_photo").off('click');
                var url = "${pageContext.request.contextPath}/gnMain?m_id=" + post_id;
                $(location).attr('href', url);

            });

            // 계정 추천
            $("#rf").change(function() {
                if ($("#rf").is(":checked")) {
                    $("#hidden_follow_rec").css("display", "block");
                } else {
                    $("#hidden_follow_rec").css("display", "none");
                }
            });


            // 댓글 작성
            //모달 초기화 수정 필요
            $(".comment_upload").on('click', function() {
                var b_id = $("#for_fuc").val();
                var comment = $(this).prev().val();
                var post_id = $(".post_id").val();
                console.log(comment);
                console.log(memId);
                if (comment == "" || comment == null) {
                    console.log("comment won't be uploaded");
                    return false;
                } else {
                    console.log("board comment upload!");
                    $.ajax({
                        url: "${pageContext.request.contextPath}/coInsert.do",
                        method: "POST",
                        data: {
                            m_id: memId,
                            t_comment: comment,
                            t_id: b_id
                        },
                        success: function(data) {
                            console.log("memId : " +
                                memId +
                                " b_id : " +
                                b_id +
                                " comment : " +
                                comment);
                            var url = "${pageContext.request.contextPath}/gnMain?m_id=" + post_id;
                            $(location).attr('href', url);
                            showpost(b_id);
                            //$("#commentbox").val('');
                            //$("#post_back").css("display", "none");
                            //$("#post_modal").css("display", "none");
                            //$("#post_con").css("display", "none");
                            //$(".each_photo").off('click');
                        },
                        error: function(request, status, error) {
                            alert("code:" +
                                request.status +
                                "\n" +
                                "message:" +
                                request.responseText +
                                "\n" + "error:" +
                                error);
                        }
                    });
                }
            });

            //$('#post_modal').on('shown.bs.modal', function (e) {
            //	   $('#post_modal').owlCarousel('refresh');
            //	 });

            //$('#post_modal').on('hidden.bs.modal', function () {
            //	$(this).removeData();
            //	$("#post_right_middle").removeData();
            //	});
        </script>

        </html>