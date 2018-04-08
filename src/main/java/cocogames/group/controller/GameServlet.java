package cocogames.group.controller;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.googlecode.objectify.Key;
import com.googlecode.objectify.ObjectifyService;

import cocogames.group.model.Forum;
import cocogames.group.model.Jeu;
import cocogames.group.model.Utilisateur;

@WebServlet(name = "GamePage", urlPatterns = { "/game" })
public class GameServlet extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		
		Utilisateur user = (Utilisateur) request.getSession().getAttribute("user");
		String name = (String) request.getParameter("name");
		boolean followed = followedGame(user, name);
		Jeu jeu = ofy().load().type(Jeu.class).id(name).now();
		if (jeu != null) {
			request.setAttribute("game", jeu);
			request.setAttribute("followed", followed);
			Forum forum = ofy().load().type(Forum.class).id(name).now();
			if(followed && forum!=null) { 
			request.setAttribute("forum", forum);
			}
			if(jeu.getKeyForum()==null) {
				jeu.setKeyForum(Key.create(Forum.class,name));
				ofy().save().entity(jeu);
			}
			request.getRequestDispatcher("/WEB-INF/game.jsp").forward(request, response);
		} else {
			response.getWriter().print("We have no informations on '" + name + "'.");
		}
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		Utilisateur user = (Utilisateur) request.getSession().getAttribute("user");
		String name = (String) request.getParameter("gameName");
		String action = (String) request.getParameter("action");
		action = action.toLowerCase();
		if(action.equals("follow") || action.equals("unfollow")) {
			followPost(request, response, user, name, action);
		} else if (action.equals("send")) {
			messagePost(request, response, user, name);
		}
		response.sendRedirect("/game?name="+name);
	}
	
	private void messagePost(HttpServletRequest request, HttpServletResponse response, Utilisateur user, String name) {
		Forum forum = ofy().load().type(Forum.class).id(name).now();
		boolean updateJeuForumKey = false;
		if(forum == null) { 
			updateJeuForumKey = true;
			forum = new Forum(name);
		}
		String content = (String) request.getParameter("content");
		forum.newForumMessage(user.getPseudo(), content);
		ofy().save().entity(forum).now();
		if( updateJeuForumKey) {
			Jeu jeu = ofy().load().type(Jeu.class).id(name).now();
			Key<Forum> key = Key.create(Forum.class,name);
			jeu.setKeyForum(key);
			ofy().save().entity(jeu).now();
		}
	}

	private void followPost(HttpServletRequest request, HttpServletResponse response, Utilisateur user, String name, String action) throws IOException, ServletException {
		Key<Jeu> key = Key.create(Jeu.class, name);
		if(action.equals("follow")) {
			if(user.getMesjeux() == null) {
				user.setMesjeux(new ArrayList<>());
			}
			user.getMesjeux().add(key);
		} else if(action.equals("unfollow")) {
			user.getMesjeux().remove(key);
		}
		ofy().save().entity(user).now();
		request.getSession().setAttribute("user", user);
	}
	
	public boolean followedGame(Utilisateur user, String name) {
		Key<Jeu> key = Key.create(Jeu.class, name);
		if(user.getMesjeux() != null && !user.getMesjeux().isEmpty() && user.getMesjeux().contains(key)) return true;
		else return false;
	}

}
