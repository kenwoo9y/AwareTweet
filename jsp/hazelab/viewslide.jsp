<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import= "beans.User" %>
<%@ page import= "java.util.ArrayList" %>
<%@ page import= "javax.servlet.http.HttpSession" %>
<%@ page import= "java.io.File" %>
<% User LoginUser = (User)session.getAttribute("user"); %>
<%
File[] jpegList =  (File[])request.getAttribute("jpeg-list");
%>
<% String slideName = (String)request.getAttribute("slideName");%>

<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
       <title>Slide</title>

    <link href="../../css/vendor/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/vendor/bootstrap.css" rel="stylesheet">
    <link href="../../css/flat-ui.css" rel="stylesheet">
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
	 <a class="navbar-brand">AwareTweet</a>
	</div>
	
	<ul class="nav navbar-nav navbar-left">
	<li><a href="../hazelab/top.jsp"><span class="fui-home"></span></a></li>
    </ul>
    <form class="navbar-form navbar-left" action="#" role="search">
     <div class="form-group">
      <div class="input-group">
       <input class="form-control" id="navbarInput-01" type="search" placeholder="AwareTweet検索">
        <span class="input-group-btn">
         <button type="submit" class="btn"><span class="fui-search"></span></button>
        </span>
      </div>
     </div>
    </form>
    <ul class="nav navbar-nav navbar-right">
    <li class="active"><a href="../hazelab/GetSlideServlet"><span class="fui-play"></span></a>
    <li><a href="../hazelab/setting.jsp"><span class="fui-user"></span></a></li>
	<li><a href="../common/LogOutServlet"><span class="fui-power"></span></a></li>
	</ul>
	
    </div>
   </nav>
   
   <div class="container">
     <div class="col-md-3">
      <div class="well">
      	<div id="avatar" class="muted">
  			<img src=<%=LoginUser.getAvator_path()%> style="with: 120px; height: 120px;"/>
 		</div>
       <p><%=LoginUser.getUser_name()%></p>
      </div>
     <br>
      <ul class="nav navbar-default nav-stacked">
       <li class="active"><a href="#">menue1</a></li>
       <li><a href="#">menue2</a></li>
       <li><a href="#">menue3</a></li>
       <li><a href="#">menue4</a></li>
       <li><a href="#">menue5</a></li>
      </ul>
     </div>
    
     <div class="span9">
     <div class="box">
     <div class="box-content">
     	<div class="span6">
     	<div class="frameLine">
		   	<ul class="bxslider">
		   	<%String hostPath = "http://localhost:8080/";%>
		   	<%String jpegdirPath = hostPath + "AwareTweet/slide/" + LoginUser.getUser_id() +"/"
		   	+ slideName + "/";%>
		   	<%for(int i=1; i<jpegList.length; i++) {%>
		   	<%File jpegs = jpegList[i]; %>
			<li><img title="スライド<%=i%>" alt="" src=<%=jpegdirPath + jpegs.getName() %> width="720" height="540" /></li>
			<%} %>
			</ul>
		</div>
		</div>
	 </div>
     </div>
     </div>
    </div>

    
    
    
  </body>
</html>