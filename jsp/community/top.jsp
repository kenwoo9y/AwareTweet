<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import= "beans.User" %>
<%@ page import= "beans.Tweet" %>
<%@ page import= "java.util.ArrayList" %>
<%@ page import= "javax.servlet.http.HttpSession" %>
<%@ page import= "java.io.File" %>
<%@ page import= "utility.UserListComponent" %>
<%@ page import= "utility.SlideListComponent" %>
<% User LoginUser = (User)session.getAttribute("user"); %>

<% UserListComponent listCompornent = new UserListComponent(); %>
<% ArrayList<String> userList = listCompornent.getUserList(); %>

<% SlideListComponent slideCompornent = new SlideListComponent(); %>
<% ArrayList<String> slideList = slideCompornent.getSlideList(); %>


<% ArrayList tweetList = (ArrayList)request.getAttribute("tweetList"); %>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

       <title>AwareTweet Top</title>

    <link href="../../css/vendor/bootstrap.min.css" rel="stylesheet">
    <link href="../../css/flat-ui.css" rel="stylesheet">
    <link href="../../css/link.css" rel="stylesheet">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
    <script src="../../js/vendor/bootstrap.min.js"></script>
 	<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
   	<script type="text/javascript">
   	$(function() {

   		var replyUsers = [];
   		<%for(int i=0; i<userList.size();i++){%>
   		replyUsers[<%=i%>] = "@"+"<%=userList.get(i)%> " ;
   		<%}%>

   		var slides = [];
   		<%for(int i=0; i<slideList.size();i++){%>
   		slides[<%=i%>] = "#"+"<%=slideList.get(i)%> " ;
   		<%}%>

   		var pages = [];
   		<%for(int i=1; i<=60; i++){ %>
   		pages[<%=i-1%>] = "pp." + "<%=i%>";
   		<%}%>


   		var completeWords = replyUsers.concat(slides);
   		completeWords = completeWords.concat(pages);

   		function split( val ) {
   	      return val.split( / \s*/ );
   	    }
   	    function extractLast( term ) {
   	      return split( term ).pop();
   	    }

   	 $( "#comment" )
     // don't navigate away from the field on tab when selecting an item
     .bind( "keydown", function( event ) {
       if ( event.keyCode === $.ui.keyCode.TAB &&
           $( this ).data( "autocomplete" ).menu.active ) {
         event.preventDefault();
       }
     })
     .autocomplete({
       minLength: 0,
       source: function( request, response ) {
         // delegate back to autocomplete, but extract the last term
         response( $.ui.autocomplete.filter(
        	completeWords, extractLast( request.term ) ) );
       },
       focus: function() {
         // prevent value inserted on focus
         return false;
       },
       select: function( event, ui ) {
         var terms = split( this.value );
         // remove the current input
         terms.pop();
         // add the selected item
         terms.push( ui.item.value );
         // add placeholder to get the comma-and-space at the end
         terms.push( "" )
         this.value = terms.join( " " );
         return false;
       }
     });


     });
     </script>
</head>

  <body style="padding-top:70px">
   <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
     <div class="container">
     <div class="navbar-header">
      <a class="navbar-brand" href="../community/MoveTopServlet">AwareTweet</a>
      </div>

      <ul class="nav navbar-nav navbar-left">
      <li><a href="../community/adduser.jsp"><span class="fui-plus">Regist</span></a></li>
      <li><a href="../community/GetSlideServlet"><span class="fui-play">Slide</span></a>
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
  			<img src="<%=LoginUser.getAvator_path() %>" style="with: 120px; height: 120px;"/>
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

     <div class="col-md-9">
     <form action="../community/TweetServlet" method="post">
      <div class="ui-widget">
      <div class="form-group">
       <label for="comment"></label>
       <textarea name="comment" id="comment" cols="50" rows="3" class="form-control" placeholder="What's happening?" required autofocus></textarea>
      </div>
      </div>
      <div class="col-sm-offset-10 text-center">
       <button type="submit" class="btn btn-info" ><i class="fui-twitter"></i>Tweet</button>
      </div>
     </form>
      <br>

      <div class="panel panel-primary">
       <% for(int i=0; i<tweetList.size(); i++){ %>
       <% Tweet tweet = (Tweet)tweetList.get(i); %>
       <div class="panel-heading"><img src=<%=tweet.getAvator_path() %> style="with: 30px; height: 30px;"/>  <a href="../community/GetUserTweetServlet?id=<%=tweet.getCommenter() %>"><font color="white"><%=tweet.getCommenter()%></font></a></div>
       <div class="panel-body"><p><%=tweet.getComment()%></p></div>
       <div class="panel-footer"><%=tweet.getDate()%></div>
       <%} %>
      </div>

     </div>
    </div>

  </body>
</html>
