<?php
//Connecting to the database
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "cw2_library";
// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);


//Searching for a book in the database by the book_id
if($_POST['SearchBookButton']){
	//declaring variables
 $book_id = $_POST['book_id'];
 $book_title = $_POST['book_title'];
 
 $sql = "SELECT * FROM book WHERE book_id = '$book_id' OR book_title = '$book_title'";
 $result = $conn->query($sql);
 
 if ($result->num_rows > 0) {
	 
// output data of each row
while($row = $result->fetch_assoc()) {
	
	echo "  - Book ID:    " . $row["book_id"]. "<br>  - Book Title:    " . $row["book_title"]. "<br>  - Category ID:    " . $row["category_id"]. "<br>  - Author:    " . $row["author"]. "<br>";
	echo '<a href="LMSSearchingBook.html">
     <input type="submit" value="Done"/>
   </a>';
}
} else {
echo '<script type="text/JavaScript">
    alert("The book doesnt exist!");
	location.href = "LMSSearchingBook.html";
    </script>';
}
}
?>