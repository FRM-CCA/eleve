<?php
include_once "inc/functions_inc.php";
include_once "inc/db_inc.php";

// define variables and set to empty values
$dataRead=null;
$submit = $method = "create";
$errNumber = $rowAffected = 0; $errMsg = "";
$id = -1;
$fname = $lname = $email = $gender = $birthdate = 
$fnameErr = $lnameErr = $emailErr = $genderErr = $birthdateErr =
$phone = $address1 = $address2 = $zipcode = $city = $class = 
$group = $degree = $creationDate = $modificationDate = "";

//POST Method datas from get/post/cookies [BECAREFULL]
if (!empty($_REQUEST["method"])) 
	$method = strtolower(trim($_REQUEST["method"]));

switch ($method) {	//METHOD CRUD CreateReadUpdateDelete
	case 'update':
		$pageTitle = "Student Update";
		$submit = $method = "update";
		break;
	case 'delete':
		$pageTitle = "Student Delete";
		$submit = $method = "delete";
		break;
	default: //'create':
		$pageTitle = "Student Create";
		$submit = $method = "create";
		break;
}
include_once("_header.php");	//HTML Header

$paramRead = $_GET;	//pointer function
//GET Method (datas from URL)	//READ
if (($method == "update" || $method == "delete")){
	if($_SERVER["REQUEST_METHOD"] == "POST"){	//GET
		$paramRead = $_POST;	//pointer function
	}
}
if (empty($paramRead["id"])) {
	$id = -1;
	$method = "create";
} else {
	$id = test_input($paramRead["id"]);
	if(is_numeric($id))
		$id = intval($id);
	else{
		$id = -1;
		$method = "create";
		redirect("userfrm.php?method=create");	//Redirect to create form
	}
}

