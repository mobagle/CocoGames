package cocogames.group.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.blobstore.*;
import com.googlecode.objectify.ObjectifyService;
import static com.googlecode.objectify.ObjectifyService.ofy;
import com.google.appengine.api.images.*;

import cocogames.group.model.Jeu;
import cocogames.group.model.Utilisateur;

@WebServlet(name = "Add a new game", urlPatterns = { "/newgame" })
public class NewGameServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
		req.getRequestDispatcher("/WEB-INF/newgame.jsp").forward(req, resp);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
        ImagesService imagesService = ImagesServiceFactory.getImagesService();

		Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(req);
		List<BlobKey> blobKeys = blobs.get("uploadedFile");
		
        String urlImage = imagesService.getServingUrl(ServingUrlOptions.Builder.withBlobKey(blobKeys.get(0)));
		String nom = req.getParameter("gameName");
		String annee = req.getParameter("annee");
		String genre = req.getParameter("genre");
		String studio = req.getParameter("studio");
		Jeu jeu = new Jeu(nom, Integer.valueOf(annee), studio, genre);
		jeu.setURLImage(urlImage);
		ofy().save().entity(jeu).now();
	}
}