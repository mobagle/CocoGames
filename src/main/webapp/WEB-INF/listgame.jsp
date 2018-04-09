<%@ page import="cocogames.group.model.*" %>
<%@ page import="java.util.List"%>
<%
List<Jeu> jeux = (List<Jeu>) request.getAttribute("games");
	if(jeux != null) {
%>
<div class="row">
<div class="col-6">
<%
		for(int i = 0; i<jeux.size();i++) {
			Jeu j = jeux.get(i);
			if(i%2==0) {
%>


<div class="row mb-4 pt-3 pb-3 mr-1 bg-white border rounded">
	<div class="col-md-auto">
		<a href='/game?name=<%=j.getNom()%>'>
		<img src="<%=j.getURLLogo()%>" class="rounded float-center img-thumbnail" alt="<%=j.getNom()%>"
					style="width: 150px; height: 150px;">
		</a>
	</div>
	<div class="col-md-auto">
		<h3 class="mt-2">
			<a href='/game?name=<%=j.getNom()%>' class="text-dark"><%=j.getNom()%></a>
		</h3>
		<p>
			<%=j.getStudio()%><br />
			<%=j.getAnnee()%><br />
			<%=j.getGenre()%><br /> 
		</p>
	</div>
</div>

<%
			}
		}
%>
</div>
<div class="col-6">
<%
		for(int i = 0; i<jeux.size();i++) {
			Jeu j = jeux.get(i);
			if(i%2==1) {
%>
<div class="row mb-4 pt-3 pb-3 ml-1 bg-white border rounded">
	<div class="col-md-auto">
		<a href='/game?name=<%=j.getNom()%>'>
		<img src="<%=j.getURLLogo()%>" class="rounded float-center img-thumbnail" alt="<%=j.getNom()%>"
					style="width: 150px; height: 150px;">
		</a>
	</div>
	<div class="col-md-auto">
		<h3 class="mt-2">
			<a href='/game?name=<%=j.getNom()%>' class="text-dark"><%=j.getNom()%></a>
		</h3>
		<p>
			<%=j.getStudio()%><br />
			<%=j.getAnnee()%><br />
			<%=j.getGenre()%><br /> 
		</p>
	</div>
</div>
<%
			}
		}
%>
</div>
</div>
<%
	}
%>