// POST Method (datas from Form HTML)	for CREATE/UPDATE/DELETE
if ($_SERVER["REQUEST_METHOD"] == "POST" && 
			($method == "create" || $method == "update" || $method == "delete") ) {
	// if (!empty($_POST["method"])) {
	// 	$method = test_input($_POST["method"]);
	// }
	if (!empty($_POST["id"])) {
		$id = test_input($_POST["id"]);
		if(is_numeric($id))
			$id = intval($id);
		else{
			$id = -1;
			$method = "create";
			redirect("userfrm.php?method=create");
		}
	}
	if (empty($_POST["fname"])) {
		$fnameErr = "First name is required and must be between 2 and 100 characters";
		$errNumber++;
	} else {
		$fname = test_input($_POST["fname"]);
		if(!empty($fname) && (strlen($fname) >= 2) && (strlen($fname) <= 100)){
			$fnameErr = "";
		} else {
			$fnameErr = "First name is required and must be between 2 and 100 characters";
			$errNumber++;
		}
		//echo "POST:First name: $fname<br>";
	}
	if (empty($_POST["lname"])) {
		$lnameErr = "Last name is required and must be between 2 and 50 characters";
		$errNumber++;
	} else {
		$lname = test_input($_POST["lname"]);
		if(!empty($lname) && (strlen($lname) >= 2) && (strlen($lname) <= 50)){
			$lnameErr = "";
		} else {
			$lnameErr = "Last name is required and must be between 2 and 50 characters";
			$errNumber++;
		}
		//echo "POST:Last name: $lname<br>";
	}
	if (empty($_POST["email"])) {
		$emailErr = "Email is required, must be between 3 and 255 characters";
		$errNumber++;
	} else {
		$email = test_input($_POST["email"]);
		if(!empty($email) && filter_var($email, FILTER_VALIDATE_EMAIL) && 
				(strlen($email) >= 3) && (strlen($email) <= 255)){
			$emailErr = "";
		} else {
			$emailErr = "Email is required, must be valid, must be between 3 and 255 characters";
			$errNumber++;
		}
		//echo "POST:Email: $email<br>";
	}
	
	if (empty($_POST["gender"])) {
		$genderErr = "Gender is required";
		$errNumber++;
	} else {
		$tmp = test_input($_POST["gender"]);
		if(is_numeric($tmp)){
			$tmp = intval($tmp);
			if($tmp<1 || $tmp>3){	//Gender = 1 Male 2 Female 3 Other
				$genderErr = "Gender is required ands must be Male/Female/Others";
				$errNumber++;
			}
			else{
				$gender = $tmp;
			}
		}
	}
	if (empty($_POST["birthdate"])) {
		$birthdateErr = "Birthdate is required";
		$errNumber++;
	}
	else{
		$birthdate = test_input($_POST["birthdate"]);
//echo "POST:Birthdate: $birthdate<br>";	//web format is like sql format (yyyy-mm-dd)
		if(!empty($birthdate) && validateDate($birthdate, DATE_FORMAT_DB)){
			$birthdateErr = "";
		} else {
			$birthdateErr = "Birthdate is required and must be valid date";
			$errNumber++;
		}
	}
	
	if (!empty($_POST["phone"])) {
		$phone = test_input($_POST["phone"]);
	}
	if (!empty($_POST["address1"])) {
		$address1 = test_input($_POST["address1"]);
	}
	if (!empty($_POST["address2"])) {
		$address2 = test_input($_POST["address2"]);
	}
	if (!empty($_POST["zipcode"])) {
		$zipcode = test_input($_POST["zipcode"]);
	}
	if (!empty($_POST["city"])) {
		$city = test_input($_POST["city"]);
	}
	if (!empty($_POST["class"])) {
		$class = test_input($_POST["class"]);
	}
	if (!empty($_POST["group"])) {
		$group = strtoupper(test_input($_POST["group"]));
		if (!preg_match('/[a-kA-K]/', $group[0])){	//1 char only
			$group = "";
		}
		//echo $group.' is a letter A to K';
	}
	if (!empty($_POST["degree"])) {
		$degree = test_input($_POST["degree"]);
	}
	if (!empty($_POST["modificationDate"])) {
		$modificationDate = test_input($_POST["modificationDate"]);
	}

	//test if the user already exists
	if($method == "create" && $id>0){
		echo "<error>User cant be created with existant id</error>";
		$errNumber++;
	}

	// if(!($method == "update" || validateDateTime($modificationDate))){
	// 	echo "<error>User already inserted/updated</error>";
	// 	$errNumber++;
	// }
	
	if ($errNumber == 0) { //No error detected, we can insert/update/delete datas
		//Open DB Connection
		if(DbConnect()){
			$conn = DbConn();
		} else {
			echo "<error>DB Connection failed: " . DbErrMsg() ."</error>";
			$conn = DbClose();
			include_once("_footer.php");
			exit(1);
		}
		//Prepare the SQL Statement
		if ($method == "create") {
			$query = "INSERT INTO `eleve`(`Nom`, `Prenom`, `Email`, `Genre`, `DateNaissance`,
			 `Telephone`, `Adresse`, `Adresse2`, `CodePostal`, `Ville`, `Classe`, `Groupe`, `Diplome`) 
				VALUES (:fname,:lname,:email,:gender,:birthdate,:phone,:address1,:address2,
				:zipcode,:city,:class,:group,:degree)";
		}
		if ($method == "update") {
			$query = "UPDATE eleve SET Nom = :fname, Prenom = :lname, Email = :email, Genre = :gender, 
				DateNaissance = :birthdate, Telephone = :phone, Adresse = :address1, Adresse2 = :address2, 
				CodePostal = :zipcode, Ville = :city, Classe = :class, Groupe = :group, Diplome = :degree, 
				DateModification = :modificationDateUpd
				WHERE id = :id and DateModification = :modificationDate";
		}

		if ($method == "delete") {	
			$query = "DELETE FROM eleve WHERE id = :id and DateModification = :modificationDate";
		}
		//Datas are verified/transformed [with size verification] for db
		if(empty($id) || $id < 0)
			$id = null;
		if(intval($gender)<1 || intval($gender)>3)	//1-Male 2-Female 3-Other
			$gender = 3;	//Other
		if(empty($phone))
			$phone = null;
		//fastest way to check if a string is empty (ternary operator)
		$address1 = empty($address1) ? null: $address1;
		$address2 = empty($address2) ? null: $address2;
		$zipcode = 	empty($zipcode) ? null: $zipcode;
		$city = empty($city) ? null: $city;
		$class = empty($class) ? null: $class;
		//GROUP A to K else None = null in db
		$group = empty($group) ? null: $group;
		$degree = empty($degree) ? null: $degree;
		//Datas are ready to be inserted/updated/deleted
		//Prepare the SQL Statement
		$stmt=null;
		$rowwAffected = 0;
		try {
			$stmt = $conn->prepare($query);
			if ($method == "create" || $method == "update") {
				$stmt->bindParam(':fname', $fname);	
				$stmt->bindParam(':lname', $lname);
				$stmt->bindParam(':email', $email);
				$stmt->bindParam(':gender', $gender);
				$stmt->bindParam(':birthdate', $birthdate);
				$stmt->bindParam(':phone', $phone);
				$stmt->bindParam(':address1', $address1);
				$stmt->bindParam(':address2', $address2);
				$stmt->bindParam(':zipcode', $zipcode);
				$stmt->bindParam(':city', $city);
				$stmt->bindParam(':class', $class);
				$stmt->bindParam(':group', $group);
				$stmt->bindParam(':degree', $degree);
			}
			if ($method == "update") {
				$modificationDateUpd = DateNow();
				$stmt->bindParam(':modificationDateUpd', $modificationDateUpd);
			}
			if ($method == "update" || $method == "delete") {
				$stmt->bindParam(':id', $id);
				$stmt->bindParam(':modificationDate', $modificationDate);	//Check if the record has been modified by another user
			}
			$stmt->execute();
			if ($method == "create") {
				$id = $conn->lastInsertId();	//Get the last inserted ID
			}
			$rowAffected = $stmt->rowCount();
		} catch (\Throwable $e) {
				$errMsg =	"DB Error: $query<br>" . $e->getMessage();
				echo "<error>DB Error failed: " . $errMsg ."</error>";
				// echo "<br><br> .".$errMsg."<br>";
				$conn = $stmt = DBClose();
				include_once("_footer.php");
				exit(1);
		}
		$conn = $stmt = DbClose();	//Close DB Connection
		switch ($method) {
			case 'create':
			case 'update':
				echo "DB Infos: " . $rowAffected . " records created/updated successfully";
				echo '&nbsp;<a href="'.ROOT_PATH. '">Goto Index</a>';
				//redirect("userlist.php?row=$rowAffected&err=".encodeURL($errMsg));
				break;
			default:
				$id = -1; //resrt id to -1 for no reading data
				echo "DB Infos: " . $rowAffected . " records deleted successfully";
				echo '&nbsp;<a href="'.ROOT_PATH. '">Goto Index</a>';
				//redirect("userlist.php?row=$rowAffected&err=".encodeURL($errMsg));
				break;
		}
		$conn = $stmt = null;	//Close DB Connection
	}
} //End POST Method

