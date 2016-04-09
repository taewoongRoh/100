<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>

<html>
<head>
<title>대한민국 1등 세탁 서비스, 백의민족</title>
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico" />

<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />


<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/bakmin.css" />
<link rel="stylesheet"	
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="assets/css/timePicker.css" />
<script src="assets/js/jquery-1.6.3.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>


<!--  <link rel="stylesheet" href="assets/css/jquery.datetimepicker.css" />
<script src="assets/js/jquery.datetimepicker.full.min.js"></script>-->
<script src="assets/js/jquery.timePicker.js"></script>


<!-- GA 스크립트 -->
<script>
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
      ga('create', 'UA-68044341-1', 'auto');
      ga('send', 'pageview');
</script>

<!--  주문하기 유효성검사 -->
<script> 	
function fosubmit() {
	var now = new Date();
	var year = now.getFullYear();
	var mon = (now.getMonth()+1)>9 ? (now.getMonth()+1) : '0'+(now.getMonth()+1);
	var day = now.getDate()>9 ? now.getDate() : '0'+now.getDate();
	var hour = now.getHours();
	var time1 = year+''+mon+''+day+''+hour; //현재시간
	
	var time2 = document.form1.date.value+''+document.form1.time.value.substr(0,2); 
	
	
	
	  if(document.form1.date.value == "" || document.form1.time.value == ""
          || document.form1.adress1.value == "" || document.form1.adress2.value == "") {
      alert("날짜, 시간, 주소를 반드시 입력해주세요.");
      return false;   // submit 진행 차단    
  }		
	  else if((document.getElementById("adress1").value.indexOf("강서구") != -1 || document.getElementById("adress1").value.indexOf("양천구") != -1
			  || document.getElementById("adress1").value.indexOf("마포구") != -1 || document.getElementById("adress1").value.indexOf("영등포구") != -1) == false) {
		  alert("죄송합니다. 서비스 지역이 아닙니다.\n현재 강서구, 양천구, 마포구, 영등포구만 주문이 가능합니다.")
		  return false;	
	  }
	  else if(time1 > time2) {
		  alert("마감된 시간입니다. 현재 "+ mon+'월 '+ day + '일 ' + (parseInt(hour)+1) +"시 이후부터 주문이 가능합니다.")
		  return false;
	  }
  else {
      return true;  // 정상적인 submit 진행        
  }
}

</script>



<!-- 다음 주소검색 js -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function openDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
                
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("adress1").value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("adress2").focus();
            }
        }).open();
    }
</script>



<!-- 달력 jquery -->
<script>
	$(function() {
		$("#datepicker").datepicker({
			
			dateFormat: "yymmdd",  // 데이터 포멧 , 20160905 형식 

			nextText: '',  //이전다음텍스트 없음

			prevText: '',  //이전다음텍스트 없음

			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],  //데이터 형식 일~토로 

			monthNames: ['1월','2월','3월','4월','5월','6월', '7월','8월','9월','10월','11월','12월'], // 달도 한글로

			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], // 달도 한글로
			
			beforeShowDay: noSundays,
			
			beforeShow: function(input) {

			    var i_offset= $(input).offset(); //클릭된 input의 위치값 체크

			    setTimeout(function(){

			       $('#ui-datepicker-div').css({'top':i_offset.top, 'bottom':''});      //datepicker의 div의 포지션을 강제로 input 위치에 그리고 좌측은 모바일이여서 작기때문에 무조건 10px에 놓았다.

			    })

			} 
		});
		function noSundays(date) {
					return [date.getDay() != 0, ''];
				}
		
		
		
		
		
		$("#time1").timePicker({
		    	startTime:"10:00",
		    	endTime:"22:00",
		    	step:60
		 });
		
		
		
	});
	

</script>

<!--  팝업 jQuery -->
<script type="text/javascript">
	function layer_open(el){

		var temp = $('#' + el);		//레이어의 id를 temp변수에 저장
		var bg = temp.prev().hasClass('bg');	//dimmed 레이어를 감지하기 위한 boolean 변수

		if(bg){
			$('.layer').fadeIn();
		}else{
			temp.fadeIn();	//bg 클래스가 없으면 일반레이어로 실행한다.
		}

		// 화면의 중앙에 레이어를 띄운다.
		if (temp.outerHeight() < $(document).height() ) temp.css('margin-top', '-'+0+'px');
		else temp.css('top', '0px');
		 if (temp.outerWidth() < $(document).width() ) temp.css('margin-left', '-'+0+'px');
		else temp.css('left', '0px'); 

		temp.find('a.cbtn').click(function(e){
			if(bg){
				$('.layer').fadeOut();
			}else{
				temp.fadeOut();		//'닫기'버튼을 클릭하면 레이어가 사라진다.
			}
			e.preventDefault();
		});

		$('.layer .bg').click(function(e){
			$('.layer').fadeOut();
			e.preventDefault();
		});

	}				
