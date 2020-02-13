<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-bs4.min.css" rel="stylesheet">
    <style>
        html, body {
            padding: 0; margin: 0;
        }
        ul {
            list-style: none;
            margin: 0;
        }
        a {
            text-decoration: none;
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

        .hidden {
            display: none;
            overflow: hidden;
        }

        .main-container {
            width: 100%;
        }

        .post-container {
            width: 80%; height: 100%;
            margin: 50px auto;
        }

        .post-title {
            width: 100%; height: 50px;
            border: none; border-bottom: 1px solid #424242;
        }


    </style>
</head>
<body>
    <c:import url="/WEB-INF/template/header.jsp"/>
    <main class="main-container">
        <form class="post-container" action="/post" method="POST">
            <input type="hidden" name="userNo" value="${loginUser.idx}">
            <input class="post-title" placeholder="제목을 입력하세요." name="title"/>
            <div id="summernote"></div>
            <input type="hidden" name="contents" class="post-contents" id="contents">
            <input class="summit-btn" type="submit" value="저장">
        </form>
    </main> <%-- //main-container --%>
    <footer></footer>
</body>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.15/dist/summernote-bs4.min.js"></script>
<script>
    let $summernote = $('#summernote'),
        $summitBtn = $('.summit-btn'),
        $postContents = $('.post-contents'),
        $postForm = $('.post-container');

    $(document).ready(function() {
        $summernote.summernote({
            height: 600,
            minHeight: null,             // set minimum height of editor
            maxHeight: null,             // set maximum height of editor
            focus: true,                  // set focus to editable area after initializing summernote
            lang: 'ko-KR' // default: 'en-US'
        });
    });

    $postForm.on('submit', function () {
        var markupStr = $summernote.summernote('code');
        document.getElementById('contents').setAttribute('value',markupStr);
        //var test = $postContents.val($summernote.summernote('code'));
    })
</script>
</html>
