<%--
  Created by IntelliJ IDEA.
  User: floriangurtler
  Date: 19.03.20
  Time: 14:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>The Guestbook</title>
  </head>
  <body>
  <h1>The Guestbook</h1>
  <p>Please leave a comment</p>
  <form method="post" action="./book">
  <div>
    <label for="name">Your Name:</label>
    <input id="name" name="name" required="required"/>
  </div>
  <div>
    <label for="comment">Your Comment:</label>
    <textarea id="comment" name="comment" cols="50" rows="8" required="required"></textarea>
  </div>
  <button type="submit">Save</button>
  </form>
  </body>
</html>
