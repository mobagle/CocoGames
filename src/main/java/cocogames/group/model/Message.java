package cocogames.group.model;

import java.util.Date;

import org.joda.time.*;

import java.io.Serializable;

import com.googlecode.objectify.annotation.*;

@Entity
@Cache
public class Message {
	@Id Long id;
	String author;
	Date date;
	String content;
	
	private Message() {}
	
	protected Message(String author, String content) {
		this.author = author;
		this.content = content;
		this.date = new Date();
	}
	
	public String getAuthor() {
		return this.author;
	}
	
	public String getContent() {
		return this.content;
	}
	
	public Date getDate() {
		return this.date;
	}
	
	public String getTimeSinceMessage() {
		
		DateTime then = new DateTime(this.date);
		DateTime now = DateTime.now();
		String time = "il y a ";
		
		int days = Days.daysBetween(then, now).getDays();
		if(days > 0) {
			if(days>=365) {
				int years = days/365;
				time += years + " an";
				if(years>1) time +="s";
			} else if(days>30) {
				int months = days/30;
				time += months + " mois";
			} else if(days>=7) {
				int weeks = days/7;
				time += weeks + " semaine";
				if(weeks>1) time +="s";
			} else {
				time += days + " jour";
				if(days>1) time +="s";
			}
		} else {
			int hours = Hours.hoursBetween(then, now).getHours() % 24;
			if(hours > 0) {
				time += hours + " heure";
				if(hours>1) time +="s";
			} else {
				int minutes = Minutes.minutesBetween(then, now).getMinutes() % 60;
				if(minutes > 0) {
					time += minutes + " minute";
					if(minutes>1) time +="s";
				} else {
					time = "à l'instant";
				}
			}
		}	
		return time;
	}

}
