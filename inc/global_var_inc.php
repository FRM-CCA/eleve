<?php
require_once realpath(dirname(dirname(__FILE__))."/config/site.php");
require_once realpath(dirname(dirname(__FILE__))."/config/db.php");
// Global Variables
// For Development mode put true else false (or comment line) 
define("DEV_MODE", SITE_DEVDEBUG);

// Set the default timezone
date_default_timezone_set(SITE_TIMEZONE);

// Web site root path
if(!defined("ROOT_PATH")){
	define("ROOT_PATH", htmlspecialchars(dirname($_SERVER['SCRIPT_NAME'])));
}

// Current page path
define("CURRENT_PATH", htmlspecialchars($_SERVER["PHP_SELF"]));

// Web site root url
if(!defined("ROOT_URL")){
	$sec=$port="";
	if( isset($_SERVER['HTTPS'] ) ) {
		$sec = ($_SERVER['HTTPS'] != "off") ? "s" : "";
	}
	define("ROOT_URL", "http$sec://".$_SERVER['HTTP_HOST'].ROOT_PATH);
}
// Default Date Format
if(!defined("DATE_FORMAT")){
	define("DATE_FORMAT", SITE_DATE_FORMAT);
}
// Default DateTime Format
if(!defined("DATETIME_FORMAT")){
	define("DATETIME_FORMAT", SITE_DATETIME_FORMAT);
}
// Default Date Format SQL
if(!defined("DATE_FORMAT_DB")){
	define("DATE_FORMAT_DB", DB_DATE_FORMAT);
}
// Default Date Format SQL
if(!defined("DATETIME_FORMAT_DB")){
	define("DATETIME_FORMAT_DB", DB_DATETIME_FORMAT);
}