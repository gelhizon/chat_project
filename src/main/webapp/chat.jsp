<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var id = $("#ids").val();
		
		setInterval(function(){
			$("#chat").load("chat.jsp");
		},2000);
		
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
</script>
</head>
<body>
<textarea rows="5" cols="20" id="messageRe" readonly></textarea>
</body>
</html>