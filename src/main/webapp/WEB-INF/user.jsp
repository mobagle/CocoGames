<%@ page import="cocogames.group.model.*"%>
<%@ page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE html>

<html>
<head>
<%
	Utilisateur u = (Utilisateur) session.getAttribute("user");
%>
<title><%=u.getPseudo()%></title>
<meta charset="utf-8" />
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>

<body class="bg-light">
	<%@include file="header.jsp" %>
	<div class="container">
		<div class="row mt-3 mb-2">
			<div class="col-md-auto">
				<h2>
					<%=u.getPseudo()%>
				</h2>		
			</div>
		</div>
		<div class="row">
			<div class="col-md-auto">
				<p class="text-dark">My followed games</p>			
			</div>
		</div>
		<%@include file="listgame.jsp" %>
	</div>
</body>
</html>