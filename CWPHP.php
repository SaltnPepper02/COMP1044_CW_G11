<?php

//Connecting to the database
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "cw2_library";
// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
die("Connection failed: " . $conn->connect_error);
}
echo "Connected successfully";



//Adding a book to the database
if($_POST['AddBookButton']){
	//declaring variables
 $book_title = $_POST['book_title'];
 $category_id = $_POST['category_id'];
 $author = $_POST['author'];
 $book_copies = $_POST['book_copies'];
 $book_pub = $_POST['book_pub'];
 $publisher_name = $_POST['publisher_name'];
 $isbn = $_POST['isbn'];
 $copyright_year = $_POST['copyright_year'];
 $status = $_POST['status'];
 
 $sql = "INSERT INTO book (book_title, category_id, author, book_copies, book_publisher, publisher_city, isbn, copyright_year, date_added, status)
 VALUES ('$book_title', '$category_id', '$author', '$book_copies', '$book_pub', '$publisher_name', '$isbn', '$copyright_year', now(), '$status')";

if ($conn->query($sql) === TRUE) {
     echo '<script type="text/JavaScript">
    alert("Book Added");
	location.href = "LMSBooks.html";
    </script>';
} else {
 echo '<script type="text/JavaScript">
    alert("Failed To Add Book");
	location.href = "LMSBook.html";
    </script>';
}

}



//Adding a member to the database
if($_POST['AddMemberButton']){
	//declaring variables
 $firstname = $_POST['firstname'];	
 $lastname = $_POST['lastname'];	
 $gender = $_POST['gender'];	
 $address = $_POST['address'];	
 $contact = $_POST['contact'];	
 $type = $_POST['type'];	
 $year_level = $_POST['year_level'];		

 $sql = "INSERT INTO member (member_id, firstname, lastname, gender, address, contact, type_id, year_level, status)
 VALUES ('$member_id', '$firstname', '$lastname', '$gender', '$address', '$contact', '$type', '$year_level', 'Active')";

if ($conn->query($sql) === TRUE) {
	echo '<script type="text/JavaScript">
    alert("New member added successfully");
	location.href = "LMSMembers.html";
    </script>';
} else {
echo '<script type="text/JavaScript">
    alert("Failed To Add Member");
	location.href = "LMSMembers.html";
    </script>';
}
}



//Updating borrow details(borrow_status, date_return) record in the database using borrow_details_id
if($_POST['UpdateBorrowDetailsButton']){
	//declaring variables
 $borrow_id = $_POST['borrow_id'];
 $borrow_status = $_POST['borrow_status'];
 
 $sql = "UPDATE borrow SET borrow_status = '$borrow_status', date_return = now() WHERE borrow_id = '$borrow_id'";
 
 if ($conn->query($sql) === TRUE) {
echo '<script type="text/JavaScript">
    alert("Borrow Details Updated Successfully");
	location.href = "LMSUpdateBorrowDetails.html";
    </script>';
} else {
echo '<script type="text/JavaScript">
    alert("Error Updating Borrow Details");
	location.href = "LMSUpdateBorrowDetails.html";
    </script>';
}
}



//Updating member details(lastname, address, contact, type, year_level, status) record in the database using member_id
if($_POST['UpdateMemberDetailsButton']){
	//declaring variables
 $member_id = $_POST['member_id'];
 $lastname = $_POST['lastname'];
 $address = $_POST['address'];
 $contact = $_POST['contact'];
 $type = $_POST['type'];
 $year_level = $_POST['year_level'];
 $status = $_POST['status'];
 
 $sql = "UPDATE member SET lastname = '$lastname', address = '$address', contact = '$contact', type_id = '$type', year_level = '$year_level', status = '$status' WHERE member_id = '$member_id'";
 
 if ($conn->query($sql) === TRUE) {
echo '<script type="text/JavaScript">
    alert("Member Details Updated Successfully");
	location.href = "LMSUpdateMember.html";
    </script>';
} else {
echo '<script type="text/JavaScript">
    alert("Error Updating Member Details");
	location.href = "LMSUpdateMember.html";
    </script>';
}
}



