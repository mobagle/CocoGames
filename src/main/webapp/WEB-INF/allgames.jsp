<%@ page import="cocogames.group.model.*" %>
<%@ page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE html>

<html>
<head>

<title>Les jeux</title>
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
	<%
	List<Jeu> games = (List<Jeu>) request.getAttribute("games");
	String search = (String) request.getAttribute("search");
	%>
	
	<p class="mb-2 mt-2 text-dark">
		<%=games != null ? games.size() : 0 %> games found
		<% if(search!= null && !search.equals("")) {
			%> for "<%=search%>"<%
			}
		%>
	</p>
		
	<%@include file="listgame.jsp" %>
	</div>
</body>
</html>