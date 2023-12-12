



// 이미 한번 체크되었는지 확인 - 다른거 체크하면 기존거 지우게
function colorChecked() {

    let childSpan = document.querySelectorAll('fieldset .sp-radio');

    childSpan.forEach(function (span) {

        let input = span.querySelector('input');

        if (!input.checked) {
            span.classList.remove('is-checked-green');
            span.classList.remove('is-checked-purple');
            span.classList.remove('is-checked-neutral');
        }

    })
}


// 배경색 맞게 설정 
function backColor(classList, spRadio) {

    if (classList.contains('color--green')) {
        spRadio.classList.add('is-checked-green');
    }

    if (classList.contains('color--neutral')) {
        spRadio.classList.add('is-checked-neutral');
    }

    if (classList.contains('color--purple')) {
        spRadio.classList.add('is-checked-purple');
    }

}


function getResult(type1, type2, newArr) {

    if (sumType[type1] === sumType[type2]) {
        return newArr.indexOf(type1) < newArr.indexOf(type2) ? type1 : type2;
    } else {
        return sumType[type1] > sumType[type2] ? type1 : type2;
    }

}



var sumType = {
    'E': 0,
    'I': 0,
    'S': 0,
    'N': 0,
    'T': 0,
    'F': 0,
    'J': 0,
    'P': 0
}


function scores(frontType, value, backType) {


    var addNum = 0;

    switch (value) {
        case (1):
            addNum = parseInt(3);
            sumType[frontType] += addNum;
            break;
        case (2):
            addNum = parseInt(2);
            sumType[frontType] += addNum;
            break;
        case (3):
            addNum = parseInt(1);
            sumType[frontType] += addNum;
            break;
        case (4):
            addNum = parseInt(0);
            sumType[frontType] += addNum;
            sumType[backType] += addNum;
            break;
        case (5):
            addNum = parseInt(1);
            sumType[backType] += addNum;
            break;
        case (6):
            addNum = parseInt(2);
            sumType[backType] += addNum;
            break;
        case (7):
            addNum = parseInt(3);
            sumType[backType] += addNum;
            break;
    }

}



function sum(arr) {

    var result = "";

    var newArr = [];
    var frontType = "";
    var backType = "";
    var value = 0;

    arr.forEach(function (item) {

        frontType = item.frontType;
        value = parseInt(item.value);
        backType = item.backType;

        newArr.push(frontType);

        scores(frontType, value, backType);

    })

    result += getResult('E', 'I', newArr);
    result += getResult('S', 'N', newArr);
    result += getResult('F', 'T', newArr);
    result += getResult('J', 'P', newArr);


    return result;
}





function resultMbti() {

    var arr = [];
    var value = 0;
    var frontType = "";
    var backType = "";
    var result = "";

    const fieldsets = document.querySelectorAll('fieldset');

    fieldsets.forEach(function (fieldset) {
        var inputs = fieldset.querySelectorAll('input[type="radio"]:checked');

        console.log(inputs);

        inputs.forEach(function (input) {

            value = parseInt(input.value);
            frontType = input.id.substring(0, 1);
            backType = input.id.substring(1, 2);
            arr.push({ frontType, value, backType });

        });
    });



    result = sum(arr);

    $j('input[name="mResult"]').val(result);

    var form = $j('#mbtiResult');

    form.submit();

}




function nextQuestion() {



    var start = parseInt($j('input[name="startNum"]').val());
    var end = parseInt($j('input[name="endNum"]').val());
    var showNum = parseInt($j('input[name="showNum"]').val());
    var min = start + showNum;
    var max = end + showNum;

    var arr = [];
    var quizMax = 0;

    $j('.quizNum').each(function (index) {
        arr.push($j(this).val());
    })


    quizMax = Math.max(...arr);




    $j('input[name="startNum"]').val(min);
    $j('input[name="endNum"]').attr('value', max);

    start = parseInt($j('input[name="startNum"]').val());
    end = parseInt($j('input[name="endNum"]').val());


    $j('.quizNum').each(function (index) {


        // console.log('index : '+ index); 0 ~ 11
        // 최대값과 마지막 값이 같을때는 전송버튼 활성화
        if (quizMax === end) {
            nextButton.classList.add('noShow');
            submitButton.classList.remove('noShow');
        }

        if (index >= start && index < end) {
            $j(this).closest('fieldset').removeClass('noShow');
        } else {
            $j(this).closest('fieldset').addClass('noShow');
        }



    })
}






function radioChecked() {
    const fieldsets = document
        .querySelectorAll('fieldset');

    let allSelected = true;

    fieldsets.forEach(function (fieldset) {
        if (!fieldset.classList.contains('noShow') && !fieldset.classList.contains('inactive')) {
            allSelected = false;
            return;
        }
    });


    if (allSelected) {
        nextQuestion();
    } else {
        alert('모든 질문에 답하세요!');
    }
}



