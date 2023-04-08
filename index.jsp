<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- contextPath 사용할 수 있도록 하는 라이브러리 코드1-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 사이트</title>
    <link rel="stylesheet" href="resources/css/main-style.css">
	
	<!-- contextPath 사용할 수 있도록 하는 라이브러리 코드2-->
	<c:set var="contextPath" value="${pageContext.request.contextPath}" />
   
</head>
<body>
    <header>
        
        <div class="hdiv1">
            <a href="${pageContext.request.contextPath}">
                <img src="${contextPath}/resources/images/porory.jpg" alt="logo" name="logo" width="300px" height="100px">
            </a>
        </div>
        <div class="hdiv2">
            <h1>우당탕탕 게시판</h1>
        </div>
        <div class="hdiv3">

        </div>
            

        
        <section></section>
    </header>

    <nav>
        <ul class="ul1">
            <li class="li1">
                <a href="#" >공지사항</a>
            </li>
            <li class="li1">
                <a href="#" >자유게시판</a>
            </li>
            <li class="li1"> 
                <a href="#">마음의소리</a>
            </li>
          
        </ul>

    </nav>
   
    <section id="secMain">    
         <!--게시판 목록이 나와야함-->
           
<div id="searchBtn1">
    <form action="#">
         
            <input type="search" id="search" name="search" autocomplete="off" placeholder="검색어를 입력해주세요.">
            <select name="select1" id="">
                <option>제목</option>
                <option>작성자</option>  
                <option>내용</option> 
            </select>
            <button id="search-btn">검색</button>
         
</form>

</div>
 
<a href="board/makeBoard">글 쓰기</a>
<div id="searchBtn2">
    
    <table border="1" class="main1">
            
            <thead>
            <tr>
                
                <th>번호</th>
                <th id="th2">제목</th>
                <th>글쓴이</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>
            </thead>
		<tbody id="tbody">
		
		</tbody>
        </table>
	
	
			<!-- 로그인이 되었을 때 -->
			<c:choose>
			<c:when test="${not empty sessionScope.loginMember }">
					 
		             	
            			<article class="login-area">
                            <!-- 회원 프로필 이미지 -->
            				<a href="${contextPath}/board/myPage/profile">
                                
                                <c:if test="${empty loginMember.profileImage}">
                                    <img src="${contextPath}/resources/images/user.png" id="member-profile">
                                </c:if>

                                <c:if test="${!empty loginMember.profileImage}">
                                    <img src="${contextPath}/${loginMember.profileImage}" id="member-profile">
                                </c:if>

            				</a>

                            <!-- 회원 정보 + 로그아웃 버튼 -->                                       
                            <div class="my-info">
                                <div>
                                    <a href="${contextPath}/member/myPage/info" id="nickname">${loginMember.memberNickname}</a>

                                    <a href="/community/member/logout" id="logout-btn">로그아웃</a>
                                </div>

                                <p>
                                    ${loginMember.memberEmail}
                                </p>
                            </div>
            			</article>
            		

					</c:when>
					 
					<c:otherwise>
						  <form action="board/login" method="POST" name="login-form" onsubmit="return loginValidate()">
		                   
		                   <fieldset>
			          <table id="main2">
			            <tr>
			                <th>이메일</th>
			                <td><input type="text" id="inputEmail" name="inputEmail" value="${cookie.saveId.value}"></td>
			              
			                 <td><button id="loginBtn3" name="loginBtn">로그인</button>
			                 
			                </td>
			            </tr>
			            <tr>
			                <th>비밀번호</th>
			                <td><input type="password" id="inputPw" name="inputPw"></td>
			                <td></td>
			            </tr>
						<tr>
							<th></th>
							<td>
					    <a href="${contextPath}/board/signUp">회원가입</a> 
						<a href="#">ID/PW찾기</a>
							</td>

						</tr>
			        </table>
				    	</fieldset>
		
                            <%-- 쿠키에 saveId가 있는 경우--%>
                            <c:if test="${ !empty cookie.saveId.value}">

                                <%-- chk 변수 생성(page scope)--%>
                                <c:set var="chk" value="checked"/>

                            </c:if>

		                    <label>
                                <!-- checked 속성 : radio/checkbox를 체크하는 속성 -->
		                        <input type="checkbox" name="saveId" ${chk}  id="saveId"> 아이디 저장
		                    </label>

					</c:otherwise>
			</c:choose>
 			

</div>	     
 		 
   

    
    <!-- jQuery 라이브러리 추가 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
   
 	<script src="${contextPath}/resources/js/main.js"></script>
  

</body>
</html>