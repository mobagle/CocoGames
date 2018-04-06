<%@ page import="cocogames.group.model.*"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<!DOCTYPE html>

<html>
<head>
<%
	Jeu j = (Jeu) request.getAttribute("game");
	Utilisateur me = (Utilisateur) session.getAttribute("user");
	boolean followed = (Boolean) request.getAttribute("followed");
%>
<title><%=j.getNom()%></title>
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

		<h1><%=j.getNom()%></h1>
		<h2>
			<strong><%=j.getAnnee()%></strong>
		</h2>
		<%
			if (j.getURLImage() != null) {
		%>
		<p>
			<img src="<%=j.getURLImage()%>" alt="<%=j.getNom()%>"
				style="width: 300px; height: 300px;">
		</p>
		<%
			}
		%>
		<h2>Infos:</h2>
		<p>

			genre:
			<%=j.getGenre()%><br /> studio:
			<%=j.getStudio()%><br />
		</p>

		<form action="/game" method="post">
			<p>
				<input type="hidden" name="gameName" value="<%=j.getNom()%>" />
				<%
					if (followed) {
				%>
				<input type="submit" name="action" value="unfollow" />
				<%
					} else {
				%>
				<input type="submit" name="action" value="follow" />
				<%
					}
				%>
			</p>

			<p>
				<label>Votre message :<br /> <textarea name="content"
						style="width: 200px; height: 100px;"></textarea></label>
			</p>
			<p>
				<input type="submit" name="action" value="envoyer" />
			</p>
		</form>


		<%
			Forum forum = (Forum) request.getAttribute("forum");
			if (forum != null) {
				List<Message> messages = forum.getMessages();
				if (messages != null && !messages.isEmpty()) {
		%>
		<h1>Forum :</h1>
		<%
		ListIterator<Message> iter = messages.listIterator(messages.size());

		while (iter.hasPrevious()) {
			Message message = iter.previous();
		%>

		<p>
			<strong><%=message.getAuthor()%></strong>, 
			<%=message.getTimeSinceMessage()%><br />
			<%=message.getContent()%>
		</p>
		<%
					}
				}
			}
		%>
	</div>
</body>
</html>