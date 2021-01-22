<?php
/**
 * Created by PhpStorm.
 * User: seedteam
 * Date: 20.01.21
 * Time: 11:14
 */
$seedReport = new AOR_Report();
$seedReport->retrieve($_REQUEST['record']);
$reportHTML = $seedReport->Sql_show(0, true);
$reportHTML=str_replace('"', '\"' , $reportHTML);
str_replace(array("\r\n", "\r", "\n"), '',  strip_tags($_POST['comment']));
$reportHTML=str_replace(array("\r\n", "\r", "\n"), ' ' , $reportHTML);
$ss = new Sugar_Smarty();
$ss->assign('sql',$reportHTML);
echo $ss->fetch('custom/modules/AOR_Reports/tpls/sql.tpl');
