	
		<?php
			session_start();
			
			echo"
			<header>        
				<h1>Foods</h1>
				<nav class=\"nav-bar\">
					<ul>
						<li><a href=\"managerEditRestaurant.php\" >Edit Restaurant</a></li>
						<li><a href=\"managerPendingOrders.php\" >Orders</a></li>
						<li><a href=\"managerFoodList.php\" >Foods</a></li>
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
			
			if (isset($_REQUEST["delete"])){
				$sql = "delete from food where id = '$_REQUEST[delete]'";
				$conn->query($sql);
			}
		
			$uname = $_SESSION["username"];
			
			$data = "SELECT * FROM restaurants where manager_username = '$uname'";
			$result = $conn->query($data);
			
			while($restaurants = $result->fetch_assoc()) {
				$_SESSION["restaurant"] = $restaurants["id"];
			echo "<div class = \"details\">
				<img src = \"$restaurants[picture]\" alt=\"\" style=\"display=block\"> 
				<div class = \"name\"> $restaurants[name] </div>
				<div class = \"about\"> $restaurants[about] </div>
				<div class = \"spec\"> $restaurants[specialities]</div>
				<div class = \"addr\">$restaurants[address] </div>
				
				<button type = \"button\" class= \"button\" id=\"edit\" onclick = \"window.location.href = 'managerEditRestaurant.php'\" > Edit </button>
			</div>";
			}

			$data = "SELECT * FROM food where restaurant_id = '$_SESSION[restaurant]'";
			$result = $conn->query($data);
			
		
			while($food = $result->fetch_assoc()) {
			echo "<section class=\"food\">
				<article><img src=\"$food[picture]\" alt=\"\"> </article>
				<aside> 
				<div class=\"name left\"> Name: $food[name] </div>
				<div class=\"ing left\">Ingredients: $food[ingredients] </div>
				<div class=\"price left\">Price: $food[price] birr </div>
				<div class=\"prep left\">Preparation time: $food[preparation_time] </div>
				</aside>
				<div><button type = \"button\" class= \"button\" onclick = \"edit_food($food[id])\" > Edit </button>
				<button type = \"button\" class= \"button\" onclick = \"delete_food($food[id])\" > Delete </button></div>
			</section>";
			}
			echo "<div class=\"manager_actions\"> <button class = \"button\" onclick=\"window.location.href = 'managerAddFood.php?'\"> Add food </button>
					<button class = \"button\" onclick=\"window.location.href = 'managerPendingOrders.php?'\"> View orders </button> </div>"; 
			
			
			if (!file_exists("../WebData/$uname")){
				mkdir("../WebData/$uname");
			}
			if (!file_exists("../WebData/$uname/foods")){
				mkdir("../WebData/$uname/foods");
			}
		?>

<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="../fontawesome-free-5.8.1-web/css/all.css">
		<link rel="stylesheet" href="../CSS/list.css">
		<title> edibl </title>
		<script type="text/javascript" src="../JavaScript/manager.js"> </script>
	</head>

	<body>

	
	</body>



</html>


