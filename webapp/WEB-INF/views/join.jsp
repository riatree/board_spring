<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <style>
        html, body, ul, li, fieldset, a, p, div{
            margin: 0; padding: 0;
            list-style: none;
            border: none;
            color: #000;
            text-decoration: none;
        }

        .hidden {
            overflow: hidden;
            display: none;
        }


        .main-container {
            width: 100%;
        }

        .form-box{
            width: 80%;
            margin: 100px auto;
        }

        .form-box h2 {
            width: 80%;
            margin: 10px auto;
            text-align: center;
        }

        .join-form ul {
            width: 80%;
            margin: 0 auto;
        }

        .row {
            width: 60%; height: 90px;
            margin: 10px auto;
            position: relative;
        }
        .row>label>p {
            margin-bottom: 5px;
            font-size: 1.3rem;
        }
        .row>label>input {
            outline: none;
            width: 25%; height: 30px;
            padding-left: 10px;
            font-size: 10%;
        }

        .email-domain {
            width: 15%; height: 30px;
            padding-left: 10px;
            font-size: .7vm;
        }
        .email-select {
            width: 150px; height: 35px;
            font-size: 1rem;
        }

        .btn {
            width: 80px; height: 30px;
            font-size: .8rem;
            border: 0; padding : 0;
            border-radius: 8px;
            display: inline-block;
            background-color: antiquewhite;
            line-height: 30px;
            text-align: center;
            cursor: pointer;
            outline: none;
        }

        .btn-box {
            position: absolute;
            right:15%;
        }
    </style>
</head>
<body>
<div class="wrap">
    <header class="header-container"></header> <!-- //header-container -->
    <main class="main-container">
        <div class="join box form-box">
            <h2>소래보드 회원가입</h2>
            <form class="join-form" action="/eager/join" method="post">
                <fieldset>
                    <legend class="hidden">회원가입 폼</legend>
                    <ul>
                        <li class="row">
                            <label>
                                <p>아이디</p>
                                <input class="email-id" placeholder="아이디를 입력해주세요."/>
                            </label> @
                            <input class="email-domain" autocomplete="off" placeholder="직접입력" />
                            <select class="email-select">
                                <option value="1">직접입력</option>
                                <option value="naver.com">naver.com</option>
                                <option value="gmail.com">gmail.com</option>
                                <option value="daum.net">daum.net</option>
                            </select>
                            <button type="button" class="check btn">중복확인</button>
                            <input type="hidden" id="id" name="id"/>
                            <div class="id msg"></div>
                        </li>
                        <li class="row">
                            <label>
                                <p>닉네임</p>
                                <input class="nickname" type="text" autocomplete="off" name="name" placeholder="닉네임을 입력해주세요." />
                            </label>
                            <div class="msg nickname"></div>
                        </li>
                        <li class="row">
                            <label>
                                <p>비밀번호</p>
                                <input class="pwd" name="password" type="password" placeholder="비밀번호를 입력해주세요." />
                            </label>
                            <div class="msg pwd"></div>
                        </li>
                        <li class="row">
                            <label>
                                <p>비밀번호 확인</p>
                                <input class="pwd-check" type="password" placeholder="비밀번호를 재 입력해주세요." />
                            </label>
                            <div class="msg pwd-confirm"></div>
                        </li>
                        <li class="row">
                            <div class="btn-box">
                                <button class="btn" type="reset">초기화</button>
                                <a class="btn" href="/eager/index">취소</a>
                                <button class="btn" type="submit">회원가입</button>
                            </div>
                        </li>
                    </ul>
                </fieldset>
            </form> <!-- //join-form -->
        </div>
    </main> <!-- //main-container -->
    <footer class="footer-container"></footer><!-- //footer-container -->
