     <!DOCTYPE html>  
     <head>  
      <title>Hello World!</title>
     </head>   

     <body>  
      <h1>Hello World!</h1>  
      <p><?php echo 'We are running PHP, version: ' . phpversion(); ?></p>  
      <?  
       $database ="mydb";  
       $user = "root";  
       $password = "secret";  
       $host = "mysql";  

       $connection = new PDO("mysql:host={$host};dbname={$database};charset=utf8", $user, $password);  
       $query = $connection->query("SELECT * FROM jouets");  
       
       
       
       while ($rows = $query->fetch(PDO::FETCH_NUM)){
       	print $rows[0];
       	echo " - ";
       	print $rows[1];
       	echo " - ";
       	print $rows[2];
       	echo " - ";
       	print $rows[3];
       	echo " - ";
       	print $rows[4];
       	echo " - ";
       	print $rows[5];
       	echo " <br> ";
       }


 
        ?>
    </body>
</html>