</script>


<script>
$(function() {
	layer_open('layer1');
})
</script>



</head>


<body class="homepage">

	<!-- 팝업창 부분 -->
	<div id="layer1" class="pop-layer">
		<div class="pop-container">
			<div class="pop-conts">
				<!--content //-->
				<p class="ctxt mb20">첫 주문 시 3,000원 할인혜택이 주어집니다.</p>
				<div class="btn-r">
					<a href="#" class="cbtn">Close</a>
				</div>
				<!--// content-->
			</div>
		</div>
	</div>



	<div id="page-wrapper">

		<!-- Header -->
		<div id="header-wrapper" class="wrapper">
			<div id="header">




				<!-- Nav -->
				<nav id="nav">
					<ul>
						<li class="current"><a href="index.jsp">Home</a></li>
						<li><a href="price_page.jsp">가격표</a>
						<li><a href="use_page.jsp">이용 방법</a></li>

						<li><a href="faq_page.jsp">F A Q</a></li>
					</ul>
				</nav>


				<!-- Logo -->
				<div id="logo">
					<a href="#" class="logo_image image"> <img
						src="images/main_logo.png" alt="" />
					</a>
				</div>



				<div id="intro_bakmin">
					<a class="intro_bakmin_image image"> <img src="images/1st.png" />
					</a>
				</div>


				<div class="download_link">
					<a class="download_link_a"
						href="https://itunes.apple.com/kr/app/baeg-uiminjog/id1032679452?l=en&mt=8">
						<img class="download_link_image" src="images/appstore_web.png" />
					</a> <a class="download_link_a" style="margin-left: 3%;"
						href="https://play.google.com/store/apps/details?id=kr.co.baekmin.baekmin_android">
						<img class="download_link_image" src="images/googlestore_web.png" />
					</a>


				</div>




				<div id="busy_life">
					<a class="busy_a"> <img class="busy_life_image"
						src="images/2nd.png" />
					</a>
				</div>


			</div>
		</div>

		<!-- Intro -->
		<div id="intro-wrapper" class="wrapper style1">

			<section id="intro" class="container">
				<a class="txt_main image"> <img src="images/txt_main.png" />
				</a>
			</section>
		</div>





		<!-- Main -->
		<div class="wrapper style2">
			<div class="title">세부사항</div>
			<div id="main" class="container">

				<!-- Image -->
				<img class="time" src="images/policy.png" alt="" />

				<!-- Features -->
				<section id="price">
					<a> <img class="policy" src="images/time.png" />
					</a> <a> <img class="price" src="images/loc.png" />
					</a> <br> <br> <br> <br>
				</section>



			</div>
		</div>



		<!-- Footer -->
		<div id="footer-wrapper" class="wrapper">
			<div class="title">주문하기</div>
			<div id="footer" class="container">
				<header class="style1">
					<h2>웹에서 주문하기</h2>
					<p>간편하게 홈페이지에서도 주문 가능합니다.</p>
				</header>
				<hr />
				<div class="row 150%">
					<div class="6u 12u(mobile)">

						<!-- Contact Form -->
						<section>
							<form method="post" action="#" name="form1"
								onsubmit="return fosubmit();">
								<div class="row 50%">
									<div class="6u 12u(mobile)">
										<input type="text" name="name" id="contact-name"
											placeholder="이름" required="required" />
									</div>
									<div class="6u 12u(mobile)">
										<input type="tel" name="phone" id="contact-email"
											placeholder="전화번호" required="required" />
									</div>
									<div class="6u 12u(mobile)">
										<input type="text" readonly name="date" id="datepicker"
											placeholder="날짜" />
									</div>
									<div class="6u 12u(mobile)">
										<input type="text" readonly name="time" id="time1"
											placeholder="시간" />
									</div>
								</div>
								<div class="row 50%">
									<div class="12u 12u(mobile)" id="adress_div">
										<input type="text" onclick="openDaumPostcode()" name="adress1"
											id="adress1" placeholder="주소" /> <input type="button"
											onclick="openDaumPostcode()" class="adress_search"
											value="주소 찾기" />
									</div>


									<div class="12u 12u(mobile)">
										<input type="text" name="adress2" id="adress2"
											placeholder="나머지주소" />
									</div>

									<div class="12u 12u(mobile)">
										<input type="text" name="note" id="note" placeholder="비고" />
									</div>

								</div>
								<div class="row">
									<div class="12u">
										<ul class="actions">
											<li><input type="submit" class="order_button"
												value="주문하기" onclick="return confirm('주문하시겠습니까?');" /></li>
											<li><input type="reset"
												onclick="return confirm('취소를 누르시면 입력한 내용이 초기화됩니다. 취소하시겠습니까?');"
												class="cansel_button" value="취소" /></li>
										</ul>
									</div>
								</div>
							</form>
						</section>

					</div>
					<div class="6u 12u(mobile)">

						<!-- Contact -->
						<section class="feature-list small" style="text-align: center;">
							<div class="row">
								<div class="6u 12u(mobile)">
									<section>
										<img class="kakao" src="images/kakao.png" />

										<h3 class="kakao_h3">카카오톡</h3>
										<p>
											<a target=_blank
												href="http://plus.kakao.com/home/%40%EB%B0%B1%EC%9D%98%EB%AF%BC%EC%A1%B1">
												@백의민족</a>

										</p>
									</section>
								</div>
								<div class="6u 12u(mobile)">
									<section>
										<h3 class="icon fa-comment">Social</h3>
										<p>
											<a target=_blank href="http://blog.naver.com/100min2442">네이버
												블로그</a><br /> <a target=_blank
												href="https://www.facebook.com/O2O100min">facebook</a><br />

										</p>
									</section>
								</div>
							</div>
							<div class="row">
								<div class="6u 12u(mobile)">
									<section>
										<h3 class="icon fa-envelope">Email</h3>
										<p>
											<a href="mailto:contact@100min.co.kr">contact@100min.co.kr
											</a>
										</p>
									</section>
								</div>
								<div class="6u 12u(mobile)">
									<section>
										<h3 class="icon fa-phone">Phone</h3>
										<p>
											<a>070-4233-1100</a>
										</p>
									</section>
								</div>
							</div>
						</section>

					</div>
				</div>
				<hr />
			</div>

		</div>

		<!-- End -->
		<div class="wrapper style3"
			style="padding-bottom: 0; padding-top: 3em;">

			<div id="highlights">

				<img class="logo" src="images/logo.png" />
				<div class="information">
					<p class="bakmincompany">(주)백의민족</p>
					<br>
					<p>서울시 구로구 디지털로30길 28 마리오타워 804호</p>
					<br>
					<p>사업자번호 : 606-86-62623</p>
					<br>
					<p>통신판매업 : 제2015-서울구로-1059호</p>
					<br>
					<p>대표자 : 이광훈</p>
					<br>
					<p>전화번호 : 070-4233-1100</p>
					<br>
					<p>이메일 : contact@100min.co.kr</p>
					<br>
					<p>@2015 백의민족 Co.,Ltd. All rights reserved</p>
				</div>


				<div class="IUSP">
					<a href="https://mixpanel.com/f/partner"> <img class="mixpanel"
						src="//cdn.mxpnl.com/site_media/images/partner/badge_light.png"
						alt="Mobile Analytics"></a> <img class="inipay"
						src="http://image.inicis.com/mkt/certmark/inipay/inipay_74x74_gray.png"
						border="0" alt="클릭하시면 이니시스 결제시스템의 유효성을 확인하실 수 있습니다."
						style="cursor: hand"
						onclick="javascript:window.open(&quot;https://mark.inicis.com/mark/popup_v1.php?mid=100min0000&quot;,&quot;mark&quot;,&quot;scrollbars=no,resizable=no,width=565,height=683&quot;);" />
					<img class="e_inipay"
						src="http://image.inicis.com/mkt/certmark/escrow/escrow_74x74_gray.png"
						border="0" alt="클릭하시면 이니시스 결제시스템의 유효성을 확인하실 수 있습니다."
						style="cursor: hand"
						onclick="javascript:window.open(&quot;https://mark.inicis.com/mark/escrow_popup.php?mid=IES100min0&quot;,&quot;mark&quot;,&quot;scrollbars=no,resizable=no,width=565,height=683&quot;);" />
				</div>
			</div>
		</div>

	</div>

	<!-- Scripts -->


	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/skel-viewport.min.js"></script>
	<script src="assets/js/util.js"></script>

	<script src="assets/js/main.js"></script>

</body>
</html>