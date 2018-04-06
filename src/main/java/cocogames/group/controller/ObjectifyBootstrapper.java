package cocogames.group.controller;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.googlecode.objectify.ObjectifyService;

import cocogames.group.model.Forum;
import cocogames.group.model.Jeu;
import cocogames.group.model.Message;
import cocogames.group.model.Utilisateur;

public class ObjectifyBootstrapper implements ServletContextListener {
	public void contextInitialized(ServletContextEvent event) {
		ObjectifyService.init();
        ObjectifyService.register(Jeu.class);
        ObjectifyService.register(Utilisateur.class);
        ObjectifyService.register(Forum.class);
        ObjectifyService.register(Message.class);
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		
	}
}
