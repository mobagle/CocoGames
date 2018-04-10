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
	    name = "ObjectifyTest"
	)
	public class ObjectifyTestsServlet extends HttpServlet {

	  @Override
	  public void doGet(HttpServletRequest request, HttpServletResponse response) 
	      throws IOException {
		  
		ArrayList<Jeu> listJeux = new ArrayList<>();
		
		listJeux.add(new Jeu("FIFA 18", 2017, "Electronic Arts","Sport"));
		listJeux.add(new Jeu("Need for Speed Payback", 2017, "Electronic Arts","Race"));
		listJeux.add(new Jeu("Star Wars : Battlefront II", 2017, "Electronic Arts","FPS"));
		
		listJeux.add(new Jeu("World of Warcraft", 2004, "Blizzard","MMO"));
		listJeux.add(new Jeu("HearthStone", 2014, "Blizzard","Card Game"));
		listJeux.add(new Jeu("StarCraft 2", 2010, "Blizzard","Strategy"));

		listJeux.add(new Jeu("League of Legends", 2009, "Riot Games","MOBA"));
		
		listJeux.add(new Jeu("Fortnite", 2017, "Epic Games","Battleroyal"));
		listJeux.add(new Jeu("Paragon", 2018, "Epic Games","MOBA"));
		
		listJeux.add(new Jeu("Slay the Spire", 2018, "Mega Crit Games","Rogue-like / Card Game"));
		
		ofy().save().entities(listJeux).now();
		
		ArrayList<Utilisateur> listUsers = new ArrayList<>();
		listUsers.add(new Utilisateur("cocorico", "cocolebg@gmail.com","coco","admin"));
		listUsers.add(new Utilisateur("matou", "matou@gmail.com","matou", "admin"));
		listUsers.add(new Utilisateur("luluberlu", "lulu@gmail.com","lulu"));
		listUsers.add(new Utilisateur("leavatar", "lealea@gmail.com","lea"));
		ofy().save().entities(listUsers).now();
	      
	    response.setContentType("text/plain");
	    response.setCharacterEncoding("UTF-8");

	    response.getWriter().print("BD remplie !\r\n");

	  }
	}
