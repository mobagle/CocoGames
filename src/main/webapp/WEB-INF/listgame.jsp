<%@ page import="cocogames.group.model.*" %>
<%@ page import="java.util.List"%>
<%
List<Jeu> jeux = (List<Jeu>) request.getAttribute("games");
List<Integer> nbMessages = (List<Integer>) request.getAttribute("nbMessages");
List<Boolean> followed = (List<Boolean>) request.getAttribute("followed");
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
	<div class="col-auto">
		<a href='/game?name=<%=j.getNom()%>'>
		<img src="<%=j.getURLLogo()%>" class="rounded float-center img-thumbnail" alt="<%=j.getNom()%>"
					style="width: 150px; height: 150px;">
		</a>
	</div>
	<div class="col-auto">
		<h3>
			<a href='/game?name=<%=j.getNom()%>' class="text-dark"><%=j.getNom()%></a>
		</h3>
		<%if(followed != null || nbMessages != null) {
			if(followed != null) { 
				if(followed.get(i)) {
			%><span class="text-info mr-3"><i class="fa fa-heart"></i> Followed</span><% 
				} else { 
			%><span class="text-secondary mr-3"><i class="fa fa-heart-o"></i> Not followed</span><%
				}
			} if(nbMessages != null) { 
			%><%=nbMessages.get(i) %> <i class="fa fa-comment-o"></i><% 
			} 
		} %>
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
	<div class="col-auto">
		<a href='/game?name=<%=j.getNom()%>'>
		<img src="<%=j.getURLLogo()%>" class="rounded float-center img-thumbnail" alt="<%=j.getNom()%>"
					style="width: 150px; height: 150px;">
		</a>
	</div>
	<div class="col-auto">
		<h3>
			<a href='/game?name=<%=j.getNom()%>' class="text-dark"><%=j.getNom()%></a>
		</h3>
		<%if(followed != null || nbMessages != null) {
			if(followed != null) { 
				if(followed.get(i)) {
			%><span class="text-info mr-3"><i class="fa fa-heart"></i> Followed</span><% 
				} else { 
			%><span class="text-secondary mr-3"><i class="fa fa-heart-o"></i> Not followed</span><%
				}
			} if(nbMessages != null) { 
			%><%=nbMessages.get(i) %> <i class="fa fa-comment-o"></i><% 
			} 
		} %>
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