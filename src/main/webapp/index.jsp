<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
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

	<div class="container">
		<div class="row">
			<div class="col-sm-4 col-sm-offset-4">
				<h2 class="text-center">Please Login to continue...</h2><br>
				
				<input class="form-control" type="text" name="user" id="user" placeholder="Username"/>
	
				<input class="form-control" type="password" name="password" id="password" placeholder="Password"/>
				
				<input class="btn btn-primary center-block text-center" type="submit" id="submit" value="Login" />
			</div>
		</div>
	</div>
	
</body>
</html>