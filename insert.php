<?php session_start();  ?>
<?php include('conn.php'); ?>
<?php
     if(isset($_POST['submit']))
     {
         $first_name=$_POST['first'];
         $last_name=$_POST['last'];
         $email_address=$_POST['email'];
         $mobile_number=$_POST['mobile'];
         $sql="INSERT INTO register(f_name,l_name,email,mobile) VALUES ('".$first_name."','".$last_name."','".$email_address."','".$mobile_number."')";
         $result=mysqli_query($conn,$sql);
         if($result)
         {
            $last_id = $conn->insert_id;
            $data=$first_name.'_'.$last_id;
               // enable error reporting
            mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
            //run the store proc
            $result = mysqli_query($conn, "CALL easemyworkDbCreate('".$data."')");
            $filename = 'easemywork_proc.sql';
            $connection = mysqli_connect('localhost','root','',$data);
            $templine = '';
            // Read in entire file
            $lines = file($filename);
            // Loop through each line
            foreach ($lines as $line) {
            // Skip it if it's a comment
               if (substr($line, 0, 2) == '--' || $line == '')
                  continue;

            // Add this line to the current segment
               $templine .= $line;
            // If it has a semicolon at the end, it's the end of the query
               if (substr(trim($line), -1, 1) == ';') {
                  // Perform the query
                  $connection->query($templine) or print('Error performing query \'<strong>' . $templine . '\': ' . $connection->error() . '<br /><br />');
                  // Reset temp variable to empty
                  $templine = '';
               }
            }
            mysqli_query($conn, "CALL easemyworkTableInsert('".$data."')");
            mysqli_close($connection);
            header('location:home.php');
         }else{
            echo 'error!'.mysqli_error($conn);
         }
     }
    

?>