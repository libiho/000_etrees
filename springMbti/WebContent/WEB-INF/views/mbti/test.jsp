<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
img {
	width: 300px;
	height: auto; /* 이미지 높이 자동 조절 */
	margin-top: 15px; /* 이미지 간격 조절 */
}

div {
	display: flex;
	flex-direction: column;
	align-items: center;
}

span {
	margin-top: 10px; /* span 요소 간격 조절 */
	font-size: 18px;
	font-weight: bold;
}

button {
	margin-top: 10px;
	align-self: flex-end;
}

.board {
	max-width: 1200px;
	padding: 15px;
	align-items: center;
	display: flex;
	flex-direction: column;
	justify-content: center;
	margin: 0 auto;
}

.notification-container {
	background: rgba(0, 0, 0, .3);
	border-radius: 10px 10px 0 0;
	padding: 15px 20px;
	/* position: absolute; */
	bottom: -50px;
	transition: transform 0.3s ease-in-out;
}

.show {
	transform: translateY(-50px);
}
</style>

</head>
<body>

	<div class="board">



		<br>
		<div class="capture">

			<span>날씨</span> <img id="test"
				src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMzExMTRfNjIg%2FMDAxNjk5OTUxMDc1NDIz.xhzdeNAd1qZt-SArNCVfOvSug9WPXkZ3yxprQ7q64zog.h9UeXkOvKqRKc7NkG7Ajcssb6j8xEx7HmXuoXSLF2Icg.PNG.ymj2584%2Fimage.png&type=sc960_832"
				alt=""> <span>교통편</span> <img
				src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA4MTNfMTE0%2FMDAxNjI4ODA0Mjg3Njgy.T_9ekyFcK1OwYUZ1IUwtQoOKMNymd_AVbhU2h8I5MDog.AtLbjczL6-kWTyta_y9ms8HvzDsZBU_FDOhO0egzvr0g.JPEG.hieu88%2F%25B3%25D7%25C0%25CC%25B9%25F6_%25B1%25E6%25C3%25A3%25B1%25E2_%25B4%25EB%25C1%25DF%25B1%25B3%25C5%25EB_%25C6%25ED%25B8%25AE%25C7%25D4%25C0%25C7_%25C1%25DF%25B5%25B6-06-1.jpg&type=sc960_832"
				alt=""> <span>CCTV</span> <img
				src="https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA5MTZfMTE5%2FMDAxNjMxNzYwMTYwODU0.zV2GvLcf-BAmtXMgmjzEziwDpyPq61l8L53rO-F_3AUg.NdvOTc_WPnlaWDBuEjIzvTuLgizKsClBl4DRF-ZxQ8wg.PNG.in_mypocket%2F20210916_015614000_iOS.png&type=sc960_832"
				alt=""> <img
				src="../../../resources/images/neom-0vpBglNUp_s-unsplash.jpg" alt="">
		</div>


		<button type="button" class="btn btn-outline-success " id="imgShare">
			공유하기 <input type="file" id="file" style="display: none;"> <label
				for="file" style="cursor: pointer"></label>

		</button>
		<br>
		<button type="button" class="btn btn-outline-success getImg">불러오기</button>
	</div>

	<!-- ### 모달창 나오고 이미지 복사 + 경로 복사 나오기 -->

	<img id="img" src="" alt="">
	<button id="copy-btn">이미지 복사하기</button>
	<button id="download-btn">이미지 저장하기</button>




	<div class="notification-container " id="notification-container">
		<p>복사가 완료되었습니다</p>
	</div>



	<script>

let isTimeCheck = false;


 document.getElementById("imgShare").addEventListener("click", uploadResource);
 
 function uploadResource() {

    setTimeout(function(){
        timeMin();
    }, 30*60*1000);

     printDiv($('.capture'));
     
    }
    
    function timeMin(){
        isTimeCheck = true;
    }
    
    function printDiv(div) {
        
        div = div[0];
        
        var nowDate = new Date();
        
        var currentTime = nowDate.YYYYMMDDHHMMSS();
        var ranNum = Math.floor(Math.random() * 90000 + 10000);
        var changeName = currentTime + ranNum + ".png";
        
        
        
        html2canvas(div).then(function (canvas) {
            canvas.toBlob(function (blob) {
                
                
                const file = new File([blob], changeName, { type: 'image/png' });
                
                
                const formData = new FormData();
                formData.append('file', file);
                
                fetch('/s3/resource', {
                    method: 'POST',
                    body: formData
                })
                .then(result => result.json())
                .then(data => {
                    console.log('이미지가 업로드되었습니다.', data);
                    document.getElementById("img").setAttribute("src", data.path);
                
                    // 여기의 data.path가 이미지 주소 복사 버튼 클릭했을때 클립보드에 복사됐으면 좋겠으면 어떻게 구현해??
                    
                })
                .catch(error => console.error('업로드 중 에러 발생:', error));




                
            });
        });
        
        
    }

    // 날짜
    Date.prototype.YYYYMMDDHHMMSS = function () {
        var yyyy = this.getFullYear().toString();
  var MM = pad(this.getMonth() + 1,2);
  var dd = pad(this.getDate(), 2);
  var hh = pad(this.getHours(), 2);
  var mm = pad(this.getMinutes(), 2)
  var ss = pad(this.getSeconds(), 2)
  
  return yyyy +  MM + dd+  hh + mm + ss;
};

function pad(number, length) {
    var str = '' + number;
    while (str.length < length) {
        str = '0' + str;
    }
    return str;
}



</script>
	<script>


    
    document.getElementById("copy-btn").addEventListener("click", clipImage);
        
    function clipImage(){


        if(!isTimeCheck){

        
        
const imgSrc = $('#img').attr('src');

// 버튼 클릭 시 클립보드에 이미지 주소 복사


    // 이미지 주소를 클립보드에 복사
    navigator.clipboard.writeText(imgSrc)
        .then(() => {
            console.log('이미지 주소가 클립보드에 복사되었습니다.');
            // 클립보드 복사 성공 시 ### 상단에 알람 떴다 사라지기
        })
        .catch(err => {
            console.error('클립보드 복사 실패:', err);
        });

        showNotification();
        
    }else{
        
        alert('재 로딩 해주세요');
    }
    }
        
     function showNotification ()  {

        let notification = $('#notification-container');

  notification.classList.add('show')
  setTimeout(() => {
    notification.classList.remove('show')
  }, 2000)
}   
   
   
</script>

</body>
</html>