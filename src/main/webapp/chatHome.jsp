<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var id = $("#ids").val();
		
		setInterval(function(){
			console.log(getLatestMessage(new Date(), $("#ids").val()));
			//alert(getLatestMessage(new Date(), $("#ids").val()));
		},1000);
		
		getMessage($("#ids").val());
		
		$("#send").on('click', function() {
			var message = $("#message").val();
			var from = $("#from").val();
			var to = $("#to").val();
			
			var jsonData = "{\"message\":\""+message+"\",\"from\":\""+from+"\",\"to\":\""+to+"\"}";
			
			console.log(jsonData);
			
			$.ajax({
				url: '/chat_project/webapi/controller/send',
				type: 'POST',
				dataType: 'json',
				data: jsonData,
				async: false,
				cache: false,
				contentType: 'application/json',
				mimeType: 'application/json',
				success: function(data){
					alert("Sent!");
					console.log(new Date());
				},
				error: function(error){
					console.log("error: " + error);
				}
			});
			
			
		});
		
		$("#refresh").on('click', function(){
			var url = "chatHome.jsp?user="+id;
			$(location).attr("href", url);
		});
	});
	
	function getMessage(from){
		var jsonData = "{\"from\":\""+from+"\"}";
		
		console.log(jsonData);
		
		$.ajax({
			url: '/chat_project/webapi/controller/getMessage',
			type: 'POST',
			dataType: 'json',
			data: jsonData,
			async: false,
			cache: false,
			contentType: 'application/json',
			mimeType: 'application/json',
			success: function(data){
				$.each(data, function(idx, datares){
					$("#messageRe").append(datares.message + "\n");
				});
			},
			error: function(error){
				console.log("error: " + error);
			}
		});
	}
	
	function getLatestMessage(d, from){
		
		var hr = d.getHours();
		var min = (d.getMinutes() < 10) ? "0"+d.getMinutes() : d.getMinutes();
		var sec = (d.getSeconds() < 10) ? "0"+d.getSeconds() : d.getSeconds();
		var ampm = (d.getHours() < 12 ? "AM" : "PM");
		
		var time = hr + ":" + min + ":" + sec + " " + ampm;
		
		var message;
		
		var jsonData = "{\"timeReceived\":\""+time+"\",\"from\":\""+from+"\"}}";
		console.log(jsonData);
		$.ajax({
			url: '/chat_project/webapi/controller/test',
			type: 'POST',
			dataType: 'json',
			data: jsonData,
			async: false,
			cache: false,
			contentType: 'application/json',
			mimeType: 'application/json',
			success: function(data){
				message = (data.message == null) ? null : data.message;
				if(message !== null){
					$("#messageRe").append(message + "\n");
				}
				
			},
			error: function(error){
				console.log("error: " + error);
			}
		});
		return message;
	}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-4 col-sm-offset-4">
				<input type="hidden" id="ids" value="<%= request.getParameter("user") %>" />
		
				<h3>Welcome <%= request.getParameter("user") %></h3>
				<h3>Chat Message:</h3>
				<div id="chat"><textarea class="form-control" rows="5" cols="20" id="messageRe" readonly></textarea></div>
				<h3>To:</h3>
				<input class="form-control" type="text" id="to" />
				
				<h3>From:</h3>
				<input class="form-control" type="text" id="from" value="<%= request.getParameter("user") %>" />
				
				<h3>Message:</h3>
				<input class="form-control" type="text" id="message" />
				
				<input class="btn btn-primary pull-right" type="submit" value="send" id="send" />
				
				<input class="btn btn-success pull-right" type="submit" value="refresh" id="refresh" />
			</div>
		</div>
	</div>
	
</body>
</html>