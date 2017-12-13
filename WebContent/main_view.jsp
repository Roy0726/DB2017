<%@page import="syllabus.SearchLecture"%>
<%@page import="syllabus.Recommend"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ page import="syllabus.Syllabus"%>
<%@ page import="syllabus.SearchLecture"%>
<%@ page import="java.util.ArrayList"%>

<%@ page import="User.User"%>

<%@page import="java.util.*"%>

<%

    request.setCharacterEncoding("UTF-8");

%>

<%@page import="DB.DB_Control"%>

<%@ page language="java" import="java.sql.*"%>

<%

   String c1 = (String)session.getAttribute("c1"); //language
   String c2 = (String)session.getAttribute("c2"); //project
   String c3 = (String)session.getAttribute("c3"); //done


   String s1 = (String)session.getAttribute("s1"); //category1
   String s2 = (String)session.getAttribute("s2"); //category2

   User user = (User)session.getAttribute("user_info");

   ArrayList<SearchLecture> main_rs = (ArrayList<SearchLecture>)session.getAttribute("main_rs");

   ArrayList<Recommend> rec = (ArrayList<Recommend>)session.getAttribute("rec");

   //System.out.println(main_rs);

%>





<!DOCTYPE html>



<html>

<title>경북대학교 수강신청 도우미  </title>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link rel="stylesheet"
   href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">

<link rel='stylesheet'
   href='https://fonts.googleapis.com/css?family=Open+Sans'>

<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
html, body {
   width: 100%;
   height: 100%
}

,
h1, h2, h3, h4, h5 {
   font-family: "Open Sans", sans-serif
}
</style>

<body class="w3-theme-l5"
   style="background-image: URL('knu_background.png'); background-attachment: fixed; background-size: cover;">



   <!-- Navbar -->

   <div class="w3-top">

      <div class="w3-bar w3-theme-d2 w3-left-align w3-large">

         <!--<a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>-->



         <a href="#"
            class="w3-bar-item w3-button w3-padding-large w3-theme-d4"><img
            src="knu_logo.png" width=25 height=25> 경북대학교 수강신청 도우미 시스템</a>

         <div class="w3-dropdown-content w3-card-4 w3-bar-block"
            style="width: 300px">

            <a href="#" class="w3-bar-item w3-button">One new friend System</a>

            <a href="#" class="w3-bar-item w3-button">John Doe posted on

               your wall</a> <a href="#" class="w3-bar-item w3-button">Jane likes

               your post</a>

         </div>

      </div>



   </div>



   <!-- Navbar on small screens -->

   <div id="navDemo"
      class="w3-bar-block w3-theme-d2 w3-hide w3-hide-large w3-hide-medium w3-large">

      <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 1</a>

      <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 2</a>

      <a href="#" class="w3-bar-item w3-button w3-padding-large">Link 3</a>

      <a href="#" class="w3-bar-item w3-button w3-padding-large">My

         Profile</a>

   </div>



   <!-- Page Container -->

   <div class="w3-container w3-content"
      style="max-width: 1600px; margin-top: 80px">



      <!-- The Grid -->

      <div class="w3-row">

         <!-- Left Column -->

         <div class="w3-col m2">
            <!-- Profile -->
            <div class="w3-card w3-round w3-white">

               <div class="w3-container">
                  <h4 class="w3-center">My Profile</h4>
                  <p class="w3-center">
                     <img src="profile.png" class="w3-circle"
                        style="height: 106px; width: 106px" alt="Avatar">
                  </p>
                  <hr>
                  <p>
                     <i class="fa fa-child fa-fw w3-margin-right w3-text-theme"></i>
                     <%=user.getSname() %></p>
                  <p>
                     <i class="fa fa-home fa-fw w3-margin-right w3-text-theme"></i>
                     <%=user.getDname() %></p>
                  <p>
                     <i
                        class="fa fa-shield fa-fw w3-margin-right w3-text-theme"></i>
                     <%=user.getGrade() %>학년
                     <%=user.getSemester() %>학기
                  </p>
                  <p>
                     <i
                        class="fa fa-book fa-fw w3-margin-right w3-text-theme"></i>
                     	수강학점 :
                     <%=user.getTaken() %>/<%=user.getSatisfied() %></p>
		         <form action="logout_page.jsp" method="post">
		            <div class="w3-buttonforlogout">
						<button type="submit" class="w3-button w3-theme">
                         		로그아웃
                       	</button>
		            </div>
		         </form>
               </div>
            </div>
            <br>


            <!-- Alert Box -->

            <div
               class="w3-container w3-display-container w3-round w3-theme-l4 w3-border w3-theme-border w3-margin-bottom w3-hide-small">

               <span onclick="this.parentElement.style.display='none'"
                  class="w3-button w3-theme-l3 w3-display-topright"> <i
                  class="fa fa-remove"></i>

               </span>

               <p>

                  <strong>주의사항</strong>

               </p>

               <p>이 사이트는 수강신청을 도와줄 뿐 수강신청 실패에 대한 어떠한 책임도 지지 않습니다.</p>

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

                              <form action="main_table.jsp" method="post">

                                 <div class="search" style="float: left; width: 100%;">

                                    검색조건 :

                                    <!--옵션을 어케 둘것인가?-->

                                    <select id="sub01" class="sub" name="sub01">

                                       <option value="11">인문대학</option>

                                       <option value="12">사회과학대학</option>

                                       <option value="13">자연과학대학</option>

                                       <option value="14">경상대학</option>

                                       <option value="15">법과대학</option>

                                       <option value="16">공과대학</option>

                                       <option value="17">농업생명과학대학</option>

                                       <option value="19">사범대학</option>

                                       <option value="18">예술대학</option>

                                       <option value="20">의과대학</option>

                                       <option value="21">치과대학</option>

                                       <option value="22">수의과대학</option>

                                       <option value="23">생활과학대학</option>

                                       <option value="24">자율전공부</option>

                                       <option value="25">전자전기컴퓨터학부</option>

                                       <option value="26">간호대학</option>

                                       <option value="27">IT대학</option>

                                       <option value="28">글로벌인재학부</option>

                                       <option value="29">약학대학</option>

                                       <option value="30">에너지공학부</option>

                                       <option value="31">행정학부</option>

                                       <option value="">==상주캠퍼스==</option>

                                       <option value="32">생태환경대학</option>

                                       <option value="33">이공대학</option>

                                       <option value="34">과학기술대학</option>

                                       <option value="35">보건복지학부</option>

                                       <option value="36">축산대학</option>

                                       <option value="37">과학기술생명자원자율학부</option>


                                    </select> <select id="sub02" class="sub" name="sub02">

                                       <option value="none"></option>

                                       <option value="205001">컴퓨터학부</option>

                                       <option value="205033">컴퓨터학부 글로벌소프트웨어학과</option>

                                       <option value="205006">전기공학과</opion>

                                       <option value="205007">전자공학부 A</option>

                                       <option value="205008">전자공학부 B</option>

                                       <option value="205009">전자공학부 C</option>

                                       <option value="205010">전자공학부 D</option>

                                       <option value="205011">전자공학부 E</option>

                                       <option value="205012">전자공학부 F</option>

                                       <option value="205013">전자공학부 모바일전공</option>

                                       <option value="205014">건설IT전공</option>

                                       <option value="205015">빅데이터전공</option>

                                    </select>

                                 </div>
                           </div>



                           <input type="checkbox" name="one" value="english"
                              <%if(c1 != null) out.print("checked=\"checked\""); %>>

                           영어 <input type="checkbox" name="two" value="project"
                              <%if(c2 != null) out.print("checked=\"checked\""); %>>

                           프로젝트 <input type="checkbox" name="three" value="done"
                              <%if(c3 != null) out.print("checked=\"checked\""); %>>

                           미이수 <br>

                           <button type="submit" class="w3-button w3-theme">

                              <i class="fa fa-pencil"></i> 조회

                           </button>

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

                  <div id="locator_cour" style="width: 75%;"></div>

                  <!-- content   -->



                  <script language="javascript">

   

   var sel = document.getElementById("sub01");
   var sel2 = document.getElementById("sub02");

   for(i=0; i<sel.options.length; i++) {   

      if(sel.options[i].value == <%=s1%>)

         {
         sel.options[i].selected=true;
           break;

         }

   }

   

   for(i=0; i<sel2.options.length; i++) {   

      if(sel2.options[i].value == <%=s2%>) 
      {

                     sel2.options[i].selected = true;

                           break;

                        }

                     }
                  </script>

                  <div style="float: left; padding: 0px; margin: 0px; width: 100%;"
                     id="viewPlans">
