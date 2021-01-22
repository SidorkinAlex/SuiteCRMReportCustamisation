<?php
/**
 * Created by PhpStorm.
 * User: seedteam
 * Date: 06.01.21
 * Time: 19:56
 */
$path_arr_for_build = array(
    array(
        'from' => 'custom/Extension/modules/AOR_Fields/Ext',
        'to' => 'SugarModules/custom/Extension/modules/AOR_Fields/Ext',
    ),
    array(
        'from' => 'custom/modules/AOR_Reports/',
        'to' => 'SugarModules/custom/modules/AOR_Reports',
    ),
    array(
        'from' => 'modules/AOR_Reports/AOR_Report.php',
        'to' => 'SugarModules/modules/AOR_Reports/AOR_Report.php',
    ),
    array(
        'from' => 'icons/',
        'to' => 'icons/',
    ),
    array(
        'from' => 'LICENSE.txt',
        'to' => 'LICENSE.txt',
    ),
    array(
        'from' => 'manifest.php',
        'to' => 'manifest.php',
    ),
    array(
        'from' => 'modules/AOR_Fields/fieldLines.js',
        'to' => 'SugarModules/modules/AOR_Fields/fieldLines.js',
    ),
    array(
        'from' => 'modules/AOR_Reports/AOR_Report_Before.js',
        'to' => 'SugarModules/modules/AOR_Reports/AOR_Report_Before.js',
    ),
);

return $path_arr_for_build;
