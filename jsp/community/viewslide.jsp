<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import= "beans.User" %>
<%@ page import= "beans.Tweet" %>
<%@ page import= "java.util.ArrayList" %>
<%@ page import= "utility.UserListComponent" %>
<%@ page import= "utility.PropertiesComponent" %>
<%@ page import= "javax.servlet.http.HttpSession" %>
<%@ page import= "java.io.File" %>
<% User LoginUser = (User)session.getAttribute("user"); %>
<%
File[] jpegList =  (File[])request.getAttribute("jpeg-list");
%>
<% String slideName = (String)request.getAttribute("slideName");%>
<% UserListComponent listCompornent = new UserListComponent(); %>
<% ArrayList<String> userList = listCompornent.getUserList(); %>
<% ArrayList tweetList = (ArrayList)request.getAttribute("tweetList"); %>
<% String author = (String) request.getAttribute("author"); %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

       <title>Slide</title>

    <link href="../../css/vendor/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/vendor/bootstrap.css" rel="stylesheet">
    <link href="../../css/flat-ui.css" rel="stylesheet">
     <link href="../../css/SelectOS.css" rel="stylesheet">
    <link href="../../bxslider/jquery.bxslider.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js" type="text/javascript"></script>
    <script src="../../bxslider/jquery.bxslider.min.js"></script>
    <script type="../../js/dropzone.js"></script>
    <script src="../../js/vendor/bootstrap.min.js"></script>


    <script type="text/javascript">
        $(document).ready(function(){
            $('.bxslider').bxSlider({
                auto: true,
                pause:  5500,
                speed: 800,
                mode: 'fade',
                pager:true,
                prevText: '<',
                nextText: '>'
            });
        });
	</script>

  </head>

  <body style="padding-top:70px;">


<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
     <div class="container">
     <div class="navbar-header">
      <a class="navbar-brand" href="../community/MoveTopServlet">AwareTweet</a>
      </div>

      <ul class="nav navbar-nav navbar-left">
      <li><a href="../community/adduser.jsp"><span class="fui-plus">Regist</span></a></li>
      <li class="active"><a href="../community/GetSlideServlet"><span class="fui-play">Slide</span></a></li>
    </ul>

    <ul class="nav navbar-nav navbar-right">
    <li><a href="../community/setting.jsp"><span class="fui-user"> Settings</span></a></li>
    <li><a href="../common/LogOutServlet"><span class="fui-power"> Logout</span></a></li>
    </ul>

    <form class="navbar-form navbar-right" action="../community/SearchTweetServlet" method="post" role="search">
     <div class="form-group">
      <div class="input-group">
       <input class="form-control" name="search_word" id="search_word" type="search" placeholder="Search">
        <span class="input-group-btn">
         <button type="submit" class="btn"><span class="fui-search"></span></button>
        </span>
      </div>
     </div>
    </form>

    </div>
  </nav>



   <div class="container">
     <div class="col-md-3">
      <div class="well">
      	<div id="avatar" class="muted">
  			<img src=<%=LoginUser.getAvator_path()%> style="with: 120px; height: 120px;"/>
 		</div>
 	   <br>
       <p><%=LoginUser.getUser_name()%></p>
      </div>
     <br>
      <form>
      <table class="table table-bordered table-hover table-condensed">
       <thead>
        <tr><th>メンバー</th></tr>
       </thead>
       <tbody>
       <%for(int i=0; i<userList.size(); i++){ %>
       <%String userName = (String)userList.get(i);%>
        <tr><td><a href="../community/GetUserTweetServlet?id=<%=userName %>"><%=userName %></a></td></tr>
       </tbody>
       <% } %>
      </table>
      </form>
     </div>

     <div class="col-md-6">
     <div class="span12">
     <div class="box">
     <div class="box-content">
     	<div class="frameLine">
		   	<ul class="bxslider">
		   	<%String hostPath = new PropertiesComponent().referProperties("hostPath"); %>
		   	<%String jpegdirPath = hostPath + "slide/" + author +"/"
		   	+ slideName + "/";%>
		   	<%for(int i=0; i<jpegList.length; i++) {%>
		   	<%File jpegs = jpegList[i]; %>
		   	<%if(!(jpegs.getName().startsWith("."))) {%>
			<li><img title="スライド<%=i+1%>" alt="" src=<%=jpegdirPath + jpegs.getName() %> width="400" height="300" /></li>
			<%} %>
			<%} %>
			</ul>
		</div>
	 </div>
     </div>
     </div>
     </div>

     <div class="col-md-3">
      <div class="panel panel-primary">
       <% for(int i=0; i<tweetList.size(); i++){ %>
       <% Tweet tweet = (Tweet)tweetList.get(i); %>
       <div class="panel-heading"><img src=<%=tweet.getAvator_path() %> style="with: 30px; height: 30px;"/>  <a href="../community/GetUserTweetServlet?id=<%=tweet.getCommenter() %>"><%=tweet.getCommenter()%></a></div>
       <div class="panel-body"><p><%=tweet.getComment()%></p></div>
       <div class="panel-footer"><%=tweet.getDate()%></div>
       <%} %>
      </div>
     </div>





  </body>
</html>
