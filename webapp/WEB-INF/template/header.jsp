<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>

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

    .user-name {
        cursor: pointer;
    }
    .userInfo-container {
        width: 150px;
        box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        position: relative;
        right: 15px;
        z-index: 1;
        background: #fff;
    }

    .logout-btn {
        width: 100px; height: 30px;
        border: none;
        size: 1.5em;
        cursor: pointer;
        background: transparent;
    }
</style>
<header class="header-container">
    <ul class="menu-container">
        <li class="menu-list">
            <a href="/eager"><img class="logo-img" src="/eager/images/board_logo.png"/></a>
        </li>
        <c:choose>
            <c:when test="${loginUser!=null}">
                <li class="menu-list login-btn">
                    <span class="btn login user-name">${loginUser.name}</span>
                    <ul class="userInfo-container hidden">
                        <li>마이페이지</li>
                        <li>회원정보수정</li>
                        <li>
                            <form action="/eager/session" method="post">
                                <input type="hidden" name="_method" value="DELETE">
                                <button class="logout-btn" title="로그아웃">로그아웃</button>
                            </form>
                        </li>
                    </ul>
                </li>
            </c:when>
            <c:otherwise>
                <li class="menu-list login-btn">
                    <a class="btn login" href="/eager/login">로그인</a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul> <!-- //menu-container -->
</header>
