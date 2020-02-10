<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>고래보드 : 로그인</title>
    <link rel="shortcut icon" href="/images/favicon/favicon.ico" type="image/x-icon">
    <style>
        html, body {
            margin: 0; padding: 0; border: 0;
        }
        a {
            text-decoration: none;
            color: #bbbbbb;
        }
        ul {
            list-style: none;
        }
        .wrap {
            width : 100%; height: 100%;
        }

        .main-container{
            width: 100%;
        }

        .form-container {
            width: 800px;
            margin: 130px auto;
            border: 1px solid #dddddd;
            box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
        }

        .row {
            width: 400px; height: 50px;
            margin: 25px auto;
        }

        .row>input {
            height: 100%;
            outline: none;
        }

        .user-input {
            width: 380px;
            border: transparent;
            border-bottom: 1px solid #424242;
            padding-left: 20px;
        }

        .login-title  {
            text-align: center;
        }

        .login-btn{
            width: 100%;
        }
        .user-info {
            display: inline;
            margin-left: 10px;
        }

        .hidden {
            display: none;
            overflow: hidden;
        }
    </style>
</head>
<body>
<div class="wrap">
    <header class="header-container"></header>
    <main class="main-container" oncontextmenu="return false" ondragstart="return false" onselect="return false">
        <h2 class="hidden">고래보드 로그인 페이지</h2>
        <form class="form-container" action="/session" method="POST">
            <ul class="login-container">
                <li class="row login-title">
                    <h2>LOGIN</h2>
                </li>
                <li class="row">
                    <label class="hidden" for="id">아이디</label>
                    <input class="user-input" type="text" name="id" id="id" autocomplete="off"/>
                </li>
                <li class="row">
                    <label class="hidden" for="password">비밀번호</label>
                    <input class="user-input" type="password" name="password" id="password"/>
                </li>
                <li class="login-chk-btn hidden">
                    <label><input type="checkbox">로그인유지</label>
                </li>
                <li class="row">
                    <input class="login-btn" type="submit" value="LOGIN"/>
                </li>
            </ul>
            <div class="row user-container">
                <ul class="info-container">
                    <li class="user-info"><a href="#">아이디 찾기</a></li>
                    <li class="user-info"><a href="#">비밀번호 찾기</a></li>
                    <li class="user-info"><a href="#">회원가입</a></li>
                </ul>
            </div>
        </form>
    </main> <!-- //main-container -->
    <footer class="footer-container"></footer>
</div>
</body>
</html>