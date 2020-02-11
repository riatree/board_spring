<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>${post.title} &boxv; ${post.name}</title>
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

</style>
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"/>
<main class="main-container">
    <div>
        <ul>
            <li>${post.title}</li>
            <li>${post.name}</li>
            <li>${post.regdate}</li>
            <li>${post.views}</li>
        </ul>
    </div>
    <div>
        <p>${post.contents}</p>
    </div>
    <div>
        <p>댓글 <span>0</span> 개</p>
        <dl>
            <dt>댓글</dt>
            <c:forEach items="${ commentsList}" var="comment">
            <dd>
                <h5>${ comment.name}</h5>
                <p>${comment.regdate}</p>
                <p>${comment.contents}</p>
                <c:choose>
                    <c:when test="${loginUser.idx == comment.user_no}">
                        <form>
                            <input type="hidden" value="${comment.idx}">
                            <input type="hidden" name="_method" value="DELETE">
                            <input type="button" value="삭제">
                        </form>
                    </c:when>
                </c:choose>
            </dd>
            </c:forEach>
        </dl>
    </div>
</main>
<footer class="footer-container"></footer>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
<script>
    let $userInfo = $('.userInfo-Container'),
        $user_name = $('.user-name');

    $user_name.on('click', function () {
        $userInfo.toggleClass('hidden');
        return false;
    });

</script>
</body>
</html>
