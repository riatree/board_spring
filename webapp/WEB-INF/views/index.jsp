<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>고래보드</title>
    <link rel="shortcut icon" href="/eager/images/favicon/favicon.ico" type="image/x-icon">
</head>
<style>
    html, body, p {
        padding: 0; margin: 0;
    }
    ul, dl, dd, li{
        list-style: none;
        margin: 0;
        padding: 0;
    }
    a {
        text-decoration: none;
        color : #424242;
    }

    .view-container {
        width: 80%;
        margin: 0 auto;
    }

    .info-container {
        width: 100%; height: 100px;
    }

    .btn-box {
        margin-top: 15px;
        width: 100%; height: 30px;
        position: relative;
    }

    .btn-box>a {
        width: 80px; height: 30px;
        display: inline-block;
        position: absolute;
        right: 0;
        background-color: #6BACD0;
        color: #fff;
        border-radius: 18px;
        text-align: center; line-height: 30px;
    }

    .contents-container{
    }

    #paginateBox {
        width: 20%; height: 50px;
        margin: 10px auto;
        text-align: center;
    }

    .paginate{
        width: 100%;
        height: 100%;
        line-height: 50px;
    }

    #paginateBox a ,  #paginateBox strong {
        font-size: 1em;
        width: 20px;
        display: inline-block;
    }

    .contents{
        border-bottom: 1px solid #424242;
    }

    .contents dl {
        padding: 30px 10px;
        overflow: hidden;
        margin: 0;
    }

    .post {
        float: left;
        margin: 0;
    }

    .post.writer-box {
        width: 160px; height: 85px;
    }


    .post.post-box {
        width: 60%; height: 80px;
        margin-left: 20px;
        padding-left: 10px;
    }

    .writer-name {
        font-size: 15px;
    }

    .write-date {
        color: #333;
        font-size: 16px;
        margin-top: 15px;
        color: #333;
    }


    .post-title {
        font-size: 25px;
        font-weight: bold;
    }

    .hidden {
        display: none;
        overflow: hidden;
    }

</style>
<body>
<c:import url="/WEB-INF/template/header.jsp"/>
<main class="main-container">

    <div class="view-container">
        <div class="info-container">

        </div>
        <c:choose>
            <c:when test="${loginUser!=null}">
                <div class="btn-box">
                    <a href="/eager/post">글쓰기</a>
                </div>
            </c:when>
        </c:choose>

        <script type="text/template" id="postTmp">
            <@ _.each(posts,function(post){ @>
                <li class="contents">
                    <a href="/eager/post/<@=post.idx@>">
                        <dl>
                            <dt class="hidden">작성유저</dt>
                            <dd class="post writer-box">
                                <p class="writer-name"><@=post.name@></p>
                                <p class="write-date"><@=moment(post.regdate).startOf('hour').fromNow() @></p>
                            </dd>
                            <dt class="hidden">작성글</dt>
                            <dd class="post post-box">
                                <p class="post-title"><@=post.title@></p>
                            </dd>
                            <dt class="hidden">그림상자</dt>
                            <dd class="post image-box hidden"></dd>
                        </dl>
                    </a>
                </li>
            <@ })@>
        </script>

        <ul class="contents-container"></ul> <!-- //view-container-->

        <div id="paginateBox"></div>
    </div>

</main> <!-- //main-container -->
<footer class="footer-container"></footer>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
<script src="/eager/js/underscore-min.js"></script>
<script src="/eager/js/board_login_js.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/locale/ko.js"></script>
<script>
    let $contentContainer = $('.contents-container');

    //jsp에서 언더스코어를 활용하기 위해서
    //% -> @ 로 사용
    _.templateSettings = {
        interpolate: /\<\@\=(.+?)\@\>/gim,
        evaluate: /\<\@([\s\S]+?)\@\>/gim,
        escape: /\<\@\-(.+?)\@\>/gim
    };

    let tmp = _.template($("#postTmp").html()),
        pageNo = 1;

    function getList() {
        $contentContainer.children().remove();
        $.ajax({
            url : "ajax/post/list/"+pageNo,
            type : "get",
            dataType : "json",
            error : function (request, status, error) {
                alert(request + status + error);
            },
            success : function (json) {
                $contentContainer.append(tmp({"posts":json.list}));
                $("#paginateBox").html(json.paginate);
            }
        })
    } //getList() end

    getList();


    $("#paginateBox").on("click",".paginate a",function(e) {
        e.preventDefault();
        var href = $(this).attr("href");
        pageNo = href.substring(href.lastIndexOf("/")+1, href.length);
        getList();
    });



</script>
</body>
</html>