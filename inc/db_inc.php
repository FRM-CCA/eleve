<?php
require_once realpath(dirname(dirname(__FILE__))."/config/db.php");

global $servername, $dbport, $dbcharset, $username, $password, $dbname, 
					$dbconn, $dberrmsg, $dbstatus;
$servername = $dbport = $username = $password = $dbname = 
$dberrmsg = $dbstatus = "";
$dbpointer = $dbconn = null;

function DbConst_Main(){
	global $servername, $dbport, $username, $password, $dbname, $dbcharset;
	$servername = DB_HOST;
	$dbport 		= DB_PORT;
	$dbname 		= DB_NAME;
	$dbcharset 	= DB_CHARSET;
	$username 	= DB_USER;
	$password 	= DB_PASSWORD;
}

function DbSelection($name=""){
	global $dbToUse, $dbpointer;
	switch ($name) {
		case DB_NAME:
		default:	//DB_NAME;
			DbConst_Main();	//Default Db
			break;
	}
}

function DbEmpty2Null($value){
	return empty($value) ? null: $value;
}

function DbNull2Empty($value){
	return is_null($value) ? "" : $value;
}

function DbErrMsg(){
	global $dberrmsg;
	return $dberrmsg;
}

function DbConn(){
	global $dbconn;
	if(DbConnect()){
		return $dbconn;
	}
	return null;
}

function DbClose(){
	global $dbconn, $dbstatus;
	$dbconn = null;
	$dbstatus = "";
	return null;
}

//Open DB Connection
function DbConnect($name=""){
	global $servername, $dbport, $dbcharset, 
		$username, $password, $dbname, $dbconn, $dberrmsg, $dbstatus;
	// var_dump($dbconn);
	DbSelection($name);
	$dberrmsg="";
	if ($dbconn != null && $dbconn instanceof PDO) {
		// echo "DB is Connected<br>";
		return true;
	}

	try {
		$dbconn = new PDO("mysql:host=$servername;port=$dbport;dbname=$dbname", $username, $password);
		// set the PDO required mode to exception
		$dbconn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);	//Error Handling for PDO
		$dbconn->setAttribute(PDO::ATTR_PERSISTENT, true);	// Keep the connection alive
		$dbconn->exec("set names ".$dbcharset);	// Set the charset for the connection
		$dbstatus = $dbconn->getAttribute(PDO::ATTR_CONNECTION_STATUS);
		// echo "DB Connected successfully<br>";
	} catch (PDOException $e) {
		$dberrmsg = $e->getMessage();
		//echo $dberrmsg;
		DbClose();
		return false;
	}
	return true;
}