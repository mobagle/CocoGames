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

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// With @WebServlet annotation the webapp/WEB-INF/web.xml is no longer required.
@WebServlet(name = "Signup", description = "User Signup", urlPatterns = { "/signup" })
public class SignupServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("error", null);
		request.getRequestDispatcher("/WEB-INF/signup.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String mail = request.getParameter("mail");
		Map<String, String> messages = new HashMap<String, String>();

		if (pseudoUnavailable(username)) {
			messages.put("username", "This username is already in use. Please choose another one.");
		}

		if (messages.isEmpty()) {
			Utilisateur user  = new Utilisateur(username, mail, password);
			ofy().save().entity(user).now();
			Utilisateur registredUser = ofy().load().type(Utilisateur.class).id(username).now();
			request.getSession().setAttribute("user", registredUser);
			response.sendRedirect(request.getContextPath() + "/user");
		}
		request.setAttribute("messages", messages);
		request.getRequestDispatcher("/WEB-INF/signup.jsp").forward(request, response);

	}

	private boolean pseudoUnavailable(String pseudo) {
		Utilisateur exist = ofy().load().type(Utilisateur.class).id(pseudo).now();
		return (exist != null);
	}

	private boolean validEmailAddress(String email) {
		boolean result = true;
		try {
			InternetAddress emailAddr = new InternetAddress(email);
			emailAddr.validate();
		} catch (AddressException ex) {
			result = false;
		}
		return result;
	}

}