<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.util.*"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<%@page import="DB.DB_Control"%>
<%@ page language="java" import="java.sql.*"%>
<%
	ResultSet main_rs = (ResultSet)session.getAttribute("main_rs");
	System.out.println(main_rs);
%>

<!DOCTYPE html>
<html>
<title>경북대학교 수강신청 도우미</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html,body{width:100%; height : 100%},h1,h2,h3,h4,h5 {font-family: "Open Sans", sans-serif}
</style>
<body class="w3-theme-l5" style="background-image:URL('knu_background.png');background-attachment:fixed;background-size:cover;">

<!-- Navbar -->
<div class="w3-top">
 <div class="w3-bar w3-theme-d2 w3-left-align w3-large">
  <!--<a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>-->
  
  <a href="#" class="w3-bar-item w3-button w3-padding-large w3-theme-d4"><img src="knu_logo.png" width = 25 height = 25> 경북대학교 수강신청 도우미 시스템</a>
      
    <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px">
      <a href="#" class="w3-bar-item w3-button">One new friend System</a>
      <a href="#" class="w3-bar-item w3-button">John Doe posted on your wall</a>
      <a href="#" class="w3-bar-item w3-button">Jane likes your post</a>
    </div>
  </div>
  <form action = logout_page.jps">
  <a href="#" class="w3-bar-item w3-button w3-hide-small w3-right w3-padding-large w3-hover-white" title="My Account">Logout</a>-->
  </form>
 </div>
</div>

<!-- Navbar on small screens -->
<div id="navDemo" class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium w3-large">
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 1</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 2</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 3</a>
  <a href="#" class="w3-bar-item w3-button w3-padding-large">My Profile</a>
</div>

