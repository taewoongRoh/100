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
<script src="assets/js/jquery-1.12.0.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>



<!-- GA 스크립트 -->
<script>
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','//www.google-analytics.com/analytics.js','ga');
      ga('create', 'UA-68044341-1', 'auto');
      ga('send', 'pageview');
</script>




<script>
	$(function() {
		$("#datepicker").datepicker({
			dateFormat: "yymmdd",  // 데이터 포멧 , 20160905 형식 


			nextText: '', 

			prevText: '',  

			dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],  //데이터 형식 일~토로 

			monthNames: ['1월','2월','3월','4월','5월','6월', '7월','8월','9월','10월','11월','12월'], // 달도 한글로

			monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], // 달도 한글로

			beforeShow: function(input) {

			    var i_offset= $(input).offset(); //클릭된 input의 위치값 체크

			    setTimeout(function(){

			       $('#ui-datepicker-div').css({'top':i_offset.top, 'bottom':'', 'left':'10px'});      //datepicker의 div의 포지션을 강제로 input 위치에 그리고 좌측은 모바일이여서 작기때문에 무조건 10px에 놓았다.

			    })

			} 
		})
	});
</script>

</head>
<body class="homepage">
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
				<div id="logo" style="margin-bottom: 2em">
					<a href="index.jsp" class="logo_image image"> <img
						src="images/main_logo.png" alt="" />
					</a>
				</div>





				<div class="download_link">
					<a class="download_link_a" href="https://itunes.apple.com/kr/app/baeg-uiminjog/id1032679452?l=en&mt=8"> <img class="download_link_image"
						src="images/appstore_web.png" />
					</a> <a class="download_link_a" style="margin-left: 3%;" href="https://play.google.com/store/apps/details?id=kr.co.baekmin.baekmin_android"> <img
						class="download_link_image" src="images/googlestore_web.png" />
					</a>


				</div>				




			</div>
		</div>

		<!-- Intro -->
		<div id="intro-wrapper" class="wrapper style1">
			<div class="title">이용 방법</div>
			<section id="utilization" class="container">


				<a> <img class="use_image1" src="images/use_animation.gif" />
				</a> 


			</section>
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
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>

</body>
</html>