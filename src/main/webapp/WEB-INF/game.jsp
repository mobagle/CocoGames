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
		<div class="row mt-3 mb-3">
			<div class="col-md-auto">
				<%
					if (j.getURLLogo() != null) {
				%>
				<p>
					<img src="<%=j.getURLLogo()%>" height="280" width="280" class="rounded float-center img-thumbnail" alt="<%=j.getNom()%>">
				</p>
				<%
					}
				%>
			</div>
			<div class="col-md-auto">
				<h2 class="mt-2 mb-2"><strong><%=j.getNom()%></strong></h2>
				<h3><%=j.getStudio()%></h3>
				<h3><%=j.getAnnee()%></h3>
				<h3><%=j.getGenre()%></h3>

				<form action="/game" method="post">
					<p>
						<input type="hidden" name="gameName" value="<%=j.getNom()%>" />
						<%
							if (followed) {
						%>
						<button type="submit" name="action" class="btn btn-danger" value="unfollow">Unfollow</button>
						<%
							} else {
						%>
						<button type="submit" name="action" class="btn btn-success" value="follow">Follow</button>
						<%
							}
						%>
					</p>
				</form>
			</div>
		</div>
			
		<%
			if(followed) {

				Forum forum = (Forum) request.getAttribute("forum");
				if (forum != null) {
					List<Message> messages = forum.getMessages();
					if (messages != null && !messages.isEmpty()) {
						ListIterator<Message> iter = messages.listIterator(messages.size());
				
						while (iter.hasPrevious()) {
							Message message = iter.previous();
		%>
							<div class="row border bg-white rounded m-2 pt-1">
								<div class="col-md-2">
									<p>
										<strong><%=message.getAuthor()%></strong><br />
										<%=message.getTimeSinceMessage()%>
									</p>
								</div>
								<div class="col-md-10">
									<p>
										<%=message.getContent()%>
									</p>
								</div>
							</div>
		<%
						}
						
						%>
						<form action="/game" method="post">
						<input type="hidden" name="gameName" value="<%=j.getNom()%>" />
						<div class="row mt-2 mb-2">
							<div class="col-md-11">
								<input class="form-control" type="text" name="content" placeholder="Type your message here...">
							</div>
							<div class="col-md-1">
								<button type="submit" name="action" class="btn btn-info float-center" value="send">Send</button>
							</div>
						</div>
						</form>
					<%
					}
				}
			}
		%>
		</form>
		
		
	</div>
</body>
</html>