//DATA READ from DB
if($id > 0 && ($method == "update" || $method == "delete") ) {
	if(DbConnect()){
		$conn = DbConn();
	} else {
			echo "<error>DB Connection failed: " . DbErrMsg() ."</error>";
			$conn = DbClose();
			include_once("_footer.php");
			exit(1);
	}
	
	try {
		// Fetch data from the database
		$query = "SELECT `Id`, `Nom`, `Prenom`, `DateNaissance`, `Classe`, 
			`Groupe`, `Diplome`, `Genre`, `Email`, `Telephone`, `Adresse`, `Adresse2`, 
			`CodePostal`, `Ville`, `DateCreation`, `DateModification` FROM `eleve` WHERE `Id` = :id";
		$stmt = $conn->prepare($query);
		$stmt->bindParam(':id', $id);
		$stmt->execute();
		$data = $stmt->fetchAll(PDO::FETCH_ASSOC);
		//Datas are ready to be inserted/updated/deleted
		//Prepare the SQL Statement
		$stmt=null;
		if(empty($data)){
			$id = -1;
			$method = "create";
			redirect("userfrm.php?method=$method");
		}
		else{
			$fname = $data[0]["Nom"];
			$lname = $data[0]["Prenom"];
			$email = $data[0]["Email"];
			$gender = $data[0]["Genre"];
			$birthdate = $data[0]["DateNaissance"];
			$phone = $data[0]["Telephone"];
			$address1 = $data[0]["Adresse"];
			$address2 = $data[0]["Adresse2"];
			$zipcode = $data[0]["CodePostal"];
			$city = $data[0]["Ville"];
			$class = $data[0]["Classe"];
			$group = $data[0]["Groupe"];
			$degree = $data[0]["Diplome"];
			$creationDate = $data[0]["DateCreation"];
			$modificationDate = $data[0]["DateModification"];
		}
	} catch (\Throwable $e) {
		echo "<error>DB Error: " .$e->getMessage() ."</error>";
		$conn = $stmt = DbClose();
		include_once("_footer.php");
		exit(1);
	}
	$conn = $stmt = DbClose();	//Close DB Connection
}

