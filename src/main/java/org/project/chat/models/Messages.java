package org.project.chat.models;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Messages {
	
	private String message;
	private long senderId;
	private long receiverId;
	private long id;
	private String from;
	private String to;
	private String dateReceived;
	private String timeReceived;
	
	public String getDateReceived() {
		return dateReceived;
	}
	public void setDateReceived(String dateReceived) {
		this.dateReceived = dateReceived;
	}
	public String getTimeReceived() {
		return timeReceived;
	}
	public void setTimeReceived(String timeReceived) {
		this.timeReceived = timeReceived;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public long getSenderId() {
		return senderId;
	}
	public void setSenderId(long senderId) {
		this.senderId = senderId;
	}
	public long getReceiverId() {
		return receiverId;
	}
	public void setReceiverId(long receiverId) {
		this.receiverId = receiverId;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
}
