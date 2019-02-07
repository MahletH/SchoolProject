
<?php

	session_start();

	$usertype  = "";

	$username = $password = "";
	$unameErr = $pwordErr = "";

	$servername = "localhost";
	$username = "root";
	$password = "";
	
	// Create connection
	$conn = new mysqli($servername, $username, $password);
	
	// Check connection
	if ($conn->connect_error) {
		die("Connection failed: " . $conn->connect_error);
	} 
	
	// Create database
		  $sql = "CREATE DATABASE edible";
		$conn -> query($sql);
		
	  $dbname = "edible";
				
			 
		$conn = new mysqli($servername, $username, $password, $dbname);
	  
	  //the rest of the tables
					$sql = "CREATE TABLE restaurants (
						id INT(9) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
						name VARCHAR(30) NOT NULL,
						about VARCHAR(300),
						specialities VARCHAR(100),
						address VARCHAR(50),
						manager_username varchar(40) not null,
						manager_password varchar(20) not null,
						picture varchar(255)

						)";
					$conn -> query($sql);
									
	
					$sql = "CREATE TABLE users (
						first_name VARCHAR(30) NOT NULL,
						last_name VARCHAR(30) NOT NULL,
						username VARCHAR(40) NOT NULL PRIMARY KEY,
						password VARCHAR(20) NOT NULL,
						country varchar(74) not null,
						city varchar(85) not null,
						street varchar(50) NOT NULL,
						picture varchar(255)
						)";
						  $conn -> query($sql);

	
					$sql = "CREATE TABLE food (
						id INT(9) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
						name VARCHAR(30) NOT NULL,
						ingredients VARCHAR(30) NOT NULL,
						restaurant_id VARCHAR(100) NOT NULL,
						price VARCHAR(7) NOT NULL,
						preparation_time time,
						picture varchar(255) NOT NULL,
						foreign key fk_rest(restaurant_id) references restaurants(id) ON DELETE CASCADE ON UPDATE CASCADE
						)";
						  $conn -> query($sql);

	
					$sql = "CREATE TABLE orders (
						id INT(9) UNSIGNED AUTO_INCREMENT PRIMARY KEY, 
						food_id INT(9) NOT NULL,
						user_id VARCHAR(40) NOT NULL,
						time_of_order time,
						status VARCHAR(7),
						number_of_orders INT(50) not null,
						foreign key fk_food(food_id) references food(id) ON DELETE CASCADE ON UPDATE CASCADE,
						foreign key fk_user(user_id) references users(id) ON DELETE CASCADE ON UPDATE CASCADE
	
						
						)";
						  $conn -> query($sql);

		
		
		 
	

	if ($_SERVER["REQUEST_METHOD"] == "POST") {
		
		// collect value of input fields
		if (empty($_POST["uname"])){
			$unameErr = "Username is required";
		}else{
			$username = test_input($_POST["uname"]);
		}
		
		if (empty($_POST["pword"])){
			$pwordErr = "Password is required";
		}else{
			$password = test_input($_POST["pword"]);
		}
			
		if ($unameErr === "" and $pwordErr === ""){//if there are no errors in the input
			if (authenticate($username, $password)){//if the username and password are valid
				$_SESSION["username"] = $username;
				if ($usertype === "user"){
						header("location: pages/userRestaurantList.php");
				}else if ($usertype == "manager"){
						header("location: pages/managerFoodList.php");
				}else {
						header("location: pages/adminRestaurantList.php");
				}
				
			}else{
				$unameErr = "Wrong username or password";
				$pwordErr = "";
			}
		}
	}

	function authenticate($cuname, $cpword){//sees if the username and password are correct
		global $conn;
		global $usertype;
		$data = "SELECT username, password FROM Users WHERE username = '$cuname'";
		$result = $conn->query($data);
		if ($result->num_rows > 0) {
			$row = $result->fetch_assoc();
			if ($row["password"] === $cpword) {
			$usertype = "user";
			return true;
			}
		}
		$data = "SELECT manager_username, manager_password FROM restaurants WHERE manager_username = '$cuname'";
		$result = $conn->query($data);
		if ($result->num_rows > 0) {
			$row = $result->fetch_assoc();
			if ($row["manager_password"] === $cpword) {
			$usertype = "manager";
			return true;
			}
		}
		if ($cuname == "admin" && $cpword == "pass"){
			$usertype = "admin";
			return true;
		}
		return false;
	}

	function test_input($data) {
		$data = trim($data);
		$data = stripslashes($data);
		$data = htmlspecialchars($data);
		return $data;
	}
?>
<html>

	<head>
        <meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="../fontawesome-free-5.8.1-web/css/all.css">
		<title> edibl </title>
		<link rel="stylesheet" href="CSS/signin.css">
		<script src="JavaScript/signin.js"></script>
	</head>

	<body>


		<div class = "form">
			
			<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">

				<span class="label">Username: <span>
				<span class="error" id = "unameErr">* </span>
				<input type="text" name="uname" oninput="check_error('unameErr', 'uname')" id = "uname">
		
				<span class="label">Password:</span>
				<span class="error" id = "pwordErr">* </span>
				<input type="password" name="pword" oninput="check_error('pwordErr', 'pword')" id = "pword">
					
				<input type="submit" value = "Sign In">
			</form>

			<a class="button" onclick="window.location.href='pages/signup.php'">Create an account</a>
		</div>

		



	</body>
</html>