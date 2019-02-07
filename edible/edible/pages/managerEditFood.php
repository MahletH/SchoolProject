
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
            
            if (isset($_REQUEST['edit']))$_SESSION["edit"] = $_REQUEST['edit'];
            $id = $_SESSION["edit"];
            
            $data = "SELECT * FROM food where id = '$id'";
            $result = $conn->query($data);
            $food = $result->fetch_assoc();
            
            $name = $food["name"];
            $ingredients = $food["ingredients"];
            $price = $food["price"];
            $preparation_time = $food["preparation_time"];
            $pic = $food["picture"];
            if ($pic == ""){
                $pic = "default.jpg";
            }
            
            if (isset ($_POST['details'])){
                        // collect value of input fields
                if (empty($_POST["name"]) === false){$name = test_input($_POST["name"]);}
                if (empty($_POST["ingredients"]) === false){$ingredients = test_input($_POST["ingredients"]);}
                if (empty($_POST["price"]) === false){$price = test_input($_POST["price"]);}
                $preparation_time = test_input($_POST["time"]);
                
                $sql = "UPDATE food SET name ='$name', ingredients ='$ingredients', price = '$price', preparation_time = '$preparation_time'
                        WHERE id='$id'";//update database
                    
                if($conn -> query ($sql) === false){
                    echo $conn -> error;
                }
                
            }else if($_SERVER["REQUEST_METHOD"] == "POST"){
                $target_dir = "../WebData/$uname/foods/";
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
                    
                    $sql = "UPDATE food SET picture = '$target_file'
                            WHERE id = '$id'";//update database
                    
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
			<h1>Edit Food</h1>
            <nav class="nav-bar">
                <ul>
					<li><a href="managerEditRestaurant.php">Edit Restaurant</a></li>
					<li><a href="managerPendingOrders.php" >Orders</a></li>
					<li><a href="managerFoodList.php" >Foods</a></li>
                </ul>
			</nav> 
			          
        </header>
        <div class="image" id="picEdit" >
            <img src= "<?php echo $pic ?>" style="height:300px;">
            <br>
            <form class="picupload" id="picupload" action="managerEditFood.php" method="post" enctype="multipart/form-data">
                <input type="file" name="fileToUpload" id="fileToUpload" oninput="submit_picture()"><br>
                <label for="fileToUpload"><span class="label" >Click to edit picture</span>

            </form>
        </div>

        <form class="detail_form" method="post" action="managerEditFood.php">

            <span class="label"> Name: </span>
            <input type="text" name="name" value = "<?php echo $name;?>"><br>
            
            <span class="label"> Ingredients: </span>
            <textarea name = "ingredients" rows = "5" cols = "100"> <?php echo $ingredients;?> </textarea> <br>
            
            <span class="label"> Price(in Birr): </span>
            <input type="text" name="price" value = "<?php echo $price;?>"> 
            
            <span class="label"> Preparation time: </span>
            <input type="text" name="time" value = "<?php echo $preparation_time;?>"><br>
            
            <input class="button" type="submit" value = "Update" name="details">
        
        </form>
        <button class="button cancel_button" type="button" onclick="window.location.href = 'managerFoodList.php';">Cancel</button>


    </body>
</html>