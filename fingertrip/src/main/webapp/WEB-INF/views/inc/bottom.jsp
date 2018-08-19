<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>
	$(function(){
		$('.refer p').click(function(){
			$('.refer div').toggle("slow");
		});
	});
</script>

<!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 h-100 text-center text-lg-left my-auto">
                    <ul class="list-inline mb-2">
                        <li class="list-inline-item">
                            <a href="<c:url value='/footer/about.do'/>">회사소개</a>
                        </li>
                        <li class="list-inline-item">&sdot;</li>
                        <li class="list-inline-item">
                            <a href="<c:url value='/footer/term.do'/>">이용약관</a>
                        </li>
                        <li class="list-inline-item">&sdot;</li>
                        <li class="list-inline-item">
                            <a href="<c:url value='/footer/advertise.do'/>">제휴/광고 문의</a>
                        </li>
                    </ul>
                    <p class="text-muted small mb-4 mb-lg-0">&copy; FiveFingers<a href="<c:url value='/admin/adminLogin.do'/>" class="admBtn" target="blank">:D</a> 2018. All Rights Reserved.</p>
                </div>
                <div class="col-lg-6 h-100 text-center text-lg-right my-auto">
                    <ul class="list-inline mb-0">
                        <li class="list-inline-item mr-3 disNone992 refer">
                            <p>참고하면 좋은 사이트</p>
                            <div>
                            	<a href="https://www.0404.go.kr" target="_blank">해외안전여행</a>
                            	<a href="https://www.seatguru.com/" target="_blank">seatguru</a>
                            </div>
                        </li>
                        <li class="list-inline-item mr-3">
                            <a href="https://www.facebook.com/FingerTrip-319749992128449"><img src="<c:url value='/img/face.png'/>" alt="핑거트립 페이스북 바로가기"></a>
                        </li>
                        <li class="list-inline-item mr-3">
                            <a href="https://twitter.com/fingertrip2018"><img src="<c:url value='/img/twit.png'/>" alt="핑거트립 트위터 바로가기"></a>
                        </li>
                        <li class="list-inline-item">
                            <a href="https://www.instagram.com/fingertrip2018"><img src="<c:url value='/img/insta.png'/>" alt="핑거트립 인스타그램 바로가기"></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>
 


</body>
</html>
