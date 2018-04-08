<%@page import="cocogames.group.model.Utilisateur"%>
<%
	Utilisateur user = (Utilisateur) session.getAttribute("user");
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container">
		<a class="navbar-brand" href="/user"> <img src="/images/logo_blanc.png"
			height="30" class="d-inline-block align-top" alt=""> CocoGames
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
	
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<form class="form-inline navbar-nav mr-auto mt-2 mt-lg-0 " action="/allgames" method="get">
				<input class="form-control mr-sm-2" type="search" name="search"
					placeholder="Search a game..." aria-label="Search">
			</form>
			<span class="navbar-text my-2 my-lg-0">
				Signed in as <%=user.getPseudo()%>
				<a href="/logout">Sign out</a>
			</span>
	
		</div>
	</div>
</nav>
