<%@ page import="at.fhj.ima.guestbook.GuestBookManager" %>
<%@ page import="at.fhj.ima.guestbook.GuestBookEntry" %><%--
  Created by IntelliJ IDEA.
  User: floriangurtler
  Date: 19.03.20
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>The Guestbook</title>
</head>
<body>
<%
    GuestBookManager bookCtx = (GuestBookManager) request.getServletContext().getAttribute("book");
    GuestBookManager bookSession = (GuestBookManager) request.getSession(true).getAttribute("book");
%>
<h1>The Guestbook</h1>
<p>These are the messages from our visitors</p>

<h2>ServletContext Book</h2>
<%
    if (bookCtx == null || bookCtx.isEmpty()) {%>
<p>Sorry, but there are no entries yet</p>
<%
    } else {
        for (GuestBookEntry entry : bookCtx.getEntries()) { %>
            <div>
                <table>
                    <tr>
                        <td>Name: </td>
                        <td><%=entry.getName() %></td>
                    </tr>
                    <tr>
                        <td>Comment: </td>
                        <td><%=entry.getComment()%></td>
                    </tr>
                    <tr>
                        <td>Created Time: </td>
                        <td><%=entry.getAddedAt()%></td>
                    </tr>
                </table>
            </div>
<%
        }
    }
%>

<h2>SessionContext Book</h2>
<%
    if (bookSession == null || bookSession.isEmpty()) {%>
<p>Sorry, but there are no entries yet</p>
<%
} else {
    for (GuestBookEntry entry : bookSession.getEntries()) { %>
<div>
    <table>
        <tr>
            <td>Name: </td>
            <td><%=entry.getName() %></td>
        </tr>
        <tr>
            <td>Comment: </td>
            <td><%=entry.getComment()%></td>
        </tr>
        <tr>
            <td>Created Time: </td>
            <td><%=entry.getAddedAt()%></td>
        </tr>
    </table>
</div>
<%
        }
    }
%>
<a href="index.jsp">Back</a>
</body>
</html>