//Button text
$submit = $method;
?>
<h2>Student:</h2>
	<!-- https://www.w3schools.com/php/php_form_validation.asp -->
	<form action="<?=CURRENT_PATH?>" method="post" <?=_devDebugMode("frm_novalidate")?>>
	<fieldset>
			<legend>Registration form</legend>
			<fieldset>
				<legend>Personal informations</legend>
				<!-- <label for="id">ID:</label> -->
				<input type="hidden" name="id" value="<?=$id?>" readonly>
				<input type="hidden" name="method" value="<?=$method?>" readonly>
				<label for="fname">First name:</label>
				<input type="text" id="fname" name="fname" value="<?=$fname?>" placeholder="Type your first name" required minlength="2"
					maxlength="100" size="50"><span class="required">* <span class="error"><?= $fnameErr ?></span></span><br>
				<label for="lname">Last name:</label>
				<input type="text" id="lname" name="lname" value="<?=$lname?>" placeholder="Type your last name" required minlength="2"
					maxlength="50" size="50"><span class="required">* <span class="error"><?= $lnameErr ?></span></span><br>
				<label for="email">Email:</label>
				<input type="email" id="email" name="email" value="<?=$email?>" placeholder="Type your email" required minlength="3"
					maxlength="255" size="50"><span class="required">* <span class="error"><?= $emailErr ?></span></span><br>
				<label for="gender">Gender:</label>
				<input type="radio" name="gender" value="1" required>Male
				<input type="radio" name="gender" value="2" required>Female
				<input type="radio" name="gender" value="3" required checked>Other <span class="required">* <span class="error"><?= $genderErr ?></span></span><br>
				<label for="birthdate">Birthdate:</label>
				<input type="date" id="birthdate" name="birthdate" value="<?=$birthdate?>" required><span class="required">* <span class="error"><?= $birthdateErr ?></span></span><br>
			</fieldset>
			<fieldset>
				<legend>Address informations</legend>
				<label for="phone">Phone number:</label>
				<input type="tel" id="phone" name="phone" placeholder="06.01.02.03.04"
						pattern="[0-9]{2}.[0-9]{2}.[0-9]{2}.[0-9]{2}.[0-9]{2}" value="<?=$phone?>"><br>
				<label for="address1">Address 1:</label>
				<input type="text" id="address1" name="address1" value="<?=$address1?>" placeholder="Type your address 1"><br>
				<label for="address2">Address 2:</label>
				<input type="text" id="address2" name="address2" value="<?=$address2?>" placeholder="Type your address 2"><br>
				<label for="zipcode">ZIP Code:</label>
				<input type="number" id="zipcode" name="zipcode" value="<?=$zipcode?>" min="0" max="99999" placeholder="75012" size="5" ><br>
				<label for="city">City:</label>
				<input type="text" id="city" name="city" value="<?=$city?>" placeholder="Type your City name"><br>
			</fieldset>
			<fieldset>
				<legend>Class informations</legend>
				<label for="class">Class:</label>
				<select id="class" name="class">
					<option value="">(Unknow)</option>
					<option value="BTS1">BTS1</option>
					<option value="BTS2">BTS2</option>
				</select><br>
				<label for="group">Group:</label>
				<input type="radio" name="group" id="group" value="None" checked>None
				<input type="radio" name="group" id="group" value="A">A
				<input type="radio" name="group" id="group" value="B">B<br>
				<label for="degree ">Degree:</label>
				<select id="degree " name="degree">
					<option value="">(Unknow)</option>
					<option value="BAC GEN">BAC GEN</option>
					<option value="BAC TECH">BAC TECH</option>
					<option value="BAC PRO">BAC PRO</option>
					<option value="BTS">BTS</option>
					<option value="BUT">BUT</option>
					<option value="LICENCE">LICENCE</option>
				</select><br>
			</fieldset>
			<hr>
			<label for="creationDate">Creation Date:</label>
			<span id="creationDate"><?=dateTimeFrmt($creationDate)?></span><br>
			<label for="modificationDate">Modification Date:</label>
			<span id="modificationDate"><?=dateTimeFrmt($modificationDate)?></span><br>
			<input type="hidden" name="modificationDate" value="<?=$modificationDate?>" readonly>
			<hr>
			<input class="btn default" type="submit" name="submit" value="<?=ucwords($method)?>">
		</fieldset>
	</form>
<?php
include_once("_footer.php");