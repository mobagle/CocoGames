package cocogames.group.controller;

import static com.googlecode.objectify.ObjectifyService.ofy;

import com.googlecode.objectify.ObjectifyService;

import cocogames.group.model.Jeu;
import cocogames.group.model.Utilisateur;

import com.googlecode.objectify.Key;
import com.google.appengine.api.datastore.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// With @WebServlet annotation the webapp/WEB-INF/web.xml is no longer required.
@WebServlet(name = "Login", description = "User login", urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Map<String, String> messages = new HashMap<String, String>();
		request.setAttribute("messages", messages);
		request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String error = "";

		Utilisateur user = ofy().load().type(Utilisateur.class).id(username).now();
		if (user != null) {
			if(user.isPassword(password)) {
			request.getSession().setAttribute("user", user);
			response.sendRedirect(request.getContextPath() + "/user");
			return;
			} else {
				error = "Wrong password.";
			}
		} else {
			error = "Unknown username, please try again.";
		}

		request.setAttribute("error", error);
		request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
	}

}