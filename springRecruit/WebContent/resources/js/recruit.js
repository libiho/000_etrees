


function checkNull(event) {


    let name = $j('input[name="name"]').val();
    let phone = $j('input[name="phoneHyphen"]').val();



    if (validatePhoneNumber(phone)) {
        alert('번호 다시 입력해주세요')
        $j('input[name="phone"]').focus();
        let btn = $j('#btn');
        btn.disabled = true;
        return false;
    } else {
        console.log('정규식 번호 통과');
    }


    if (name === null || name === '') {
        alert('이름 입력해주세요');
        return false;
    }

    if (phone === null || phone === '') {
        alert('비밀번호 입력해주세요');
        return false;
    }


}


function btnDisabled() {
    btn.disabled = true;
}

function btnActive() {
    btn.disabled = false;

}

function postData() {
    let form = document.getElementById('myForm');

    form.submit();

}




$j('#btn').click(function () {
    checkNull();
    postData();
})


function validatePhoneNumber(phoneNumber) {

    let phone = $j('input[name="phone"]');

    phoneNumber = phoneNumber.replace(/-/g, '');

    console.log("phoneNumber : " + phoneNumber);

    phone.val(phoneNumber);

    console.log(phone.val());


    const phonePattern = /^(01[016789]{1})[0-9]{3,4}[0-9]{4}$/;


    return !phonePattern.test(phoneNumber);
}




const autoHyphen = (target) => {
    let btn = $j('#btn');
    btn.disabled = false;
    target.value = target.value
        .replace(/[^0-9]/g, '')
        .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
}
