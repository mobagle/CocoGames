package cocogames.group.controller;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.googlecode.objectify.ObjectifyService;

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
		
		
		List<Jeu> jeux =  ofy().load().type(Jeu.class).list();
		if(jeux != null && !jeux.isEmpty()) {
	    request.setAttribute("games", jeux);
	    request.getRequestDispatcher("/WEB-INF/allgames.jsp").forward(request, response);
		} else  {
			response.getWriter().print("Impossible de r�cup�rer les jeux.");
		}
	  }
	}
