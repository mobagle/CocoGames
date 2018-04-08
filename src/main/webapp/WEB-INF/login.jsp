<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@page import="java.util.Map"%>

<!DOCTYPE html>

<html>
<head>
<title>Connexion</title>
<meta charset="utf-8" />
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="https://getbootstrap.com/docs/4.0/examples/sign-in/signin.css" rel="stylesheet">
</head>
<body class="text-center bg-light">
		<form class="form-signin" action="/login" method="post">
		<img class="mb-3" src="/images/logo_rond.png" alt="" width="100" height="100">
	      	  <h1 class="h3 mb-3 font-weight-normal">CocoGames</h1>
	      	  
   	  		<%
				String error = (String) request.getAttribute("error");
				if (error != null) {
					%>
					<div class="alert alert-danger mb-2" role="alert"><%=error %></div>
					<%
				}
			%>
	      	  
	        <label for="inputEmail" class="sr-only">Username</label>
			<input type="text" name="username" class="form-control mb-2" placeholder="Username" required="" autofocus="">
			<label for="inputPassword" class="sr-only">Password</label>
			<input type="password" name="password" class="form-control mb-4" placeholder="Password" required="">
	
			<button class="btn btn-lg btn-primary btn-block mb-1" type="submit">Sign in</button>
      		<p class="text-muted">New to CocoGames ? <a href='/signup'>Create an account</a></p>
		</form>
		
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