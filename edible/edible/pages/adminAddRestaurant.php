

<?php
		session_start();
			$rname = $uname = $pword = $cpword="";
			$rnameErr = $unameErr = $pwordErr = $cpwordErr = "";
			
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
			// $uname = $_SESSION["username"];
			$_SESSION["username"] = $uname;
			
			if ($_SERVER["REQUEST_METHOD"] == "POST") {
			
			// collect value of input fields
			if (empty($_POST["rname"])){
				$rnameErr = "Restaurant name is required";
			}else{
				$rname = test_input($_POST["rname"]);
			}
			
			if (empty($_POST["uname"])){
				$unameErr = "Username is required";
			}else{
				$uname = test_input($_POST["uname"]);
			}
			
			if (empty($_POST["pword"])){
				$pwordErr = "Password is required";
			}else{
				$pword = test_input($_POST["pword"]);
			}
			
			if (empty($_POST["cpword"])){
				$cpwordErr = "Please confirm password";
			}else if ($_POST["cpword"] != $_POST["pword"]){
				$cpwordErr = "Passwords don't match";
			}
			
			if ($unameErr === "" and $pwordErr === "" and $cpwordErr === ""){//if there are no errors in the input
				if (valid_uname($uname)){//if the username is valid
					$conn -> query ("INSERT INTO restaurants (manager_username, manager_password, name)
					VALUES ('$uname', '$pword', '$rname')");//add the user to the database
					header("location: adminRestaurantList.php");
				}else{
					$unameErr = "Username already exists";
				}
			}
		}

		function valid_uname($cuname){//checks if the given username is already in use
			global $conn;
			$unames = "SELECT manager_username FROM Restaurants WHERE manager_username = '$cuname'";
			$result = $conn->query($unames);
			if ($result->num_rows > 0) return false;
			return true;
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
		<title> </title>
		<link rel="stylesheet" href="../CSS/form.css">
		<link rel="stylesheet" href="fontawesome-free-5.8.1-web/css/all.css">
        <link rel="shortcut icon" type="image/png" href="">

	</head>

	<body>

		

		<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
			<span class="label" >Restaurant name: </span> <span class="error">* <?php echo $rnameErr;?></span>
			<input type="text" name="rname" id = "rName">
			
			
			<span class="label">Manager username:</span> <span class="error">* <?php echo $unameErr;?></span>
			<input type="text" name="uname" id="manUname">
			
			
			<span class="label"> Manager password:</span> <span class="error">* <?php echo $pwordErr;?></span>
			<input type="password" name="pword" id="manpword"> 
			
			
			<span class = "label">Confirm manager password:</span> <span class="error">* <?php echo $cpwordErr;?></span>
			<input type="password" name="cpword" id="cpword">
			
			
			<input type="submit" value = "Add restaurant" class="button">
		</form>

	</body>
</html>