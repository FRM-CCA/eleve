<?php
require_once "inc/functions_inc.php";
require_once "inc/db_inc.php";

$pageTitle = "Student List";
include_once("_header.php"); //MENU

try {
	//Open DB Connection
	$conn = new PDO("mysql:host=".DB_HOST.";dbname=".DB_NAME, DB_USER, DB_PASSWORD);
	// set the PDO required mode to exception
	$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
	echo "DB Connected successfully<br>";
} catch (PDOException $e) {
		echo "<error>DB Connection failed: " . $e->getMessage() ."</error>";
		$conn = null;
		include_once("_footer.php");
		exit(1);
}

try {
	// Fetch data from the database
	$query = "SELECT `Id`, `Nom`, `Prenom`, `DateNaissance`, `Email` FROM `elevesimple`";
	$stmt = $conn->prepare($query);
	$stmt->execute();
	$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
	echo "<error>DB Connection failed: " . $e->getMessage() ."</error>";
	$conn = null;
	include_once("_footer.php");
	exit(1);
}

// Generate HTML table
$table = '<table>';
$table .= '<thead><tr>';
$table .= '<th>Upd.</th>';
$table .= '<th>Del.</th>';
$emailPosCol=$telPosCol=$dateNaissancePosCol=$dateCreationPosCol=$dateModificationPosCol=$cptCol=-1;
foreach ($data[0] as $column => $value) {
	$cptCol ++;
	switch ($column) {
		case "Email":
			$emailPosCol = $cptCol;
			break;
		case "Telephone":
			$telPosCol = $cptCol;
			break;
		case "DateNaissance":
			$dateNaissancePosCol = $cptCol;
			break;
		case "DateCreation":
			$dateCreationPosCol = $cptCol;
			break;
		case "DateModification":	
			$dateModificationPosCol = $cptCol;
			break;
		default:
			break;
	}
	$table .= '<th>' . $column . '</th>';
}
$table .= '</tr></thead>';

$table .= '<tbody>';
foreach ($data as $row) {
	$dbid=null;
//	var_dump($row);
	$dbid = $row["Id"];
	$table .= '<tr>';
	$table .= '<td><a href="usersimplefrmrec.php?method=update&id='.$dbid.'"><img class="update" src="icons/editBlack.png" alt="Edit"></a></td>';
	$table .= '<td><a href="usersimplefrmrec.php?method=delete&id='.$dbid.'"><img class="delete" src="icons/crossBlack.png" alt="Delete"></a></td>';
	$cptCol=-1;
	foreach ($row as $value) {
// var_dump($value);
		$cptCol ++;
		switch ($cptCol) {
			case $emailPosCol:
				if(!empty($value))
					$table .= '<td><a href="mailto:'. $value .'">' . $value . '</a></td>';
				else
					$table .= '<td>' . $value . '</td>';
				break;
			case $telPosCol:
				if(!empty($value))
					$table .= '<td><a href="tel:'. $value .'">' . $value . '</a></td>';
				else
					$table .= '<td>' . $value . '</td>';
				break;
			case $dateNaissancePosCol:
				if(!empty($value))
						$table .= '<td>'. dateFrmt($value) .'</td>';
					else
					$table .= '<td>' . $value . '</td>';
				break;
			case $dateCreationPosCol:
			case $dateModificationPosCol:
					if(!empty($value))
						$table .= '<td>'. dateTimeFrmt($value) .'</td>';
					else
						$table .= '<td>' . $value . '</td>';
					break;
			default:
				$table .= '<td>' . $value . '</td>';
				break;
		}
	}
	$table .= '</tr>';
}
$table .= '</tbody>';
$table .= '</table>';
?>

<body>
<h2>Student:</h2>
<a id="addUserLink" class="btn default" href="usersimplefrmrec.php">
	<img class="user" src="icons/userBlack.png" alt="User">&nbsp;&nbsp;Add User
</a>
<?php
// Output the HTML table
echo $table;
echo "<br>";
?>
</body>
</html>
<?php
include_once("_footer.php");