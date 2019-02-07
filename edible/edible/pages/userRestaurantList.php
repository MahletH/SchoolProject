<?php
	session_start();
	
	echo"
	<header>        
		<h1>Restaurants</h1>
		<nav class=\"nav-bar\">
			<ul>
				<li><a href=\"userProfile.php\" >Profile</a></li>
				<li><a href=\"userOrdersList.php\" >Orders</a></li>
				<li><a href=\"userRestaurantList.php\" >Restaurants</a></li>
			</ul>
		</nav> 
				
	</header>
	";
	$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "edible";
	
	// Create connection
	$conn = new mysqli($servername, $username, $password, $dbname);

	// Check connection
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	}
	
    $uname = $_SESSION["username"];

    $data = "SELECT * FROM users WHERE username='$uname'";
    $result = $conn->query($data);
    $users = $result->fetch_assoc();

	
    echo 
    "<div class=\"details\">
        <img src = \"$users[picture]\" alt = \"\" style=\"display=block\">
        <div class = \"name\"> $users[first_name] $users[last_name] </div>
        <div class = \"username\"> Username: $users[username] </div>
		<div class = \"addr\">  Address: $users[street] -  $users[city], $users[country]   </div>
            
    </div>";
    

  
	$data = "SELECT * FROM restaurants";
    $result = $conn->query($data);
    
	while($restaurants = $result->fetch_assoc()) {

	echo "
	<div class = \"user_restaurant\">
		<section >
            <article><img src=\"$restaurants[picture]\"> </article>
			<aside><div class = \"name\">$restaurants[name] </div>
			<button class=\"button\" onclick=\"window.location.href = 'userFoodList.php?id=$restaurants[id]'\"> View Foods</button>
            <div class = \"about\">$restaurants[about] </div>
            <div class = \"spec\">Specialities: $restaurants[specialities] </div>
            <div class = \"addr\">Located: $restaurants[address] </div> </aside>
		</section>

	</div>" ;
	}
	
	echo "<button class = \"button\" onclick=\"window.location.href = 'userOrdersList.php'\"> View Orders </button>";
	
	if (!file_exists("../WebData/$uname")){
		mkdir("../WebData/$uname");
	}
?>

<script>
			function order_food(id){
    alert("buto");
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
    xmlhttp.open("GET", "restaurant.php?q="+id+"&amnt="+amount, true);
    xmlhttp.send();
}
</script>
<html>

	<head>
        <meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="../fontawesome-free-5.8.1-web/css/all.css">
		<link rel="stylesheet" href="../CSS/list.css">
		
	</head>

    <body>
    </body>
</html>