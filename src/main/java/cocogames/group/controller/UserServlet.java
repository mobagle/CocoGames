package cocogames.group.controller;

import static com.googlecode.objectify.ObjectifyService.ofy;

import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;
import com.googlecode.objectify.ObjectifyService;

import cocogames.group.model.Forum;
import cocogames.group.model.Jeu;
import cocogames.group.model.Utilisateur;

import com.googlecode.objectify.Key;
import com.google.appengine.api.datastore.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// With @WebServlet annotation the webapp/WEB-INF/web.xml is no longer required.
@WebServlet(name = "User", description = "User basic page", urlPatterns = { "/","/user"})
public class UserServlet extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		try {

			Utilisateur user = (Utilisateur) req.getSession().getAttribute("user");
			ArrayList<Jeu> jeuxdecoco = new ArrayList<>();
			if (user.getMesjeux() != null) {
				for (Key<Jeu> cleJeu : user.getMesjeux()) {
					jeuxdecoco.add(ofy().load().key(cleJeu).now());
				}
			}
			ArrayList<Integer> nbMessages = new ArrayList<>();
			for(Jeu j : jeuxdecoco) {
				int size = 0;
				if(j.getKeyForum() != null) {
					Forum forum = ofy().load().key(j.getKeyForum()).now();
					if(forum != null && forum.getMessages()!=null) size = forum.getMessages().size();
				} 
				nbMessages.add(size);
			}
			req.setAttribute("games", jeuxdecoco);
			req.setAttribute("nbMessages", nbMessages);
			this.getServletContext().getRequestDispatcher("/WEB-INF/user.jsp").forward(req, resp);

		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
}