<!-- Page Container -->
<div class="w3-container w3-content" style="max-width:1600px;margin-top:80px"> 
   
  <!-- The Grid -->
  <div class="w3-row">
    <!-- Left Column -->
    <div class="w3-col m3">
      <!-- Profile -->
      <div class="w3-card w3-round w3-white">
        <div class="w3-container">
         <h4 class="w3-center">My Profile</h4>
         <p class="w3-center"><img src="/w3images/avatar3.png" class="w3-circle" style="height:106px;width:106px" alt="Avatar"></p>
         <hr>
         <p><i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i> 김광환</p>
         <p><i class="fa fa-home fa-fw w3-margin-right w3-text-theme"></i> 컴퓨터학부</p>
         <p><i class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i> 3학년 2학기</p>
		 <p><i class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i> 수강학점 : 125</p>

        </div>
      </div>
      <br>

      <!-- Alert Box -->
      <div class="w3-container w3-display-container w3-round w3-theme-l4 w3-border w3-theme-border w3-margin-bottom w3-hide-small">
        <span onclick="this.parentElement.style.display='none'" class="w3-button w3-theme-l3 w3-display-topright">
          <i class="fa fa-remove"></i>
        </span>
        <p><strong>Hey!</strong></p>
        <p>People are looking at your profile. Find out who.</p>
      </div>
    
    <!-- End Left Column -->
    </div>
    
    <!-- Middle Column -->
    <div class="w3-col m7">
    
      <div class="w3-row-padding">
        <div class="w3-col m12">
          <div class="w3-card w3-round w3-white">
            <div class="w3-container w3-padding">   
			<h4 class="w3-opacity">강의계획서</h4>
			<div>
				<div class="bbs_info">
				<form action="main_table.jsp">
					<div class="search" style="float:left; width: 100%;">			
						검색조건 :  
						<!--옵션을 어케 둘것인가?-->
						<select id="sub02" class="sub">
							<option value="11">인문대학</option>
							<option value="12">사회과학대학</option>
							<option value="13">자연과학대학</option>
							<option value="14">경상대학</option>
							<option value="15">법과대학</option>
							<option value="16">공과대학</option>
							<option value="17">농업생명과학대학</option>
							<option value="19">사범대학</option>
							<option value="18">예술대학</option>
							<option value="1F">의과대학</option>
							<option value="1G">치과대학</option>
							<option value="1A">수의과대학</option>
							<option value="1B">생활과학대학</option>
							<option value="1E">자율전공부</option>
							<option value="1D">전자전기컴퓨터학부</option>
							<option value="1C">간호대학</option>
							<option value="1O">IT대학</option>
							<option value="1P">글로벌인재학부</option>
							<option value="1Q">약학대학</option>
							<option value="1R">에너지공학부</option>
							<option value="1S">행정학부</option>
							<option value="">==상주캠퍼스==</option>
							<option value="1L">생태환경대학</option>
							<option value="1N">이공대학</option>
							<option value="1U">과학기술대학</option>
							<option value="1M">보건복지학부</option>
							<option value="1V">축산대학</option>
							<option value="1W">과학기술생명자원자율학부</option>
						</select>
						<select id="sub03" class="sub">
							<option value="211"></option>
							<option value="CSE">컴퓨터학부</option>
							<option value="223">컴퓨터학부 글로벌소프트웨어학과</option>
							<option value="224">전기공학과</option>
							<option value="225">전자공학부 A</option>
							<option value="226">전자공학부 B</option>
							<option value="228">전자공학부 C</option>
							<option value="22G">전자공학부 D</option>
							<option value="229">전자공학부 E</option>
							<option value="22A">전자공학부 F</option>
							<option value="23D">전자공학부 모바일전공</option>
							<option value="22F">건설IT전공</option>
							<option value="22F">빅데이터전공</option>
						</select>
				</div>
			</div>

			<input type="checkbox" name = "one" value = "lee">  one 
			<input type="checkbox" name = "two" value = "na"> two 
			<input type="checkbox" name = "three" value> three <br>
			<button type="submit" class="w3-button w3-theme"><i class="fa fa-pencil"></i> 조회</button> 
				</form>
			</div>
            </div>
          </div>
        </div>
      </div>
            
      <div class="w3-container w3-card w3-white w3-round w3-margin">
	  <div>
	<!-- title  -->
	<div id="title_cour"></div>
	<!-- current location  -->
	<div id="locator_cour" style="width:75%;"></div>
	<!-- content   -->
	  
		
	  <div style="float:left;padding:0px; margin:0px; width:100%;" id="viewPlans">
	  	<div id="detail_title_cour" class="sotitle" style="padding-top: 6px;">공통</div>
	
		<input type="hidden" id ="search_open_yr_trm" name="search_open_yr_trm"/>
		<table class="courTable" style="width:100%;" id="main_table">
	  		<tr>
				<th class="th1">학년</th>
			    <th class="th2">교과<br>구분</th>
			    <th class="th4">교과목<br>번호</th>
			    <th class="th5">교과목명</th>
			    <th class="th6">학점</th>
			    <th class="th7">강의</th>
			    <th class="th8">실습</th>
			    <th class="th9">담당<br>교수</th>
			    <th class="th10">강의시간</th>
			    <th class="th11">강의실</th>
			    <th class="th12">수강<br/>정원</th>
			    <th class="th13">수강<br/>신청</th>
			    <th class="th14">수강꾸러미<br/>신청</th>
			    <th class="th15"><p style="color:blue;">수강꾸러미<br/>신청가능여부</p></th>
			    <th class="th16">비고</th>
	  		</tr>
	  		<%
	  		if(main_rs != null)
         while (main_rs.next()) {
      %>
      <tr>
         <td><%=main_rs.getString(1) %></td>
         <td><%=main_rs.getString(2) %></td>
         <%-- 
         <td>교과구분</td>
         <td>교과목명</td>
         <td>학점</td>
         <td>담당교수</td>
         <td>강의시간</td>
         <td>수강정원</td>
         --%>
      </tr>
      <%
         }// end while loop
         if(main_rs != null)
         	main_rs.close();
      %>
		</table>
		<div class="note">
		  	<h5>참고사항</h5>
		  	<p class="emp">※교과목 번호를  클릭하면, 강의계획서를 볼 수 있습니다.</p>
	  	</div>
	</div>
		</div>
	</div>
	
		
    <!-- End Middle Column -->
    </div>
    
    <!-- Right Column -->
    <div class="w3-col m2">
      <div class="w3-card w3-round w3-white w3-center">
        <div class="w3-container">
          <p><strong>추천 과목</strong></p>
          <p>데이터베이스</p>
          <p>모바일 앱 프로그래밍</p>
		  <p>존나</p>
		  <p>하기싫다</p>
          <p><button class="w3-button w3-block w3-theme-l4">자세히 보기</button></p>
        </div>
      </div>
      <br>
      
    <!-- End Right Column -->
    </div>
    
  <!-- End Grid -->
  </div>
  
<!-- End Page Container -->
</div>
<br>
</body>
</html>