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

import com.googlecode.objectify.ObjectifyService;
import com.googlecode.objectify.cmd.Query;

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
		List<Jeu> jeux = new ArrayList<>();
		if(search != null && !search.equals("")) {
			//Query<Jeu> q = ofy().load().type(Jeu.class);
			//jeux.addAll(q.filter(" >=", search).list());
			//jeux.addAll(q.filter(" <", search + "\ufffd").list());
			jeux = ofy().load().type(Jeu.class)
					.filter("lowercaseName >=", search)
					.filter("lowercaseName <", search + "\ufffd")
					.list();
		} else {
			jeux =  ofy().load().type(Jeu.class).list();
		}
		if(!jeux.isEmpty()) {
			request.setAttribute("games", jeux);
		}
		request.setAttribute("search",search);
	    request.getRequestDispatcher("/WEB-INF/allgames.jsp").forward(request, response);

	  }
	}
