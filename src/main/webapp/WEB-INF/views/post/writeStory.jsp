<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>스토리 추가하기</title>
            <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
            <link rel="stylesheet" type="text/css" href="https://fengyuanchen.github.io/cropperjs/css/cropper.css">
            <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.2.1.min.js"></script>
            <script src="https://kit.fontawesome.com/2409d81413.js" crossorigin="anonymous"></script>

            <style>
                body {
                    width: 100%;
                    height: 100%;
                }
                
                #write_stroy_con {
                    display: flex;
                    justify-content: center;
                    width: 100%;
                }
                
                #write_big_con {
                    max-width: 1000px;
                }
                
                #top_menu {
                    width: 100%;
                    height: 54px;
                }
                /* .tab_menu {
                    border-right: 1px solid black;
                    float: left;
                    box-sizing: border-box;
                    cursor: pointer;
                    text-align: center;
                } */
                
                .tab_menu:nth-of-type(4) {
                    border: none;
                }
                
                .upload {
                    width: 100%;
                }
                
                .story_img_con {
                    display: flex;
                    justify-content: center;
                    width: 80%;
                    margin-left: 10%;
                }
                
                .image {
                    width: 100%;
                }
                
                canvas {
                    border: black 1px solid;
                    border-radius: 5px;
                }
                
                .cate_mine {
                    color: #C7C7C7;
                    cursor: pointer;
                }
                
                .cate_1 {
                    height: 53px;
                    line-height: 53px;
                    font-size: 12px;
                    float: left;
                }
                
                .cate_con {
                    float: left;
                    margin-top: 20px;
                    margin-right: 5px;
                }
                
                .category {
                    float: right;
                }
            </style>
        </head>

        <body>
            <jsp:include page="../header.jsp"></jsp:include>
            <input type="hidden" value="${my_name }" id="m_id">
            <input type="radio" id="ctm1" name="x" checked style="display: none;">
            <input type="radio" id="ctm2" name="x" style="display: none;">
            <input type="radio" id="ctm3" name="x" style="display: none;">
            <input type="radio" id="ctm4" name="x" style="display: none;">
            <input type="radio" id="ctm5" name="x" style="display: none;">
            <div id="write_stroy_con">
                <div id="write_big_con">
                    <div id="top_menu">
                        <label for="ctm1">
                            <div class="cate_1 cate_mine forctm1 add_photo tab_menu" style="margin-right: 60px;">
                                <i class="far fa-image cate_con"></i>
                                <div class="category">사진 추가</div>
                            </div>
                        </label>
                        <label for="ctm2">
                            <div class="cate_1 cate_mine forctm2 add_captured tab_menu" style="margin-right: 60px;">
                                <i class="fas fa-camera cate_con"></i>
                                <div class="category">사진 찍기</div>
                            </div>
                        </label>
                        <label for="ctm3">
                            <div class="cate_1 cate_mine forctm3 add_edit tab_menu" style="margin-right: 60px;">
                                <i class="far fa-edit cate_con"></i>
                                <div class="category">사진 수정</div>
                            </div>
                        </label>
                        <label for="ctm4">
                            <div class="cate_1 cate_mine forctm4 my_story tab_menu" style="margin-right: 60px;">
                                <i class="far fa-smile cate_con"></i>
                                <div class="category">내 스토리</div>
                            </div>
                        </label>
                        <label for="ctm5">
                            <div class="cate_1 cate_mine forctm5 highlight tab_menu">
                                <i class="far fa-star cate_con"></i>
                                <div class="category">하이라이트 관리</div>
                            </div>
                        </label>
                    </div>
                    <div class="upload photo_upload">
                        <div class="story_img_con">
                            <img class="image">
                        </div>
                        <form action="storyInsert.do" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="my_name" value="${my_name }">
                            <input type="file" name="upfile" class="upfile">
                            <input type="submit" value="스토리 올리기">
                            <input type="button" id="backto_main" value="돌아가기">
                            <input type="hidden" name="m_id" class="m_id" value="${myProfile.m_id }">
                        </form>
                    </div>
                    <div class="upload capture_video" style="display: none;">
                        <video id="video" width="320" height="240" autoplay></video>
                        <canvas id="canvas" width="960" height="720"></canvas>
                        <button type="button" id="webcamBtn">캡쳐하기</button>
                        <a href="" download="capture.png">다운로드</a> <input type="button" class="backto_main" value="돌아가기">
                    </div>
                    <div class="upload edit" style="display: none;">
                        <canvas id="canvas1" width="600" height="600"></canvas>
                        <input id="loadButton" type="file" accept="image/*">
                        <button id="invertFilter">invertFilter</button>
                        <button id="brightnessFilter">brightnessFilter</button>
                        <button id="grayscaleFilter">grayscaleFilter</button>
                        <button id="sepiaFilter">sepiaFilter</button>
                        <a href="" id="canvas_down">다운로드</a>
                    </div>
                    <div class="upload mine" style="display: none;">
                        <c:if test="${empty myStory }">
                            <div id="recom_upload">
                                스토리를 올려 나의 일상을 공유해보세요! <br>
                                <input type="button" class="add_photo" value="사진 추가하러 가기">
                            </div>
                        </c:if>
                        <c:if test="${not empty myStory }">
                            <c:forEach var="vo" items="${myStory }" varStatus="s">
                                <div class="count_story">
                                    <form action="insertHighlight.do" method="post">
                                        <a href="${pageContext.request.contextPath}/resources/uploadFiles/${vo.s_img}" download>${vo.s_img }</a>
                                        <img src="${pageContext.request.contextPath}/resources/uploadFiles/${vo.s_img}">
                                        <input type="button" value="delete" class="delete">
                                        <input type="hidden" value="${vo.s_img}">
                                        <input type="text" name="m_id" value="${my_name}">
                                        <input type="text" name="s_id" value="${vo.s_id}">
                                        <input type="text" name="h_img" value="${vo.s_img}">
                                        <input type="text" name="h_name" required>
                                        <input type="submit" value="하이라이트에 추가하기">
                                    </form>
                                </div>
                            </c:forEach>
                        </c:if>
                        <div id="recom_upload2" style="display: none;">
                            스토리를 올려 나의 일상을 공유해보세요! <br>
                            <input type="button" class="add_photo" value="사진 추가하러 가기">
                        </div>
                    </div>
                    <div class="upload hl" style="display: none;">
                        <c:if test="${empty selectHighlight }">
                            <div id="recom_upload">
                                하이라이트를 추가해 나의 일상을 공유해보세요! <br>
                                <input type="button" class="my_story" value="하이라이트 추가하러 가기">
                            </div>
                        </c:if>
                        <c:if test="${not empty selectHighlight }">
                            <c:forEach var="vo" items="${selectHighlight }" varStatus="s">
                                <div class="count_storyh count_story${vo.h_name}">
                                    <input type="button" value="delete" class="deleteh" onclick="delhname('${vo.h_name}');">
                                    <input type="hidden" value="${vo.s_img}">
                                    <input type="hidden" value="${vo.s_id}">
                                    <input type="hidden" value="${vo.m_id}">
                                    <input type="text" value="${vo.h_name }">
                                    <input class="fs" type="hidden" onclick="fs('${vo.h_name}','${vo.s_id}','${vo.h_img }');">
                                    <div id="con${vo.h_name}"></div>
                                </div>
                            </c:forEach>
                        </c:if>
                        <div id="recom_upload3" style="display: none;">
                            스토리를 올려 나의 일상을 공유해보세요! <br>
                            <input type="button" class="my_story" value="하이라이트 추가하러 가기">
                        </div>
                    </div>
                </div>
            </div>
        </body>
        <script>
            $(function() {
                $(".forctm1").css("color", "#262626");
                $("#ctm1").change(function() {
                    if ($("#ctm1").is(':checked')) {
                        $(".forctm1").css("color", "#262626");
                        $(".forctm2").css("color", "#C7C7C7");
                        $(".forctm3").css("color", "#C7C7C7");
                        $(".forctm4").css("color", "#C7C7C7");
                        $(".forctm5").css("color", "#C7C7C7");
                    }

                });
                $("#ctm2").change(function() {
                    if ($("#ctm2").is(':checked')) {
                        $(".forctm1").css("color", "#C7C7C7");
                        $(".forctm2").css("color", "#262626");
                        $(".forctm3").css("color", "#C7C7C7");
                        $(".forctm4").css("color", "#C7C7C7");
                        $(".forctm5").css("color", "#C7C7C7");
                    }

                });
                $("#ctm3").change(function() {
                    if ($("#ctm3").is(':checked')) {
                        $(".forctm1").css("color", "#C7C7C7");
                        $(".forctm2").css("color", "#C7C7C7");
                        $(".forctm3").css("color", "#262626");
                        $(".forctm4").css("color", "#C7C7C7");
                        $(".forctm5").css("color", "#C7C7C7");
                    }

                });
                $("#ctm4").change(function() {
                    if ($("#ctm4").is(':checked')) {
                        $(".forctm1").css("color", "#C7C7C7");
                        $(".forctm2").css("color", "#C7C7C7");
                        $(".forctm3").css("color", "#C7C7C7");
                        $(".forctm4").css("color", "#262626");
                        $(".forctm5").css("color", "#C7C7C7");
                    }

                });
                $("#ctm5").change(function() {
                    if ($("#ctm5").is(':checked')) {
                        $(".forctm1").css("color", "#C7C7C7");
                        $(".forctm2").css("color", "#C7C7C7");
                        $(".forctm3").css("color", "#C7C7C7");
                        $(".forctm4").css("color", "#C7C7C7");
                        $(".forctm5").css("color", "#262626");
                    }

                });
            });
            $("#backto_main").on('click', function() {
                var memId = $(".m_id").val();
                var url = "${pageContext.request.contextPath}/timeLine";
                $(location).attr('href', url);
            });

            $(function() {
                $(".fs").trigger('click');
                $(".add_photo").on('click', function() {
                    $('.upfile').val('');
                    $('.image').attr('src', '');
                    $(".photo_upload").css("display", "block");
                    $(".capture_video").css("display", "none");
                    $(".edit").css("display", "none");
                    $(".hl").css("display", "none");
                    $(".mine").css("display", "none");
                    $(".forctm1").css("color", "#262626");
                    $(".forctm2").css("color", "#C7C7C7");
                    $(".forctm3").css("color", "#C7C7C7");
                    $(".forctm4").css("color", "#C7C7C7");
                    $(".forctm5").css("color", "#C7C7C7");

                });
                $(".add_captured").on('click', function() {
                    $('.upfile').val('');
                    $('.image').attr('src', '');
                    $(".photo_upload").css("display", "none");
                    $(".capture_video").css("display", "block");
                    $(".edit").css("display", "none");
                    $(".hl").css("display", "none");
                    $(".mine").css("display", "none");
                    $(".forctm1").css("color", "#C7C7C7");
                    $(".forctm2").css("color", "#262626");
                    $(".forctm3").css("color", "#C7C7C7");
                    $(".forctm4").css("color", "#C7C7C7");
                    $(".forctm5").css("color", "#C7C7C7");

                });
                $(".add_edit").on('click', function() {
                    $('.upfile').val('');
                    $('.image').attr('src', '');
                    $(".photo_upload").css("display", "none");
                    $(".capture_video").css("display", "none");
                    $(".edit").css("display", "block");
                    $(".hl").css("display", "none");
                    $(".mine").css("display", "none");
                    $(".forctm1").css("color", "#C7C7C7");
                    $(".forctm2").css("color", "#C7C7C7");
                    $(".forctm3").css("color", "#262626");
                    $(".forctm4").css("color", "#C7C7C7");
                    $(".forctm5").css("color", "#C7C7C7");
                });
                $(".my_story").on('click', function() {
                    $('.upfile').val('');
                    $('.image').attr('src', '');
                    $(".photo_upload").css("display", "none");
                    $(".capture_video").css("display", "none");
                    $(".edit").css("display", "none");
                    $(".hl").css("display", "none");
                    $(".mine").css("display", "block");
                    $(".forctm1").css("color", "#C7C7C7");
                    $(".forctm2").css("color", "#C7C7C7");
                    $(".forctm3").css("color", "#C7C7C7");
                    $(".forctm4").css("color", "#262626");
                    $(".forctm5").css("color", "#C7C7C7");
                });
                $(".highlight").on('click', function() {
                    $('.upfile').val('');
                    $('.image').attr('src', '');
                    $(".photo_upload").css("display", "none");
                    $(".capture_video").css("display", "none");
                    $(".edit").css("display", "none");
                    $(".mine").css("display", "none");
                    $(".hl").css("display", "block");
                    $(".forctm1").css("color", "#C7C7C7");
                    $(".forctm2").css("color", "#C7C7C7");
                    $(".forctm3").css("color", "#C7C7C7");
                    $(".forctm4").css("color", "#C7C7C7");
                    $(".forctm5").css("color", "#262626");
                });
            });

            function fs(h_name, s_id, h_img) {
                var s_id2 = s_id.split(",");
                var h_img2 = h_img.split(",");
                for (i = 0; i < h_img2.length; i++) {
                    console.log(h_img[i]);
                    $("#con" + h_name).append('<img class="for_delh' + s_id2[i] + '" src="${pageContext.request.contextPath}/resources/uploadFiles/' + h_img2[i] + '">');
                    $("#con" + h_name).append('<input class="for_delh' + s_id2[i] + '" type="button" value="하이라이트 지우기" onclick="delh(\'' + s_id2[i] + '\');">');
                }
            }

            // 웹캠 연결
            if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
                navigator.mediaDevices.getUserMedia({
                    video: true
                }).then(function(stream) {
                    var video = document.getElementById('video');
                    video.srcObject = stream;
                    video.play();
                });
            }

            // 웹캠 화면 캡쳐
            var canvas = document.getElementById('canvas');
            var context = canvas.getContext('2d');
            var video = document.getElementById('video');
            document.getElementById("webcamBtn").addEventListener("click", function() {
                context.drawImage(video, 0, 0, 960, 720);
            });

            document.querySelector('a').addEventListener('click', event =>
                event.target.href = canvas.toDataURL()
            );

            // 업로드 파일 미리보기

            var file = document.querySelector('.upfile');

            file.onchange = function() {
                var fileList = file.files;

                // 읽기
                var reader = new FileReader();
                reader.readAsDataURL(fileList[0]);
                console.log(reader);

                //로드 한 후
                reader.onload = function() {
                    document.querySelector('.image').src = reader.result;
                };
            };

            // 이미지 클릭 시 다운로드
            function dataURLtoBlob(dataurl) {
                var arr = dataurl.split(','),
                    mime = arr[0].match(/:(.*?);/)[1],
                    bstr = atob(arr[1]),
                    n = bstr.length,
                    u8arr = new Uint8Array(n);
                while (n--) {
                    u8arr[n] = bstr.charCodeAt(n);
                }
                return new Blob([u8arr], {
                    type: mime
                });
            }

            function downloadImg(imgSrc) {
                var image = new Image();
                image.crossOrigin = "anonymous";
                image.src = imgSrc;
                var fileName = image.src.split("/").pop();
                image.onload = function() {
                    var canvas = document.createElement('canvas');
                    canvas.width = this.width;
                    canvas.height = this.height;
                    canvas.getContext('2d').drawImage(this, 0, 0);
                    if (typeof window.navigator.msSaveBlob !== 'undefined') {
                        window.navigator.msSaveBlob(dataURLtoBlob(canvas.toDataURL()), fileName);
                    } else {
                        var link = document.createElement('a');
                        link.href = canvas.toDataURL();
                        link.download = fileName;
                        link.click();
                    }
                };
            }

            // 사진 수정
            var canvas1 = $('#canvas1')[0];
            var ctx = canvas1.getContext('2d');

            function drawImageData(image) {
                image.height *= canvas1.offsetWidth / image.width;
                image.width = canvas1.offsetWidth;

                if (image.height > canvas1.offsetHeight) {
                    image.width *= canvas1.offsetHeight / image.height;
                    image.height = canvas1.offsetHeight;
                }

                ctx.drawImage(image, 0, 0, image.width, image.height);
                console.log(ctx.getImageData(0, 0, canvas1.width, canvas1.height));
            }

            $('#loadButton').on('change', function(e) {
                var file = e.target.files[0];
                var fileReader = new FileReader();

                fileReader.onload = function(e) {
                    var image = new Image();
                    image.src = e.target.result;
                    image.onload = function() {
                        drawImageData(image);
                    }
                };

                fileReader.readAsDataURL(file);
            });

            // 수정본 다운로드
            $("#canvas_down").on('click', function() {
                var dataURL = canvas1.toDataURL('image/png');
                dataURL = dataURL.replace(/^data:image\/[^;]*/, 'data:application/octet-stream');
                dataURL = dataURL.replace(/^data:application\/octet-stream/, 'data:application/octet-stream;headers=Content-Disposition%3A%20attachment%3B%20filename=Canvas.png');
                var aTag = document.createElement('a');
                aTag.download = 'from_canvas.png';
                aTag.href = dataURL;
                aTag.click();
            });

            // 필터 클릭
            $('#invertFilter').on('click', function() {
                var pixels = ctx.getImageData(0, 0, canvas1.width, canvas1.height);
                var filteredData = invertFilter(pixels, 100);
                ctx.putImageData(filteredData, 0, 0);
            });
            $('#brightnessFilter').on('click', function() {
                var pixels = ctx.getImageData(0, 0, canvas1.width, canvas1.height);
                var filteredData = brightnessFilter(pixels, 100);
                ctx.putImageData(filteredData, 0, 0);
            });
            $('#grayscaleFilter').on('click', function() {
                var pixels = ctx.getImageData(0, 0, canvas1.width, canvas1.height);
                var filteredData = grayscaleFilter(pixels, 100);
                ctx.putImageData(filteredData, 0, 0);
            });
            $('#sepiaFilter').on('click', function() {
                var pixels = ctx.getImageData(0, 0, canvas1.width, canvas1.height);
                var filteredData = sepiaFilter(pixels, 100);
                ctx.putImageData(filteredData, 0, 0);
            });


            // 필터
            function invertFilter(pixels) {
                var d = pixels.data;
                for (var i = 0; i < pixels.data.length; i += 4) {
                    d[i] = 255 - d[i]; // R
                    d[i + 1] = 255 - d[i + 1]; // G
                    d[i + 2] = 255 - d[i + 2]; // B
                    d[i + 3] = 255; // Alpha
                }
                return pixels;
            }

            function brightnessFilter(pixels, value) {
                var d = pixels.data;
                for (var i = 0; i < d.length; i += 4) {
                    d[i] += value / 3;
                    d[i + 1] += value / 3;
                    d[i + 2] += value / 3;
                }
                return pixels;
            }

            function grayscaleFilter(pixels) {
                var d = pixels.data;
                for (var i = 0; i < d.length; i += 4) {
                    var r = d[i];
                    var g = d[i + 1];
                    var b = d[i + 2];

                    var v = 0.2126 * r + 0.7152 * g + 0.0722 * b; // 보정값
                    d[i] = d[i + 1] = d[i + 2] = v // RBG 색을 같게 맞추자
                }
                return pixels;
            }

            function sepiaFilter(pixels) {
                var d = pixels.data;
                for (var i = 0; i < d.length; i += 4) {
                    var r = d[i];
                    var g = d[i + 1];
                    var b = d[i + 2];

                    d[i] = r * 0.3588 + g * 0.7044 + b * 0.1368;
                    d[i + 1] = r * 0.2990 + g * 0.5870 + b * 0.1140;
                    d[i + 2] = r * 0.2392 + g * 0.4696 + b * 0.0912;
                }
                return pixels;
            }

            $(".delete").on('click', function() {
                var s_img = $(this).next().val();
                var memId = $(this).next().next().val();
                console.log(memId);
                console.log(s_img);
                $(this).parent().remove();

                var count = $(".count_story").length;
                console.log(count);
                $.ajax({
                    url: "${pageContext.request.contextPath}/deleteStory.do",
                    method: "POST",
                    data: {
                        m_id: memId,
                        s_img: s_img
                    },
                    async: false,
                    success: function(data) {
                        console.log("memId : " +
                            memId +
                            " s_img : " +
                            s_img);

                        if (count == 0) {
                            $("#recom_upload2").css("display", "block");
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
            });

            function delhname(h_name) {
                var memId = $("#m_id").val();
                $.ajax({
                    url: "${pageContext.request.contextPath}/deleteHname.do",
                    method: "POST",
                    data: {
                        my_name: memId,
                        h_name: h_name
                    },
                    async: false,
                    success: function(data) {
                        var count = $(".count_storyh").length;
                        console.log("memId : " +
                            memId +
                            " h_name : " +
                            h_name);
                        $(".count_story" + h_name).css("display", "none");
                        if (count == 0) {
                            $("#recom_upload3").css("display", "block");
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

            function delh(s_id) {
                var memId = $("#m_id").val();
                $.ajax({
                    url: "${pageContext.request.contextPath}/deleteh.do",
                    method: "POST",
                    data: {
                        my_name: memId,
                        s_id: s_id
                    },
                    async: false,
                    success: function(data) {
                        var count = $(".count_storyh").length;
                        console.log("memId : " +
                            memId +
                            " s_id : " +
                            s_id);
                        $(".for_delh" + s_id).css("display", "none");
                        if (count == 0) {
                            $("#recom_upload3").css("display", "block");
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
        </script>

        </html>