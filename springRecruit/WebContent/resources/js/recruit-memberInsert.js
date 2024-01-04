

function validatePhoneNumber(phoneNumber) {

    let phone = $j('input[name="phone"]');

    phoneNumber = phoneNumber.replace(/-/g, '');

    phone.val(phoneNumber);

}


const autoHyphen = (target) => {
    target.value = target.value
        .replace(/[^0-9]/g, '')
        .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);

    validatePhoneNumber(target.value);
}

function showHyphen() {
    let target = $j('input[name="phone"]').val();

    let formatPhone = target
        .replace(/[^0-9]/g, '')
        .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);

    $j('input[name="phoneHyphen"]').val(formatPhone);
}


$j(document).ready(function () {
    showHyphen();
})



document.querySelectorAll('.add').forEach(function (button) {
    button.addEventListener('click', function () {
        const table = button.parentElement.nextElementSibling; // 버튼 다음에 오는 테이블을 선택합니다.

        const newRow = table.insertRow(table.rows.length); // 테이블의 맨 끝에 새로운 행을 삽입합니다.
        const firstRow = table.querySelector('.template-row'); // 템플릿 행을 선택합니다.

        const cloneRow = firstRow.cloneNode(true); // 템플릿 행을 복제합니다.
        newRow.innerHTML = cloneRow.innerHTML; // 복제된 행을 실제 테이블 행에 추가합니다.
    });
});





// 삭제 버튼 클릭 시 체크된 항목 삭제
document.querySelectorAll('.delete').forEach(function (deleteButton) {
    deleteButton.addEventListener('click', function () {
        const table = deleteButton.parentElement.nextElementSibling; // 삭제 버튼 다음에 오는 테이블을 선택합니다.
        const rows = table.querySelectorAll('tr:not(:first-child)'); // 해당 테이블의 모든 행을 선택합니다.

        rows.forEach(function (row) {

            const checkbox = row.querySelector('input[type="checkbox"]'); // 각 행의 체크 박스를 선택합니다.


            if (checkbox.checked && checkbox) {
                row.remove(); // 체크된 행을 삭제합니다.
            }
        });
    });
});
