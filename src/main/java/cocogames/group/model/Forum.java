package cocogames.group.model;

import java.util.ArrayList;

import com.googlecode.objectify.annotation.*;

@Entity
@Cache
public class Forum {
	@Id String id;
	private ArrayList<Message> forum;

	private Forum() {
	}

	public Forum(String id) {
		this.id = id;
		forum = new ArrayList<>();
	}

	public void newForumMessage(String author, String content) {
		if(this.forum == null) {
			this.forum = new ArrayList<>(); 
		}
		this.forum.add(new Message(author, content));
	}

	public ArrayList<Message> getMessages() {
		return this.forum;
	}
}
