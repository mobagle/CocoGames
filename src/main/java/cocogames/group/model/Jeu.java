package cocogames.group.model;

import java.util.ArrayList;

import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.*;

@Entity
@Cache
public class Jeu {
	@Id
	String id;
	String nom;
	int annee;
	String studio;
	String genre;
	private String urlImage;
	private Key<Forum> keyForum;

	private Jeu() {
	}

	public Jeu(String nom, int annee, String studio, String genre) {
		this.id = nom;
		this.setNom(nom);
		this.setAnnee(annee);
		this.setStudio(studio);
		this.setGenre(genre);
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public int getAnnee() {
		return annee;
	}

	public void setAnnee(int annee) {
		this.annee = annee;
	}

	public String getStudio() {
		return studio;
	}

	public void setStudio(String studio) {
		this.studio = studio;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public String getURLImage() {
		return urlImage;
	}

	public void setURLImage(String urlImage) {
		this.urlImage = urlImage;
	}
	
	public Key<Forum> getKeyForum() {
		return this.keyForum;
	}
	
	public void setKeyForum(Key<Forum> key) {
		this.keyForum = key;
	}
}
