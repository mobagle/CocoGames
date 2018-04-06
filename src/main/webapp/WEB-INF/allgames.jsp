<%@ page import="cocogames.group.model.*" %>
<%@ page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE html>

<html>
<head>
	<%
	List<Jeu> jeux = (List<Jeu>) request.getAttribute("games");
	%>
<title>Les jeux</title>
<meta charset="utf-8" />
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>

<body class="bg-light">
	<div class="container">
	<h1><%=jeux.size() %> jeux</h1>
	<%
		for(Jeu j: jeux) {
	%>
	<h2>
		<strong><a href='/game?name=<%=j.getNom()%>'><%=j.getNom()%></a></strong>
	</h2>
	<p>
		annee:<%=j.getAnnee()%><br />
		genre:<%=j.getGenre()%><br /> 
		studio:<%=j.getStudio()%><br />
	</p>
	<%
		}
	%>
</div>
</body>
</html>