//@prepros-prepend modules/*.js
//@prepros-prepend user-modules/*.js
function checkNickname(){
	var url = root_url+"api/user/check_nickname";
	var nickname = $("#nickname").val();
	console.log(root_url)
	if(nickname.length >= 3 && nickname.length <=20){
		$.ajax({
			type: "GET",
			url: url,
			data: {nickname:$("#nickname").val()},
			success: function(data)
			{
				if(data.code == 0){
					document.getElementById('check_nickname').value = '1';
					window.trams.popup.open('#popupNicknameOk');
					
				}else if(data.code == 2){
					document.getElementById('check_nickname').value = '0';
					window.trams.popup.open('#popupNicknameExistedError');
				} else{
					
				}
			}
		});
	}
}

function checkUsername(){
	var url = root_url+"api/user/check_username";
	var username = $("#username").val();
	console.log(root_url)
	if(username.length >= 6 && username.length <= 12){
		$.ajax({
			type: "GET",
			url: url,
			data: {username:username},
			success: function(data)
			{
				if(data.code == 0){
					document.getElementById('check_username').value = '1';
					
					window.trams.popup.open('#popupUsernameOk');
				}else if(data.code == 2){
					document.getElementById('check_nickname').value = '0';
					
					window.trams.popup.open('#popupUsernameExistedError');
				} else{
					
				}
			}
		});
	}
}

function checkAllFormation(){
	var check2= document.getElementById('check_nickname').value;
	var pass1 = document.getElementById("password1").value;
    var pass2 = document.getElementById("password2").value;
    
	if(check2 == '0'){
		window.trams.popup.open('#popupOverlap');
	}else if( pass1 != pass2){
		window.trams.popup.open('#popupPassword_NotMatch');
	}else if(pass1==pass2 && pass1.length<6){
		window.trams.popup.open('#popupPassword_Length');
	}else if(pass1==pass2 && pass1.length>=6){
		$("#form_signup").submit();
	}
	
	
	
};

function changeNickname(){
	 document.getElementById("check_nickname").value='0';
	
};

function checkAllFormation_MyInfo(){
	var check2= document.getElementById('check_nickname').value;
	var pass1 = document.getElementById("password1").value;
    var pass2 = document.getElementById("password2").value;
    
	if( check2 == '0'){
		window.trams.popup.open('#popupOverlap');
	}else {
		if( pass1 != pass2  ){
			window.trams.popup.open('#popupPassword_NotMatch');
		}else if(pass1==pass2 && pass1.length>0 && pass1.length<6){
			window.trams.popup.open('#popupPassword_Length');
		}else{
			$("#form_signup").submit();
		}
	}
	
};

function changeNickname_MyInfo(){
	 var nicknamename=document.getElementById("nickname").value;
	 var old_nickname=document.getElementById("old_nickname").value;
	 console.log(nicknamename);
	 console.log(old_nickname);
	 if(nicknamename==old_nickname){
		 console.log(1)
		 document.getElementById("href_check_username").setAttribute('onclick','');
		 document.getElementById("check_nickname").value='1';
	 }else{
		 console.log(2)
		 document.getElementById("href_check_username").setAttribute('onclick','checkNickname()');
		 document.getElementById("check_nickname").value='0';
	 }
	
	
};