//Deleting a book from the database using book_id
if($_POST['DeleteBookButton']){
	//declaring variables
	$book_id = $_POST['book_id'];
	
	$sql = "SELECT * FROM book WHERE book_id = '$book_id'";
	$result = $conn->query($sql);
	
 if (mysqli_num_rows($result) === 1){
	 
	 $sql = "SELECT * FROM borrow WHERE book_id = '$book_id'";
	$result = $conn->query($sql);
	
 if (mysqli_num_rows($result) >= 1){ 
	 
	 echo '<script type="text/JavaScript">
    alert("Book cannot be deleted.");
	location.href = "LMSDeleteBook.html";
    </script>';
} 
 else {
	$sql = "DELETE FROM book WHERE book_id = '$book_id'";
	 if ($conn->query($sql) === TRUE) {
	 echo '<script type="text/JavaScript">
    alert("Book deleted successfully.");
	location.href = "LMSDeleteBook.html";
    </script>';
 }
 }
 }else {
echo '<script type="text/JavaScript">
    alert("Book doesnt exist in library.");
	location.href = "LMSDeleteBook.html";
    </script>';
}
}


//Deleting a member from the database using member_id
if($_POST['DeleteMemberButton']){
	//declaring variables
	$member_id = $_POST['member_id'];
	
		$sql = "SELECT * FROM member WHERE member_id = '$member_id'";
	    $result = $conn->query($sql);
		
 if (mysqli_num_rows($result) === 1){
	 
	 $sql = "SELECT * FROM borrow WHERE member_id = '$member_id'";
	    $result = $conn->query($sql);
		
 if (mysqli_num_rows($result) >= 1){
	 
	 echo '<script type="text/JavaScript">
    alert("Member cannot be deleted.");
	location.href = "LMSDeleteMember.html";
    </script>';
	
 } else {
	$sql = "DELETE FROM member WHERE member_id = $member_id";
     if ($conn->query($sql) === TRUE) {
        echo '<script type="text/JavaScript">
    alert("Member deleted successfully.");
	location.href = "LMSDeleteMember.html";
    </script>';
} 
 }
 }else {
echo '<script type="text/JavaScript">
    alert("Member doesnt exist in library.");
	location.href = "LMSDeleteMember.html";
    </script>';
}
}



//Login in if user is in database
if($_POST['LoginButton']){
	//declaring variables
 $username = $_POST['username'];
 $password = $_POST['password'];
 
 $sql = "SELECT * FROM users WHERE username LIKE '$username' AND password LIKE '$password'";
 $result = $conn->query($sql);
 if (mysqli_num_rows($result) === 1){
	 $row = mysqli_fetch_assoc($result);
	 if ($row['username'] === $username && $row['password'] === $password){
		echo '<script type="text/JavaScript">
    alert("Logged in Successfully");
	location.href = "LibraryMSfront.html";
    </script>';
		 
	 } 
 }	 
 else {
		 echo '<script type="text/JavaScript">
    alert("Incorrect username or password");
	location.href = "LMSLogin.html";
    </script>';
	 }
}
 


//logout php
if($_POST['LogoutButton']){
	session_start();
	session_unset();
	session_destroy();
}



//Adding a new user to the database(signin)
if($_POST['SigninButton']){
	//declaring variables
 $username = $_POST['username'];
 $password = $_POST['password']; 
 $firstname = $_POST['firstname'];	
 $lastname = $_POST['lastname'];	

$sql = "SELECT * FROM users WHERE username LIKE '$username'";
 $result = $conn->query($sql);
 if (mysqli_num_rows($result) === 1){
	 header("Location: LMSSignup.html");
 } else{
	  $sql = "INSERT INTO users (username, password, firstname, lastname)
 VALUES ('$username', '$password', '$firstname', '$lastname')";

if ($conn->query($sql) === TRUE) {
echo '<script type="text/JavaScript">
    alert("Signup Successful");
	location.href = "LMSLogin.html";
    </script>';
} else {
echo '<script type="text/JavaScript">
    alert("Signup Failed");
	location.href = "LMSSignup.html";
    </script>';
}
 }
}





$conn->close();
?>
