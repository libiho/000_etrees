



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


var sum_E = 0;
var sum_I = 0;
var sum_T = 0;
var sum_F = 0;
var sum_N = 0;
var sum_S = 0;
var sum_J = 0;
var sum_P = 0;



function sum(arr) {

    var result = "";

    var newArr = [];

    var type = ""
    var value = 0;
    arr.forEach(function (item) {

        type = item.type;
        value = parseInt(item.value);

        newArr.push(type);


        switch (type) {
            case ('E'):
                sum_E += value;
                break;
            case ('I'):
                sum_I += value;
                break;
            case ('F'):
                sum_F += value;
                break;
            case ('T'):
                sum_T += value;
                break;
            case ('N'):
                sum_N += value;
                break;
            case ('S'):
                sum_S += value;
                break;
            case ('J'):
                sum_J += value;
                break;
            case ('P'):
                sum_P += value;
                break;
        }
    })

    // console.log("E의 합계는  : " + sum_E);
    // console.log("I의 합계는  : " + sum_I);
    // console.log("T의 합계는  : " + sum_T);
    // console.log("F의 합계는  : " + sum_F);
    // console.log("N의 합계는  : " + sum_N);
    // console.log("S의 합계는  : " + sum_S);
    // console.log("J의 합계는  : " + sum_J);
    // console.log("P의 합계는  : " + sum_P);


    if (sum_E === sum_I) {
        result += newArr.indexOf('E') < newArr.indexOf('I') ? 'E' : 'I'
    } else {
        result += sum_E > sum_I ? 'E' : 'I';
    }


    if (sum_S === sum_N) {
        result += newArr.indexOf('S') < newArr.indexOf('N') ? 'S' : 'N';
    } else {
        result += sum_S > sum_N ? 'S' : 'N';
    }


    if (sum_F === sum_T) {
        result += newArr.indexOf('F') < newArr.indexOf('T') ? 'F' : 'T'
    } else {
        result += sum_F > sum_T ? 'F' : 'T';
    }


    if (sum_J === sum_P) {
        result += newArr.indexOf('J') < newArr.indexOf('P') ? 'J' : 'P';
    } else {
        result += sum_J > sum_P ? 'J' : 'P';
    }
    return result;
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




function resultMbti() {

    var arr = [];
    var value = 0;
    var type = "";
    var result = "";

    // 모든 fieldset을 선택합니다.
    const fieldsets = document.querySelectorAll('fieldset');

    // 각 fieldset 안의 input 요소들을 확인합니다.
    fieldsets.forEach(function (fieldset) {
        var inputs = fieldset.querySelectorAll('input[type="radio"]:checked');

        console.log(inputs);

        // 각 input 요소에 대해 체크된 값을 확인하고 배열에 추가합니다.
        inputs.forEach(function (input) {

            value = parseInt(input.value);
            type = input.id.substring(0, 1);
            arr.push({ value, type });



        });
    });
    result = sum(arr);
    // result = sum(value,type,arr);
    $j('input[name="mResult"]').val(result);

    var form = $j('#mbtiResult');

    form.submit();

}



