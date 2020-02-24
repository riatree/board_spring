let $userInfo = $('.userInfo-container'),
    $user_name = $('.user-name');


$user_name.on('click', function () {
    $userInfo.toggleClass('hidden');
    return false;
});

