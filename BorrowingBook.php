<?php

//Connecting to the database
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "cw2_library";
// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);


//Codes to borrow book from the library
if($_POST['YesButton']){
	//declaring variables
 $member_id = $_POST['member_id'];
 $book_id = $_POST['book_id'];
 $due_date = $_POST['due_date'];
 
 $sql = "SELECT * FROM member WHERE member_id LIKE '$member_id'";
 $result = $conn->query($sql);
 
 if (mysqli_num_rows($result) === 1){
	 $sql = "INSERT INTO borrow (member_id, book_id, date_borrow, due_date, borrow_status) 
	 VALUES ('$member_id', '$book_id', now(), '$due_date', 'Pending')";
	 
	 if ($conn->query($sql) === TRUE) {
		 $sql =  "SELECT * FROM borrow ORDER BY borrow_id DESC LIMIT 1";
		 $result = $conn->query($sql);
		 
		 if ($result->num_rows > 0) {
		 echo "Book Successfully borrowed<br><br>";
 
         while($row = $result->fetch_assoc()) {
		 echo "  - Borrow ID:    " . $row["borrow_id"]. "<br>";
		 }
		 $sql =  "SELECT * FROM book WHERE book_id = '$book_id'";
		 $result = $conn->query($sql);
		 
		 while($row = $result->fetch_assoc()) {
		 echo "  - Book Title:    " . $row["book_title"]. "<br>";
		 }
		 
	echo '<a href="LMSBorrow.html">
     <input type="submit" value="Done"/>
   </a>';

		 
		 }
	 } 
 } else{
	echo '<script type="text/JavaScript">
    alert("Member ID doesnt exist");
	location.href = "LMSBorrow.html";
 </script>';
 }
 
 
}

$conn->close();
?>