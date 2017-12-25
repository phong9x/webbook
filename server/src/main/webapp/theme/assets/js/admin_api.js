function post_report_history(id){
	var url = root_url+"api/post_report_history";
	console.log("+++++++");
	$.ajax({
			type: "GET",
			url: url,
			data: {id:id},
			success: function(data)
			{
				
				if(data.code == 0){
					$("#popup_post_report_history").html("<img src='"+root_url+"theme/assets/img/bookmark.png' alt='bookmark' style='vertical-align: text-bottom;' class='wb-mr20'/>");
					setTimeout(function(){
				  		$('#popup_post_report_history').modal('show');
				  	}, 200);
				}else if(data.code == 2){
					$("#bookmark").html("1");
				} 
			}
		});
}

function report_history(id,type){
	var url = root_url+"api/report_history";
	
	$.ajax({
			type: "GET",
			url: url,
			data: {id:id,type:type},
			success: function(response)
			{
				if(response.code == 0){
					var html = "";
					for (var i = 0; i < response.data.length; i++) {
						 	html +="<tr>";
		    			    html +="<td>"+response.data[i].title+"</td>";
		    			    html +="<td>"+response.data[i].introduce+"</td>";
		    			    html +="<td>"+response.data[i].dayOfWeek+"</td>";
		    				html +="</tr>";
					}
					$("#content_history").html(html);
					setTimeout(function(){
				  		$('#popupReportHistoryList').modal('show');
				  	}, 1);
				}else if(response.data.code == 2){
					$("#content_history").html(html);
					setTimeout(function(){
				  		$('#popup_post_report_history').modal('show');
				  	}, 1);
				} 
			}
		});
}

function book_info(id){
	var url = root_url+"api/book_info";
	$.ajax({ 
			type: "GET",
			url: url,
			data: {id:id},
			success: function(response)
			{
				if(response.code == 0){
					var html = "";
					for (var i = 0; i < response.data.length; i++) {
							
						 	html +="<tr>";
		    			    html +="<td>"+response.data[i].title+"</td>";
		    			    html +="<td>"+response.data[i].episodeNumber+"화 </td>";
		    			    html +="<td>"+response.data[i].ageGroupName+"</td>";
		    				html +="</tr>";
					}
					$("#content_book").html(html);
					setTimeout(function(){
				  		$('#popupBookInfoList').modal('show');
				  	}, 1);
				}else if(response.data.code == 2){
					$("#content_book").html(html);
					setTimeout(function(){
				  		$('#popupBookInfoList').modal('show');
				  	}, 1);
				} 
			}
		});
}
function viewbook(id){
	var url = root_url+"api/viewbook";
	$.ajax({ 
			type: "GET",
			url: url,
			data: {id:id},
			success: function(response)
			{
				if(response.code == 0){
					var html = "";
					for (var i = 0; i < response.data.length; i++) {
							
						 	html +="<tr>";
		    			    html +="<td>"+response.data[i].title+"</td>";
		    			    html +="<td>"+response.data[i].episodeNumber+"화 </td>";
		    			    html +="<td>"+response.data[i].ageGroupName+"</td>";
		    				html +="</tr>";
					}
					$("#content_bookview").html(html);
					setTimeout(function(){
				  		$('#BookViewing').modal('show');
				  	}, 1);
				}else if(response.data.code == 2){
					$("#content_bookview").html(html);
					setTimeout(function(){
				  		$('#BookViewing').modal('show');
				  	}, 1);
				} 
			}
		});
}

function interestbook(id){
	var url = root_url+"api/interestbook";
	$.ajax({ 
			type: "GET",
			url: url,
			data: {id:id},
			success: function(response)
			{
				if(response.code == 0){
					var html = "";
					for (var i = 0; i < response.data.length; i++) {
							
						 	html +="<tr>";
		    			    html +="<td>"+response.data[i].title+"</td>";
		    			    html +="<td>"+response.data[i].episodeNumber+"화 </td>";
		    			    html +="<td>"+response.data[i].ageGroupName+"</td>";
		    				html +="</tr>";
					}
					$("#content_interested").html(html);
					setTimeout(function(){
				  		$('#InterestedBook').modal('show');
				  	}, 1);
				}else if(response.data.code == 2){
					$("#content_interested").html(html);
					setTimeout(function(){
				  		$('#InterestedBook').modal('show');
				  	}, 1);
				} 
			}
		});
}
function reset_password(id){
	var url = root_url+"api/user/reset_password";
	$.ajax({
			type: "GET",
			url: url,
			data: {id:id},
			success: function(data)
			{
				if(data.code == 0){
				  		$('#popup_send_password_success').modal('show');
				}else if(data.code == 2 || data.code == 1){
						$('#popup_send_password_not_success').modal('show');
				} 
			}
		});
}


