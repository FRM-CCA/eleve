<?php
require_once "inc/functions_inc.php";
require_once "inc/db_inc.php";

$pageTitle = "Student List";
include_once "_header.php";

if (DbConnect()) {
    $conn = DbConn();
} else {
    echo "<error>DB Connection failed: " . DbErrMsg() . "</error>";
    $conn = DbClose();
    include_once "_footer.php";
    exit(1);
}
// try {
//     //Open DB Connection
//     $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
//     // set the PDO required mode to exception
//     $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
//     //echo "DB Connected successfully<br>";
// } catch (PDOException $e) {
//         echo "<error>DB Connection failed: " . $e->getMessage() ."</error>";
//         $conn = null;
//         include_once("_footer.php");
//         exit(1);
// }

try {
    // Fetch data from the database
    $query = "select d.Id, d.LibelleCourt, ifnull(d.Libelle,'Sans Diplome') as libelle, d.Niveau, count(p.EleveId) as nbDiplomer
		FROM diplome as d
			left join posseder as p on d.id = p.DiplomeId
			group by d.Id
			order by nbDiplomer desc";
    //order by `Nom` ASC, `Prenom` ASC;";
    $stmt = $conn->prepare($query);
    $stmt->execute();
    $data = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo "<error>DB Connection failed: " . $e->getMessage() . "</error>";
    $conn = DbClose();
    include_once "_footer.php";
    exit(1);
}

try {
	// Fetch data from the database
	$query2 = "select e.Id, e.nom, p.EleveId, count(p.DiplomeId)  as nbdiplome
	FROM eleve as e 
		left join posseder as p on e.id = p.EleveId
	group by e.Id
    order by e.Nom, e.Prenom";
	//order by `Nom` ASC, `Prenom` ASC;";
	$stmt = $conn->prepare($query2);
	$stmt->execute();
	$data2 = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
	echo "<error>DB Connection failed: " . $e->getMessage() . "</error>";
	$conn = DbClose();
	include_once "_footer.php";
	exit(1);
}

function htmlTable($data, $query = null)
{
// Generate HTML table
		if(!empty($query))
			echo "<h3>Query : $query</h3>";
    $table = '<table>';
    $table .= '<thead><tr>';
    $emailPosCol = $telPosCol = $dateNaissancePosCol = $dateCreationPosCol = $dateModificationPosCol = $cptCol = -1;
    foreach ($data[0] as $column => $value) {
        $cptCol++;
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
        $dbid = null;
//    var_dump($row);
        $dbid = $row["Id"];
        $table .= '<tr>';
        $cptCol = -1;
        foreach ($row as $value) {
// var_dump($value);
            $cptCol++;
            switch ($cptCol) {
                case $emailPosCol:
                    if (!empty($value)) {
                        $table .= '<td><a href="mailto:' . $value . '">' . $value . '</a></td>';
                    } else {
                        $table .= '<td>' . $value . '</td>';
                    }

                    break;
                case $telPosCol:
                    if (!empty($value)) {
                        $table .= '<td><a href="tel:' . $value . '">' . $value . '</a></td>';
                    } else {
                        $table .= '<td>' . $value . '</td>';
                    }

                    break;
                case $dateNaissancePosCol:
                    if (!empty($value)) {
                        $table .= '<td>' . dateFrmt($value) . '</td>';
                    } else {
                        $table .= '<td>' . $value . '</td>';
                    }

                    break;
                case $dateCreationPosCol:
                case $dateModificationPosCol:
                    if (!empty($value)) {
                        $table .= '<td>' . dateTimeFrmt($value) . '</td>';
                    } else {
                        $table .= '<td>' . $value . '</td>';
                    }

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
		return $table;
}
?>


<body>
<h2>Group by Degree : for get nb student / Degree</h2>
<?php
// Output the HTML table
echo htmlTable($data, $query);
echo "<br>";
?>
<h2>Group by student : for get nb Degree / student</h2>
<?php
// Output the HTML table
echo htmlTable($data2, $query2);
echo "<br>";
?>
</body>
</html>
<?php
include_once "_footer.php";
