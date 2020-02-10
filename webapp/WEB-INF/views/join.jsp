<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>고래보드 : 회원가입</title>
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
        <h2 class="hidden">고래보드 회원가입 페이지</h2>
        <form class="form-container" action="/join" method="POST">
            <ul class="login-container">
                <li class="row login-title">
                    <h2>회원가입</h2>
                </li>
                <li class="row">
                    <label class="hidden" for="id">아이디</label>
                    <input class="user-input" type="text" name="id" id="id" autocomplete="off"/>
                </li>
                <li class="row">
                    <label class="hidden" for="password">비밀번호</label>
                    <input class="user-input" type="password" name="password" id="password"/>
                </li>
                <li class="row">
                    <label class="hidden" for="passwordCheck">비밀번호 확인</label>
                    <input class="user-input" type="password" id="passwordCheck"/>
                </li>
                <li class="row">
                    <label class="hidden" for="name">닉네임</label>
                    <input class="user-input" type="text" name="name" id="name"/>
                </li>
                <li class="row">
                    <input class="login-btn" type="submit" value="회원가입"/>
                </li>
            </ul>
        </form>
    </main> <!-- //main-container -->
    <footer class="footer-container"></footer>
</div>
</body>
</html>