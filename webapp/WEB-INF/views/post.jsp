<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>${post.title} &boxv; ${post.name}</title>
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



        .hidden {
            display: none;
            overflow: hidden;
        }

        .main-container {
            width: 100%; margin-bottom: 50px;
        }

        .post-container {
            width: 70%;
            margin: 30px auto;
            box-shadow: 0 2px 0 0 rgba(0, 0, 0, 0.16);
        }

        .writer-container {
            width: 100%;

        }

        .writer-box {
            width: 100%;
            padding: 10px 0;
            box-shadow: 0 2px 0 0 rgba(0, 0, 0, 0.16);
        }

        .post-title {
            width: 100%;
            font-size: 4em;
            text-align: center;
            font-weight: bold;
        }

        .post-sub {
            width: 90%;
            margin: 10px 20px;
        }
        .sub {
            width: 150px;
            font-size: 13px;
            text-align: center;
            color: #a7a7a7;
            margin: 10px 30px;
        }

        .post-box {
            width: 100%;
            padding: 20px;
        }

        .post-content {
            width: 100%;
            margin: 0;
            font-size: 0.9em;
        }

        .post-box>pre {
            width: 90%;
            background: #a7a7a7;
            border-radius: 5px;
            padding: 10px;
        }

        .comment-container {
            width: 70%;
            margin: 10px auto;
        }

        .comment-box{
            width: 94%;
            padding: 3px;
            margin: 10px;
            box-shadow: 0 2px 2px 0 rgba(0,0,0,.5);
        }

        .comment.sub {
            margin: 0;
            margin-top: 10px;
            display: inline-block;
        }

        .content-box{
            position: relative;
        }
        .comment-contents {
            padding: 0 20px;
            position: relative;
        }

        .comment-btn {
            position: absolute;
            right: 10px; top: 0;
        }
        .comment-btn>li {
            display: inline;
        }

        .comment-inputbox {

        }

        .comment-area {
            width: 94%;
            height: 100px;
            font-size: 1.1em;
            color: #a7a7a7;
            margin: 10px 10px;
            padding: 25px;
            resize: none; border: none;
            box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            white-space:pre-line
        }
        .btn-box {
            width: 94%;
            position: relative;
        }


        .insert-btn {
            width: 80px; height: 30px;
            border-radius: 18px; border: none;
            font-size: 1em;
            background-color: #6BACD0;
            color: #fff;
            cursor: pointer;
            position: absolute;
            right: 0;
        }
    </style>
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"/>
<main class="main-container">
    <div class="post-container">
        <div class="writer-container">
            <ul class="writer-box">
                <li class="post-title">${post.title}</li>
                <li class="post-sub">
                    <span class="sub">${post.name}</span>
                    <span class="sub">${post.regdate}</span>
                </li>
            </ul>
        </div>
        <div class="post-box">
            <p class="post-content">${post.contents}</p>
        </div>
    </div> <%-- //post-container --%>

    <div class="comment-container">
        <div>
            <p><span class="comment-count">0</span> Comments</p>

            <ul class="comment-list"> </ul> <%-- //comment-list --%>

            <script type="text/template" id="commentTmp">
                <@ _.each(commentList,function(comment){
                var loginNo = 0;
                <c:if test="${loginUser != null}">
                    loginNo = ${loginUser.idx};
                </c:if>
                @>
                <li class="comment-box">
                    <dl>
                        <dt class="hidden">작성자 상자</dt>
                        <dd>
                            <span class="comment-username comment sub"><@=comment.name @></span>
                            <span class="comment-regdate comment sub"><@=comment.regdate @></span>
                        </dd>
                        <dt class="hidden">내용상자</dt>
                        <dd class="content-box">

                            <p class="comment-contents">
                                <@=comment.contents @>
                                <@ if (loginNo == comment.userNo) { @>
                                    <ul class="comment-btn">
                                        <li>
                                            <input type="hidden" class="comment-idx" value="<@=comment.idx @>"/>
                                            <button class="hidden">수정</button>
                                            <button class="delete-btn" type="button">삭제</button>
                                        </li>
                                    </ul>
                                <@ } @>
                            </p>
                        </dd>
                    </dl>
                </li>
                <@ }) @>
            </script>
        </div>
        <div class="comment-inputbox">
            <input class="user-num" type="hidden" value="${loginUser.idx}"/>
            <input class="post-num" type="hidden" value="${post.idx}"/>
            <textarea class="comment-area" placeholder="소중한 댓글을 입력해주세요."></textarea>
            <div class="btn-box">
                <button class="insert-btn">등록</button>
            </div>
        </div>

    </div> <%-- //comment-container --%>

