<?php
  $host='localhost';
  $username='root';
  $password='';
  $dbname='dbthfpykf2cc3p';

  $conn=mysqli_connect($host,$username,$password,$dbname);
  
  if(!$conn){
      die('connection fail'.mysqli_connect_errror($con));
  }

?>