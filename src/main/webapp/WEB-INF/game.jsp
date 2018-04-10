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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body class="bg-light">
	<%@include file="header.jsp" %>
	<div class="container">
		<div class="row mt-4 mb-4 pb-4 border-bottom">
			
			<div class="col-3 center-block">
				<%
					if (j.getURLLogo() != null) {
				%>
					<img src="<%=j.getURLLogo()%>" height="280" width="280" class="rounded float-center img-thumbnail" alt="<%=j.getNom()%>">				
				<%
					}
				%>
			</div>
		
			<div class="col-9">
				<div class="row mb-2 pb-1 border-bottom">
					<div class="col">
						<h2 class="text-dark mt-4"><%=j.getNom()%></h2>
					</div>
					<div class="col">
						<form action="/game" method="post">
							<p>
								<input type="hidden" name="gameName" value="<%=j.getNom()%>" />
								<%
									if (followed) {
								%>
								<button type="submit" name="action" class="btn btn-danger float-right" value="unfollow"><i class="fa fa-remove"></i> Unfollow</button>
								<%
									} else {
								%>
								<button type="submit" name="action" class="btn btn-success float-right" value="follow"><i class="fa fa-plus"></i> Follow</button>
								<%
									}
								%>
							</p>
						</form>
					</div>
				</div>
				<h4 class="mb-2 text-dark"><%=j.getStudio()%></h4>
				<h4 class="mb-2 text-dark"><%=j.getAnnee()%></h4>
				<h4 class="mb-2 text-dark"><%=j.getGenre()%></h4>
				
				<!-- Button trigger modal -->
				<button type="button" class="btn" data-toggle="modal" data-target="#gameplayModal">
				 	<i class="fa fa-image"></i> Gameplay
				</button>
				
				<!-- Modal -->
				<div class="modal fade" id="gameplayModal" tabindex="-1" role="dialog" aria-labelledby="gameplayModalCenterTitle" aria-hidden="true">
				  <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="gameplayModalLongTitle"><%=j.getNom() %></h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				        <img alt="" src="<%=j.getURLGameplay()%>=s0" style="width:100%;height:auto;">
				      </div>
				    </div>
				  </div>
				</div>
			</div>
		</div>
		
		<%
			if(followed) {
				Forum forum = (Forum) request.getAttribute("forum");
				int size = 0;
				if(forum != null && forum.getMessages()!=null) {
					size = forum.getMessages().size();
				}
				 
		%>
		
		<div class="row">
			<div class="col-3 pl-4">
				<h3 class="text-dark">Forum</h3>
				<% if(size>0) { %>
				<h5 class="text-dark"><%=size %> message<%=size>1?"s":"" %></h5>
				<h5 class="text-dark">started <%=forum.getMessages().get(0).getTimeSinceMessage() %></h5>
				<% } %>
			</div>
			<div class="col-9">
			
		<%
				if (forum != null) {
					List<Message> messages = forum.getMessages();
					if (messages != null && !messages.isEmpty()) {
						ListIterator<Message> iter = messages.listIterator(messages.size());
						while (iter.hasPrevious()) {
							Message message = iter.previous();
		%>
				<div class="row border bg-white m-2 mb-3 pt-1">
					<div class="col-md-2 border-right">
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
					}
				} else {
		%>
				<p class="text-dark"><i>No message yet... be the first !</i></p>
		<%
				}
		%>
				<form action="/game" method="post">
					<input type="hidden" name="gameName" value="<%=j.getNom()%>" />
					<div class="row mb-2 mt-4">
						<div class="col-10 ml-2">
							<input class="form-control" type="text" name="content" placeholder="Type your message here...">
						</div>
						<div class="col-auto">
							<button type="submit" name="action" class="btn btn-primary float-right" value="send">Send</button>
						</div>
					</div>
					<div class="row">
						<br />
						<br />
						<br />
						<br />
						<br />
					</div>
				</form>
			</div>
		</div>
	<% 
		} else {
	%>
		<div class="row">
			<div class="col-12">
				<h5 class="mt-5 text-center text-dark">Follow <%=j.getNom() %> to join the forum</h5>
			</div>
		</div>
	<%
		}
	%>
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>