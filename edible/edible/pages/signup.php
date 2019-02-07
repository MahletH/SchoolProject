
<?php

session_start();

$first_name = $last_name = $username = $password = $confirm_password = "";

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

if (isset($_REQUEST['q'])){
	echo valid_uname($_REQUEST['q']);
	exit;
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
	
    // collect value of input fields
    $first_name = test_input($_POST["fname"]);
	$last_name = test_input($_POST["lname"]);
	$username = test_input($_POST["uname"]);
	$password = test_input($_POST["pword"]);
	$country = test_input($_POST["cntry"]);
	$city = test_input($_POST["city"]);
	$street = test_input($_POST["street"]);
	
	$sql = "INSERT INTO Users (first_name, last_name, username, password, country, city, street)
    VALUES ('$first_name', '$last_name', '$username', '$password', '$country', '$city', '$street')";
    if($conn -> query ($sql) === false){
        echo $conn -> error;
    }//add the user to the database
    $_SESSION["username"] = $username;
    header("location: userRestaurantList.php");
}



function valid_uname($cuname){//checks if the given username is already in use
	global $conn;
  $unames = "SELECT username FROM Users WHERE username = '$cuname'";
  $result = $conn->query($unames);
  if ($result->num_rows > 0) {return 0;}
  $unames = "SELECT manager_username FROM restaurants WHERE manager_username = '$cuname'";
  $result = $conn->query($unames);
  if ($result->num_rows > 0) {return 0;}
  return 1;
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
	<link rel="stylesheet" href="../CSS/signup.css">
	<script type="text/javascript" src="../JavaScript/signup.js"></script>


</head>

<body>



<div>
<form method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">


	<span class="label">First Name: <span>
	<span class="error" id = "fnameErr">* </span>
	<input type="text" name="fname" oninput="check_error('fnameErr', 'fname')" id = "fname">
	
	<span class="label">Last Name: <span>
	<span class="error" id = "lnameErr">* </span>
	<input type="text" name="lname" oninput="check_error('lnameErr', 'lname')" id = "lname">
	
	<span class="label">Username: <span>
	<span class="error" id = "unameErr">* </span>
	<input type="text" name="uname" oninput="check_error('unameErr', 'uname')" id = "uname">
	
  	<span class="label">Password:</span>
	<span class="error" id = "pwordErr">* </span>
   	<input type="password" name="pword" oninput="check_error('pwordErr', 'pword')" id = "pword">
	
  	<span class="label">Confirm Password:</span>
	<span class="error" id = "cpwordErr">* </span>
	<input type="password" name="cpword" oninput="check_error('cpwordErr', 'cpword')" id = "cpword">
	
	<span class="label">Country: </span>
	<span class="error" id = "cntryErr">* </span>
	<input type="text" name="cntry" oninput="check_error('cntryErr', 'cntry')" id = "cntry">
	
	<span class="label">City: </span>
	<span class="error" id = "cityErr">* </span>
	<input type="text" name="city" oninput="check_error('cityErr', 'city')" id = "city">
	
	<span class="label">Street: </span>
	<span class="error" id = "streetErr">* </span>
	<input type="text" name="street" oninput="check_error('streetErr', 'street')" id = "street">

	<input type="submit" class="button" value = "Sign Up" id = "signup" disabled = "true">
  
	<a class="button default" onclick="window.location.href='../default.php'">Already have an account?</a>

</form>

</div>


</body>
</html>


