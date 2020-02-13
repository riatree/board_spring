<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header class="header-container">
    <ul class="menu-container">
        <li class="menu-list">
            <a href="/index"><img class="logo-img" src="/images/board_logo.png"/></a>
        </li>
        <c:choose>
            <c:when test="${loginUser!=null}">
                <li class="menu-list login-btn">
                    <span class="btn login user-name">${loginUser.name}</span>
                    <ul class="userInfo-Container hidden">
                        <li>마이페이지</li>
                        <li>회원정보수정</li>
                        <li>
                            <form action="/session" method="post">
                                <input type="hidden" name="_method" value="DELETE">
                                <button class="logout-btn" title="로그아웃">로그아웃</button>
                            </form>
                        </li>
                    </ul>
                </li>
            </c:when>
            <c:otherwise>
                <li class="menu-list login-btn">
                    <a class="btn login" href="/login">로그인</a>
                </li>
            </c:otherwise>
        </c:choose>
    </ul> <!-- //menu-container -->
</header>
