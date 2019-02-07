
      
<?php
	session_start();
	
	$unameErr = $pwordErr = $cpwordErr = "";
	
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
	if ($uname == ""){header("location: ../default.php");}
	$data = "SELECT * FROM Users WHERE username = '$uname'";
	$result = $conn->query($data);
	$userinfo = $result->fetch_assoc();
	
	$fname = $userinfo["first_name"];
	$lname = $userinfo["last_name"];
	$pword = $userinfo["password"];
	$cntry = $userinfo["country"];
	$cty = $userinfo["city"];
	$strt = $userinfo["street"];
	
	$pic = $userinfo["picture"];
	if ($pic == ""){
		$pic = "../pictures/default.jpg";
	}
	
	
	if (isset ($_POST['details'])){
		// collect value of input fields
    	
	if (empty($_POST["fname"]) === false){
		$first_name = test_input($_POST["fname"]);
	}
	if (empty($_POST["lname"]) === false){
		$last_name = test_input($_POST["lname"]);
	}
	if (empty($_POST["cntry"]) === false){
		$country = test_input($_POST["cntry"]);	
	}
	if (empty($_POST["city"]) === false){
		$city = test_input($_POST["city"]);
	}
	if (empty($_POST["street"]) === false){
		$street = test_input($_POST["street"]);
	}
	
	if (empty($_POST["pword"])){
		$pwordErr = "Password is required";
	}else{
		$password = test_input($_POST["pword"]);
	}
	
	if (empty($_POST["cpword"])){
		$cpwordErr = "Please confirm password";
	}else if ($_POST["cpword"] != $_POST["pword"]){
		$cpwordErr = "Passwords don't match";
	}
	
	if ($pwordErr === "" and $cpwordErr === ""){//if there are no errors in the input
		$fname = $first_name;
		$lname = $last_name;
		$pword = $password;
		$cntry = $country;
		$cty = $city;
		$strt = $street;
		$sql = "UPDATE Users SET first_name ='$fname', last_name ='$lname', password = '$pword', country = '$cntry', city = '$city', street = '$strt'
				WHERE username='$uname'";//update database
		
		$conn -> query ($sql);
	}
}else if($_SERVER["REQUEST_METHOD"] == "POST"){
	$target_dir = "../WebData/$uname/";
$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
$uploadOk = 1;
$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
	$check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
    if($check !== false) {
        $uploadOk = 1;
    } else {
        echo "File is not an image.";
        $uploadOk = 0;
    }
	
	if (file_exists($target_file)) {
    echo "Sorry, file already exists.";
    $uploadOk = 0;
}
// Allow certain file formats
if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg"
	&& $imageFileType != "gif" ) {
    echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
    $uploadOk = 0;
}
// Check if $uploadOk is set to 0 by an error
if ($uploadOk == 0) {
    echo "Sorry, your file was not uploaded.";
// if everything is ok, try to upload file
} else {
    if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
		
		$data = "SELECT picture FROM Users WHERE username = '$uname'";
		$result = $conn->query($data);
		$userinfo = $result->fetch_assoc();
		$oldpic = $userinfo["picture"];	
		if ($oldpic != ""){unlink($oldpic);}
		
		$sql = "UPDATE Users SET picture = '$target_file'
				WHERE username='$uname'";//update database
		
		$conn -> query ($sql);
		
		header("location: userProfile.php");
		
    } else {
        echo "Sorry, there was an error uploading your file.";
    }
}
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
		<link rel="stylesheet" href="../CSS/form.css">
		<title> edible </title>
        <script type="text/javascript" src = "../JavaScript/user.js"></script>

    </head>

    <body>
  
	<header>        
		<h1>Edit Profile</h1>
		<nav class="nav-bar">
			<ul>
				<li><a href="userProfile.php" >Profile</a></li>
				<li><a href="userOrdersList.php" >Orders</a></li>
				<li><a href="userRestaurantList.php" >Restaurants</a></li>
			</ul>
		</nav> 
				
	</header>

		<div class="image">
			<span class="uname"> <?php echo "@".$uname; ?> </span>
			<img src= "<?php echo $pic ?>" style="height:300px;">
            <br>
            <form class="picupload" id="picupload" action="userEditProfile.php" method="post" enctype="multipart/form-data">
                <input type="file" class="file" value: "" name="fileToUpload" id="fileToUpload" oninput="submit_picture()">
                <label for="fileToUpload"><span class="label" >Click to edit picture</span>
            </form>
        </div> 

        <form method="post" action="managerAddFood.php">
			<div class="detail_form"> 
				<span class="label" >First name: </span> 
				<span class="error" id = "fnameErr">* </span>
				<input type="text" name="fname" id = "fname" value = <?php echo $fname ?>>
				
				<span class="label" >Last name: </span> 
				<span class="error" id = "lnameErr">* </span>
				<input type="text" name="lname" id = "lname" value = <?php echo $lname ?>>
		
				<span class="label" >New password: </span> 
				<span class="error" id = "pwordErr">* </span>
				<input type="password" name="pword"  id = "pword" value = <?php echo $pword ?>>

				<span class="label" >Confirm password: </span> 
				<span class="error" id = "cpwordErr">* </span>
				<input type="password" name="cpword" id = "cpword" value = <?php echo $pword ?>>
			</div>
            
			<div class="addr">
				<span class="label" >Country:</span> 
				<span class="error" id = "cntryErr">* </span>
				<input type="text" name="cntry" id = "cntry" value = <?php echo $cntry ?>>

				<span class="label" >City: </span> 
				<span class="error" id = "cityErr">* </span>
				<input type="text" name="city" id = "city" value = <?php echo $cty ?>>

				<span class="label" >Street: </span> 
				<span class="error" id = "streetErr">* </span>
				<input type="text" name="street" id = "street" value = <?php echo $strt ?>>
			</div>
			<input type="submit" value = "Update" class="button" id = "signup" name = "details" >
        
        </form>
        <button class="button cancel_button" onclick="window.location.href = 'userProfile.php';">Cancel</button>

</body>
</html>