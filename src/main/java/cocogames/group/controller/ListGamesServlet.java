package cocogames.group.controller;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.googlecode.objectify.Key;
import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.cmd.Query;

import cocogames.group.model.Forum;
import cocogames.group.model.Jeu;
import cocogames.group.model.Utilisateur;

@WebServlet(
	    name = "All Games",
	    urlPatterns = {"/allgames"}
	)
	public class ListGamesServlet extends HttpServlet {

	  @Override
	  public void doGet(HttpServletRequest request, HttpServletResponse response) 
	      throws IOException, ServletException {
		String search = request.getParameter("search");
		Utilisateur user = (Utilisateur) request.getSession().getAttribute("user");
		List<Jeu> jeux = new ArrayList<>();
		if(search != null && !search.equals("")) {
			jeux = ofy().load().type(Jeu.class)
					.filter("lowercaseName >=", search)
					.filter("lowercaseName <", search + "\ufffd")
					.list();
		} else {
			jeux =  ofy().load().type(Jeu.class).list();
		}
		if(!jeux.isEmpty()) {
			List<Integer> nbMessages = new ArrayList<>();
			List<Boolean> followed = new ArrayList<>();
			for(Jeu j : jeux) {
				int size = 0;
				if(j.getKeyForum() != null) {
					Forum forum = ofy().load().key(j.getKeyForum()).now();
					if(forum != null && forum.getMessages()!=null) size = forum.getMessages().size();
				} 
				nbMessages.add(size);
				if(user.getMesjeux().contains(Key.create(Jeu.class,j.getNom()))) {
					followed.add(true);
				} else {
					followed.add(false);
				}
			}
			request.setAttribute("games", jeux);
			request.setAttribute("followed", followed);
			request.setAttribute("nbMessages", nbMessages);
		}
		request.setAttribute("search",search);
	    request.getRequestDispatcher("/WEB-INF/allgames.jsp").forward(request, response);

	  }
	}
