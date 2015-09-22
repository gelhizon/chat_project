<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		
		$("#submit").on('click', function(){
			
			var username = $("#user").val();
			var password = $("#password").val();
			
			var jsonData = "{\"username\":\""+username+"\",\"password\":\""+password+"\"}";
			
			$.ajax({
				url: '/chat_project/webapi/controller/login',
				type: 'POST',
				dataType: 'json',
				data: jsonData,
				async: false,
				cache: false,
				contentType: 'application/json',
				mimeType: 'application/json',
				success: function(data){
					if(data.message == "Login Success"){
						var url = "chatHome.jsp?user="+data.username;
						$(location).attr("href", url);
						console.log(data);
					}
					else{
						alert("Login Failed!");
					}
				},
				error: function(error){
					console.log("error: " + error);
				}
			});
			
			
			
		});
		
	});

</script>
</head>
<body>
<center>

<h2>Please Login to continue...</h2><br>

Username: <input type="text" name="user" id="user" />
<br>
Password: &nbsp<input type="password" name="password" id="password" />
<br>
<input type="submit" id="submit" value="Login" />

</center>
</body>
</html>