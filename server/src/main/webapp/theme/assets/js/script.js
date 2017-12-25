function edit_comment(id){
	$("#comment_content_id_"+id).hide();
	$("#comment_tool_"+id).hide();
	$("#edit_comment_id_"+id).val($("#comment_content_id_"+id).text());
	$("#edit_comment_id_"+id).show();
	$("#edit_tool_"+id).show();
}
function cancel_edit_comment(id){
	$("#comment_content_id_"+id).show();
	$("#comment_tool_"+id).show();
	$("#edit_comment_id_"+id).hide();
	$("#edit_tool_"+id).hide();
}

function display_comment(id,content){
	  var str = String(unescape(content))
    .replace(/&/g, '&amp;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#39;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;');
	
	$("#comment_content_id_"+id).html(str);
}
var entityMap = {
	    "&": "&amp;",
	    "<": "&lt;",
	    ">": "&gt;",
	    '"': '&quot;',
	    "'": '&#39;',
	    "/": '&#x2F;'
	  };

	  function escapeHtml(string) {
	    return String(string).replace(/[&<>"'\/]/g, function (s) {
	      return entityMap[s];
	    });
	  }
	  
	  
function save_comment(id){
	var url = api+"/edit_comment";
	
	var edit_comment = $("#edit_comment_id_"+id).val();
	if(edit_comment.trim() != null){
		
		var json = '{"edit_id":"'+id+'","comment":"'+escapeHtml(edit_comment)+'"}'
		
		$.ajax({
			type: "POST",
			url: url,
			contentType : 'application/json',
			dataType: 'json',
			data: json, // serializes the form's elements.
			
			success: function(response)
			{
				if(response.code == 1){
					display_comment(id,escape(edit_comment))
					cancel_edit_comment(id)
				}else{
					
				}
			}
		});
	}
}