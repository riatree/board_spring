<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>고래보드</title>
    <link rel="shortcut icon" href="/images/favicon/favicon.ico" type="image/x-icon">
</head>
<style>
    html, body {
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

    .header-container {
        width: 100%; height: 50px;
        box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    }

    .menu-container {
        width: 100%; height: 50px;
        position: relative;
    }

    .menu-list {
        width: 100px; height: 100%;
        float: left;
        text-align: center;
    }

    .logo-img {
        width: 100%; height: 100%;
    }

    .login-btn {
        line-height: 50px;
        position: absolute;
        right: 50px;
    }

    .contents-container{
        width: 80%;
        margin: 30px auto 10px auto;
    }

    #paginateBox {
        width: 20%;
        margin: 0 auto;
        text-align: center;
    }

    #paginateBox a {
        font-size: 1em;
        width: 10px; height: 10px;
        background-color: #6BACD0;
    }

    .contents{
        border-bottom: 1px solid #424242;
    }

    .hidden {
        display: none;
        overflow: hidden;
    }

</style>
<body>
<c:import url="/WEB-INF/template/header.jsp"/>
<main class="main-container">
    <div class="info-container">

    </div>
    <div class="view-container">
        <c:choose>
            <c:when test="${loginUser!=null}">
                <a href="/post">글쓰기</a>
            </c:when>
        </c:choose>

        <script type="text/template" id="postTmp">
            <@ _.each(posts,function(post){ @>
                <li class="contents">
                    <a href="/post/<@=post.idx@>">
                        <dl>
                            <dt class="hidden">작성유저</dt>
                            <dd>
                                <p><@=post.name@></p>
                                <p><@=post.regdate @></p>
                            </dd>
                            <dt class="hidden">작성글</dt>
                            <dd>
                                <p><@=post.title@></p>
                            </dd>
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
<script src="/js/jquery-3.3.1.min.js"></script>
<script src="/js/underscore-min.js"></script>
<script>
    let $userInfo = $('.userInfo-Container'),
        $user_name = $('.user-name'),
        $contentContainer = $('.contents-container');

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
            url : "/ajax/post/list/"+pageNo,
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

    $user_name.on('click', function () {
        $userInfo.toggleClass('hidden');
        return false;
    });

</script>
</body>
</html>