<!-- 
                     <div id="detail_title_cour" class="sotitle"
                        style="padding-top: 6px;">공통</div>
-->


                     <input type="hidden" id="search_open_yr_trm"
                        name="search_open_yr_trm" />

                     <table class="courTable" style="width: 100%;" id="main_table">
                        <tr>
                           <th class="th1">학년</th>
                           <th class="th2">교과<br>구분
                           </th>
                           <th class="th3">교과목<br>번호
                           </th>
                           <th class="th4">교과목명</th>
                           <th class="th5">학점</th>
                           <th class="th6">담당<br>교수
                           </th>
                           <th class="th7">수강<br />정원
                           </th>
							<th class="th7">수강<br />시간
                           </th>
                        </tr>
                        <%
                           if (main_rs != null)
                              for (SearchLecture sy : main_rs) {
                        %>
     				 <tr>
                           <th><%=sy.get_grade()%></th>
                           <th><%=sy.get_major()%></th>
                           <th><%=sy.get_lid()%></th>
                           <th><%=sy.get_lname()%></th>
                           <th><%=sy.get_credit()%></th>
                           <th ><%=sy.get_pname()%></th>
                           <th ><%=sy.get_capacity()%></th>
							<th ><%=sy.prev%> <br> <%=sy.after %></th>
                        </tr>
                        <%
                           } // end while loop
                        %>
                     </table>
                     <div class="note">
                        <h5>참고사항</h5>
                        <p class="emp">※교과목 번호를 클릭하면, 강의계획서를 볼 수 있습니다.</p>
                     </div>
                  </div>

               </div>

            </div>





            <!-- End Middle Column -->

         </div>



         <!-- Right Column -->
         <div class="w3-col m3">
            <div class="w3-card w3-round w3-white w3-center">
               <div class="w3-container">
                     <div id="detail_title_cour" class="sotitle"
                        style="padding-top: 6px ;padding-bottom:6px">수강 추천 목록</div>
                  <table style="font-size: 12px;">
                     <tr >
                        <td>학점</td>
                        <td>과목명</td>
                        <td>언어</td>
                        <td>프로젝트</td>
                        <td>이수여부</td>
                     </tr>
                     <%
                        for (Recommend temp : rec) {
                     %>
                     <tr>
                        <td><%=temp.getCredit()%></td>
                        <td><%=temp.getLname()%></td>
                        <td><%=temp.getLang()%></td>
                        <td><%=temp.getProject()%></td>
                        <td><%=temp.getDone()%></td>
                     </tr>
                     <%
                        } //end while loop
                     %>
                  </table>
                  <p>
                    <button class="w3-button w3-block w3-theme-l4">자세히 보기</button>
                  </p>
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