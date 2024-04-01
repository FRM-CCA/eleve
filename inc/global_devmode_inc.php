<?php
require_once realpath(dirname(__FILE__)."/global_var_inc.php");

//Function to put web site in Dev/Debug mode
function _devDebugMode(string $option="")
{
		if(!defined("DEV_MODE"))
			return "";
		if (DEV_MODE==false)
			return "";

		$option=trim($option);
		if(empty($option))
			return "";

		switch(strtolower($option))
		{
			case "frm_novalidate":	//invalidate html auto validation
				return "novalidate";
				break;
			case "xxx":
				return "xxx";
				break;
			default:
				return "";
				break;
		}
}