</main>
<footer class="footer-container"></footer>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.9.1/underscore-min.js"></script>
<script src="/eager/js/board_login_js.js"></script>
<script>
    _.templateSettings = {
        interpolate: /\<\@\=(.+?)\@\>/gim,
        evaluate: /\<\@([\s\S]+?)\@\>/gim,
        escape: /\<\@\-(.+?)\@\>/gim
    };

    let commentTmp = _.template($('#commentTmp').html()),
        $commentList = $('.comment-list'),
        $insertBtn = $('.insert-btn'),
        $commentArea = $('.comment-area'),
        $commentCount = $('.comment-count');

    var userNo = $('.user-num').val(),
        boardNo = $('.post-num').val(),
        pageNo = 1;


    function getCommentList() {
        $commentList.children().remove();
        $.ajax({
            url:"/eager/ajax/post/" + boardNo + "/page/" + pageNo,
            type: "get",
            dataType: "json",
            error:function(request, status, error) {
                alert(request + status + error);
            },success:function(json){
                $commentList.append(commentTmp({"commentList":json.commentList}));
                $commentCount.text(json.total);
            }
        });
    } //getCommentList() end

    getCommentList();

    function insertComment() {
        $.ajax({
            url: "/eager/ajax/post/comment",
            type:"post",
            dataType:"json",
            data:{
                "userNo" : userNo,
                "boardNo" : boardNo,
                "contents" : $commentArea.val().replace(/(?:\r\n|\r|\n)/g, '<br />')
            },
            error:function (request, status, error) {
                alert(request + status + error);
            },
            success:function (json) {
                if(json.result) {
                    getCommentList();
                    $commentArea.val("");
                } else {
                    alert("다시 시도해주세요.");
                }
            }
        });
    } // insertComment() end

    let commentNum;

    function delectComment(commentNum) {
        $.ajax({
            url : "/eager/ajax/post/comment/delete",
            type: "post",
            dataType : "json",
            data: {"commentNo" : commentNum },
            error:function (request, status, error) {
                alert(request + status + error);
            },
            success:function (json) {
                if(json.result) {
                    getCommentList();
                } else {
                    alert("서버에 문제가 발생하였습니다. 다시 시도해주세요.");
                }
            }

        })
    }

    $commentList.on("click", ".delete-btn",function () {
        commentNum = $(this).parent().find('input').val();
        var flag = confirm("댓글을 삭제 하시겠습니까?");
        if(flag) {
            delectComment(commentNum);
        }
    });

    $insertBtn.on('click', function () {
        if (${loginUser!=null}) {
            if($commentArea.val().length > 0) {
                insertComment();

            } else {
                alert("값을 입력해주세요.");
            }
        } else {
            alert("로그인 해주세요.");
        }
    });


    $commentArea.on('keydown', function (e) {
            if(e.keyCode==13) {
                if(!e.shiftKey) {
                    if (${loginUser!=null}) {
                        if($commentArea.val().length > 0) {
                            insertComment();

                        } else {
                            alert("값을 입력해주세요.");
                        }
                    } else {
                        alert("로그인 해주세요.");
                    }
                }
            }

    });

</script>
</body>
</html>
