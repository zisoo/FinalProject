<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width,user-scalable=no,initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <title>Final Project</title>
   <!-- CSS -->
   <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<script src="../../../resources/lib/jquery/jquery-3.4.1.min.js"></script>
   <link rel="stylesheet" type="text/css" href="../../../resources/css/common.css">
   <link rel="stylesheet" type="text/css" href="../../../resources/css/adminMain.css">
   <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700" rel="stylesheet">

   <!-- 부트스트랩 -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

   <script>
   		$(document).ready(function(){

			$('.first').hover(function () {
			    if($(".firstSub").css("display") == "none"){
			       $('.firstSub').css("display", "block");
			       event.preventDefault();
			    } else {
			       $('.firstSub').css("display", "none");
			    }
			});

			$('.firstSub2').hover(function () {
			    if($(".asideSubmenu2").css("display") == "none"){
			       $('.asideSubmenu2').css("display", "block");
			       event.preventDefault();
			    } else {
			       $('.asideSubmenu2').css("display", "none");
			    }
			});

			$('.second').hover(function () {
			    if($(".secondSub").css("display") == "none"){
			       $('.secondSub').css("display", "block");
			       event.preventDefault();
			    } else {
			       $('.secondSub').css("display", "none");
			    }
			});

			$('.third').hover(function () {
			    if($(".thirdSub").css("display") == "none"){
			       $('.thirdSub').css("display", "block");
			       event.preventDefault();
			    } else {
			       $('.thirdSub').css("display", "none");
			    }
			});

			$('.fourth').hover(function () {
			    if($(".fourthSub").css("display") == "none"){
			       $('.fourthSub').css("display", "block");
			       event.preventDefault();
			    } else {
			       $('.fourthSub').css("display", "none");
			    }
			});

		});//ready
   </script>
