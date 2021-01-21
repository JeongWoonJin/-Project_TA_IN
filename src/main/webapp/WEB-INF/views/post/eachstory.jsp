<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>TA_IN 스토리</title>
            <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
            <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
            <script src="https://kit.fontawesome.com/2409d81413.js" crossorigin="anonymous"></script>
            <style>
                body {
                    width: 100%;
                    height: 100%;
                    color: #262626;
                    background-color: #FAFAFA;
                }
                
                #story_con {
                    display: flex;
                    justify-content: center;
                    width: 100%;
                    height: 900px;
                }
                
                #story_big_con {
                    width: 1000px;
                    max-height: 98%;
                    margin-top: 1%;
                    margin-bottom: 1%;
                }
                
                #show_story {
                    max-width: 1000px;
                    height: 100%;
                    position: relative;
                    overflow: hidden;
                }
                
                #story {
                    display: flex;
                    position: absolute;
                    top: 0px;
                    left: 0px;
                }
                
                .story_photo_con {
                    width: 1000px;
                    height: 900px;
                }
                
                .photo {
                    width: 450px;
                    margin-left: 25px;
                }
                
                .story_id {
                    height: 32px;
                    width: 100%;
                    line-height: 32px;
                    font-size: 14px;
                }
                
                #send_big_con {
                    width: 100%;
                    display: flex;
                    justify-content: center;
                    z-index: 4;
                    height: 64px;
                }
                
                #send_con {
                    background-color: white;
                    display: flex;
                    justify-content: center;
                    width: 100%;
                }
                
                .message {
                    height: 44px;
                    margin-top: 10px;
                    width: 80%;
                    outline: none;
                    box-sizing: border-box;
                }
                
                .send {
                    height: 44px;
                    margin-top: 10px;
                    outline: none;
                    box-sizing: border-box;
                }
                
                .hashtag_con {
                    margin-top: 20px;
                    border-top: 1px Dashed #C7C7C7;
                }
                
                .h_tag {
                    width: 500px;
                    padding: 0px;
                    border: none;
                    height: 40px;
                    padding: 10px 0px 10px 0px;
                    outline: none;
                }
                
                .btn {
                    height: 30px;
                    border: none;
                    margin-top: 15px;
                    margin-bottom: 10px;
                    background-color: transparent;
                    cursor: pointer;
                    color: rgb(56, 151, 240);
                    outline: none;
                    font-size: 13px;
                }
                
                .form_up {
                    padding: 0px 20px 0px 20px;
                }
                
                label {
                    cursor: pointer;
                }
                
                .iicon {
                    height: 100%;
                    width: 20px;
                }
                
                .upload {
                    width: 540px;
                    border: 1px solid #C7C7C7;
                    background-color: white;
                    margin-left: 229px;
                }
                
                .upload_id {
                    width: 505px;
                    height: 25px;
                    padding: 10px 15px 10px 20px;
                    font-size: 13px;
                    line-height: 25px;
                    border-bottom: 1px solid #C7C7C7;
                }
                
                .story_img_con {
                    display: flex;
                    justify-content: center;
                    width: 80%;
                    margin-left: 10%;
                    margin-top: 30px;
                }
                
                .image {
                    width: 100%;
                }
                
                .forflex {
                    width: 1000px;
                    display: flex;
                    justify-content: center;
                }
                
                .stcon {
                    width: 540px;
                    border: 1px solid #C7C7C7;
                    background-color: white;
                }
                
                label {
                    cursor: pointer;
                }
                
                .hprophoto {
                    width: 25px;
                    height: 25px;
                    border-radius: 50%;
                    float:left;
                    cursor:pointer;
                }
                
                .sproid {
                    line-height: 25px;
                    height: 25px;
                    margin-left: 12px;
                    float:left;
                    cursor:pointer;
                }
            </style>
        </head>

        <body>
            <jsp:include page="../header.jsp"></jsp:include>
            <div id="story_con">
                <button type="button" class="slide_btn_prev" id="slide_btn_prev" class="buttons" style="display:none;">Prev</button>
                <div id="story_big_con">
                    <div id="show_story">
                        <div id="story">
                            <c:if test="${not empty eachstory}">
                                <c:forEach var="vo" items="${eachstory}" varStatus="s">
                                    <div class="story_photo_con">
                                        <div class="forflex">
                                            <div class="stcon">
                                                <div class="upload_id">
                                                    <img onclick="goboard('${vo.m_id}');" class="hprophoto" src="${pageContext.request.contextPath}/resources/uploadFiles/${vo.m_img }" class="sprofile">
                                                        <span onclick="goboard('${vo.m_id}');" class="sproid">${vo.m_id }</span>
                                                    <div style="float:right;display:inline;" class="more_s">
                                                        <label for="slide_btn_prev"><i class="fas fa-chevron-left"></i></label>&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <label for="slide_btn_next"><i class="fas fa-chevron-right"></i></label>
                                                    </div>
                                                </div>
                                                <div class="story_img_con">
                                                    <img class="image">
                                                </div>
                                                <div class="form_up">
                                                    <img class="photo photo${vo.m_id}" src="${pageContext.request.contextPath}/resources/uploadFiles/${vo.s_img}">
                                                        <div id="send_con" class="hashtag_con">
                                                            <input type="text" id="message${vo.s_img}" class="message${vo.s_img} h_tag" name="messagea" placeholder="${vo.m_id}님에게 메세지 보내기 ...">
                                                            <input type="button" onclick="sendMessage('${vo.m_id}','${my_id }','${vo.s_img}');" value="보내기" class="send btn">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                        </div>
                    </div>
                </div>
                <button type="button" class="slide_btn_next" id="slide_btn_next" class="buttons" style="display:none;">Next</button>
            </div>

        </body>
        <script>
        
     // 계정 상세페이지 이동 
        function goboard(id) {
            var url = "${pageContext.request.contextPath}/gnMain?m_id=" + id;
            $(location).attr('href', url);
        }
            $(function() {
            	var count = $(".story_photo_con").length;
            	console.log(count);
            	if(count==1){
            		$(".more_s").css("display", "none");
            	} else{
            		
            	}
                // 게시물 슬라이드
                var slideWrapper = document.querySelector('#show_story');
                var slides = document.querySelectorAll('.story_photo_con');
                var totalSlides = slides.length;
                var sliderWidth = slideWrapper.clientWidth;
                var slideIndex = 0;
                var slider = document.querySelector('#story');
                console.log("slideWrapper:" + slideWrapper);
                console.log("slides:" + slides);
                console.log("totalSlides:" + totalSlides);
                console.log("sliderWidth:" + sliderWidth);
                console.log("slideIndex:" + slideIndex);
                console.log("slider:" + slider);
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
            });
        </script>

        </html>