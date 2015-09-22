package org.project.chat.chat_project;

import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.project.chat.models.Accounts;
import org.project.chat.models.Messages;
import org.project.chat.service.Service;

@Path("/controller")
public class Controller {
	
	Service service = new Service();
	
	@POST
	@Path("/login")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Accounts login(Accounts account){
		System.out.println(service.login(account.getUsername(), account.getPassword()));
		account.setMessage(service.login(account.getUsername(), account.getPassword()));
		return account;
	}
	
	@POST
	@Path("/send")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Messages send(Messages message){
		service.sendMessage(message.getMessage(), message.getFrom(), message.getTo());
		return message;
	}
	
	@POST
	@Path("/getMessage")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public List<Messages> getMessage(Messages message){
		
		return service.getMessage(message.getFrom());
	}
	
	@POST
	@Path("/test")
	@Produces(MediaType.APPLICATION_JSON)
	@Consumes(MediaType.APPLICATION_JSON)
	public Messages test(Messages message){
		return service.getLatestMessage(message.getTimeReceived(), message.getFrom());
	}
	
}
