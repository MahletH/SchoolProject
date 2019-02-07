
        <?php
            session_start();
            
            $servername = "localhost";
            $username = "root";
            $password = "";
            $dbname = "edible";
            
            $uname = $_SESSION["username"];
            
            // Create connection
            $conn = new mysqli($servername, $username, $password, $dbname);

            // Check connection
            if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
            } 
            $data = "SELECT * FROM restaurants where manager_username = '$uname'";
            $result = $conn->query($data);
            $restaurant = $result->fetch_assoc();
            
            $name = $restaurant["name"];
            $about = $restaurant["about"];
            $specialities = $restaurant["specialities"];
            $address = $restaurant["address"];
            $pic = $restaurant["picture"];
            if ($pic == ""){
                $pic = "default.jpg";
            }
            
            if (isset ($_POST['details'])){
                        // collect value of input fields
                if (empty($_POST["name"]) === false){$name = test_input($_POST["name"]);}
                $about = test_input($_POST["about"]);
                $specialities = test_input($_POST["specialities"]);
                $address = test_input($_POST["address"]);
                
                $sql = "UPDATE restaurants SET name ='$name', about ='$about', specialities = '$specialities', address = '$address'
                        WHERE manager_username='$uname'";//update database
                    
                $conn -> query ($sql);
                
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
                    
                    $sql = "UPDATE restaurants SET picture = '$target_file'
                            WHERE manager_username = '$uname'";//update database
                    
                    $conn -> query ($sql);
                    $pic = $target_file;
                    header("location: managerFoodList.php");
                    
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
		<title> edibl </title>
		<link rel="stylesheet" href="../CSS/form.css">
		<link rel="stylesheet" href="fontawesome-free-5.8.1-web/css/all.css">
        <link rel="shortcut icon" type="image/png" href="">
        <script type="text/javascript" src="manager.js"> </script>
        </head>
    <body>

        <header>        
			<h1>Edit Restaurant</h1>
            <nav class="nav-bar">
                <ul>
						<li><a href="managerEditRestaurant.php" >Edit Restaurant Detail</a></li>
						<li><a href="managerPendingOrders.php" >Pending Orders</a></li>
						<li><a href="managerFoodList.php" >List of Foods</a></li>
                </ul>
			</nav> 
			          
        </header>
        
        <div class="image" id="picEdit" >
            <img src= "<?php echo $pic ?>" style="height:300px;">
            <br>
            <form class="picupload" id="picupload" action="managerEditRestaurant.php" method="post" enctype="multipart/form-data">
                <input type="file" name="fileToUpload" id="fileToUpload" oninput="submit_picture()"><br>
                <label for="fileToUpload"><span class="label" >Click to edit picture</span>

            </form>
        </div>

        <form class="detail_form" method="post" action="managerEditRestaurant.php">

            <span class="label"> Name: </span>
            <input type="text" name="name" value = "<?php echo $name;?>">
            
            <span class="label">About: </span>
            <textarea name = "about" rows = "5" cols = "100"> <?php echo $about;?> </textarea> 
            
            <span class="label">Specialities: </span>
            <textarea name = "specialities" rows = "5" cols = "100"> <?php echo $specialities;?> </textarea>
            
            <span class="label">Address: </span>
            <textarea name = "address" rows = "5" cols = "100"> <?php echo $address;?> </textarea> 
        
            <input class="button" type="submit" value = "Update" name="details">
        
        </form>
        <button class=" button cancel_button" type="button" onclick="window.location.href = 'managerFoodList.php';">Cancel</button>

    </body>
</html>

