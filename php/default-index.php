<?php
// MySQL Login
$user='heppa';
$password='8iml4Ah0vEjrfQDYOZOV';
// Data Source Name i.e. connection details
$database=$user;
$dsn="mysql:host=localhost;charset=UTF8;dbname=$database";
// Open Connection, create new object of PDO class
$pdo=new PDO($dsn, $user, $password);
// Perform SQL Query
$pdoStatement=$pdo->prepare('SELECT * FROM model;');
$pdoStatement->execute();
$hits=$pdoStatement->fetchAll();
// Print the $hits Array
foreach($hits as $row) {
 echo "<p>".$row['id']." ".$row['name']."</p>\n";
}
?>


