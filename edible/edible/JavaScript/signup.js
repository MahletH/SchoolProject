function check_error(error, input){
	if(document.getElementById(input).value == ""){
		document.getElementById(error).textContent = "Field cannot be empty";
	}else if (input == "cpword"){
		if (document.getElementById(input).value != document.getElementById("pword").value){
			document.getElementById(error).textContent = "Passwords must match";
		}else{
			document.getElementById(error).textContent = "";
		}
	}else if (input == "uname"){
		var str = document.getElementById(input).value;
		var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                var x = (xmlhttp.responseText);
				if (x == 1){
					document.getElementById(error).textContent = "";
				}else{
					document.getElementById(error).textContent = "Username already in use";
				}
            }
        };
        xmlhttp.open("GET", "../pages/signup.php?q="+str, true);
        xmlhttp.send(); 	
	}else{
		document.getElementById(error).textContent = "";
	}
	
	var errors = document.getElementsByClassName("error");
	var cntr = 0;
	var i = 0;
	for (i = 0; i < errors.length; i++){
		if (errors[i].textContent == "" )cntr++;
	}
	
	if (cntr == errors.length){
		document.getElementById("signup").disabled = false;
	}else{
		document.getElementById("signup").disabled = true;
	}
}