</div> <!-- //wrap -->
</body>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
<script>
    /* 정규식 표현 */
    let idReg = /^[a-z|A-Z|0-9][\w]{3,15}$/;
    let nickReg = /^[a-z|A-Z|0-9|ㄱ-힣]{2,16}$/;
    let pwdReg = /^(?=.*\d{1,15})(?=.*[a-zA-Z|ㄱ-힣]{1,15})(?=.*[!._#*&]{1,2}).{4,15}$/;


    let $email = $('.email-id'),
        $domain = $('.email-domain'),
        $id = $('#id'),
        $emailSelect = $('.email-select'),
        $idBtn = $('.check.btn'),
        $nickname = $('.nickname'),
        $pwd = $('.pwd'),
        $pwdChk = $('.pwd-check'),
        $joinForm = $('.join-form');

    let isValidId, isValidNick;

    $emailSelect.on("change", function () {
        $('.email-select option:selected').each(function () {
            if($(this).val() == 1) {
                $domain.val('');
                $domain.attr('disabled', false);
            } else {
                $domain.val($(this).text());
                $domain.attr('disabled', true);
            }
        })
    });

    function checkId() {
        let emailVal = $email.val(),
            domainVal = $domain.val(),
            oldId = "", id = "";

        if(oldId != emailVal) {
            oldId != emailVal;

            if(idReg.test(emailVal)) {
                isValidId = false;
                id = emailVal + "@" + domainVal;

                $.ajax({
                    url : "ajax/user/check/id",
                    dataType : "json",
                    data : {"id" : id},
                    error : function () {
                        alert("에러");
                    },
                    success : function (json) {
                        if(0 == json.count) {
                            isValidId = true;
                            $id.val(id);
                            $('.msg.id').text("사용 가능한 아이디입니다.").css("color", "green");
                            console.log("id test"  + !isValidId);
                        } else {
                            isValidId = false;
                            $('.msg.id').text("이미 사용 중이거나 탈퇴한 아이디입니다.").css("color", "red");
                        }
                    }
                }); // ajax() end
            }
        }
    } // checkId() end
    function checkNick() {
        let oldNick = "", nickVal = $nickname.val();

        if(oldNick != nickVal) {
            oldNick = nickVal;
            if(nickReg.test(nickVal)) {
                isValidNick = false;
                $('.msg.nickname').text("확인 중...").css("color", "red");
                $.ajax({
                    url : "ajax/user/check/name",
                    dataType: "json",
                    data: {"name" : nickVal},
                    error : function () {

                    },
                    success : function (json) {
                        if(json.count == 0) {
                            isValidNick = true;
                            console.log("test" + !isValidNick);
                            $('.msg.nickname').text("아주 좋은 닉네임입니다.").css("color", "green");
                        } else {
                            isValidNick = false;
                            $('.msg.nickname').text("이미 사용중인 아이디입니다.").css("color", "red");
                        }
                    }
                }); //ajax() end
            }
        }

    } //checkNick() end
    function checkPwd() {
        if(pwdReg.test($pwd.val())) {
            $('.msg.pwd').text("좋은 비밀번호입니다.").css("color", "green");
            return true;
        } else {
            $('.msg.pwd').text("영어, 숫자, 특수문자 4~16자로 입력해주세요.").css("color", "red");
            return false;
        }
    } //checkPwd() end
    function checkRePwd() {
        if($pwd.val() == $pwdChk.val()) {
            $('.msg.pwd-confirm').text("비밀번호가 일치합니다.").css("color", "green");
            return true;
        } else {
            $(".msg.pwd-confirm").text("비밀번호가 일치하지 않습니다.").css("color","red");
            return false;
        }
    } // checkRePwd() end

    $idBtn.click(checkId);
    $nickname.keyup(checkNick);
    $pwd.keyup(checkPwd);
    $pwdChk.blur(checkRePwd);

    $joinForm.submit(function () {
        if(!isValidId) {
            return false;
        }
        if(!isValidNick) {
            return false;
        }
        if(!checkPwd()) {
            return false;
        } if (!checkRePwd()) {
            return false;
        }
    });

</script>
</html>