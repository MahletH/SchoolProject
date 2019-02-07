
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
		$restaurant_id = $_REQUEST["id"];
		
		if (isset($_REQUEST['q'])){
			$food_id =  $_REQUEST['q'];
			date_default_timezone_set("Africa/Addis_Ababa");
			$time = date("h:i:s");
			$amount = $_REQUEST['amnt'];
			$sql = "insert into orders (food_id, user_id, number_of_orders, time_of_order)
					values ('$food_id', '$uname', $amount, '$time')";
			$conn -> query($sql);
			exit;
		}

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
		
		$data = "SELECT * FROM food where restaurant_id = '$restaurant_id'";
		$result = $conn->query($data);
		
		while($food = $result->fetch_assoc()) {
		echo "
		<div class=\"user_food\">
			<section>
				<article>
					<img src=\"$food[picture]\">
				</article>
				<aside>		
					<div class=\"name\">$food[name] </div>
					<div class=\"ing\">Ingredients: $food[ingredients] </div>
					<div class=\"price\">Price: $food[price] Birr </div>
					<div class=\"prep\">Prep time: $food[preparation_time] </div>
					
					<div class=\"amount\">Order Amount: <input type=\"number\" name=\"amount\" id = \"amount\" value = 1></div>
				</aside>
			</section>
			<button type='button' class=\"button\" onclick = 'order_food($food[id])'>Order</button>
			
		</div>";
		}
		echo "
		
		
		<button type='button' class = \"button\" onclick = \"window.location.href = 'userOrdersList.php'\"> View All Orders </button>";
		
	?>


<html>
    <head>

        <meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="../fontawesome-free-5.8.1-web/css/all.css">
		<link rel="stylesheet" href="../CSS/list.css">
		<script src="../JavaScript/user.js"> </script>
    </head>
	<body>
	

	</body>
</html>