<link rel="stylesheet" type="text/css" href="../../../resources/css/tableEllipsis.css">
<link rel="stylesheet" type="text/css" href="../../../resources/css/test.css">
</head>
<body>
	<div id="wrap">
		<header>
			<nav>
				<div class="inner">
					<div class="headerContent">
						<div class="mainlogo"><a href="#"></a></div>
						<ul class="gnb">
							<li>admin</li>
							<li><input type="button" name="logout" value="로그아웃"></li>
						</ul>
					</div>
				</div>
			</nav>
		</header>
		<div id="container">
			<aside>
				<ul class="asdieMainMenu">
					<li class="Mainli first">매출 관리
						<ul class="asideSubmenu firstSub">
							<li><a href="#">결제 내역</a></li>
							<li class="firstSub2">입금 관리
								<ul class="asideSubmenu2">
									<li><a href="#">입금 전 목록</a></li>
									<li><a href="#">입금 완료 목록</a></li>
								</ul>
							</li>
							<li><a href="#">통계 관리</a></li>
						</ul>
					</li>
					<li class="Mainli"><a href="#">레벨테스트 관리</a></li>
					<li class="Mainli"><a href="#">공지사항 관리</a></li>
					<li class="Mainli second">고객센터 관리
						<ul class="asideSubmenu secondSub">
							<li><a href="#">QnA 관리</a></li>
							<li><a href="#">FAQ 관리</a></li>
						</ul>
					</li>
					<li class="Mainli third">회원 관리
						<ul class="asideSubmenu thirdSub">
							<li><a href="#">회원 관리</a></li>
							<li><a href="#">리더 관리</a></li>
						</ul>
					</li>
					<li class="Mainli fourth">리더가입 관리
						<ul class="asideSubmenu forthSub">
							<li><a href="#">가입 대기 리더 목록</a></li>
							<li><a href="#">리더 가입 거부 목록</a></li>
						</ul>
					</li>
				</ul>
			</aside>
			
			<!-- End Sidebar Start 내용물-->
			<div class="containerContent">
				<div class="inner">
				<h2>레벨 테스트 관리</h2>
				<div class="beforeDepositList">
					<table class="table table-striped table-hover">
						<thead>
			            	<tr>
			                  <th>문제<!-- Rendering engine --></th>
			                  <th>정답<!-- Engine version --></th>
			            	</tr>
			            </thead>
			            <tbody>
	                   		<c:forEach items="${list}" var="test">
			            	<tr>
			            		<td><a class="move" href="${test.testIndex}">${test.testContent}</a></td>
						        <td>${test.testAnswer}</td>
			            	</tr>
			            	</c:forEach>
			           </tbody>
					</table>
					<button id="regBtn" class="btn btn-primary pull-right">문제 추가</button>
					
					<!-- 액션폼 -->
					<form id='actionForm' action="/level/list" method="get">
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
						<%-- <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
						<input type="hidden" name="type" value="${pageMaker.cri.type }">
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }"> --%>
					</form>
				</div>
				
				<!-- 페이징 -->
				<div class="pull-center">
				<ul class="pagination">
				<!-- previous 버튼 표시 -->
				<c:if test="${pageMaker.prev }">	
					<li class="paginate_button previous">
						<a href="${pageMaker.startPage -1}">이전으로</a>
					</li>
				</c:if>
					
				<!-- 페이지 번호 표시 -->
				<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
					<li class='paginate_button ${pageMaker.cri.pageNum == num ? "active":"" } '>
					<a href="${num}"> ${num} </a></li>
				</c:forEach>
				<!-- next 버튼 표시 -->
				<c:if test="${pageMaker.next }">	
					<li class="paginate_button next">
						<a href="${pageMaker.endPage +1 }">다음으로</a>
					</li>
				</c:if>
				</ul>
				</div>
				</div>
			</div>
			<!-- End 내용물 -->
			
		</div><!-- container -->
		
			
		<footer>
			<div class="inner">
				<div class="footArea">
					<div class="footerLeft">
						<div class="callNumber"><b>고객센터</b><strong> 1588-0000</strong> 평일 09:00~18:00(공휴일 제외)</div>
						<div class="footerinfo">
							<ul>
								<li><a href="#">개인정보 처리방침</a></li>
								<li><a href="#">서비스약관</a></li>
							</ul>
						</div>
						<address>서울특별시 마포구 서교동 447-5 풍성빌딩 쌍용강북교육센터</address>
					</div>
					<div class="footerRight">
						<div class="sns">
		                    <a href="#" target="_blank"><img src="../../../resources/img/GumonMain/img_sns_instar.png" alt="인스타"></a>
		                    <a href="#" target="_blank"><img src="../../../resources/img/GumonMain/img_sns_blog.png" alt="블로그"></a>
		                    <a href="#" target="_blank"><img src="../../../resources/img/GumonMain/img_sns_facebook.png" alt="페이스북"></a>
		                    <a href="#" target="_blank"><img src="../../../resources/img/GumonMain/img_sns_kakaostory.png" alt="카카오스토리"></a>
		                </div>
					</div>
				</div>
				<div class="copyright">Copyrightⓒ AGUMON. All Right Reserved</div>
			</div><!-- inner -->
		</footer>
	</div><!-- wrap -->
	
<script>

var actionForm = $("#actionForm");

//등록 이벤트
$("#regBtn").on("click", function(){
	self.location = "/level/register";
});

//상세보기 페이지 이동
$(".move").on("click", function(e){
		e.preventDefault();
		actionForm.append("<input type='hidden' name='testIndex' value='"+$(this).attr("href")+"'>");
		actionForm.attr("action", "/level/get");
		actionForm.submit();
		
});

//페이지 이동하기
var actionForm = $("#actionForm");

$(".paginate_button a").on("click", function(e){
	e.preventDefault();

	actionForm.find("input[name='pageNum']").val($(this).attr("href"));
	
	actionForm.submit();
});
</script>	
</body>
</html>