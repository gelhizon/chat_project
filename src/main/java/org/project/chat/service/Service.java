package org.project.chat.service;

import java.util.List;

import org.project.chat.database.Database;
import org.project.chat.models.Messages;

public class Service {
	
	public String login(String username, String password){
		String message = null;
		
		try {
			message = Database.login(username, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return message;
	}
	
	public String sendMessage(String message, String sender_id, String receiver_id){
		try{
			Database.insert(message, Database.getId(sender_id), Database.getId(receiver_id));
			System.out.println(Database.getId(sender_id) + " " + Database.getId(receiver_id));
			return "Sent!";
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	public List<Messages> getMessage(String receiver_id){
		try {
			System.out.println(Database.getId(receiver_id));
			return Database.getMessage(Database.getId(receiver_id));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
}
