package org.project.chat.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.project.chat.models.Messages;

public class Database {
	
	private static Connection conn = null;
	
	public static void connect(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Success!");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chat_test", "root", "");
			System.out.println("Successfully connected!");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void close(){
		try {
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static String login(String username, String password) throws Exception{
		
		connect();
		
		String message = null;
		
		String sql = "select count(*) as count from users where username=? and password=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setString(1, username);
		stmt.setString(2, password);
		
		ResultSet rs = stmt.executeQuery();
		
		int count = 0;
		
		if(rs.next()){
			count = rs.getInt("count");
		}
		
		if(count == 0){
			message = "Failed";
		}else{
			message = "Login Success";
		}
		
		close();
		
		return message;
	}
	
	public static void insert(String message, long sender_id, long receiver_id) throws Exception{
		connect();
		
		String sql = "insert into message (sender_id, receiver_id, message) values (?,?,?)";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setLong(1, sender_id);
		stmt.setLong(2, receiver_id);
		stmt.setString(3, message);
		
		stmt.executeUpdate();
		
		close();
	}
	
	public static List<Messages> getMessage(long receiver_id) throws Exception{
		List<Messages> messages = new ArrayList<Messages>();
		
		connect();
		
		String sql = "select message as message from message where receiver_id=?";
		
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setLong(1, receiver_id);
		ResultSet rs = stmt.executeQuery();
		
		while(rs.next()){
			Messages message = new Messages();
			message.setMessage(rs.getString("message"));
			System.out.println(message.getMessage());
			messages.add(message);
		}
		
		close();
		
		return messages;
	}
	
	public static long getId(String username) throws Exception{
		long id = 0;
		
		connect();
		
		String sql = "select id as userId from users where username=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		
		stmt.setString(1, username);
		
		ResultSet rs = stmt.executeQuery();
		
		if(rs.next()){
			id = rs.getInt("userId");
		}
		
		close();
		
		return id;
	}
	
}
