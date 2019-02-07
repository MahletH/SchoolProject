function goto_restaurant(id){
    window.location.href = "userFoodList.php?id="+id;
}


function order_food(id){
	var amount = document.getElementById("amount").value;
	if (amount <= 0){
		alert("Number of orders must be greater than 0");
		return;
	} 
	var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			alert("Order added!");
        }
        
    };
    xmlhttp.open("GET", "userOrdersList.php?q="+id+"&amnt="+amount, true);
    xmlhttp.send();
}

function submit_picture(){
	document.getElementById("picupload").submit();
}