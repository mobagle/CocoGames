package cocogames.group.model;

import java.util.ArrayList;

import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.*;

@Entity
@Cache
public class Jeu {
	@Id
	String id;
	@Index String nom;
	@Index String lowercaseName;
	@Index int annee;
	@Index String studio;
	@Index String genre;
	private String urlLogo;
	private String urlGameplay;
	private Key<Forum> keyForum;

	private Jeu() {
	}

	public Jeu(String nom, int annee, String studio, String genre) {
		this.id = nom;
		this.setNom(nom);
		this.setLowercaseName(nom.toLowerCase());
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

	public String getURLLogo() {
		return urlLogo;
	}

	public void setURLLogo(String urlLogo) {
		this.urlLogo = urlLogo;
	}
	
	public String getURLGameplay() {
		return urlGameplay;
	}

	public void setURLGameplay(String urlGameplay) {
		this.urlGameplay = urlGameplay;
	}
	
	public Key<Forum> getKeyForum() {
		return this.keyForum;
	}
	
	public void setKeyForum(Key<Forum> key) {
		this.keyForum = key;
	}

	String getLowercaseName() {
		return lowercaseName;
	}

	void setLowercaseName(String lowercaseName) {
		this.lowercaseName = lowercaseName;
	}
}
