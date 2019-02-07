function submit_picture(){
	document.getElementById("picupload").submit();
}

function edit_food(id){
	window.location.href = "managerEditFood.php?edit="+id;
}
function delete_food(id){
	window.location.href = "managerFoodList.php?delete="+id;
}

function submit_picture(){
	document.getElementById("picupload").submit();
}
function check_error(error, input){
	if(document.getElementById(input).value == ""){
	  document.getElementById(error).textContent = "Field cannot be empty";
	}else{  document.getElementById(error).textContent = "";}
	
	var errors = document.getElementsByClassName("error");
	var cntr = 0;
	var i = 0;
	for (i = 0; i < errors.length; i++){
	  if (errors[i].textContent == "" )cntr++;
	}
	
	if (cntr == errors.length){
	  document.getElementById("butn").disabled = false;
	}else{
	  document.getElementById("butn").disabled = true;
	}
  }