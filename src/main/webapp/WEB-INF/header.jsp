<%@page import="cocogames.group.model.Utilisateur"%>
<%
	Utilisateur user = (Utilisateur) session.getAttribute("user");
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-white border-bottom">
	<div class="container">
		<a class="navbar-brand text-dark" href="/user"> <img src="/images/logo_noir.png"
			height="30" class="d-inline-block align-top" alt=""> CocoGames
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
	
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<a class="mr-2 btn btn-primary" href="/allgames" role="button">All games</a>
			<form class="form-inline navbar-nav mr-auto mt-2 mt-lg-0 " action="/allgames" method="get">
				<input class="form-control mr-sm-2" type="search" name="search"
					placeholder="Search a game..." aria-label="Search">
			</form>
			<span class="navbar-text my-2 my-lg-0 text-dark">
				Signed in as <%=user.getPseudo()%>
				<a href="/logout" class="ml-1 text-info">Sign out</a>
			</span>
	
		</div>
	</div>
</nav>
