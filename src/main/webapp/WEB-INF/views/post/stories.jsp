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
            <!-- <script src="js/jquery-1.7.2.js"></script>
            <script src="js/jquery.easing.1.3.js"></script>
            <script src="js/jquery.slideinslide.js"></script> -->
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
                
                .scon_con {
                    max-width: 1000px;
                    height: 900px;
                    position: relative;
                    overflow: hidden;
                }
                
                .scon {
                    display: flex;
                    position: absolute;
                    top: 0px;
                    left: 0px;
                }
                
                .story_each_con {
                    width: 1000px;
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
                
                .photo {
                    /* max-width: 1000px;
                    height: 700px; */
                    width: 450px;
                    margin-left: 25px;
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
                <button type="button" class="slide_btn_prev" class="buttons" id="slide_btn_prev" style="display:none;">Prev</button>
                <button type="button" class="slide_btn_prev_s" class="buttons" id="slide_btn_prev_s" style="display:none;">sPrev</button>
                <div id="story_big_con">
                    <div id="show_story">
                        <input type="hidden" id="my_id" value="${my_name }">
                        <input type="hidden" id="showst" value="${showAllStory.m_id}" onclick="split('${showAllStory.m_id}','${showAllStory.s_type}','${showAllAStory.m_id}','${showAllAStory.s_type}');">
                        <div id="story">
                        </div>
                    </div>
                </div>
                <button type="button" class="slide_btn_next_s" class="buttons" id="slide_btn_next_s" style="display:none;">sNext</button>
                <button type="button" class="slide_btn_next" class="buttons" id="slide_btn_next" style="display:none;">Next</button>
            </div>
        </body>
        <script>
            $(function() {
                $("#showst").trigger('click');
                $(".story_photo_con").trigger('click');
            });

            // 계정 상세페이지 이동 
            function goboard(id) {
                var url = "${pageContext.request.contextPath}/gnMain?m_id=" + id;
                $(location).attr('href', url);
            }

            function split(a, a_t, b, b_t) {
                var arr = a.split("|");
                var arrb = b.split("|");
                for (i = 0; i < arr.length; i += 3) {
                    for (j = i; j < i + 3; j++) {
                        if (arr[j] != undefined) {
                            $("#story").append(
                                '<div class="story_photo_con" onclick="showeach(\'' + arr[j] + '\',\'' + a_t + '\');">' +
                                '<div class="scon_con scon_con' + arr[j] + '"><div class="scon scon' + arr[j] + a_t + '"></div></div></div>');
                        }
                    }
                    console.log(arrb[i]);
                    console.log("arrb[i] : " + arrb[i]);
                    if (arrb[i] != "") {
                        $("#story").append(
                            '<div class="story_photo_con" onclick="showeach(\'' + arrb[i] + '\',\'' + b_t + '\');">' +
                            '<div class="scon_con scon_con' + arrb[i] + '"><div class="scon scon' + arrb[i] + b_t + '"></div></div></div>');
                    } else {

                    }
                }
                // 게시물 슬라이드
                var slideWrapper = document.querySelector('#show_story');
                var slides = document.querySelectorAll('.story_photo_con');
                var totalSlides = slides.length;
                var sliderWidth = slideWrapper.clientWidth;
                var slideIndex = 0;
                var slider = document.querySelector('#story');
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

            }

            function showeach(id, s_type) {
                var my_id = $("#my_id").val();
                $.ajax({
                    url: "${pageContext.request.contextPath}/storyResult.do",
                    method: "POST",
                    data: {
                        id: id,
                        s_type: s_type
                    },
                    dataType: "json",
                    success: function(story) {
                        var count = story;
                        for (var i = 0; i < count.story.length; i++) {
                            var s_img = count.story[i].s_img;
                            var m_img = count.story[i].m_img;
                            $(".scon" + id + s_type).append('<div class="story_each_con story_each_con' + id + '"><div class="forflex"><div class="stcon">' +
                                '<div class="upload_id">'+
                                '<img onclick="goboard(\'' + id + '\');" class="hprophoto" src="${pageContext.request.contextPath}/resources/uploadFiles/'+m_img+'" class="sprofile">'+
                                '<span onclick="goboard(\'' + id + '\');" class="sproid">' + id + '</span>'+
                                '<div style="float:right;display:inline;"><label for="slide_btn_prev"><i class="fas fa-chevron-left"></i></label>&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '<div style="display:inline;" class="more_s' + id + '">' +
                                '<label for="slide_btn_prev_s"><i class="fas fa-arrow-circle-left"></i></label>&nbsp;&nbsp;&nbsp;&nbsp;' +
                                '<label for="slide_btn_next_s"><i class="fas fa-arrow-circle-right"></i></label>&nbsp;&nbsp;&nbsp;&nbsp;</div>' +
                                '<label for="slide_btn_next"><i class="fas fa-chevron-right"></i></label></div>' +
                                '</div>' +
                                '<div class="story_img_con">' +
                                '<img class="image">' +
                                '</div><div class="form_up">' +
                                '<img class="photo photo' + id + '" src="${pageContext.request.contextPath}/resources/uploadFiles/' + s_img + '">' +
                                '<div id="send_con" class="hashtag_con">' +
                                '<input type="text" id="message${vo.s_img}" class="message${vo.s_img} h_tag" name="messagea" placeholder="' + id + '님에게 메세지 보내기 ...">' +
                                '<input type="button" onclick="sendMessage(\'' + id + '\',\'' + my_id + '\',\'' + s_img + '\');" value="보내기" class="send btn">' +
                                '</div></div></div></div></div><div>');
                        }

                        console.log(id + ":" + count.story.length);

                        if (count.story.length == 1) {
                            $(".more_s" + id).css("display", "none");
                        }

                        // 게시물 슬라이드
                        var slideWrapper = document.querySelector('.scon_con' + id);
                        var slides = document.querySelectorAll('.story_each_con' + id);
                        var totalSlides = slides.length;
                        var sliderWidth = slideWrapper.clientWidth;
                        var slideIndex = 0;
                        var slider = document.querySelector('.scon' + id + s_type);
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
                        var nextBtn = document.querySelector('.slide_btn_next_s');
                        var prevBtn = document.querySelector('.slide_btn_prev_s');
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
            }

            // $(document).ready(function() {
            //     connectWS();
            // });

            // function sendMessage(id, my_id, s_img) {
            //     var message = document.getElementById("message" + s_img).value;
            //     console.log(id + ',' + my_id + ',' + s_img + ',' + message);
            //     console.log(message);

            //     if (socket) {
            //         // websocket에 보내기!! (reply,댓글작성자,게시글작성자,글번호)
            //         let socketMsg = message + "," + my_id + "," + id + "," + s_img;
            //         console.debug("sssssssmsg>>", socketMsg)
            //         socket.send(socketMsg);
            //     }

            // }
            // var socket = null;

            // function connectWS() {
            //     console.log("tttttttttttttt")
            //     var ws = new WebSocket("ws://localhost:8090/tain/replyEcho?s_img=aaa");
            //     socket = ws;

            //     ws.onopen = function() {
            //         console.log('Info: connection opened.');
            //     };

            //     ws.onmessage = function(event) {
            //         console.log("ReceiveMessage:", event.data + '\n');
            //         /* let $socketAlert = $('div#socketAlert');
            //             $socketAlert.html(event.data);
            //             $socketAlert.css('display', 'block');

            //             setTimeout( function() {
            //                 $socketAlert.css('display', 'none');
            //             }, 3000); */
            //     };

            //     ws.onclose = function(event) {
            //         console.log('Info: connection closed.');
            //         //setTimeout( function(){ connect(); }, 1000); // retry connection!!
            //     };
            //     ws.onerror = function(err) {
            //         console.log('Error:', err);
            //     };
            // }
        </script>

        </html>