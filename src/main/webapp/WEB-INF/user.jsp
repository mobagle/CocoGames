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
		<h1><%=u.getPseudo()%></h1>
		<h2>
			<strong><%=u.getMail()%></strong> - rank:
			<%=u.getRang()%>
		</h2>
		<h2>Mes jeux:</h2>
		<%
			List<Jeu> jeux = (List<Jeu>) request.getAttribute("games");
			if(jeux != null && !jeux.isEmpty()) {
				for (Jeu jeu : jeux) {
		%>
		<p>
			<strong><a href='/game?name=<%=jeu.getNom()%>'><%=jeu.getNom()%></a></strong><br />
			<%=jeu.getAnnee()%><br /> genre:
			<%=jeu.getGenre()%><br /> studio:
			<%=jeu.getStudio()%><br />
		</p>
		<%
				}
			}
		%>
		<p>
			<a href='/allgames'>Ajouter des jeux</a>
		</p>
	</div>

</body>
</html>