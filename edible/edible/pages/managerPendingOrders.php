
<?php
	session_start();
	
	echo"
	<header>        
		<h1>Pending Orders</h1>
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
	
	$uname = $_SESSION["username"];
	$rname = $_SESSION["restaurant"];
	
	// Create connection
	$conn = new mysqli($servername, $username, $password, $dbname);

	// Check connection
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	} 
	
	if (isset($_REQUEST["accept"])){
		$accept_id = $_REQUEST['accept'];
		$sql = "UPDATE orders SET status = 'Started' where id = '$accept_id'";
        $conn->query($sql);
        header("location: managerPendingOrders.php");
	}
	
	if (isset($_REQUEST["done"])){
		$done_id = $_REQUEST['done'];
		$sql = "UPDATE orders SET status = 'Done' where id = '$done_id'";
		$conn->query($sql);
        header("location: managerPendingOrders.php");
    }
	
	if (isset($_REQUEST["deny"])){
		$deny_id = $_REQUEST['deny'];
		$sql = "UPDATE orders SET status = 'Denied' where id = '$deny_id'";
		$conn->query($sql);
        header("location: managerPendingOrders.php");
    }
	
	$uname = $_SESSION["username"];
	$resid = $_SESSION["restaurant"];
	
	$data = "SELECT * FROM orders where food_id in (SELECT id FROM food where restaurant_id = '$resid') order by id desc";
	$result = $conn->query($data);
	
	while($orders = $result->fetch_assoc()) {
		$order_user = $orders["user_id"];
		$order_food = $orders["food_id"];
		$order_time = $orders["time_of_order"];
		$order_number = $orders["number_of_orders"];
		$order_status = $orders["status"];
		$order_id = $orders["id"];
		display_order($order_user, $order_food, $order_time, $order_number, $order_status, $order_id);
	}
	
	$cntr = 0;
	function display_order($user, $food, $time, $number, $status, $order_id){
		global $conn;
		global $cntr;

		$data = "SELECT * FROM users where username = '$user'";
		$result = $conn->query($data);
		$user = $result->fetch_assoc();
		
		$data = "SELECT * FROM food where id = '$food'";
		$result = $conn->query($data);
		$food = $result->fetch_assoc();

		if($cntr<1){
			$cntr+=1;
			$data ="SELECT * FROM restaurants where id = '$food[restaurant_id]'";
			$result = $conn->query($data);
			$restaurants = $result->fetch_assoc();
			
			echo "<div class = \"details\">
				<img src = \"$restaurants[picture]\" alt=\"\" style=\"display=block\"> 
				<div class= \"name\"> Restaurant name: $restaurants[name] </div>
				<div class=\"about\"> About: $restaurants[about] </div>
				<div class= \"spec\"> Specialities: $restaurants[specialities]</div>
				<div class=\"addr\"> Address: $restaurants[address] </div>
				</div>
			";
		
		}


		echo "<section class=\"orders\">
				<article><img src=\"$food[picture]\" alt=\"\"> </article>
				<aside> 
				<div class=\"name\"> User: $user[first_name] $user[last_name] </div> 
				<div class=\"foodName\">Food: $food[name] </div>
				<div class=\"ordertime\">Order time: $time </div>
				<div class=\"number\">Number: $number </div>
				<div class=\"status\">Status: $status </div>
				</aside>
			</section>";

	if ($status == "pending"){
		echo "<div><button type = \"button\" class= \"button\" onclick = \"window.location.href = 'managerPendingOrders.php?accept=$order_id'\" > Accept </button> 
		<button type = \"button\" class= \"button\" onclick = \"window.location.href = 'managerPendingOrders.php?deny=$order_id'\" > Deny </button> </div>";
	} else if ($status == "Started"){
		echo "<div><button type = \"button\" class= \"button\" onclick = \"window.location.href = 'managerPendingOrders.php?done=$order_id'\" > Done </button> </div>";
	}
	
	}
	
?>
<html>
    <head>
        <meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="../fontawesome-free-5.8.1-web/css/all.css">
		<link rel="stylesheet" href="../CSS/list.css">
		<title> edibl </title>
        <script type="text/javascript" src = "../JavaScript/manager.js"></script>

    </head>
<body>
	<header>        

</body>

</html>
