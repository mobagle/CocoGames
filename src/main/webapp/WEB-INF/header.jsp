<%@page import="cocogames.group.model.Utilisateur"%>
<%
	Utilisateur user = (Utilisateur) session.getAttribute("user");
%>
<nav class="navbar navbar-expand-lg navbar-dark bg-white border-bottom">
	<div class="container">
		<a class="navbar-brand text-dark" href="/user"> <img src="/images/logo_noir.png"
			height="30" class="d-inline-block align-top" alt=""> CocoGames
		</a>
		<button class="navbar-toggler bg-primary" type="button" data-toggle="collapse"
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
