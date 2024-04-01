<?php
//Function to validate the input data
// function test_input($data)
// {
//     $data = trim($data);
//     $data = stripslashes($data);
//     $data = htmlspecialchars($data);
//     return $data;
// }
// function validateDate($date, $format = "Y-m-d") // H:i:s
// {
//     $d = DateTime::createFromFormat($format, $date);
//     return $d && $d->format($format) == $date;
// }
require_once 'inc/functions_inc.php';
require_once "inc/db_inc.php";

// define variables and set to empty values
$submit = $method = "create";
$errNumber = $rowAffected = 0;
$errMsg = "";
$id = -1;
$fname = $lname = $email = $birthdate =
$fnameErr = $lnameErr = $emailErr = $birthdateErr = "";

// Test query string param "method" to determine the form action
if (!empty($_REQUEST["method"])) {
    $method = strtolower(test_input($_REQUEST["method"]));
    echo "Method GET: $method<br>";
}
switch ($method) {
    case 'update':
        $submit = $method = "update";
        break;
    case 'delete':
        $submit = $method = "delete";
        break;
    default: //'create':
        $submit = $method = "create";
        break;
}
$pageTitle = "Student " . ucwords($method);
include_once("_header.php");	//MENU
echo "Method GET validation: $method<br>";

// Test form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (!empty($_POST["id"])) {
        $id = test_input($_POST["id"]);
        if (is_numeric($id)) {
            $id = intval($id);
        } else {
            $id = -1;
            $method = "create";
            redirect("usersimplefrmrec.php?method=create");
        }
        echo "POST id: $id<br>";
    }
    // Test form data
    if (empty($_POST["fname"])) {
        $fnameErr = "First name is required and must be between 2 and 100 characters";
        $errNumber++;
    } else {
        $fname = test_input($_POST["fname"]);
        if (!empty($fname) && (strlen($fname) >= 2) && (strlen($fname) <= 100)) {
            $fnameErr = "";
        } else {
            $fnameErr = "First name is required and must be between 2 and 100 characters";
            $errNumber++;
        }
        echo "POST:First name: $fname<br>";
    }
    if (empty($_POST["lname"])) {
        $lnameErr = "Last name is required and must be between 2 and 50 characters";
        $errNumber++;
    } else {
        $lname = test_input($_POST["lname"]);
        if (!empty($lname) && (strlen($lname) >= 2) && (strlen($lname) <= 50)) {
            $lnameErr = "";
        } else {
            $lnameErr = "Last name is required and must be between 2 and 50 characters";
            $errNumber++;
        }
        echo "POST:Last name: $lname<br>";
    }
    if (empty($_POST["email"])) {
        $emailErr = "Email is required, must be between 3 and 255 characters";
        $errNumber++;
    } else {
        $email = test_input($_POST["email"]);
        if (!empty($email) && filter_var($email, FILTER_VALIDATE_EMAIL) && (strlen($email) >= 3) && (strlen($email) <= 255)) {
            $emailErr = "";
        } else {
            $emailErr = "Email is required, must be valid and must be between 3 and 255 characters";
            $errNumber++;
        }
        echo "POST:Email: $email<br>";
    }
		//echo "POST:Birthdate: ".$_POST["birthdate"]."<br>";
    if (empty($_POST["birthdate"])) {
        $birthdateErr = "";
    } else {
        $birthdate = test_input($_POST["birthdate"]);
        //var_dump(validateDate($birthdate));
        if (!empty($birthdate) && validateDate($birthdate)) {
            $birthdateErr = "";
        } else {
            $birthdate = "";
            $birthdateErr = "Birthdate must be valid or empty";
            $errNumber++;
        }
        echo "POST:Birthdate: $birthdate<br>";
    }

    if ($errNumber == 0) {
        $conn = null;
        try {
            require_once 'inc/db_inc.php';
            //Open DB Connection
            $conn = new PDO("mysql:host=" . DB_HOST . ";dbname=" . DB_NAME, DB_USER, DB_PASSWORD);
            // set the PDO required mode to exception
            $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            echo "DB Connected successfully<br>";
        } catch (PDOException $e) {
            echo "<error>DB Connection failed: " . $e->getMessage() . "</error>";
            $conn = null;
            exit(1);
        }

				//Modify fields to sql format or null
				//CI DESSOUS IF ou if en ligne
				//if(empty($birthdate))
				//	$birthdatedb = "null";
				//else
				//	$birthdatedb = "'$birthdate'";
				//IDENTIQUE A CI DESSUS
				empty($birthdate) ? $birthdatedb = "null" : $birthdatedb = "'$birthdate'";
				//NE PAS STOCKER DE VIDE MAIS NULL si la champ est vide on met null

        switch ($method) {
            case 'update':
                // Update record (SQL INJECTION RISK!!!)
                $sql = "update elevesimple set nom='$fname', prenom='$lname', email='$email', datenaissance=$birthdatedb where id=$id";
	var_dump($sql);
                if ($rowAffected = $conn->exec($sql) > 0) {
                    $id = $conn->lastInsertId();
                    echo "record updated successfully with ID: $id ($rowAffected line affected)";
                } else {
                    $errNumber++;
                    $errMsg = "Error: " . $sql . "<br>" . $conn->errorInfo()[2];
                    print_r($conn->errorInfo());
                }
                break;
            case 'delete':
                // Delete record (SQL INJECTION RISK!!!)
                $sql = "delete from elevesimple where id=$id";
	var_dump($sql);
                if ($rowAffected = $conn->exec($sql) > 0) {
                    $id = $conn->lastInsertId();
                    echo "record deleted successfully with ID: $id ($rowAffected line affected)";
                } else {
                    $errNumber++;
                    $errMsg = "Error: " . $sql . "<br>" . $conn->errorInfo()[2];
                    print_r($conn->errorInfo());
                }
                break;
            default: //'create':
                if ($id > 0) {
                    echo "<h3>User already inserted</h3>";
                } else {
                    // Create new record (SQL INJECTION RISK!!!)
                    $sql = "INSERT INTO elevesimple (nom, prenom, email, datenaissance) VALUES ('$fname', '$lname', '$email', $birthdatedb)";
var_dump($sql);
                    if ($rowAffected = $conn->exec($sql) > 0) {
                        $id = $conn->lastInsertId();
                        echo "New record created successfully with ID: $id ($rowAffected line affected)";
                    } else {
                        $errNumber++;
                        $errMsg = "Error: " . $sql . "<br>" . $conn->errorInfo()[2];
                        print_r($conn->errorInfo());
                    }
                }
                break;
        }
        $conn = null; //Close DB Connection
    }
} else { //GET -> READ DATAS
    if ($method == "update" || $method == "delete") {
        if (!empty($_GET["id"])) {
            $id = test_input($_GET["id"]);
            if (is_numeric($id)) {
                $id = intval($id);
            } else {
                $id = -1;
                $method = "create";
                header("Location: usersimplefrmrec.php?method=".$method);
                exit();
            }
            if ($id > 0) {
								$conn = null;
								try {
										require_once 'inc/db_inc.php';
										//Open DB Connection
										$conn = new PDO("mysql:host=" . DB_HOST . ";dbname=" . DB_NAME, DB_USER, DB_PASSWORD);
										// set the PDO required mode to exception
										$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
										echo "DB Connected successfully<br>";
								} catch (PDOException $e) {
										echo "<error>DB Connection failed: " . $e->getMessage() . "</error>";
										$conn = null;
										exit(1);
								}
                // Read record (SQL INJECTION RISK!!!)
                $sql = "select nom, prenom, email, datenaissance from elevesimple where id=$id";
                $result = $conn->query($sql);
                if ($result->rowCount() > 0) {
                    $row = $result->fetch(PDO::FETCH_ASSOC);
                    $fname = $row["nom"];
                    $lname = $row["prenom"];
                    $email = $row["email"];
                    $birthdate = $row["datenaissance"];
                    echo "record read successfully with ID: $id";
                } else {
                    $errNumber++;
                    $errMsg = "Error: " . $sql . "<br>" . $conn->errorInfo()[2];
                    print_r($conn->errorInfo());
                }
                $conn = null; //Close DB Connection
            }
        }
    }
		else{
			$id = -1;
			$method = "create";
			//header("Location: usersimplefrmrec.php?method=".$method);
			//exit();
		}
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Student Simple Record</title>
	<link rel="stylesheet" href="css/style.css">
</head>
<body>
<h2><?=$pageTitle?>:</h2>
<a id="listUserLink" class="btn default" href="usersimplelist.php">
		<img class="user" src="icons/utilisateurs-alt.png" alt="User">&nbsp;&nbsp;Students List
</a>
<!-- https://www.w3schools.com/php/php_form_validation.asp -->
<form action="<?=htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="post" novalidate>
<!-- <form action="<?=htmlspecialchars($_SERVER["PHP_SELF"]);?>" method="post"> -->
<fieldset>
		<legend>Registration form</legend>
		<fieldset>
			<legend>Personal informations</legend>
			<!-- <label for="id">ID:</label> -->
			<input type="hidden" name="id" value="<?=$id?>" readonly>
			<input type="hidden" name="method" value="<?=$method?>" readonly>
			<label for="fname">First name:</label>
			<input type="text" id="fname" name="fname" value="<?=$fname?>" placeholder="Type your first name" required minlength="2"
				maxlength="100" size="50"><span class="required">* <span class="error"><?=$fnameErr?></span></span><br>
			<label for="lname">Last name:</label>
			<input type="text" id="lname" name="lname" value="<?=$lname?>" placeholder="Type your last name" required minlength="2"
				maxlength="50" size="50"><span class="required">* <span class="error"><?=$lnameErr?></span></span><br>
			<label for="email">Email:</label>
			<input type="email" id="email" name="email" value="<?=$email?>" placeholder="Type your email" required minlength="3"
				maxlength="255" size="50"><span class="required">* <span class="error"><?=$emailErr?></span></span><br>
			<label for="birthdate">Birthdate:</label>
			<input type="date" id="birthdate" name="birthdate" value="<?=$birthdate?>"><span class="required"><br>
		</fieldset>
		<input class="btn default" type="submit" name="submit" value="<?=ucwords($method)?>">
	</fieldset>
</form>

</body>
</html>