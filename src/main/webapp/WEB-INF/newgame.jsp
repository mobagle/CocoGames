<%@ page import="com.google.appengine.api.blobstore.*"%>

<%
	BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
%>

<!DOCTYPE html>

<html>
<head>
<title>New game</title>
<meta charset="utf-8" />
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>

<body class="bg-light">
	<div class="container">
	<h1>Ajouter un jeu</h1>
	
	<%
	String state = (String) request.getAttribute("state");
	if (state != null) {
		if(state.equals("error")) {
		%>
		<div class="alert alert-danger mb-2" role="alert"><%=state %></div>
		<%
		} else if(state.equals("success")) {
		%>
		<div class="alert alert-info mb-2" role="alert"><%=state %></div>
		<%	
		}
	}
	%>
	
	<form action="<%=blobstoreService.createUploadUrl("/newgame")%>"
		method="post" enctype="multipart/form-data">
		<p>
			<label>Nom du jeu associé : <input type="text"
				name="gameName" /></label>
		</p>
		<p>
			<label>Logo du jeu : <input type="file" name="uploadedFile" multiple/></label>
		</p>
		<p>
			<label>Image de gameplay du jeu : <input type="file" name="uploadedFile" multiple/></label>
		</p>
		<p>
			<input type="submit" />
		</p>
	</form>
	</div>
</body>
</html>