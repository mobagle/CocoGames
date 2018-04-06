package cocogames.group.model;

import java.io.Serializable;
import java.util.ArrayList;

import com.googlecode.objectify.Key;
import com.googlecode.objectify.annotation.*;

@Entity
@Cache
@Index // Active l'indexation par d�faut
public class Utilisateur implements Serializable{
    @Id String id; // Sera indexe (les ID sont toujours indexes)
    @Unindex String pseudo; // Ne sera pas indexe
	String mail;
	String rang;
	String password;
	private ArrayList<Key<Jeu>> mesjeux;
	
	private Utilisateur() {} // Obligatoire pour Objectify
	
	public Utilisateur(String pseudo, String mail, String password) {
		this.id = pseudo;
		this.setPseudo(pseudo);
		this.setMail(mail);
		this.setRang("novice");
		this.password = password;
		this.setMesjeux(new ArrayList<>());
	}

	public String getPseudo() {
		return pseudo;
	}

	public void setPseudo(String pseudo) {
		this.pseudo = pseudo;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getRang() {
		return rang;
	}

	public void setRang(String rang) {
		this.rang = rang;
	}

	public ArrayList<Key<Jeu>> getMesjeux() {
		return mesjeux;
	}

	public void setMesjeux(ArrayList<Key<Jeu>> mesjeux) {
		this.mesjeux = mesjeux;
	}
	
	public boolean isPassword(String password) {
		return this.password.equals(password);
	}
	
	public boolean isAdmin() {
		return this.rang.equals("admin");
	}

}
