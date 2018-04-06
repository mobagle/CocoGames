package cocogames.group.controller;

import static com.googlecode.objectify.ObjectifyService.ofy;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.googlecode.objectify.Key;
import com.googlecode.objectify.ObjectifyService;

import cocogames.group.model.Jeu;
import cocogames.group.model.Utilisateur;

@WebServlet(
	    name = "ObjectifyTest",
	    urlPatterns = {"/objectify"}
	)
	public class ObjectifyTestsServlet extends HttpServlet {

	  @Override
	  public void doGet(HttpServletRequest request, HttpServletResponse response) 
	      throws IOException {
		  
		ArrayList<Jeu> listJeux = new ArrayList<>();
		listJeux.add(new Jeu("FIFA 18", 2017, "EA","sport"));
		listJeux.add(new Jeu("World of Warcraft", 2004, "Blizzard","mmo"));
		listJeux.add(new Jeu("League of Legends", 2009, "Riot Games","moba"));
		listJeux.add(new Jeu("Fortnite", 2017, "Epic Games","battleroyal"));
		listJeux.add(new Jeu("Slay the Spire", 2018, "Mega Crit Games","rogue-like"));
		ofy().save().entities(listJeux).now();
		
		ArrayList<Utilisateur> listUsers = new ArrayList<>();
		Utilisateur coco =new Utilisateur("cocorico", "cocolebg@gmail.com","coco");
		Key<Jeu> keyFifa = Key.create(Jeu.class, "FIFA 18");
		coco.getMesjeux().add(keyFifa);
		Key<Jeu> keyWow = Key.create(Jeu.class, "World of Warcraft");
		coco.getMesjeux().add(keyWow);
		listUsers.add(coco);
		listUsers.add(new Utilisateur("matou", "matou@gmail.com","matou"));
		listUsers.add(new Utilisateur("luluberlu", "lulu@gmail.com","lulu"));
		listUsers.add(new Utilisateur("leavatar", "lealea@gmail.com","lea"));
		ofy().save().entities(listUsers).now();
	      
	    response.setContentType("text/plain");
	    response.setCharacterEncoding("UTF-8");

	    response.getWriter().print("BD remplie !\r\n");

	  }
	}
