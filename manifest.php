<?php
$manifest = array (
    0 =>
        array (
            'acceptable_sugar_versions' =>
                array (
                    0 => '',
                ),
        ),
    1 =>
        array (
            'acceptable_sugar_flavors' =>
                array (
                    0 => 'CE',
                    1 => 'PRO',
                    2 => 'ENT',
                    3 => 'CORP',
                    4 => 'ULT',
                ),
        ),
    'readme' => '',
    'key' => 'Report',
    'author' => 'Alex Sidorkin',
    'description' => 'Report customization package for the ability to create columns with manually generated subqueries (sql).',
    'icon' => '',
    'is_uninstallable' => false,
    'name' => 'Custom Report',
    'published_date' => '2021-01-21 09:10:55',
    'type' => 'module',
    'version' => '1.0.0',
    'remove_tables' => 'prompt',
);

$installdefs = array (
    'id' => '',
    'beans' =>
        array (
        ),
    'layoutdefs' =>
        array (
        ),
    'relationships' =>
        array (
        ),
    'image_dir' => '<basepath>/icons',
    'copy' =>
        array (
            0 =>
                array (
                    'from' => '<basepath>/SugarModules/custom/Extension/modules/AOR_Fields/Ext',
                    'to' => 'custom/Extension/modules/AOR_Fields/Ext',
                ),
            1 =>
                array (
                    'from' => '<basepath>/SugarModules/custom/modules/AOR_Reports',
                    'to' => 'custom/modules/AOR_Reports',
                ),
            2 =>
                array (
                    'from' => '<basepath>/SugarModules/modules/AOR_Reports/AOR_Report.php',
                    'to' => 'modules/AOR_Reports/AOR_Report.php',
                ),
            3 =>
                array (
                    'from' => '<basepath>/SugarModules/modules/AOR_Reports/AOR_Report_Before.js',
                    'to' => 'modules/AOR_Reports/AOR_Report_Before.js',
                ),
            4 =>
                array (
                    'from' => '<basepath>/SugarModules/modules/AOR_Fields/fieldLines.js',
                    'to' => 'modules/AOR_Fields/fieldLines.js',
                ),
        ),
    'language' =>
        array (
        ),

);