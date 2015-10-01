<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import= "beans.User" %>
<%@ page import= "java.util.ArrayList" %>
<%@ page import= "javax.servlet.http.HttpSession" %>
<% User LoginUser = (User)session.getAttribute("user"); %>

<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
       <title>Setting</title>

    <link href="../../css/vendor/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/flat-ui.css" rel="stylesheet">
   
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
    <li class="active"><a href="../hazelab/setting.jsp"><span class="fui-gear"></span></a></li>
	<li><a href="./LogOutServlet"><span class="fui-power"></span></a></li>
	</ul>
	
    </div>
   </nav>
   
   <div class="container">
     <div class="col-md-3">
      <div class="well">
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
     
	 <div class="row">
	 	<p>Password(change password?)</p>
        <div class="col-xs-3">
          <div class="form-group">
            <input type="password" value="" placeholder="Password" class="form-control" />
          </div>
        </div>
        <p>Your avator</p>
        <div id="avatar" class="muted">
        	<img src="/avator/<%=LoginUser.getUser_id()%>/avatar.png" style="with: 120px; height: 120px;"/>
        </div>
        
        <style type="text/css">
div.dz-filename, div.dz-size, div.dz-progress, div.dz-success-mark, div.dz-error-mark, div.dz-error-message {
  display: none;
}

div#clickable {
  width: 100%;
  text-align: center;
  line-height: 120px;
}

div.dz-message, div.dz-fallback {
  width: 240px;
  color: #000000;
  font-size: 12px;
  line-height: 14px;
}

div#avatar {
  background-color: #f8f8f8;
  border: 1px dashed silver;
  width: 120px;
  height: 120px;
}
        	
    </div>
    
    
     
     
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="../../js/vendor/bootstrap.min.js"></script>
  </body>
</html>
