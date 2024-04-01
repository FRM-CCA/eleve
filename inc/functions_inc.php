<?php
require_once realpath(dirname(__FILE__) . "/global_devmode_inc.php");
require_once realpath(dirname(__FILE__) . "/global_var_inc.php");

//echo __FILE__ . "<br>";
//echo realpath(dirname(__FILE__));
//echo dirname(realpath(dirname(__FILE__)));

//Start the site buffer page
if (defined("SITE_CACHE")) {
 if (SITE_CACHE) {
  ob_start();
 }
}

enum CRUD_Method: string {
 case Create = "create";
 case Update = "update";
 case Delete = "delete";
 case Read = "read";
}
$crud_method = CRUD_Method::Read;

function getCRUDMethod(CRUD_Method $defaultMethod = CRUD_Method::Read)
{
 global $crud_method;
 if (!empty($_REQUEST["method"])) {
  $crud_method = strtolower(trim($_REQUEST["method"]));
 }
 //POST Method datas from get/post/cookies [BECAREFULL]

 switch ($crud_method) { //METHOD CRUD CreateReadUpdateDelete
  case 'create':
   $crud_method = CRUD_Method::Create;
   break;
  case 'update':
   $crud_method = CRUD_Method::Update;
   break;
  case 'delete':
   $crud_method = CRUD_Method::Delete;
   break;
  default: //'read (or create 4 form)':
   $crud_method = $defaultMethod;
   break;
 }
 return $crud_method;
}

//Function to redirect to another page
function redirect(string $url)
{
 if (!empty($url)) {
  header("Location: {$url}");
  exit();
 }
}

enum encodeUrlType {
 case UrlEncode;
 case RawUrlEncode;
 case HtmlSpecialChars;
 case HtmlEntities;
}
//Function to encode url
function encodeHtml(string $url, encodeUrlType $encode = encodeUrlType::HtmlSpecialChars)
{
 return encodeUrl($url, $encode);
}
//Function to encode url
function encodeUrl(string $url, encodeUrlType $encode = encodeUrlType::UrlEncode)
{
 //echo ini_get('default_charset');  must be //UTF-8
 switch ($encode) {
  case encodeUrlType::UrlEncode:
   return urlencode($url); //Working with &amp;
   break;
  case encodeUrlType::RawUrlEncode:
   return rawurlencode($url); //Working with &amp;
   break;
  case encodeUrlType::HtmlSpecialChars:
   return htmlspecialchars($url, ENT_QUOTES); //Working with &amp;
   break;
  case encodeUrlType::HtmlEntities:
   return htmlentities($url, ENT_QUOTES); //Not working with &amp;
   break;
  default:
   return urlencode($url);
   break;
 }
}

//Function to get the current date
function dateNow($format = DATETIME_FORMAT_DB)
{
 // Remove date_default_timezone_set('Europe/Paris') in global_var_inc.php for UTC Time
 return date($format); //UTC Time
 // $date = new DateTime("now", new DateTimeZone("Europe/Paris"));  //Local Time
 // return $date->format($format);
}

//Function to format the date
function dateFrmt($date, $defaultSysDate = false, $format = DATE_FORMAT)
{
 return dateTimeFrmt($date, $defaultSysDate, $format);
}
function dateTimeFrmt($date, $defaultSysDate = false, $format = DATETIME_FORMAT)
{
 if (!empty($date)) {
  try {
   $date = new DateTime($date);
   return $date->format($format);
  } catch (\Throwable $th) {

  }
 }
 if ($defaultSysDate) {
  return date($format);
 }

 return "";
}

//Function to validate the date and time
function validateDateTime($date, $format = DATETIME_FORMAT_DB)
{
 return validateDate($date, $format = DATETIME_FORMAT_DB);
}

//Function to validate the date
//function validateDate($date, $format = DATE_FORMAT)
function validateDate($date, $format = DATE_FORMAT_DB)
{
 $d = DateTime::createFromFormat($format, $date);
 return $d && $d->format($format) == $date;
}

//Function to validate the input data
function test_input($data)
{
 $data = trim($data);
 $data = stripslashes($data);
 $data = htmlspecialchars($data);
 return $data;
}
