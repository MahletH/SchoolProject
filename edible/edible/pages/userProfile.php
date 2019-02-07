
		<?php
			session_start();
			echo"
			<header>        
				<h1>Profile</h1>
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
			if ($uname == ""){header("location: userRestaurantList.php");}

			$data = "SELECT * FROM users WHERE username = '$uname'";
			$result = $conn->query($data);
			$user = $result->fetch_assoc();


				
			
			
			$pic = $user["picture"];

			if ($pic == ""){
				$pic = "default.jpg";
			}
			
			if (!file_exists("../WebData/$uname")){
				mkdir("../WebData/$uname");
			}

			echo "
			<div class=\"image\"> 
				<img src= \"$pic\" style=\"height:300px;\">

			</div>";

			echo "
			<div class=\"detail_form userProfile\">
				<div class=\"right\">
					<b>Name: </b> <div class=\"label_block\">$user[first_name] $user[last_name]</div> <br>
					<b>Userame: </b> <div class=\"label_block\">$user[username]</div> <br>
					<b>Address: </b><div class=\"label_block\"> 
					$user[street] - 
					$user[city], $user[country]</div> 
				</div>

			</div>";

			echo "
			<hr>
			<h1>	ORDERS	</h1> ";

			$data = "SELECT * FROM orders where user_id = '$uname' order by id desc";
			$result = $conn->query($data);
			
			while($orders = $result->fetch_assoc()) {
				$order_food = $orders["food_id"];
				$order_time = $orders["time_of_order"];
				$order_number = $orders["number_of_orders"];
				$order_status = $orders["status"];
				$order_id = $orders["id"];
				display_order($order_food, $order_time, $order_number, $order_status, $order_id);
			}
			
			function display_order($food, $time, $number, $status, $order_id){
				global $conn;
				
				$data = "SELECT * FROM food where id = '$food'";
				$result = $conn->query($data);
				$food = $result->fetch_assoc();
				if($status == ""){$status = "Pending";}
				echo "<div class=\"orders user_orders\">
				<section>
				<article>
					<img src=\"$food[picture]\">
				</article>

				<aside>
					<div class = \"name\">Food: $food[name] </div>
					<div class = \"time\">Order time: $time </div>
					<div class = \"number\">Number: $number </div>
					<div class = \"status\">Status: $status </div>
				</aside>
				</section>
			</div>";
			}

			echo"
			<button type=\"button\" class=\"edit_button button\" onclick=\"window.location.href = 'userEditProfile.php'\">Edit account</button>";
		?>
		
		
<html>

	<head>
	<meta charset="UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1">
			<link rel="stylesheet" href="../fontawesome-free-5.8.1-web/css/all.css">
			<title> edibl</title>
			<link rel="stylesheet" href="../CSS/form.css">
			<link rel="stylesheet" href="../CSS/list.css">

	</head>

	<body>


	
	</body>
</html>