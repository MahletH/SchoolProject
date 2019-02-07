    <?php
        session_start();
        
        echo"
        <header>        
            <h1>Orders</h1>
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
        
        $uname = $_SESSION["username"];
        
        // Create connection
        $conn = new mysqli($servername, $username, $password, $dbname);

        // Check connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
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
            if($status = ""){$status = "Pending";}
            echo "<div class=\"orders\">
            <section>
            <article>
                <img src=\"$food[picture]\">
            </article>
            <aside>
            <div class = \"name\">Food: $food[name] </div>
            <div class = \"time\">Order time: $time </div>
            <div class = \"number\"> Number: $number </div>
            <div class = \"status\"> Status: $status </div>
            </aside>
            </section>
        </div>";
	
	}
?>
<html>
    <head>

        <meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="../fontawesome-free-5.8.1-web/css/all.css">
		<link rel="stylesheet" href="../CSS/list.css">
		<script type="text/javascript" scr="../JavaScript/user.js"> </script>

    </head>
    <body>


    </body>
</html>
