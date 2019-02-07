<?php
	
            $name = $ingredients = $price = $preparation_time = "";
            $nameErr = $priceErr = $ingredientErr = "";

            session_start();
            
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
            $pic = "bgFood3.jpg";
            
            if (isset ($_POST['details'])){
                
            $preparation_time = test_input($_POST["time"]);
            
            if (empty($_POST["name"])){
                $nameErr = "Name is required";
            }else{
                $name = test_input($_POST["name"]);
            }
            
            if (empty($_POST["ingredients"])){
                $ingredientErr = "Ingredients are required";
            }else{
                $ingredients = test_input($_POST["ingredients"]);
            }
            
            if (empty($_POST["price"])){
                $priceErr = "Price is required";
            }else{
                $price = test_input($_POST["price"]);
            }
            
            if ($nameErr === "" and $priceErr === "" and $ingredientErr === ""){//if there are no errors in the input
                    $sql = "INSERT INTO food (name, price, ingredients, preparation_time, picture, restaurant_id)
                    VALUES ('$name', '$price', '$ingredients', '$preparation_time', '$_SESSION[picture]', '$rname')";//add the food to the database
                    if ($conn->query($sql) === FALSE) {
                        echo $conn->error;
                    } 
                    header("location: managerFoodList.php");
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
                $_SESSION["picture"] = $target_file;
                $pic = $target_file;
                move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file);
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
        <title> edibl </title>
        <script type="text/javascript" src = "../JavaScript/manager.js"></script>

    </head>

    <body>
        
        <header>        
			<h1>Add Food</h1>
            <nav class="nav-bar">
                <ul>
                    <li><a href="managerEditRestaurant.php">Edit Restaurant</a></li>
					<li><a href="managerPendingOrders.php" >Orders</a></li>
					<li><a href="managerFoodList.php" >Foods</a></li> </ul>
			</nav> 
			          
        </header>
        <div class="image">
            <img src= "<?php echo $pic ?>" style="width:300px;">
            <br>
            <form class="picupload" id="picupload" action="managerAddFood.php" method="post" enctype="multipart/form-data">
                <input type="file" class="file" value: "" name="fileToUpload" id="fileToUpload" oninput="submit_picture()">
                <label for="fileToUpload"><span class="label" >Click to upload picture</span>
            </form>
        </div>      
        

        <form class="detail_form" method="post" action="managerAddFood.php">

            <span class="label"> Name: </span> 
            <span class="error" id = "nameErr">* </span>
            <input type="text" name="name" oninput="check_error('nameErr', 'name')" id = "name">

            <span class="label" >Ingredients:</span> 
            <span class="error" id = "ingErr">* </span>
            <textarea name = "ingredients" rows = "5" cols = "100" oninput="check_error('ingErr', 'ing')" id = "ing"> </textarea>

            <span class="label" > Price(in Birr): </span> 
            <span class="error" id = "priceErr">* </span>
            <input type="text" name="name" oninput="check_error('priceErr', 'price')" id = "price">

            <span class="label" >Preparation time: </span> 
            <input type="text" name="time"><br>

            <input type="submit" class="button" value = "Add" name="details" id = "butn" disabled = "true">

        
        </form>
        <button class="button cancel_button" onclick="window.location.href = 'managerFoodList.php';">Cancel</button>



    </body>



</html>
