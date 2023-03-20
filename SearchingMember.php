<?php
//Connecting to the database
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "cw2_library";
// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

//Searching for a member in the database by member_id
if($_POST['SearchMemberButton']){
	//declaring variables
 $member_id = $_POST['member_id'];
 $firstname = $_POST['firstname'];
 $lastname = $_POST['lastname'];
 
 $sql = "SELECT * FROM member WHERE member_id = '$member_id' OR firstname = '$firstname' AND lastname = '$lastname'";
 $result = $conn->query($sql);
 
 if ($result->num_rows > 0) {
	 
// output data of each row
while($row = $result->fetch_assoc()) {
 echo "  -Member ID: " . $row["member_id"]. "<br>  - Name: " . $row["firstname"]. " " . $row["lastname"]. "<br>  - Gender: " . $row["gender"]. "<br>  - Address: " . $row["address"]. "<br>";
 echo '<a href="LMSSearchingMember.html">
     <input type="submit" value="Done"/>
   </a>';
 }
} else {
echo '<script type="text/JavaScript">
    alert("The member doesnt exist!");
	location.href = "LMSSearchingBook.html";
    </script>';
}
}

?>