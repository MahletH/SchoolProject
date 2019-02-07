<?php
		session_start();
			
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
			

				$sql = "delete FROM orders where food_id in (SELECT id FROM food where restaurant_id = '$_REQUEST[delete]')";
				$conn->query($sql);
				$sql = "delete from food where restaurant_id = '$_REQUEST[delete]'";
				$conn->query($sql);
				$sql = "delete from restaurants where id = '$_REQUEST[delete]'";
				$conn->query($sql);

			}
			
			$uname = $_SESSION["username"];
			$data = "SELECT * FROM restaurants";
			$result = $conn->query($data);


			while($restaurants = $result->fetch_assoc()) {
				//add the image, if there's one. 
			echo "<section class=\"restaurant\">
				<article> $restaurants[picture] </article>
				<aside>
				<div class = \"name\">$restaurants[name] </div>
				<button type = \"button\" class= \"button\" onclick = \"window.location.href = 'adminRestaurantList.php?delete=$restaurants[id]'\"> Delete </button>
				<div class = \"about\">$restaurants[about]</div>
				<div class = \"specialities\"> Specilaities: $restaurants[specialities]</div>
				<div class = \"address\">Located: $restaurants[address] </div>
				
				<div class = \"manager\">Manager: $restaurants[manager_username] </div> </aside>
			</section>";
			}
		?>
<html>

	<head>
        <meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="../fontawesome-free-5.8.1-web/css/all.css">
		<title> edibl </title>	
		<link rel="stylesheet" href="../CSS/list.css">
		<script src="../JavaScript/admin.js"> </script>

	</head>

	<body>
		
		


	<button class = "button" onclick="window.location.href = 'adminAddRestaurant.php'" id = "add"> Add restaurant </button>

	</body>
</html>