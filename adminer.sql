-- Adminer 4.7.4 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
  `id` char(36) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `account_type` varchar(50) DEFAULT NULL,
  `industry` varchar(50) DEFAULT NULL,
  `annual_revenue` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `billing_address_street` varchar(150) DEFAULT NULL,
  `billing_address_city` varchar(100) DEFAULT NULL,
  `billing_address_state` varchar(100) DEFAULT NULL,
  `billing_address_postalcode` varchar(20) DEFAULT NULL,
  `billing_address_country` varchar(255) DEFAULT NULL,
  `rating` varchar(100) DEFAULT NULL,
  `phone_office` varchar(100) DEFAULT NULL,
  `phone_alternate` varchar(100) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `ownership` varchar(100) DEFAULT NULL,
  `employees` varchar(10) DEFAULT NULL,
  `ticker_symbol` varchar(10) DEFAULT NULL,
  `shipping_address_street` varchar(150) DEFAULT NULL,
  `shipping_address_city` varchar(100) DEFAULT NULL,
  `shipping_address_state` varchar(100) DEFAULT NULL,
  `shipping_address_postalcode` varchar(20) DEFAULT NULL,
  `shipping_address_country` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `sic_code` varchar(10) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_accnt_id_del` (`id`,`deleted`),
  KEY `idx_accnt_name_del` (`name`,`deleted`),
  KEY `idx_accnt_assigned_del` (`deleted`,`assigned_user_id`),
  KEY `idx_accnt_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `accounts_audit`;
CREATE TABLE `accounts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_accounts_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `accounts_bugs`;
CREATE TABLE `accounts_bugs` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_acc_bug_acc` (`account_id`),
  KEY `idx_acc_bug_bug` (`bug_id`),
  KEY `idx_account_bug` (`account_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `accounts_cases`;
CREATE TABLE `accounts_cases` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_acc_case_acc` (`account_id`),
  KEY `idx_acc_acc_case` (`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `accounts_contacts`;
CREATE TABLE `accounts_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_account_contact` (`account_id`,`contact_id`),
  KEY `idx_contid_del_accid` (`contact_id`,`deleted`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `accounts_opportunities`;
CREATE TABLE `accounts_opportunities` (
  `id` varchar(36) NOT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_account_opportunity` (`account_id`,`opportunity_id`),
  KEY `idx_oppid_del_accid` (`opportunity_id`,`deleted`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `acl_actions`;
CREATE TABLE `acl_actions` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `acltype` varchar(100) DEFAULT NULL,
  `aclaccess` int(3) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aclaction_id_del` (`id`,`deleted`),
  KEY `idx_category_name` (`category`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `acl_actions` (`id`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `name`, `category`, `acltype`, `aclaccess`, `deleted`) VALUES
('10f8683a-cc94-9eca-25ce-5f8990911a78',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'delete',	'Meetings',	'module',	90,	0),
('13227318-76db-e069-b35f-5f8990b92c55',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'import',	'Meetings',	'module',	90,	0),
('13cee88a-53f6-d617-81a8-5f89907b302d',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'list',	'EmailMarketing',	'module',	90,	0),
('1513343c-4420-9896-3b03-5f89901126ca',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'export',	'Meetings',	'module',	90,	0),
('16527f89-a83d-f028-6222-5f8990ac9035',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'edit',	'EmailMarketing',	'module',	90,	0),
('16cd77d2-38a9-4a9f-f829-5f8990f40e5a',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'massupdate',	'Meetings',	'module',	90,	0),
('183995a9-6ad2-a054-2726-5f899095d4a3',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'delete',	'EmailMarketing',	'module',	90,	0),
('19cc560d-92c7-67b9-843f-5f8990292c3d',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'import',	'EmailMarketing',	'module',	90,	0),
('1b6069c8-b4bf-75f7-9169-5f89903d06c2',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'export',	'EmailMarketing',	'module',	90,	0),
('1cd485a9-9d1a-bf9d-5948-5f8990567c77',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'massupdate',	'EmailMarketing',	'module',	90,	0),
('1ebfe483-0ac6-1cda-0118-5f8990f65379',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'access',	'Leads',	'module',	89,	0),
('1fdc2377-e1d2-585d-adab-5f899097c8b7',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'access',	'ProjectTask',	'module',	89,	0),
('20125aae-0b5e-4d14-1683-5f89909c9f92',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'view',	'Leads',	'module',	90,	0),
('212e7a22-f901-6657-809b-5f89907eadd1',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'list',	'Leads',	'module',	90,	0),
('227792e7-5d15-279e-a6e1-5f8990105e21',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'edit',	'Leads',	'module',	90,	0),
('23480297-06d4-5cef-cd5d-5f8990eb7bd6',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'import',	'Project',	'module',	90,	0),
('237463ec-7907-0f6f-d927-5f899009b873',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'delete',	'Leads',	'module',	90,	0),
('23d0a0b7-bde4-c5c5-d7cb-5f8990cb8bc9',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'view',	'ProjectTask',	'module',	90,	0),
('246b91e5-abce-c335-cc13-5f8990f9ee7a',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'import',	'Leads',	'module',	90,	0),
('25671e58-0e92-7a87-4ff1-5f89900a5261',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'export',	'Leads',	'module',	90,	0),
('259efa7d-8ccc-5f67-2522-5f8990d1bea5',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'access',	'EmailTemplates',	'module',	89,	0),
('265a2ac5-62de-0ac3-3a4c-5f8990a0ec9c',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'massupdate',	'Leads',	'module',	90,	0),
('270976d9-06e9-980f-e8c9-5f899028b996',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'list',	'ProjectTask',	'module',	90,	0),
('2990762f-0ce3-05fd-dd5f-5f8990462b90',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'view',	'EmailTemplates',	'module',	90,	0),
('2a064fb5-3f30-5589-6680-5f89901af2e5',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'edit',	'ProjectTask',	'module',	90,	0),
('2c7cea2d-8d31-5113-c642-5f8990e94333',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'list',	'EmailTemplates',	'module',	90,	0),
('2d12d9fc-0f06-a242-4fa0-5f899068d18f',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'delete',	'ProjectTask',	'module',	90,	0),
('2e32233e-5bd2-36eb-1088-5f899060973d',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'edit',	'EmailTemplates',	'module',	90,	0),
('2fb3e98d-3770-da2a-78d0-5f8990515c18',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'delete',	'EmailTemplates',	'module',	90,	0),
('302f12df-f17e-f2bb-149a-5f8990a3db95',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'access',	'Tasks',	'module',	89,	0),
('30428752-897e-43bb-6ea6-5f8990de8e1b',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'import',	'ProjectTask',	'module',	90,	0),
('3126b913-4010-391f-0746-5f8990a117bc',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'import',	'EmailTemplates',	'module',	90,	0),
('32a47e3c-1cb3-53bb-9950-5f8990e60dfa',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'export',	'EmailTemplates',	'module',	90,	0),
('33740930-6f63-2780-9a5f-5f899067db2c',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'view',	'Meetings',	'module',	90,	0),
('33ccc6c3-b794-3de2-f50b-5f8990653c6d',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'export',	'ProjectTask',	'module',	90,	0),
('342fc3fd-4022-b855-8fe5-5f8990a48b44',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'view',	'Tasks',	'module',	90,	0),
('345e8e86-e285-6b75-9e14-5f8990a0bfcd',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'massupdate',	'EmailTemplates',	'module',	90,	0),
('373bfbd0-2e73-2dfe-4022-5f8990d3307f',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'massupdate',	'ProjectTask',	'module',	90,	0),
('385e81fb-8bbd-f210-1713-5f89900bf3a9',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'list',	'Tasks',	'module',	90,	0),
('3bed12bf-0e30-7715-1a0c-5f89908a885c',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'edit',	'Tasks',	'module',	90,	0),
('3f650a79-383e-9978-334b-5f89902c5663',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'delete',	'Tasks',	'module',	90,	0),
('42b4fc2f-dc50-c6b7-535b-5f8990e6b780',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'import',	'Tasks',	'module',	90,	0),
('45495f9f-f9c4-b7bb-17db-5f89902e3c9b',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'access',	'Notes',	'module',	89,	0),
('45f50f64-4514-fda4-381b-5f899032abdc',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'export',	'Tasks',	'module',	90,	0),
('48a32b17-49f6-38fa-9f50-5f8990de5c99',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'massupdate',	'Tasks',	'module',	90,	0),
('49265a5e-24f3-24d0-9604-5f8990bf7fcc',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'view',	'Notes',	'module',	90,	0),
('4d4b505e-4bca-ac37-37e3-5f8990431ca1',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'list',	'Notes',	'module',	90,	0),
('51bd914c-fd17-08b5-f99d-5f8990fb0e62',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'edit',	'Notes',	'module',	90,	0),
('55229ba9-f582-0c8d-609d-5f89906db662',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'delete',	'Notes',	'module',	90,	0),
('586e2d39-2e33-63ab-341f-5f89900a3cb7',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'import',	'Notes',	'module',	90,	0),
('5b967cdf-1ef4-74fb-42a9-5f89903c8c99',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'access',	'Cases',	'module',	89,	0),
('5bb5476f-c059-f8a1-df2e-5f8990ec527f',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'export',	'Notes',	'module',	90,	0),
('5c81431e-c330-765d-0cf6-5f899097fa7b',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'access',	'Campaigns',	'module',	89,	0),
('5cd837a0-4cc7-c878-f759-5f8990984861',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'view',	'Cases',	'module',	90,	0),
('5e517a12-d9ec-c310-ba89-5f89907128f5',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'view',	'Campaigns',	'module',	90,	0),
('5e63ffc3-34fe-20eb-f9a9-5f8990553fa4',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'list',	'Cases',	'module',	90,	0),
('5ee68a30-ffb1-93ed-54ef-5f8990ea209b',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'massupdate',	'Notes',	'module',	90,	0),
('5fa371b3-22a3-2435-7bcb-5f8990bebf74',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'edit',	'Cases',	'module',	90,	0),
('60537ca0-b762-4ae4-cea7-5f899028d8ff',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'list',	'Campaigns',	'module',	90,	0),
('60e2f76d-c2f5-6e3a-bd0c-5f8990f4426e',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'delete',	'Cases',	'module',	90,	0),
('621ceec7-5eaf-59fb-525c-5f899082f5d7',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'import',	'Cases',	'module',	90,	0),
('6251dd8f-5c1f-cab0-28be-5f8990203021',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'edit',	'Campaigns',	'module',	90,	0),
('63612bd7-58ec-9918-d9a8-5f89907a680b',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'export',	'Cases',	'module',	90,	0),
('64359d47-17da-f43e-705e-5f8990a16720',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'delete',	'Campaigns',	'module',	90,	0),
('64f4b68a-5198-4e7d-0bdc-5f89902ba896',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'massupdate',	'Cases',	'module',	90,	0),
('6622a4ba-af6c-62d3-725e-5f89908f1be4',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'import',	'Campaigns',	'module',	90,	0),
('685739b2-b82f-7597-e1c1-5f8990aa2416',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'export',	'Campaigns',	'module',	90,	0),
('6a5e4afe-ee01-f0cf-26dd-5f8990d1ea3e',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'massupdate',	'Campaigns',	'module',	90,	0),
('6b73d960-585c-1382-8f9e-5f8990149f84',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'access',	'Contacts',	'module',	89,	0),
('6c85a9cc-a2c5-6f32-9070-5f89904f2cbc',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'view',	'Contacts',	'module',	90,	0),
('6cd1017f-401a-e9d4-cfdd-5f8990b2aba3',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'export',	'Project',	'module',	90,	0),
('6d95ba09-3daa-80ce-1440-5f89901649c3',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'list',	'Contacts',	'module',	90,	0),
('6ece1b74-80cf-2ce6-1463-5f899051803a',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'edit',	'Contacts',	'module',	90,	0),
('6fd59a92-f896-61fc-2bf1-5f89909f4210',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'delete',	'Contacts',	'module',	90,	0),
('70d4d309-2e9a-4be3-a5a8-5f8990fbaec2',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'import',	'Contacts',	'module',	90,	0),
('71f55a2a-a677-5b57-9e2f-5f8990cb6cde',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'export',	'Contacts',	'module',	90,	0),
('73069f4f-2901-80e4-b099-5f89900cddcf',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'massupdate',	'Contacts',	'module',	90,	0),
('752e05ae-10b1-bf87-1894-5f89909fcf97',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'list',	'Meetings',	'module',	90,	0),
('7b44d23c-1683-d170-fd31-5f89905597be',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'access',	'Calls',	'module',	89,	0),
('7ef6a3e6-1063-4d6e-d466-5f8990a4eda0',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'access',	'Bugs',	'module',	89,	0),
('7f3a85e1-d5e7-431e-61ff-5f8990deb916',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'view',	'Calls',	'module',	90,	0),
('801b188e-a10d-72ec-df15-5f89904843fc',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'view',	'Bugs',	'module',	90,	0),
('81447df9-3b4b-6fb9-e967-5f89907d9423',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'list',	'Bugs',	'module',	90,	0),
('826ad081-74c2-6924-ebfc-5f8990da981c',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'edit',	'Bugs',	'module',	90,	0),
('834a6ab6-e047-30af-7b8b-5f899052cc8e',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'list',	'Calls',	'module',	90,	0),
('839b34cf-9381-3e02-823b-5f8990d34516',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'delete',	'Bugs',	'module',	90,	0),
('84d2ab0a-e0d5-a03e-a52e-5f89907ea651',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'import',	'Bugs',	'module',	90,	0),
('862ee7dd-1838-e1b7-8560-5f8990fbe170',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'export',	'Bugs',	'module',	90,	0),
('86a7d4f5-1d00-366f-8eee-5f899051e7be',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'edit',	'Calls',	'module',	90,	0),
('87a51a4d-8aff-25e0-bee0-5f8990450a5f',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'massupdate',	'Bugs',	'module',	90,	0),
('8a204a98-6b1c-c1aa-8a43-5f89905df610',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'delete',	'Calls',	'module',	90,	0),
('8b69c146-337d-d5db-3289-5f8990a590d0',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'access',	'Alerts',	'module',	89,	0),
('8cbd793d-52bd-56df-9e5c-5f8990fa59c1',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'view',	'Alerts',	'module',	90,	0),
('8dbf5933-110d-09b6-8303-5f89908d907f',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'import',	'Calls',	'module',	90,	0),
('8df70982-f5d7-682b-732c-5f899082cf76',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'list',	'Alerts',	'module',	90,	0),
('8f636997-d175-4258-038c-5f8990cc13c9',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'edit',	'Alerts',	'module',	90,	0),
('90e1a1f2-5d95-e2da-d165-5f8990f7d0d6',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'delete',	'Alerts',	'module',	90,	0),
('91199315-93d0-42f7-ac08-5f8990cc3e3f',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'export',	'Calls',	'module',	90,	0),
('921ebaac-008d-5699-ea8e-5f89904f9053',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'import',	'Alerts',	'module',	90,	0),
('9353874a-3bd0-f14b-42b3-5f8990eec34b',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'export',	'Alerts',	'module',	90,	0),
('93f0627a-507b-0acf-cfad-5f899066ac6f',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'access',	'Accounts',	'module',	89,	0),
('944cbb07-abaa-e20a-d34b-5f8990fbe631',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'access',	'ProspectLists',	'module',	89,	0),
('94a4783f-bc91-f9f6-f0d2-5f89900cde01',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'massupdate',	'Alerts',	'module',	90,	0),
('952ecb1f-3a9c-8e8c-fb1d-5f8990375651',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'massupdate',	'Calls',	'module',	90,	0),
('95c6a420-1f77-c580-f50d-5f8990e055c6',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'view',	'Accounts',	'module',	90,	0),
('975241d3-0477-4d8b-a3fc-5f8990cf7b15',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'list',	'Accounts',	'module',	90,	0),
('9787480b-5697-84ef-076e-5f8990864953',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'view',	'ProspectLists',	'module',	90,	0),
('992d9cec-b19e-95b0-593d-5f89902cf246',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'edit',	'Accounts',	'module',	90,	0),
('9ab05817-e6d6-6fd8-e82d-5f8990e6daa9',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'list',	'ProspectLists',	'module',	90,	0),
('9af49a1b-8249-13ef-0941-5f8990fed0cf',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'delete',	'Accounts',	'module',	90,	0),
('9caf2795-e5cc-04fd-1d0b-5f8990b0c238',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'import',	'Accounts',	'module',	90,	0),
('9dcc8283-edd8-c47a-17b3-5f8990a7b82b',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'edit',	'ProspectLists',	'module',	90,	0),
('9e5061c0-52a3-5d12-f8c1-5f89901717f4',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'export',	'Accounts',	'module',	90,	0),
('9fe1f093-ce35-bc6f-4df7-5f8990d9783d',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'massupdate',	'Accounts',	'module',	90,	0),
('a0b94128-8f45-d64c-1838-5f899027e908',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'delete',	'ProspectLists',	'module',	90,	0),
('a1930cf2-377b-f646-d521-5f89903e3e9e',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'access',	'EmailMarketing',	'module',	89,	0),
('a3a3ccef-80e4-db7f-8c20-5f89905a49a5',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'import',	'ProspectLists',	'module',	90,	0),
('a6933eb6-2426-005e-c3ac-5f8990cb6e3f',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'export',	'ProspectLists',	'module',	90,	0),
('a9837e81-eb4a-a27b-9911-5f89900cc88a',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'massupdate',	'ProspectLists',	'module',	90,	0),
('aa5e0e26-22b0-93ce-8e2b-5f8990cbd44b',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'massupdate',	'Project',	'module',	90,	0),
('abb2d467-1090-c28e-8d3c-5f89908c0f91',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'access',	'Users',	'module',	89,	0),
('af2d70d5-e21e-afc9-7cd5-5f8990930fef',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'view',	'Users',	'module',	90,	0),
('b0ee1f87-4472-1922-add5-5f89904bade8',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'access',	'Documents',	'module',	89,	0),
('b2611c55-00b1-091a-001a-5f89906c3ca2',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'list',	'Users',	'module',	90,	0),
('b4ce4a94-6c89-f089-de43-5f89906a9043',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'view',	'Documents',	'module',	90,	0),
('b59c5ccc-cd35-3db9-4f78-5f89902212ce',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'edit',	'Users',	'module',	90,	0),
('b6b7287c-04b5-2ee2-aadd-5f89905b7cf6',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'access',	'Emails',	'module',	89,	0),
('b7ddf1c5-a817-f2f4-f0ff-5f89901305a1',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'list',	'Documents',	'module',	90,	0),
('b87ee365-305a-2d73-9c4c-5f8990632fd5',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'delete',	'Users',	'module',	90,	0),
('ba2f5a73-14d5-2888-55af-5f89901ea97b',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'view',	'Emails',	'module',	90,	0),
('bafe5687-fb2a-5f8a-f971-5f89903e7532',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'edit',	'Documents',	'module',	90,	0),
('bc181434-fd77-6072-b433-5f8990fe7a9d',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'import',	'Users',	'module',	90,	0),
('bdbed6f1-4b6b-fac9-7eeb-5f89904be29f',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'list',	'Emails',	'module',	90,	0),
('be2e6222-0122-ffd6-c828-5f89909bcbbb',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'delete',	'Documents',	'module',	90,	0),
('beaf547b-2fad-7c25-972b-5f899017e498',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'export',	'Users',	'module',	90,	0),
('c0c1134a-26aa-b537-c3d5-5f89909886ca',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'edit',	'Emails',	'module',	90,	0),
('c14180c2-6222-4065-2dc7-5f8990c7aaa1',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'import',	'Documents',	'module',	90,	0),
('c145a74f-f0d6-df0e-55d4-5f89903755cd',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'massupdate',	'Users',	'module',	90,	0),
('c425deeb-18ce-3a94-768f-5f89907b7d0f',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'delete',	'Emails',	'module',	90,	0),
('c4d698d7-2f7f-afae-f22a-5f89901fb2c3',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'export',	'Documents',	'module',	90,	0),
('c543aa51-0c48-4de9-4005-5f89905f3470',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'access',	'Prospects',	'module',	89,	0),
('c847677e-2a07-934e-7e54-5f89900d2028',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'import',	'Emails',	'module',	90,	0),
('c854910c-f556-7d63-7b01-5f89900a40e0',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'massupdate',	'Documents',	'module',	90,	0),
('c8d96fc7-92ad-40a4-49f2-5f89902c9f68',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'view',	'Prospects',	'module',	90,	0),
('cc258f27-2fec-e837-ada0-5f8990f3ec37',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'list',	'Prospects',	'module',	90,	0),
('cc373ab7-db3c-2725-ed34-5f8990edb165',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'export',	'Emails',	'module',	90,	0),
('cf680e6a-d773-6b52-56bb-5f899062f978',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'edit',	'Prospects',	'module',	90,	0),
('cfce1a22-2987-e11d-bb74-5f8990fed2e6',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'massupdate',	'Emails',	'module',	90,	0),
('d28f7019-36f8-5e90-b210-5f8990079570',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'delete',	'Prospects',	'module',	90,	0),
('d3390521-1b64-9cad-f1aa-5f8990b4ac54',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'edit',	'Meetings',	'module',	90,	0),
('d54f25bf-05e4-ab41-812e-5f89909a62b5',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'access',	'Opportunities',	'module',	89,	0),
('d59df6c4-e28b-804f-20cb-5f89902b3732',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'import',	'Prospects',	'module',	90,	0),
('d84b6a45-527e-22ec-0750-5f8990cbdd39',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'view',	'Opportunities',	'module',	90,	0),
('d8a17235-5972-dbec-5f22-5f8990cf0b38',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'export',	'Prospects',	'module',	90,	0),
('db932d37-b8e6-bbcc-36ee-5f89905aa857',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'list',	'Opportunities',	'module',	90,	0),
('dc46bc83-75ef-7bab-405f-5f899052c7c9',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'massupdate',	'Prospects',	'module',	90,	0),
('dece391c-c96d-b7f8-4921-5f8990dff2a5',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'edit',	'Opportunities',	'module',	90,	0),
('e2cbef5a-bf5e-a26c-4b1a-5f8990d5d2e5',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'delete',	'Opportunities',	'module',	90,	0),
('e6363d89-cde0-d35d-274c-5f8990fc579f',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'import',	'Opportunities',	'module',	90,	0),
('e68d581d-405c-acb3-676d-5f8990a7012f',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'access',	'Project',	'module',	89,	0),
('e93e4b57-bbf6-5063-48f4-5f8990868194',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'export',	'Opportunities',	'module',	90,	0),
('e9835365-fac4-6e2e-873d-5f8990db0395',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'view',	'Project',	'module',	90,	0),
('ec595c9c-b15b-a21e-5c42-5f89907a3380',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'list',	'Project',	'module',	90,	0),
('ec7afdb3-b815-454c-9b16-5f899092aa66',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'massupdate',	'Opportunities',	'module',	90,	0),
('ef46ed9f-e995-0dc8-2631-5f89908008e4',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'edit',	'Project',	'module',	90,	0),
('f2a94a31-0339-b127-e6a1-5f89901c14f0',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'delete',	'Project',	'module',	90,	0),
('f368b2d1-fb83-9d2d-e2d9-5f899090a9c3',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'access',	'Meetings',	'module',	89,	0),
('f36d0773-a16c-8cde-0c87-5f8990867afa',	'2020-10-16 12:23:18',	'2020-10-16 12:23:18',	'1',	'',	'view',	'EmailMarketing',	'module',	90,	0);

DROP TABLE IF EXISTS `acl_roles`;
CREATE TABLE `acl_roles` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aclrole_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `acl_roles_actions`;
CREATE TABLE `acl_roles_actions` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `action_id` varchar(36) DEFAULT NULL,
  `access_override` int(3) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_acl_role_id` (`role_id`),
  KEY `idx_acl_action_id` (`action_id`),
  KEY `idx_aclrole_action` (`role_id`,`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `acl_roles_users`;
CREATE TABLE `acl_roles_users` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_aclrole_id` (`role_id`),
  KEY `idx_aclrole_user` (`role_id`,`user_id`),
  KEY `idx_acluser_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=244;


DROP TABLE IF EXISTS `address_book`;
CREATE TABLE `address_book` (
  `assigned_user_id` char(36) NOT NULL,
  `bean` varchar(50) DEFAULT NULL,
  `bean_id` char(36) NOT NULL,
  KEY `ab_user_bean_idx` (`assigned_user_id`,`bean`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `alerts`;
CREATE TABLE `alerts` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `target_module` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `url_redirect` varchar(255) DEFAULT NULL,
  `reminder_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `am_projecttemplates`;
CREATE TABLE `am_projecttemplates` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Draft',
  `priority` varchar(100) DEFAULT 'High',
  `override_business_hours` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `am_projecttemplates_audit`;
CREATE TABLE `am_projecttemplates_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_am_projecttemplates_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `am_projecttemplates_contacts_1_c`;
CREATE TABLE `am_projecttemplates_contacts_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `am_projecttemplates_ida` varchar(36) DEFAULT NULL,
  `contacts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `am_projecttemplates_contacts_1_alt` (`am_projecttemplates_ida`,`contacts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `am_projecttemplates_project_1_c`;
CREATE TABLE `am_projecttemplates_project_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `am_projecttemplates_project_1am_projecttemplates_ida` varchar(36) DEFAULT NULL,
  `am_projecttemplates_project_1project_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `am_projecttemplates_project_1_ida1` (`am_projecttemplates_project_1am_projecttemplates_ida`),
  KEY `am_projecttemplates_project_1_alt` (`am_projecttemplates_project_1project_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `am_projecttemplates_users_1_c`;
CREATE TABLE `am_projecttemplates_users_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `am_projecttemplates_ida` varchar(36) DEFAULT NULL,
  `users_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `am_projecttemplates_users_1_alt` (`am_projecttemplates_ida`,`users_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `am_tasktemplates`;
CREATE TABLE `am_tasktemplates` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Not Started',
  `priority` varchar(100) DEFAULT 'High',
  `percent_complete` int(255) DEFAULT 0,
  `predecessors` int(255) DEFAULT NULL,
  `milestone_flag` tinyint(1) DEFAULT 0,
  `relationship_type` varchar(100) DEFAULT 'FS',
  `task_number` int(255) DEFAULT NULL,
  `order_number` int(255) DEFAULT NULL,
  `estimated_effort` int(255) DEFAULT NULL,
  `utilization` varchar(100) DEFAULT '0',
  `duration` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `am_tasktemplates_am_projecttemplates_c`;
CREATE TABLE `am_tasktemplates_am_projecttemplates_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `am_tasktemplates_am_projecttemplatesam_projecttemplates_ida` varchar(36) DEFAULT NULL,
  `am_tasktemplates_am_projecttemplatesam_tasktemplates_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `am_tasktemplates_am_projecttemplates_ida1` (`am_tasktemplates_am_projecttemplatesam_projecttemplates_ida`),
  KEY `am_tasktemplates_am_projecttemplates_alt` (`am_tasktemplates_am_projecttemplatesam_tasktemplates_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `am_tasktemplates_audit`;
CREATE TABLE `am_tasktemplates_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_am_tasktemplates_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aobh_businesshours`;
CREATE TABLE `aobh_businesshours` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `opening_hours` varchar(100) DEFAULT '1',
  `closing_hours` varchar(100) DEFAULT '1',
  `open_status` tinyint(1) DEFAULT NULL,
  `day` varchar(100) DEFAULT 'monday',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aod_index`;
CREATE TABLE `aod_index` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `last_optimised` datetime DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aod_indexevent`;
CREATE TABLE `aod_indexevent` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `error` varchar(255) DEFAULT NULL,
  `success` tinyint(1) DEFAULT 0,
  `record_id` char(36) DEFAULT NULL,
  `record_module` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_record_module` (`record_module`),
  KEY `idx_record_id` (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aod_indexevent_audit`;
CREATE TABLE `aod_indexevent_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aod_indexevent_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aod_index_audit`;
CREATE TABLE `aod_index_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aod_index_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aok_knowledgebase`;
CREATE TABLE `aok_knowledgebase` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Draft',
  `revision` varchar(255) DEFAULT NULL,
  `additional_info` text DEFAULT NULL,
  `user_id_c` char(36) DEFAULT NULL,
  `user_id1_c` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aok_knowledgebase_audit`;
CREATE TABLE `aok_knowledgebase_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aok_knowledgebase_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aok_knowledgebase_categories`;
CREATE TABLE `aok_knowledgebase_categories` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `aok_knowledgebase_id` varchar(36) DEFAULT NULL,
  `aok_knowledge_base_categories_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aok_knowledgebase_categories_alt` (`aok_knowledgebase_id`,`aok_knowledge_base_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aok_knowledge_base_categories`;
CREATE TABLE `aok_knowledge_base_categories` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aok_knowledge_base_categories_audit`;
CREATE TABLE `aok_knowledge_base_categories_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aok_knowledge_base_categories_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aop_case_events`;
CREATE TABLE `aop_case_events` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `case_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aop_case_events_audit`;
CREATE TABLE `aop_case_events_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aop_case_events_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aop_case_updates`;
CREATE TABLE `aop_case_updates` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `case_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `internal` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aop_case_updates_audit`;
CREATE TABLE `aop_case_updates_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aop_case_updates_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aor_charts`;
CREATE TABLE `aor_charts` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `aor_report_id` char(36) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `x_field` int(11) DEFAULT NULL,
  `y_field` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aor_conditions`;
CREATE TABLE `aor_conditions` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `aor_report_id` char(36) DEFAULT NULL,
  `condition_order` int(255) DEFAULT NULL,
  `logic_op` varchar(255) DEFAULT NULL,
  `parenthesis` varchar(255) DEFAULT NULL,
  `module_path` longtext DEFAULT NULL,
  `field` varchar(100) DEFAULT NULL,
  `operator` varchar(100) DEFAULT NULL,
  `value_type` varchar(100) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `parameter` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aor_conditions_index_report_id` (`aor_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aor_fields`;
CREATE TABLE `aor_fields` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `aor_report_id` char(36) DEFAULT NULL,
  `field_order` int(255) DEFAULT NULL,
  `module_path` longtext DEFAULT NULL,
  `field` varchar(100) DEFAULT NULL,
  `display` tinyint(1) DEFAULT NULL,
  `link` tinyint(1) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `field_function` varchar(100) DEFAULT NULL,
  `sort_by` varchar(100) DEFAULT NULL,
  `format` varchar(100) DEFAULT NULL,
  `total` varchar(100) DEFAULT NULL,
  `sort_order` varchar(100) DEFAULT NULL,
  `group_by` tinyint(1) DEFAULT NULL,
  `group_order` varchar(100) DEFAULT NULL,
  `group_display` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aor_fields_index_report_id` (`aor_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aor_reports`;
CREATE TABLE `aor_reports` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `report_module` varchar(100) DEFAULT NULL,
  `graphs_per_row` int(11) DEFAULT 2,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aor_reports_audit`;
CREATE TABLE `aor_reports_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aor_reports_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aor_scheduled_reports`;
CREATE TABLE `aor_scheduled_reports` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `schedule` varchar(100) DEFAULT NULL,
  `last_run` datetime DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `email_recipients` longtext DEFAULT NULL,
  `aor_report_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aos_contracts`;
CREATE TABLE `aos_contracts` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `reference_code` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `total_contract_value` decimal(26,6) DEFAULT NULL,
  `total_contract_value_usdollar` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Not Started',
  `customer_signed_date` date DEFAULT NULL,
  `company_signed_date` date DEFAULT NULL,
  `renewal_reminder_date` datetime DEFAULT NULL,
  `contract_type` varchar(100) DEFAULT 'Type',
  `contract_account_id` char(36) DEFAULT NULL,
  `opportunity_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `call_id` char(36) DEFAULT NULL,
  `total_amt` decimal(26,6) DEFAULT NULL,
  `total_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `discount_amount` decimal(26,6) DEFAULT NULL,
  `discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `tax_amount` decimal(26,6) DEFAULT NULL,
  `tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_amount` decimal(26,6) DEFAULT NULL,
  `shipping_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_tax` varchar(100) DEFAULT NULL,
  `shipping_tax_amt` decimal(26,6) DEFAULT NULL,
  `shipping_tax_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `total_amount` decimal(26,6) DEFAULT NULL,
  `total_amount_usdollar` decimal(26,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aos_contracts_audit`;
CREATE TABLE `aos_contracts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aos_contracts_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aos_contracts_documents`;
CREATE TABLE `aos_contracts_documents` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `aos_contracts_id` varchar(36) DEFAULT NULL,
  `documents_id` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_contracts_documents_alt` (`aos_contracts_id`,`documents_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aos_invoices`;
CREATE TABLE `aos_invoices` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `billing_account_id` char(36) DEFAULT NULL,
  `billing_contact_id` char(36) DEFAULT NULL,
  `billing_address_street` varchar(150) DEFAULT NULL,
  `billing_address_city` varchar(100) DEFAULT NULL,
  `billing_address_state` varchar(100) DEFAULT NULL,
  `billing_address_postalcode` varchar(20) DEFAULT NULL,
  `billing_address_country` varchar(255) DEFAULT NULL,
  `shipping_address_street` varchar(150) DEFAULT NULL,
  `shipping_address_city` varchar(100) DEFAULT NULL,
  `shipping_address_state` varchar(100) DEFAULT NULL,
  `shipping_address_postalcode` varchar(20) DEFAULT NULL,
  `shipping_address_country` varchar(255) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `total_amt` decimal(26,6) DEFAULT NULL,
  `total_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `discount_amount` decimal(26,6) DEFAULT NULL,
  `discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `tax_amount` decimal(26,6) DEFAULT NULL,
  `tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_amount` decimal(26,6) DEFAULT NULL,
  `shipping_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_tax` varchar(100) DEFAULT NULL,
  `shipping_tax_amt` decimal(26,6) DEFAULT NULL,
  `shipping_tax_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `total_amount` decimal(26,6) DEFAULT NULL,
  `total_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `quote_number` int(11) DEFAULT NULL,
  `quote_date` date DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `template_ddown_c` text DEFAULT NULL,
  `subtotal_tax_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aos_invoices_audit`;
CREATE TABLE `aos_invoices_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aos_invoices_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aos_line_item_groups`;
CREATE TABLE `aos_line_item_groups` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `total_amt` decimal(26,6) DEFAULT NULL,
  `total_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `discount_amount` decimal(26,6) DEFAULT NULL,
  `discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `tax_amount` decimal(26,6) DEFAULT NULL,
  `tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_tax_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `total_amount` decimal(26,6) DEFAULT NULL,
  `total_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aos_line_item_groups_audit`;
CREATE TABLE `aos_line_item_groups_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aos_line_item_groups_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aos_pdf_templates`;
CREATE TABLE `aos_pdf_templates` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  `type` varchar(100) DEFAULT NULL,
  `pdfheader` text DEFAULT NULL,
  `pdffooter` text DEFAULT NULL,
  `margin_left` int(255) DEFAULT 15,
  `margin_right` int(255) DEFAULT 15,
  `margin_top` int(255) DEFAULT 16,
  `margin_bottom` int(255) DEFAULT 16,
  `margin_header` int(255) DEFAULT 9,
  `margin_footer` int(255) DEFAULT 9,
  `page_size` varchar(100) DEFAULT NULL,
  `orientation` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aos_pdf_templates_audit`;
CREATE TABLE `aos_pdf_templates_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aos_pdf_templates_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aos_products`;
CREATE TABLE `aos_products` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `maincode` varchar(100) DEFAULT 'XXXX',
  `part_number` varchar(25) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `type` varchar(100) DEFAULT 'Good',
  `cost` decimal(26,6) DEFAULT NULL,
  `cost_usdollar` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `price` decimal(26,6) DEFAULT NULL,
  `price_usdollar` decimal(26,6) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `aos_product_category_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aos_products_audit`;
CREATE TABLE `aos_products_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aos_products_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aos_products_quotes`;
CREATE TABLE `aos_products_quotes` (
  `id` char(36) NOT NULL,
  `name` text DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `part_number` varchar(255) DEFAULT NULL,
  `item_description` text DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `product_qty` decimal(18,4) DEFAULT NULL,
  `product_cost_price` decimal(26,6) DEFAULT NULL,
  `product_cost_price_usdollar` decimal(26,6) DEFAULT NULL,
  `product_list_price` decimal(26,6) DEFAULT NULL,
  `product_list_price_usdollar` decimal(26,6) DEFAULT NULL,
  `product_discount` decimal(26,6) DEFAULT NULL,
  `product_discount_usdollar` decimal(26,6) DEFAULT NULL,
  `product_discount_amount` decimal(26,6) DEFAULT NULL,
  `product_discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `discount` varchar(255) DEFAULT 'Percentage',
  `product_unit_price` decimal(26,6) DEFAULT NULL,
  `product_unit_price_usdollar` decimal(26,6) DEFAULT NULL,
  `vat_amt` decimal(26,6) DEFAULT NULL,
  `vat_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `product_total_price` decimal(26,6) DEFAULT NULL,
  `product_total_price_usdollar` decimal(26,6) DEFAULT NULL,
  `vat` varchar(100) DEFAULT '5.0',
  `parent_type` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `product_id` char(36) DEFAULT NULL,
  `group_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aospq_par_del` (`parent_id`,`parent_type`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aos_products_quotes_audit`;
CREATE TABLE `aos_products_quotes_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aos_products_quotes_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aos_product_categories`;
CREATE TABLE `aos_product_categories` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `is_parent` tinyint(1) DEFAULT 0,
  `parent_category_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aos_product_categories_audit`;
CREATE TABLE `aos_product_categories_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aos_product_categories_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aos_quotes`;
CREATE TABLE `aos_quotes` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `approval_issue` text DEFAULT NULL,
  `billing_account_id` char(36) DEFAULT NULL,
  `billing_contact_id` char(36) DEFAULT NULL,
  `billing_address_street` varchar(150) DEFAULT NULL,
  `billing_address_city` varchar(100) DEFAULT NULL,
  `billing_address_state` varchar(100) DEFAULT NULL,
  `billing_address_postalcode` varchar(20) DEFAULT NULL,
  `billing_address_country` varchar(255) DEFAULT NULL,
  `shipping_address_street` varchar(150) DEFAULT NULL,
  `shipping_address_city` varchar(100) DEFAULT NULL,
  `shipping_address_state` varchar(100) DEFAULT NULL,
  `shipping_address_postalcode` varchar(20) DEFAULT NULL,
  `shipping_address_country` varchar(255) DEFAULT NULL,
  `expiration` date DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `opportunity_id` char(36) DEFAULT NULL,
  `template_ddown_c` text DEFAULT NULL,
  `total_amt` decimal(26,6) DEFAULT NULL,
  `total_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `subtotal_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `discount_amount` decimal(26,6) DEFAULT NULL,
  `discount_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `tax_amount` decimal(26,6) DEFAULT NULL,
  `tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_amount` decimal(26,6) DEFAULT NULL,
  `shipping_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `shipping_tax` varchar(100) DEFAULT NULL,
  `shipping_tax_amt` decimal(26,6) DEFAULT NULL,
  `shipping_tax_amt_usdollar` decimal(26,6) DEFAULT NULL,
  `total_amount` decimal(26,6) DEFAULT NULL,
  `total_amount_usdollar` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `stage` varchar(100) DEFAULT 'Draft',
  `term` varchar(100) DEFAULT NULL,
  `terms_c` text DEFAULT NULL,
  `approval_status` varchar(100) DEFAULT NULL,
  `invoice_status` varchar(100) DEFAULT 'Not Invoiced',
  `subtotal_tax_amount` decimal(26,6) DEFAULT NULL,
  `subtotal_tax_amount_usdollar` decimal(26,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aos_quotes_aos_invoices_c`;
CREATE TABLE `aos_quotes_aos_invoices_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `aos_quotes77d9_quotes_ida` varchar(36) DEFAULT NULL,
  `aos_quotes6b83nvoices_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_quotes_aos_invoices_alt` (`aos_quotes77d9_quotes_ida`,`aos_quotes6b83nvoices_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aos_quotes_audit`;
CREATE TABLE `aos_quotes_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aos_quotes_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aos_quotes_os_contracts_c`;
CREATE TABLE `aos_quotes_os_contracts_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `aos_quotese81e_quotes_ida` varchar(36) DEFAULT NULL,
  `aos_quotes4dc0ntracts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_quotes_aos_contracts_alt` (`aos_quotese81e_quotes_ida`,`aos_quotes4dc0ntracts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aos_quotes_project_c`;
CREATE TABLE `aos_quotes_project_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `aos_quotes1112_quotes_ida` varchar(36) DEFAULT NULL,
  `aos_quotes7207project_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aos_quotes_project_alt` (`aos_quotes1112_quotes_ida`,`aos_quotes7207project_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aow_actions`;
CREATE TABLE `aow_actions` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `aow_workflow_id` char(36) DEFAULT NULL,
  `action_order` int(255) DEFAULT NULL,
  `action` varchar(100) DEFAULT NULL,
  `parameters` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aow_action_index_workflow_id` (`aow_workflow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aow_conditions`;
CREATE TABLE `aow_conditions` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `aow_workflow_id` char(36) DEFAULT NULL,
  `condition_order` int(255) DEFAULT NULL,
  `module_path` longtext DEFAULT NULL,
  `field` varchar(100) DEFAULT NULL,
  `operator` varchar(100) DEFAULT NULL,
  `value_type` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `aow_conditions_index_workflow_id` (`aow_workflow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aow_processed`;
CREATE TABLE `aow_processed` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `aow_workflow_id` char(36) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Pending',
  PRIMARY KEY (`id`),
  KEY `aow_processed_index_workflow` (`aow_workflow_id`,`status`,`parent_id`,`deleted`),
  KEY `aow_processed_index_status` (`status`),
  KEY `aow_processed_index_workflow_id` (`aow_workflow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aow_processed_aow_actions`;
CREATE TABLE `aow_processed_aow_actions` (
  `id` varchar(36) NOT NULL,
  `aow_processed_id` varchar(36) DEFAULT NULL,
  `aow_action_id` varchar(36) DEFAULT NULL,
  `status` varchar(36) DEFAULT 'Pending',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_aow_processed_aow_actions` (`aow_processed_id`,`aow_action_id`),
  KEY `idx_actid_del_freid` (`aow_action_id`,`deleted`,`aow_processed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aow_workflow`;
CREATE TABLE `aow_workflow` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `flow_module` varchar(100) DEFAULT NULL,
  `flow_run_on` varchar(100) DEFAULT '0',
  `status` varchar(100) DEFAULT 'Active',
  `run_when` varchar(100) DEFAULT 'Always',
  `multiple_runs` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `aow_workflow_index_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `aow_workflow_audit`;
CREATE TABLE `aow_workflow_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_aow_workflow_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `bugs`;
CREATE TABLE `bugs` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `bug_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` varchar(255) DEFAULT NULL,
  `work_log` text DEFAULT NULL,
  `found_in_release` varchar(255) DEFAULT NULL,
  `fixed_in_release` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `product_category` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `bugsnumk` (`bug_number`),
  KEY `bug_number` (`bug_number`),
  KEY `idx_bug_name` (`name`),
  KEY `idx_bugs_assigned_user` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `bugs_audit`;
CREATE TABLE `bugs_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_bugs_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `calls`;
CREATE TABLE `calls` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `duration_hours` int(2) DEFAULT NULL,
  `duration_minutes` int(2) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Planned',
  `direction` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `reminder_time` int(11) DEFAULT -1,
  `email_reminder_time` int(11) DEFAULT -1,
  `email_reminder_sent` tinyint(1) DEFAULT 0,
  `outlook_id` varchar(255) DEFAULT NULL,
  `repeat_type` varchar(36) DEFAULT NULL,
  `repeat_interval` int(3) DEFAULT 1,
  `repeat_dow` varchar(7) DEFAULT NULL,
  `repeat_until` date DEFAULT NULL,
  `repeat_count` int(7) DEFAULT NULL,
  `repeat_parent_id` char(36) DEFAULT NULL,
  `recurring_source` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_call_name` (`name`),
  KEY `idx_status` (`status`),
  KEY `idx_calls_date_start` (`date_start`),
  KEY `idx_calls_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_calls_assigned_del` (`deleted`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `calls_contacts`;
CREATE TABLE `calls_contacts` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_con_call_call` (`call_id`),
  KEY `idx_con_call_con` (`contact_id`),
  KEY `idx_call_contact` (`call_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `calls_leads`;
CREATE TABLE `calls_leads` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `lead_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_lead_call_call` (`call_id`),
  KEY `idx_lead_call_lead` (`lead_id`),
  KEY `idx_call_lead` (`call_id`,`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `calls_reschedule`;
CREATE TABLE `calls_reschedule` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `call_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `calls_reschedule_audit`;
CREATE TABLE `calls_reschedule_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_calls_reschedule_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `calls_users`;
CREATE TABLE `calls_users` (
  `id` varchar(36) NOT NULL,
  `call_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_usr_call_call` (`call_id`),
  KEY `idx_usr_call_usr` (`user_id`),
  KEY `idx_call_users` (`call_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `campaigns`;
CREATE TABLE `campaigns` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `tracker_count` int(11) DEFAULT 0,
  `refer_url` varchar(255) DEFAULT 'http://',
  `tracker_text` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `impressions` int(11) DEFAULT 0,
  `currency_id` char(36) DEFAULT NULL,
  `budget` double DEFAULT NULL,
  `expected_cost` double DEFAULT NULL,
  `actual_cost` double DEFAULT NULL,
  `expected_revenue` double DEFAULT NULL,
  `campaign_type` varchar(100) DEFAULT NULL,
  `objective` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `frequency` varchar(100) DEFAULT NULL,
  `survey_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `camp_auto_tracker_key` (`tracker_key`),
  KEY `idx_campaign_name` (`name`),
  KEY `idx_survey_id` (`survey_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `campaigns_audit`;
CREATE TABLE `campaigns_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_campaigns_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `campaign_log`;
CREATE TABLE `campaign_log` (
  `id` char(36) NOT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `target_tracker_key` varchar(36) DEFAULT NULL,
  `target_id` varchar(36) DEFAULT NULL,
  `target_type` varchar(100) DEFAULT NULL,
  `activity_type` varchar(100) DEFAULT NULL,
  `activity_date` datetime DEFAULT NULL,
  `related_id` varchar(36) DEFAULT NULL,
  `related_type` varchar(100) DEFAULT NULL,
  `archived` tinyint(1) DEFAULT 0,
  `hits` int(11) DEFAULT 0,
  `list_id` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `more_information` varchar(100) DEFAULT NULL,
  `marketing_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_camp_tracker` (`target_tracker_key`),
  KEY `idx_camp_campaign_id` (`campaign_id`),
  KEY `idx_camp_more_info` (`more_information`),
  KEY `idx_target_id` (`target_id`),
  KEY `idx_target_id_deleted` (`target_id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `campaign_trkrs`;
CREATE TABLE `campaign_trkrs` (
  `id` char(36) NOT NULL,
  `tracker_name` varchar(255) DEFAULT NULL,
  `tracker_url` varchar(255) DEFAULT 'http://',
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` char(36) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `is_optout` tinyint(1) DEFAULT 0,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `campaign_tracker_key_idx` (`tracker_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cases`;
CREATE TABLE `cases` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `case_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  `resolution` text DEFAULT NULL,
  `work_log` text DEFAULT NULL,
  `account_id` char(36) DEFAULT NULL,
  `state` varchar(100) DEFAULT 'Open',
  `contact_created_by_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `casesnumk` (`case_number`),
  KEY `case_number` (`case_number`),
  KEY `idx_case_name` (`name`),
  KEY `idx_account_id` (`account_id`),
  KEY `idx_cases_stat_del` (`assigned_user_id`,`status`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cases_audit`;
CREATE TABLE `cases_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cases_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cases_bugs`;
CREATE TABLE `cases_bugs` (
  `id` varchar(36) NOT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_cas_bug_cas` (`case_id`),
  KEY `idx_cas_bug_bug` (`bug_id`),
  KEY `idx_case_bug` (`case_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `category` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `value` text DEFAULT NULL,
  KEY `idx_config_cat` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `config` (`category`, `name`, `value`) VALUES
('system',	'adminwizard',	'1');

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT 0,
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `lawful_basis` text DEFAULT NULL,
  `date_reviewed` date DEFAULT NULL,
  `lawful_basis_source` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `lead_source` varchar(255) DEFAULT NULL,
  `reports_to_id` char(36) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `joomla_account_id` varchar(255) DEFAULT NULL,
  `portal_account_disabled` tinyint(1) DEFAULT NULL,
  `portal_user_type` varchar(100) DEFAULT 'Single',
  PRIMARY KEY (`id`),
  KEY `idx_cont_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_contacts_del_last` (`deleted`,`last_name`),
  KEY `idx_cont_del_reports` (`deleted`,`reports_to_id`,`last_name`),
  KEY `idx_reports_to_id` (`reports_to_id`),
  KEY `idx_del_id_user` (`deleted`,`id`,`assigned_user_id`),
  KEY `idx_cont_assigned` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `contacts_audit`;
CREATE TABLE `contacts_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_contacts_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `contacts_bugs`;
CREATE TABLE `contacts_bugs` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_con_bug_con` (`contact_id`),
  KEY `idx_con_bug_bug` (`bug_id`),
  KEY `idx_contact_bug` (`contact_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `contacts_cases`;
CREATE TABLE `contacts_cases` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_con_case_con` (`contact_id`),
  KEY `idx_con_case_case` (`case_id`),
  KEY `idx_contacts_cases` (`contact_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `contacts_users`;
CREATE TABLE `contacts_users` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_con_users_con` (`contact_id`),
  KEY `idx_con_users_user` (`user_id`),
  KEY `idx_contacts_users` (`contact_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `cron_remove_documents`;
CREATE TABLE `cron_remove_documents` (
  `id` varchar(36) NOT NULL,
  `bean_id` varchar(36) DEFAULT NULL,
  `module` varchar(25) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_cron_remove_document_bean_id` (`bean_id`),
  KEY `idx_cron_remove_document_stamp` (`date_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `currencies`;
CREATE TABLE `currencies` (
  `id` char(36) NOT NULL,
  `name` varchar(36) DEFAULT NULL,
  `symbol` varchar(36) DEFAULT NULL,
  `iso4217` varchar(3) DEFAULT NULL,
  `conversion_rate` double DEFAULT 0,
  `status` varchar(100) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `created_by` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_currency_name` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `custom_fields`;
CREATE TABLE `custom_fields` (
  `bean_id` varchar(36) DEFAULT NULL,
  `set_num` int(11) DEFAULT 0,
  `field0` varchar(255) DEFAULT NULL,
  `field1` varchar(255) DEFAULT NULL,
  `field2` varchar(255) DEFAULT NULL,
  `field3` varchar(255) DEFAULT NULL,
  `field4` varchar(255) DEFAULT NULL,
  `field5` varchar(255) DEFAULT NULL,
  `field6` varchar(255) DEFAULT NULL,
  `field7` varchar(255) DEFAULT NULL,
  `field8` varchar(255) DEFAULT NULL,
  `field9` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  KEY `idx_beanid_set_num` (`bean_id`,`set_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `documents`;
CREATE TABLE `documents` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `document_name` varchar(255) DEFAULT NULL,
  `doc_id` varchar(100) DEFAULT NULL,
  `doc_type` varchar(100) DEFAULT 'Sugar',
  `doc_url` varchar(255) DEFAULT NULL,
  `active_date` date DEFAULT NULL,
  `exp_date` date DEFAULT NULL,
  `category_id` varchar(100) DEFAULT NULL,
  `subcategory_id` varchar(100) DEFAULT NULL,
  `status_id` varchar(100) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  `related_doc_id` char(36) DEFAULT NULL,
  `related_doc_rev_id` char(36) DEFAULT NULL,
  `is_template` tinyint(1) DEFAULT 0,
  `template_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_doc_cat` (`category_id`,`subcategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `documents_accounts`;
CREATE TABLE `documents_accounts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `document_id` varchar(36) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_accounts_account_id` (`account_id`,`document_id`),
  KEY `documents_accounts_document_id` (`document_id`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `documents_bugs`;
CREATE TABLE `documents_bugs` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `document_id` varchar(36) DEFAULT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_bugs_bug_id` (`bug_id`,`document_id`),
  KEY `documents_bugs_document_id` (`document_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `documents_cases`;
CREATE TABLE `documents_cases` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `document_id` varchar(36) DEFAULT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_cases_case_id` (`case_id`,`document_id`),
  KEY `documents_cases_document_id` (`document_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `documents_contacts`;
CREATE TABLE `documents_contacts` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `document_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documents_contacts_contact_id` (`contact_id`,`document_id`),
  KEY `documents_contacts_document_id` (`document_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `documents_opportunities`;
CREATE TABLE `documents_opportunities` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `document_id` varchar(36) DEFAULT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_docu_opps_oppo_id` (`opportunity_id`,`document_id`),
  KEY `idx_docu_oppo_docu_id` (`document_id`,`opportunity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `document_revisions`;
CREATE TABLE `document_revisions` (
  `id` varchar(36) NOT NULL,
  `change_log` varchar(255) DEFAULT NULL,
  `document_id` varchar(36) DEFAULT NULL,
  `doc_id` varchar(100) DEFAULT NULL,
  `doc_type` varchar(100) DEFAULT NULL,
  `doc_url` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `file_ext` varchar(100) DEFAULT NULL,
  `file_mime_type` varchar(100) DEFAULT NULL,
  `revision` varchar(100) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `date_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `documentrevision_mimetype` (`file_mime_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `eapm`;
CREATE TABLE `eapm` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `application` varchar(100) DEFAULT 'webex',
  `api_data` text DEFAULT NULL,
  `consumer_key` varchar(255) DEFAULT NULL,
  `consumer_secret` varchar(255) DEFAULT NULL,
  `oauth_token` varchar(255) DEFAULT NULL,
  `oauth_secret` varchar(255) DEFAULT NULL,
  `validated` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_app_active` (`assigned_user_id`,`application`,`validated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `emailman`;
CREATE TABLE `emailman` (
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `user_id` char(36) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` char(36) DEFAULT NULL,
  `marketing_id` char(36) DEFAULT NULL,
  `list_id` char(36) DEFAULT NULL,
  `send_date_time` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `in_queue` tinyint(1) DEFAULT 0,
  `in_queue_date` datetime DEFAULT NULL,
  `send_attempts` int(11) DEFAULT 0,
  `deleted` tinyint(1) DEFAULT 0,
  `related_id` char(36) DEFAULT NULL,
  `related_type` varchar(100) DEFAULT NULL,
  `related_confirm_opt_in` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_eman_list` (`list_id`,`user_id`,`deleted`),
  KEY `idx_eman_campaign_id` (`campaign_id`),
  KEY `idx_eman_relid_reltype_id` (`related_id`,`related_type`,`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `emails`;
CREATE TABLE `emails` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `orphaned` tinyint(1) DEFAULT NULL,
  `last_synced` datetime DEFAULT NULL,
  `date_sent_received` datetime DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `flagged` tinyint(1) DEFAULT NULL,
  `reply_to_status` tinyint(1) DEFAULT NULL,
  `intent` varchar(100) DEFAULT 'pick',
  `mailbox_id` char(36) DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `category_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_email_name` (`name`),
  KEY `idx_message_id` (`message_id`),
  KEY `idx_email_parent_id` (`parent_id`),
  KEY `idx_email_assigned` (`assigned_user_id`,`type`,`status`),
  KEY `idx_email_cat` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `emails_beans`;
CREATE TABLE `emails_beans` (
  `id` char(36) NOT NULL,
  `email_id` char(36) DEFAULT NULL,
  `bean_id` char(36) DEFAULT NULL,
  `bean_module` varchar(100) DEFAULT NULL,
  `campaign_data` text DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_emails_beans_bean_id` (`bean_id`),
  KEY `idx_emails_beans_email_bean` (`email_id`,`bean_id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `emails_email_addr_rel`;
CREATE TABLE `emails_email_addr_rel` (
  `id` char(36) NOT NULL,
  `email_id` char(36) NOT NULL,
  `address_type` varchar(4) DEFAULT NULL,
  `email_address_id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_eearl_email_id` (`email_id`,`address_type`),
  KEY `idx_eearl_address_id` (`email_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `emails_text`;
CREATE TABLE `emails_text` (
  `email_id` char(36) NOT NULL,
  `from_addr` varchar(250) DEFAULT NULL,
  `reply_to_addr` varchar(250) DEFAULT NULL,
  `to_addrs` text DEFAULT NULL,
  `cc_addrs` text DEFAULT NULL,
  `bcc_addrs` text DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `description_html` longtext DEFAULT NULL,
  `raw_source` longtext DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`email_id`),
  KEY `emails_textfromaddr` (`from_addr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `email_addresses`;
CREATE TABLE `email_addresses` (
  `id` char(36) NOT NULL,
  `email_address` varchar(255) DEFAULT NULL,
  `email_address_caps` varchar(255) DEFAULT NULL,
  `invalid_email` tinyint(1) DEFAULT 0,
  `opt_out` tinyint(1) DEFAULT 0,
  `confirm_opt_in` varchar(255) DEFAULT 'not-opt-in',
  `confirm_opt_in_date` datetime DEFAULT NULL,
  `confirm_opt_in_sent_date` datetime DEFAULT NULL,
  `confirm_opt_in_fail_date` datetime DEFAULT NULL,
  `confirm_opt_in_token` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_ea_caps_opt_out_invalid` (`email_address_caps`,`opt_out`,`invalid_email`),
  KEY `idx_ea_opt_out_invalid` (`email_address`,`opt_out`,`invalid_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=963;

INSERT INTO `email_addresses` (`id`, `email_address`, `email_address_caps`, `invalid_email`, `opt_out`, `confirm_opt_in`, `confirm_opt_in_date`, `confirm_opt_in_sent_date`, `confirm_opt_in_fail_date`, `confirm_opt_in_token`, `date_created`, `date_modified`, `deleted`) VALUES
('11f70f5a-59a3-e369-6e4b-5def48e3f92c',	'AKarmakulova@tsconsulting.com',	'AKARMAKULOVA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2019-12-10 07:26:00',	'2020-10-08 10:06:37',	0),
('13d6576f-12a0-cd2a-f32c-5e7885ed1070',	'aastashenko@tsconsulting.com',	'AASTASHENKO@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-10-02 07:17:43',	0),
('14061357-d1aa-bedf-a763-5e7885f1a99c',	'denivanov@tsconsulting.com',	'DENIVANOV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:42',	0),
('14496c16-dece-71c9-282d-5e788505ad43',	'imilyutin@tsconsulting.com',	'IMILYUTIN@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:42',	0),
('17510d23-af45-d794-1318-5e7a227bbd89',	'asycheva@tsconsulting.com',	'ASYCHEVA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-24 15:07:00',	'2020-07-22 07:23:32',	0),
('1ac99c75-b595-78e1-1158-5e7885d91b39',	'gtsereteli@tsconsulting.com',	'GTSERETELI@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-10-02 07:17:43',	0),
('1b701fa9-39a7-ee1a-4846-5e7885dadd50',	'slushchikov@tsconsulting.com',	'SLUSHCHIKOV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-10-02 07:17:43',	0),
('1bbe384d-a691-e929-6956-5e7885654f2d',	'ekiristova@tsconsulting.com',	'EKIRISTOVA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-10-02 07:17:43',	0),
('1e4e30c4-1fb0-8cc8-de45-5e74d5a039f4',	'omironova@tsconsulting.com',	'OMIRONOVA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-20 14:36:00',	'2020-07-22 07:23:49',	0),
('217cae43-80ca-7a02-7c62-5f0f3a0315de',	'agrigoreva@tsconsulting.com',	'AGRIGOREVA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-07-15 17:19:00',	'2020-10-02 07:17:43',	0),
('2271a3ba-d4c8-1994-3a43-5e7885381d8d',	'aryabov@tsconsulting.com',	'ARYABOV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-10-02 07:17:43',	0),
('229102d5-af0c-c0f8-263d-5e01e9738f57',	'ekozhevnikova@tsconsulting.com',	'EKOZHEVNIKOVA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2019-12-24 10:33:00',	'2020-10-08 10:06:37',	0),
('22f63ee9-feb1-0a49-adf0-5e788534c737',	'sulyanov@tsconsulting.com',	'SULYANOV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:49',	0),
('2a305042-2825-0e31-c546-5e4bef1d09b1',	'emityaeva@tsconsulting.com',	'EMITYAEVA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-02-18 14:08:00',	'2020-07-22 07:23:32',	0),
('2bf3a19e-7230-f947-0cd9-5e78854bd954',	'aavramov@tsconsulting.com',	'AAVRAMOV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:32',	0),
('2c5afa1d-57c7-89c5-1908-5de64498593c',	'truban@tsconsulting.com',	'TRUBAN@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2019-12-03 11:18:00',	'2020-10-08 10:06:37',	0),
('30b811d9-a823-e772-212e-5e78850717e5',	'dmakarov@tsconsulting.com',	'DMAKAROV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-10-02 07:17:43',	0),
('31432458-f1ae-0851-c4df-5e720bf7428d',	'ibaranova@tsconsulting.com',	'IBARANOVA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-18 11:51:00',	'2020-10-08 10:06:37',	0),
('31b11543-79d2-8233-1546-5e26b5ace8ea',	'esmarkova@tsconsulting.com',	'ESMARKOVA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-01-21 08:25:00',	'2020-10-08 10:06:37',	0),
('32dd1864-0396-f526-fe84-5e788530c25c',	'asidorkin@tsconsulting.com',	'ASIDORKIN@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:32',	0),
('32e931bc-91c8-fa37-875b-5e78858cf920',	'aantonov@tsconsulting.com',	'AANTONOV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:32',	0),
('34e0fa51-69d5-03ac-d05c-5f7afccbc63b',	'test.crmmd@mail.ru',	'TEST.CRMMD@MAIL.RU',	0,	0,	'not-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-10-05 11:01:13',	'2020-10-05 11:01:13',	0),
('3728bf28-f236-dad3-864a-5e78852722e1',	'crm@mail.ru',	'CRM@MAIL.RU',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:32',	0),
('3a0ac02f-8f0d-c70d-ef33-5e7885dd7394',	'adenisov@tsconsulting.com',	'ADENISOV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-10-02 07:17:43',	0),
('3d9396a3-1bf7-2029-a1d5-5e7885eb325c',	'nsamokhvalov@tsconsulting.com',	'NSAMOKHVALOV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:42',	0),
('43c7b215-2ce8-c82c-ea51-5e7885f26b19',	'kmorozova@tsconsulting.com',	'KMOROZOVA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:42',	0),
('44b9b470-696e-e38b-c9a6-5e37cdc99049',	'PVodinets@tsconsulting.com',	'PVODINETS@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-02-03 07:35:00',	'2020-10-08 10:06:37',	0),
('495fddde-8dd8-7580-5dd6-5e788521b88e',	'ksokolova@tsconsulting.com',	'KSOKOLOVA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-10-02 07:17:43',	0),
('4a00dea9-14bb-38da-16be-5e788592f3d3',	'aklyanchin@tsconsulting.com',	'AKLYANCHIN@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-10-02 07:17:43',	0),
('4b081998-9f3e-f7ae-05f0-5f0f3a409bad',	'stkachev@tsconsulting.com',	'STKACHEV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-07-15 17:18:00',	'2020-10-02 07:17:43',	0),
('4b6ed296-3e3e-0e84-0d5c-5e7885210ffd',	'nlkazakova@tsconsulting.com',	'NLKAZAKOVA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:42',	0),
('4d4a3638-c1a5-b2be-ff26-5f02e94d3737',	'vledenev@tsconsulting.com',	'VLEDENEV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-07-06 09:06:00',	'2020-07-22 07:23:32',	0),
('4e65564a-fe11-cd16-8457-5de64475b146',	'vfilyaeva@tsconsulting.com',	'VFILYAEVA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2019-12-03 11:19:00',	'2020-10-08 10:06:37',	0),
('4fd0897e-5022-45ba-05ab-5def529d48d9',	'uantonova@tsconsulting.com',	'UANTONOVA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2019-12-10 08:09:00',	'2020-10-08 10:06:37',	0),
('509d32ac-9208-5c73-61ce-5ea6d7e785a3',	'dklimov@tsconsulting.com',	'DKLIMOV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-04-27 13:00:00',	'2020-07-22 07:23:32',	0),
('520c80e2-9783-e679-5279-5e78853c0c06',	'tporoshin@tsconsulting.com',	'TPOROSHIN@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:49',	0),
('57495aea-7d59-6dcf-74c2-5e78858fe430',	'kmaseykin@tsconsulting.com',	'KMASEYKIN@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-10-02 07:17:43',	0),
('581cc523-87df-6523-a4c9-5e7885f1425c',	'alyubushkin@tsconsulting.com',	'ALYUBUSHKIN@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:32',	0),
('589fb353-fc3d-ba9a-13ad-5e7885ec6bb1',	'imarvanov@tsconsulting.com',	'IMARVANOV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-10-02 07:17:43',	0),
('5d72338b-9cb5-7ee0-fe4e-5e7885b20777',	'amarkarov@tsconsulting.com',	'AMARKAROV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-10-02 07:17:43',	0),
('5f3f5fc3-08d8-6a90-3e29-5e031d13171f',	'oshchetkin@tsconsulting.com',	'OSHCHETKIN@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2019-12-25 08:26:00',	'2020-10-08 10:06:37',	0),
('605537f7-24b0-52e1-8bab-5eb294fc7f53',	'sbarysheva@tsconsulting.com',	'SBARYSHEVA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-05-06 10:43:00',	'2020-10-02 07:17:43',	0),
('60c36210-ac73-1179-754a-5e7885150815',	'test@mail.ru',	'TEST@MAIL.RU',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-10-08 10:06:37',	0),
('63960d77-49d1-f4e7-e2ae-5e7885f58c42',	'avaleev@tsconsulting.com',	'AVALEEV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:32',	0),
('69aeea15-90ca-c495-1f68-5e7885f3451c',	'akrasilnikov@tsconsulting.com',	'AKRASILNIKOV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-10-02 07:17:43',	0),
('6fc00f7e-c09c-6283-338e-5e7885e8a7d4',	'ysnikolaev@tsconsulting.com',	'YSNIKOLAEV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:49',	0),
('704ba875-6bad-5feb-76a8-5e67ae882d3f',	'jmugapparova@tsconsulting.com',	'JMUGAPPAROVA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-10 15:14:00',	'2020-10-02 07:17:43',	0),
('70ba3b58-bc0d-aca8-caa2-5e7885f73047',	'eschelkonogova@tsconsulting.com',	'ESCHELKONOGOVA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:42',	0),
('73f700fd-c0b0-b976-7fd2-5e78859ec93e',	'vfink@tsconsulting.com',	'VFINK@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:42',	0),
('74970f84-8d9f-a196-bc96-5e78855ef473',	'iproshina@tsconsulting.com',	'IPROSHINA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:42',	0),
('75aca09b-50e8-4079-4fd8-5e9d9d161a7b',	'asozdatelev@tsconsulting.com',	'ASOZDATELEV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-04-20 13:01:00',	'2020-07-22 07:23:32',	0),
('75b8eb8e-c746-d3b5-32b9-5e78853f003e',	'mkozin@tsconsulting.com',	'MKOZIN@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-10-02 07:17:43',	0),
('7831d363-6f22-2e08-db5b-5e78850e7da5',	'kstepanov@tsconsulting.com',	'KSTEPANOV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-10-02 07:17:43',	0),
('7ced250c-d6a3-9609-439e-5e788561db48',	'odenisova@tsconsulting.com',	'ODENISOVA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-10-08 10:06:37',	0),
('805b555c-89bf-0a11-03c6-5e7885442e51',	'atarasova@tsconsulting.com',	'ATARASOVA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-10-02 07:17:43',	0),
('8356ca86-48e0-caef-4914-5e788552e4b6',	'aakolesnikov@tsconsulting.com',	'AAKOLESNIKOV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-10-02 07:17:43',	0),
('857bedac-711f-bb42-6a0b-5e7885cc8028',	'admin@mail.ru',	'ADMIN@MAIL.RU',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-09-28 07:17:10',	0),
('86b0d8a9-f174-d29e-7409-5e788521fb20',	'akatrich@tsconsulting.com',	'AKATRICH@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:32',	0),
('8a014982-9291-9b12-6fe1-5e62614931f4',	'ksnovikov@tsconsulting.com',	'KSNOVIKOV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-06 14:44:00',	'2020-07-22 07:23:32',	0),
('8c9d708b-70f6-83c7-bdb0-5e7885f760d9',	'kkeglev@tsconsulting.com',	'KKEGLEV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:42',	0),
('8d1d7ae3-32e2-38ad-61d5-5e7885673370',	'dmakarovskiy@tsconsulting.com',	'DMAKAROVSKIY@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:42',	0),
('8f2d07d7-8895-657e-c318-5e26b831c0e2',	'ikolchanova@tsconsulting.com',	'IKOLCHANOVA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-01-21 08:39:00',	'2020-10-08 10:06:37',	0),
('91234b37-42f3-bade-a3c0-5e78858a958b',	'ovlasenko@tsconsulting.com',	'OVLASENKO@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:42',	0),
('93773b8f-9ecc-349c-36bc-5e7885d9f7ea',	'vmironova@tsconsulting.com',	'VMIRONOVA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:42',	0),
('93806800-202b-dd41-84dc-5e7885af5ded',	'ibannov@tsconsulting.com',	'IBANNOV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-10-02 07:17:43',	0),
('963192e6-116d-1b76-929b-5e05db3e3657',	'vpisareva@tsconsulting.com',	'VPISAREVA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2019-12-27 10:22:00',	'2020-10-08 10:06:37',	0),
('9797158f-d68a-2a6a-4d7c-5e7885ecb54b',	'akolobov@tsconsulting.com',	'AKOLOBOV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-10-02 07:17:43',	0),
('9a0df5e0-6c57-0c2b-6e2b-5e7885b46d40',	'rurmanov@tsconsulting.com',	'RURMANOV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:49',	0),
('9aa845b7-2e58-2487-38d9-5e26b6cd4aa7',	'edorokhova@tsconsulting.com',	'EDOROKHOVA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-01-21 08:28:00',	'2020-10-08 10:06:37',	0),
('9bfbacea-b6e5-bc33-6e38-5ece606f90ec',	'mbondarenko@tsconsulting.com',	'MBONDARENKO@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-05-27 12:43:00',	'2020-07-22 07:23:32',	0),
('9e05e464-5643-fdc5-783c-5e7885c1f347',	'rpavlenko@tsconsulting.com',	'RPAVLENKO@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:49',	0),
('a071293f-e894-6d11-19a6-5e7885e37207',	'amaximkin@tsconsulting.com',	'AMAXIMKIN@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:32',	0),
('a421967a-cae0-80ea-d138-5e7885e1be12',	'1@mail.ru',	'1@MAIL.RU',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:49',	0),
('a5a50a42-3c02-a77d-4ce0-5e788595f2e3',	'VPrazdnikov@tsconsulting.com',	'VPRAZDNIKOV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-10-08 10:06:37',	0),
('a6ab6560-4fd0-fefc-da43-5e7885b86617',	'vvoronov@tsconsulting.com',	'VVORONOV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:42',	0),
('a760fbe6-02d2-95d1-8ea6-5de64ca9e949',	'rkhachaturian@tsconsulting.com',	'RKHACHATURIAN@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2019-12-03 11:54:00',	'2020-10-08 10:06:37',	0),
('a9e74028-dcd1-dfa3-715b-5e01eac6f306',	'esoboleva@tsconsulting.com',	'ESOBOLEVA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2019-12-24 10:36:00',	'2020-10-08 10:06:37',	0),
('ac1493c4-957e-d747-db6a-5e788520efe7',	'avspirin@tsconsulting.com',	'AVSPIRIN@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:42',	0),
('aca003a8-bc49-b835-db7a-5e7885857fe9',	'rleonov@tsconsulting.com',	'RLEONOV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-10-02 07:17:43',	0),
('ad072fc6-8ce5-4afc-ad41-5e78858cf0bc',	'aakuznetsov@tsconsulting.com',	'AAKUZNETSOV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-10-02 07:17:43',	0),
('b0b7d0be-27cb-0ca2-c0af-5ea939ee0bea',	'dsedov@tsconsulting.com',	'DSEDOV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-04-29 08:22:00',	'2020-07-22 07:23:42',	0),
('b2f634ce-bf8b-ef68-c4b6-5e78855dfdc0',	'isemenov@tsconsulting.com',	'ISEMENOV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:42',	0),
('b3791c10-61a0-7413-b930-5e788581e408',	'ymatsigin@tsconsulting.com',	'YMATSIGIN@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:49',	0),
('b3e63ae0-fd29-eca4-b65b-5e78855b3dea',	'aakuptsova@tsconsulting.com',	'AAKUPTSOVA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-10-02 07:17:43',	0),
('b9d80d5f-4939-09bb-445b-5e7885806c06',	'edenisova@tsconsulting.com',	'EDENISOVA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-10-02 07:17:43',	0),
('b9f4dbf4-2f1e-4f3e-08d1-5e6a37a88ccb',	'kkuznetsov@tsconsulting.com',	'KKUZNETSOV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-12 13:22:00',	'2020-07-22 07:23:32',	0),
('ba28c5c5-67c4-bfbf-34d0-5e7885ca1ba5',	'nkiryukhin@tsconsulting.com',	'NKIRYUKHIN@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-10-02 07:17:43',	0),
('bb47d066-dd39-4827-b4ce-5e7885a8dcaa',	'dpletenev@tsconsulting.com',	'DPLETENEV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-10-02 07:17:43',	0),
('bfed39ec-a02d-176d-b075-5e74d3b98106',	'null',	'NULL',	0,	0,	'not-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-20 14:32:10',	'2020-03-20 14:32:10',	0),
('c17dcad0-2eac-b52e-7b48-5e7885235840',	'5@mail.ru',	'5@MAIL.RU',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:32',	0),
('c325792e-036a-8b3d-1d76-5e676942a380',	'ikostichan@tsconsulting.com',	'IKOSTICHAN@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-10 10:19:00',	'2020-10-08 10:06:37',	0),
('c39e4434-ba70-e13a-4515-5e7885a949ea',	'taubova@tsconsulting.com',	'TAUBOVA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-10-08 10:06:37',	0),
('c4068cf7-86a9-c676-4222-5e74d3d844c4',	'rmaslennikov@tsconsulting.com',	'RMASLENNIKOV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-20 14:32:00',	'2020-10-08 10:06:37',	0),
('c54305ad-fc39-8116-5b80-5e78856f8430',	'asavchuk@tsconsulting.com',	'ASAVCHUK@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-10-02 07:17:43',	0),
('c74943b8-a142-af39-7fef-5e7885a63037',	'tdasmaeva@tsconsulting.com',	'TDASMAEVA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:49',	0),
('c80fe4a1-af3c-cc31-f974-5e788539944d',	'dklokov@tsconsulting.com',	'DKLOKOV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:42',	0),
('c82084d7-0485-8148-e9a9-5e78a1bd69a5',	'yfedorova@tsconsulting.com',	'YFEDOROVA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 11:44:00',	'2020-10-08 10:06:37',	0),
('cb038530-b3d1-fb93-01c9-5e788542a560',	'lkrasovskikh@tsconsulting.com',	'LKRASOVSKIKH@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-10-02 07:17:43',	0),
('cbcf345f-afd8-b528-4cd3-5e01e916949b',	'atemlyantsev@tsconsulting.com',	'ATEMLYANTSEV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2019-12-24 10:34:00',	'2020-10-08 10:06:37',	0),
('cd46c338-b355-de22-e23a-5e7885de556f',	'kschukin@tsconsulting.com',	'KSCHUKIN@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-10-02 07:17:43',	0),
('cdddd29b-fd0c-7799-7f49-5def48dfecff',	'emakhmutova@tsconsulting.com',	'EMAKHMUTOVA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2019-12-10 07:27:00',	'2020-10-08 10:06:37',	0),
('ce3146e4-5f8b-23a7-4580-5e7885f616fe',	'dderbentsov@tsconsulting.com',	'DDERBENTSOV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-10-02 07:17:43',	0),
('d0d950c2-f1e0-420b-63fc-5e16e6dba08b',	'AHamaganova@tsconsulting.com',	'AHAMAGANOVA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-01-09 08:39:00',	'2020-10-08 10:06:37',	0),
('d254f250-54f5-ea56-2bd9-5e7885c138f4',	'egorshkov@tsconsulting.com',	'EGORSHKOV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-10-02 07:17:43',	0),
('d3a2d7e9-ad49-2867-c2d6-5e78857361c9',	'nsimagina@tsconsulting.com',	'NSIMAGINA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:42',	0),
('d5245a11-f9bb-a9da-003a-5e7885bff435',	'kignatenkov@tsconsulting.com',	'KIGNATENKOV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-10-02 07:17:43',	0),
('d64c348a-19ce-9193-d7d2-5f0f3a776948',	'mstarov@tsconsulting.com',	'MSTAROV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-07-15 17:20:00',	'2020-10-02 07:17:43',	0),
('d7265f54-cfbc-3019-9573-5e42784ee802',	'vbatrakova@tsconsulting.com',	'VBATRAKOVA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-02-11 09:50:00',	'2020-07-22 07:23:32',	0),
('d9a70ab5-3c96-e8d3-fff9-5e7885ec2b66',	'eillarionov@tsconsulting.com',	'EILLARIONOV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-10-02 07:17:43',	0),
('d9e1f787-a72c-3a74-0a32-5e78851498eb',	'TKurbanova@tsconsulting.com',	'TKURBANOVA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:49',	0),
('da260b11-d17c-1e19-8abf-5e7885048765',	'atubalitsev@tsconsulting.com',	'ATUBALITSEV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-10-02 07:17:43',	0),
('dec68b6f-fe6e-fa86-ce80-5eeb6896aaae',	'azybenkov@tsconsulting.com',	'AZYBENKOV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-06-18 13:13:00',	'2020-10-08 10:06:37',	0),
('e03dde5a-bfb1-78d7-06a1-5e7885c9502c',	'ipravsky@tsconsulting.com',	'IPRAVSKY@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:42',	0),
('e22b19a8-355b-1b4c-ee18-5e78854e9757',	'aroschin@tsconsulting.com',	'AROSCHIN@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-10-06 09:33:37',	0),
('e4b5e410-a7c6-bc78-fe43-5e2ae58875b9',	'obelousova@tsconsulting.com',	'OBELOUSOVA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-01-24 12:37:00',	'2020-10-08 10:06:37',	0),
('e69e950a-6137-1be3-07e4-5e7885e8b7ad',	'dshohalevich@tsconsulting.com',	'DSHOHALEVICH@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:42',	0),
('e87fa440-a19d-9065-e0b4-5de6457f3dba',	'kselezneva@tsconsulting.com',	'KSELEZNEVA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2019-12-03 11:22:00',	'2020-10-08 10:06:37',	0),
('e97a9fc0-2a5d-76eb-dbd9-5e7885e08055',	'ikudryavtsev@tsconsulting.com',	'IKUDRYAVTSEV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:42',	0),
('eb3b7033-f75e-e51d-7310-5e7885f378de',	'pfrunza@tsconsulting.com',	'PFRUNZA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:49',	0),
('ed419ad1-db77-9a35-9cec-5e78ccbf97ce',	'hr-crm@tsconsulting.com',	'HR-CRM@TSCONSULTING.COM',	0,	0,	'not-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 14:48:39',	'2020-03-23 14:48:39',	0),
('ed8758d5-57f7-f641-0e9b-5ec238b86394',	'tbordyugova@tsconsulting.com',	'TBORDYUGOVA@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-05-18 07:25:00',	'2020-10-08 10:06:37',	0),
('ee1af645-afc8-cdc2-c841-5e7885a490f2',	'bminakov@tsconsulting.com',	'BMINAKOV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:32',	0),
('ee53cc4b-212f-7f29-3c26-5e6a3a37f4f1',	'isychev@tsconsulting.com',	'ISYCHEV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-12 13:36:00',	'2020-10-02 07:17:43',	0),
('f0c9402f-3eaa-3226-3d18-5e78857bf4e7',	'starasov@tsconsulting.com',	'STARASOV@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:49',	0),
('f38dc82f-b7ae-16b8-ebfa-5e78858f820e',	'ametelin@tsconsulting.com',	'AMETELIN@TSCONSULTING.COM',	0,	0,	'confirmed-opt-in',	NULL,	NULL,	NULL,	NULL,	'2020-03-23 09:44:00',	'2020-07-22 07:23:42',	0);

DROP TABLE IF EXISTS `email_addresses_audit`;
CREATE TABLE `email_addresses_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_email_addresses_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `email_addr_bean_rel`;
CREATE TABLE `email_addr_bean_rel` (
  `id` char(36) NOT NULL,
  `email_address_id` char(36) NOT NULL,
  `bean_id` char(36) NOT NULL,
  `bean_module` varchar(100) DEFAULT NULL,
  `primary_address` tinyint(1) DEFAULT 0,
  `reply_to_address` tinyint(1) DEFAULT 0,
  `date_created` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_email_address_id` (`email_address_id`),
  KEY `idx_bean_id` (`bean_id`,`bean_module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `email_cache`;
CREATE TABLE `email_cache` (
  `ie_id` char(36) DEFAULT NULL,
  `mbox` varchar(60) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `fromaddr` varchar(100) DEFAULT NULL,
  `toaddr` varchar(255) DEFAULT NULL,
  `senddate` datetime DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  `mailsize` int(10) unsigned DEFAULT NULL,
  `imap_uid` int(10) unsigned DEFAULT NULL,
  `msgno` int(10) unsigned DEFAULT NULL,
  `recent` tinyint(4) DEFAULT NULL,
  `flagged` tinyint(4) DEFAULT NULL,
  `answered` tinyint(4) DEFAULT NULL,
  `deleted` tinyint(4) DEFAULT NULL,
  `seen` tinyint(4) DEFAULT NULL,
  `draft` tinyint(4) DEFAULT NULL,
  KEY `idx_ie_id` (`ie_id`),
  KEY `idx_mail_date` (`ie_id`,`mbox`,`senddate`),
  KEY `idx_mail_from` (`ie_id`,`mbox`,`fromaddr`),
  KEY `idx_mail_subj` (`subject`),
  KEY `idx_mail_to` (`toaddr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `email_marketing`;
CREATE TABLE `email_marketing` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `from_name` varchar(100) DEFAULT NULL,
  `from_addr` varchar(100) DEFAULT NULL,
  `reply_to_name` varchar(100) DEFAULT NULL,
  `reply_to_addr` varchar(100) DEFAULT NULL,
  `inbound_email_id` varchar(36) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `template_id` char(36) NOT NULL,
  `status` varchar(100) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `outbound_email_id` char(36) DEFAULT NULL,
  `all_prospect_lists` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_emmkt_name` (`name`),
  KEY `idx_emmkit_del` (`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `email_marketing_prospect_lists`;
CREATE TABLE `email_marketing_prospect_lists` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `email_marketing_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `email_mp_prospects` (`email_marketing_id`,`prospect_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `email_templates`;
CREATE TABLE `email_templates` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `published` varchar(3) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `body` longtext DEFAULT NULL,
  `body_html` longtext DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `text_only` tinyint(1) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_email_template_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `favorites`;
CREATE TABLE `favorites` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fields_meta_data`;
CREATE TABLE `fields_meta_data` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `vname` varchar(255) DEFAULT NULL,
  `comments` varchar(255) DEFAULT NULL,
  `help` varchar(255) DEFAULT NULL,
  `custom_module` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `len` int(11) DEFAULT NULL,
  `required` tinyint(1) DEFAULT 0,
  `default_value` varchar(255) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `audited` tinyint(1) DEFAULT 0,
  `massupdate` tinyint(1) DEFAULT 0,
  `duplicate_merge` smallint(6) DEFAULT 0,
  `reportable` tinyint(1) DEFAULT 1,
  `importable` varchar(255) DEFAULT NULL,
  `ext1` varchar(255) DEFAULT NULL,
  `ext2` varchar(255) DEFAULT NULL,
  `ext3` varchar(255) DEFAULT NULL,
  `ext4` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_meta_id_del` (`id`,`deleted`),
  KEY `idx_meta_cm_del` (`custom_module`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `folders`;
CREATE TABLE `folders` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `folder_type` varchar(25) DEFAULT NULL,
  `parent_folder` char(36) DEFAULT NULL,
  `has_child` tinyint(1) DEFAULT 0,
  `is_group` tinyint(1) DEFAULT 0,
  `is_dynamic` tinyint(1) DEFAULT 0,
  `dynamic_query` text DEFAULT NULL,
  `assign_to_id` char(36) DEFAULT NULL,
  `created_by` char(36) NOT NULL,
  `modified_by` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_parent_folder` (`parent_folder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `folders_rel`;
CREATE TABLE `folders_rel` (
  `id` char(36) NOT NULL,
  `folder_id` char(36) NOT NULL,
  `polymorphic_module` varchar(25) DEFAULT NULL,
  `polymorphic_id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_poly_module_poly_id` (`polymorphic_module`,`polymorphic_id`),
  KEY `idx_fr_id_deleted_poly` (`folder_id`,`deleted`,`polymorphic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `folders_subscriptions`;
CREATE TABLE `folders_subscriptions` (
  `id` char(36) NOT NULL,
  `folder_id` char(36) NOT NULL,
  `assigned_user_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_folder_id_assigned_user_id` (`folder_id`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fp_events`;
CREATE TABLE `fp_events` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `duration_hours` int(3) DEFAULT NULL,
  `duration_minutes` int(2) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `budget` decimal(26,6) DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `invite_templates` varchar(100) DEFAULT NULL,
  `accept_redirect` varchar(255) DEFAULT NULL,
  `decline_redirect` varchar(255) DEFAULT NULL,
  `activity_status_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fp_events_audit`;
CREATE TABLE `fp_events_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_fp_events_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fp_events_contacts_c`;
CREATE TABLE `fp_events_contacts_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `fp_events_contactsfp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_contactscontacts_idb` varchar(36) DEFAULT NULL,
  `invite_status` varchar(25) DEFAULT 'Not Invited',
  `accept_status` varchar(25) DEFAULT 'No Response',
  `email_responded` int(2) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fp_events_contacts_alt` (`fp_events_contactsfp_events_ida`,`fp_events_contactscontacts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fp_events_fp_event_delegates_1_c`;
CREATE TABLE `fp_events_fp_event_delegates_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `fp_events_fp_event_delegates_1fp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_fp_event_delegates_1fp_event_delegates_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fp_events_fp_event_delegates_1_ida1` (`fp_events_fp_event_delegates_1fp_events_ida`),
  KEY `fp_events_fp_event_delegates_1_alt` (`fp_events_fp_event_delegates_1fp_event_delegates_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fp_events_fp_event_locations_1_c`;
CREATE TABLE `fp_events_fp_event_locations_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `fp_events_fp_event_locations_1fp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_fp_event_locations_1fp_event_locations_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fp_events_fp_event_locations_1_alt` (`fp_events_fp_event_locations_1fp_events_ida`,`fp_events_fp_event_locations_1fp_event_locations_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fp_events_leads_1_c`;
CREATE TABLE `fp_events_leads_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `fp_events_leads_1fp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_leads_1leads_idb` varchar(36) DEFAULT NULL,
  `invite_status` varchar(25) DEFAULT 'Not Invited',
  `accept_status` varchar(25) DEFAULT 'No Response',
  `email_responded` int(2) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fp_events_leads_1_alt` (`fp_events_leads_1fp_events_ida`,`fp_events_leads_1leads_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fp_events_prospects_1_c`;
CREATE TABLE `fp_events_prospects_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `fp_events_prospects_1fp_events_ida` varchar(36) DEFAULT NULL,
  `fp_events_prospects_1prospects_idb` varchar(36) DEFAULT NULL,
  `invite_status` varchar(25) DEFAULT 'Not Invited',
  `accept_status` varchar(25) DEFAULT 'No Response',
  `email_responded` int(2) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `fp_events_prospects_1_alt` (`fp_events_prospects_1fp_events_ida`,`fp_events_prospects_1prospects_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fp_event_locations`;
CREATE TABLE `fp_event_locations` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `address_city` varchar(100) DEFAULT NULL,
  `address_country` varchar(100) DEFAULT NULL,
  `address_postalcode` varchar(20) DEFAULT NULL,
  `address_state` varchar(100) DEFAULT NULL,
  `capacity` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fp_event_locations_audit`;
CREATE TABLE `fp_event_locations_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_fp_event_locations_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `fp_event_locations_fp_events_1_c`;
CREATE TABLE `fp_event_locations_fp_events_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `fp_event_locations_fp_events_1fp_event_locations_ida` varchar(36) DEFAULT NULL,
  `fp_event_locations_fp_events_1fp_events_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fp_event_locations_fp_events_1_ida1` (`fp_event_locations_fp_events_1fp_event_locations_ida`),
  KEY `fp_event_locations_fp_events_1_alt` (`fp_event_locations_fp_events_1fp_events_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `import_maps`;
CREATE TABLE `import_maps` (
  `id` char(36) NOT NULL,
  `name` varchar(254) DEFAULT NULL,
  `source` varchar(36) DEFAULT NULL,
  `enclosure` varchar(1) DEFAULT ' ',
  `delimiter` varchar(1) DEFAULT ',',
  `module` varchar(36) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `default_values` text DEFAULT NULL,
  `has_header` tinyint(1) DEFAULT 1,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `is_published` varchar(3) DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `idx_owner_module_name` (`assigned_user_id`,`module`,`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `inbound_email`;
CREATE TABLE `inbound_email` (
  `id` varchar(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Active',
  `server_url` varchar(100) DEFAULT NULL,
  `email_user` varchar(100) DEFAULT NULL,
  `email_password` varchar(100) DEFAULT NULL,
  `port` int(5) DEFAULT NULL,
  `service` varchar(50) DEFAULT NULL,
  `mailbox` text DEFAULT NULL,
  `delete_seen` tinyint(1) DEFAULT 0,
  `mailbox_type` varchar(10) DEFAULT NULL,
  `template_id` char(36) DEFAULT NULL,
  `stored_options` text DEFAULT NULL,
  `group_id` char(36) DEFAULT NULL,
  `is_personal` tinyint(1) DEFAULT 0,
  `groupfolder_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `inbound_email_autoreply`;
CREATE TABLE `inbound_email_autoreply` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `autoreplied_to` varchar(100) DEFAULT NULL,
  `ie_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ie_autoreplied_to` (`autoreplied_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `inbound_email_cache_ts`;
CREATE TABLE `inbound_email_cache_ts` (
  `id` varchar(255) NOT NULL,
  `ie_timestamp` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `jjwg_address_cache`;
CREATE TABLE `jjwg_address_cache` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `lat` float(10,8) DEFAULT NULL,
  `lng` float(11,8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `jjwg_address_cache_audit`;
CREATE TABLE `jjwg_address_cache_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_jjwg_address_cache_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `jjwg_areas`;
CREATE TABLE `jjwg_areas` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `coordinates` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `jjwg_areas_audit`;
CREATE TABLE `jjwg_areas_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_jjwg_areas_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `jjwg_maps`;
CREATE TABLE `jjwg_maps` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `distance` float(9,4) DEFAULT NULL,
  `unit_type` varchar(100) DEFAULT 'mi',
  `module_type` varchar(100) DEFAULT 'Accounts',
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `jjwg_maps_audit`;
CREATE TABLE `jjwg_maps_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_jjwg_maps_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `jjwg_maps_jjwg_areas_c`;
CREATE TABLE `jjwg_maps_jjwg_areas_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `jjwg_maps_5304wg_maps_ida` varchar(36) DEFAULT NULL,
  `jjwg_maps_41f2g_areas_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jjwg_maps_jjwg_areas_alt` (`jjwg_maps_5304wg_maps_ida`,`jjwg_maps_41f2g_areas_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `jjwg_maps_jjwg_markers_c`;
CREATE TABLE `jjwg_maps_jjwg_markers_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `jjwg_maps_b229wg_maps_ida` varchar(36) DEFAULT NULL,
  `jjwg_maps_2e31markers_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `jjwg_maps_jjwg_markers_alt` (`jjwg_maps_b229wg_maps_ida`,`jjwg_maps_2e31markers_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `jjwg_markers`;
CREATE TABLE `jjwg_markers` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `jjwg_maps_lat` float(10,8) DEFAULT 0.00000000,
  `jjwg_maps_lng` float(11,8) DEFAULT 0.00000000,
  `marker_image` varchar(100) DEFAULT 'company',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `jjwg_markers_audit`;
CREATE TABLE `jjwg_markers_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_jjwg_markers_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `job_queue`;
CREATE TABLE `job_queue` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `scheduler_id` char(36) DEFAULT NULL,
  `execute_time` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `resolution` varchar(20) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `data` text DEFAULT NULL,
  `requeue` tinyint(1) DEFAULT 0,
  `retry_count` tinyint(4) DEFAULT NULL,
  `failure_count` tinyint(4) DEFAULT NULL,
  `job_delay` int(11) DEFAULT NULL,
  `client` varchar(255) DEFAULT NULL,
  `percent_complete` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_status_scheduler` (`status`,`scheduler_id`),
  KEY `idx_status_time` (`status`,`execute_time`,`date_entered`),
  KEY `idx_status_entered` (`status`,`date_entered`),
  KEY `idx_status_modified` (`status`,`date_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `leads`;
CREATE TABLE `leads` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT 0,
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `lawful_basis` text DEFAULT NULL,
  `date_reviewed` date DEFAULT NULL,
  `lawful_basis_source` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `converted` tinyint(1) DEFAULT 0,
  `refered_by` varchar(100) DEFAULT NULL,
  `lead_source` varchar(100) DEFAULT NULL,
  `lead_source_description` text DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `status_description` text DEFAULT NULL,
  `reports_to_id` char(36) DEFAULT NULL,
  `account_name` varchar(255) DEFAULT NULL,
  `account_description` text DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `account_id` char(36) DEFAULT NULL,
  `opportunity_id` char(36) DEFAULT NULL,
  `opportunity_name` varchar(255) DEFAULT NULL,
  `opportunity_amount` varchar(50) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `portal_name` varchar(255) DEFAULT NULL,
  `portal_app` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_lead_acct_name_first` (`account_name`,`deleted`),
  KEY `idx_lead_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_lead_del_stat` (`last_name`,`status`,`deleted`,`first_name`),
  KEY `idx_lead_opp_del` (`opportunity_id`,`deleted`),
  KEY `idx_leads_acct_del` (`account_id`,`deleted`),
  KEY `idx_del_user` (`deleted`,`assigned_user_id`),
  KEY `idx_lead_assigned` (`assigned_user_id`),
  KEY `idx_lead_contact` (`contact_id`),
  KEY `idx_reports_to` (`reports_to_id`),
  KEY `idx_lead_phone_work` (`phone_work`),
  KEY `idx_leads_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `leads_audit`;
CREATE TABLE `leads_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_leads_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `linked_documents`;
CREATE TABLE `linked_documents` (
  `id` varchar(36) NOT NULL,
  `parent_id` varchar(36) DEFAULT NULL,
  `parent_type` varchar(25) DEFAULT NULL,
  `document_id` varchar(36) DEFAULT NULL,
  `document_revision_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_parent_document` (`parent_type`,`parent_id`,`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `meetings`;
CREATE TABLE `meetings` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `join_url` varchar(200) DEFAULT NULL,
  `host_url` varchar(400) DEFAULT NULL,
  `displayed_url` varchar(400) DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `external_id` varchar(50) DEFAULT NULL,
  `duration_hours` int(3) DEFAULT NULL,
  `duration_minutes` int(2) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `parent_type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Planned',
  `type` varchar(255) DEFAULT 'Sugar',
  `parent_id` char(36) DEFAULT NULL,
  `reminder_time` int(11) DEFAULT -1,
  `email_reminder_time` int(11) DEFAULT -1,
  `email_reminder_sent` tinyint(1) DEFAULT 0,
  `outlook_id` varchar(255) DEFAULT NULL,
  `sequence` int(11) DEFAULT 0,
  `repeat_type` varchar(36) DEFAULT NULL,
  `repeat_interval` int(3) DEFAULT 1,
  `repeat_dow` varchar(7) DEFAULT NULL,
  `repeat_until` date DEFAULT NULL,
  `repeat_count` int(7) DEFAULT NULL,
  `repeat_parent_id` char(36) DEFAULT NULL,
  `recurring_source` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mtg_name` (`name`),
  KEY `idx_meet_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_meet_stat_del` (`assigned_user_id`,`status`,`deleted`),
  KEY `idx_meet_date_start` (`date_start`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `meetings_contacts`;
CREATE TABLE `meetings_contacts` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_con_mtg_mtg` (`meeting_id`),
  KEY `idx_con_mtg_con` (`contact_id`),
  KEY `idx_meeting_contact` (`meeting_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `meetings_leads`;
CREATE TABLE `meetings_leads` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `lead_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_lead_meeting_meeting` (`meeting_id`),
  KEY `idx_lead_meeting_lead` (`lead_id`),
  KEY `idx_meeting_lead` (`meeting_id`,`lead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `meetings_users`;
CREATE TABLE `meetings_users` (
  `id` varchar(36) NOT NULL,
  `meeting_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `required` varchar(1) DEFAULT '1',
  `accept_status` varchar(25) DEFAULT 'none',
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_usr_mtg_mtg` (`meeting_id`),
  KEY `idx_usr_mtg_usr` (`user_id`),
  KEY `idx_meeting_users` (`meeting_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `notes`;
CREATE TABLE `notes` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `file_mime_type` varchar(100) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `portal_flag` tinyint(1) DEFAULT NULL,
  `embed_flag` tinyint(1) DEFAULT 0,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_note_name` (`name`),
  KEY `idx_notes_parent` (`parent_id`,`parent_type`),
  KEY `idx_note_contact` (`contact_id`),
  KEY `idx_notes_assigned_del` (`deleted`,`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `oauth2clients`;
CREATE TABLE `oauth2clients` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `secret` varchar(4000) DEFAULT NULL,
  `redirect_url` varchar(255) DEFAULT NULL,
  `is_confidential` tinyint(1) DEFAULT 1,
  `allowed_grant_type` varchar(255) DEFAULT 'password',
  `duration_value` int(11) DEFAULT NULL,
  `duration_amount` int(11) DEFAULT NULL,
  `duration_unit` varchar(255) DEFAULT 'Duration Unit',
  `assigned_user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `oauth2tokens`;
CREATE TABLE `oauth2tokens` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `token_is_revoked` tinyint(1) DEFAULT NULL,
  `token_type` varchar(255) DEFAULT NULL,
  `access_token_expires` datetime DEFAULT NULL,
  `access_token` varchar(4000) DEFAULT NULL,
  `refresh_token` varchar(4000) DEFAULT NULL,
  `refresh_token_expires` datetime DEFAULT NULL,
  `grant_type` varchar(255) DEFAULT NULL,
  `state` varchar(1024) DEFAULT NULL,
  `client` char(36) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `oauth_consumer`;
CREATE TABLE `oauth_consumer` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `c_key` varchar(255) DEFAULT NULL,
  `c_secret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ckey` (`c_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `oauth_nonce`;
CREATE TABLE `oauth_nonce` (
  `conskey` varchar(32) NOT NULL,
  `nonce` varchar(32) NOT NULL,
  `nonce_ts` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`conskey`,`nonce`),
  KEY `oauth_nonce_keyts` (`conskey`,`nonce_ts`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `oauth_tokens`;
CREATE TABLE `oauth_tokens` (
  `id` char(36) NOT NULL,
  `secret` varchar(32) DEFAULT NULL,
  `tstate` varchar(1) DEFAULT NULL,
  `consumer` char(36) NOT NULL,
  `token_ts` bigint(20) DEFAULT NULL,
  `verify` varchar(32) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `callback_url` varchar(255) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`,`deleted`),
  KEY `oauth_state_ts` (`tstate`,`token_ts`),
  KEY `constoken_key` (`consumer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `opportunities`;
CREATE TABLE `opportunities` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `opportunity_type` varchar(255) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `lead_source` varchar(50) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `amount_usdollar` double DEFAULT NULL,
  `currency_id` char(36) DEFAULT NULL,
  `date_closed` date DEFAULT NULL,
  `next_step` varchar(100) DEFAULT NULL,
  `sales_stage` varchar(255) DEFAULT NULL,
  `probability` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_opp_name` (`name`),
  KEY `idx_opp_assigned` (`assigned_user_id`),
  KEY `idx_opp_id_deleted` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `opportunities_audit`;
CREATE TABLE `opportunities_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_opportunities_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `opportunities_contacts`;
CREATE TABLE `opportunities_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `contact_role` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_con_opp_con` (`contact_id`),
  KEY `idx_con_opp_opp` (`opportunity_id`),
  KEY `idx_opportunities_contacts` (`opportunity_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `outbound_email`;
CREATE TABLE `outbound_email` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(15) DEFAULT 'user',
  `user_id` char(36) NOT NULL,
  `smtp_from_name` varchar(255) DEFAULT NULL,
  `smtp_from_addr` varchar(255) DEFAULT NULL,
  `mail_sendtype` varchar(8) DEFAULT 'smtp',
  `mail_smtptype` varchar(20) DEFAULT 'other',
  `mail_smtpserver` varchar(100) DEFAULT NULL,
  `mail_smtpport` varchar(5) DEFAULT '0',
  `mail_smtpuser` varchar(100) DEFAULT NULL,
  `mail_smtppass` varchar(100) DEFAULT NULL,
  `mail_smtpauth_req` tinyint(1) DEFAULT 0,
  `mail_smtpssl` varchar(1) DEFAULT '0',
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461;

INSERT INTO `outbound_email` (`id`, `name`, `type`, `user_id`, `smtp_from_name`, `smtp_from_addr`, `mail_sendtype`, `mail_smtptype`, `mail_smtpserver`, `mail_smtpport`, `mail_smtpuser`, `mail_smtppass`, `mail_smtpauth_req`, `mail_smtpssl`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `deleted`, `assigned_user_id`) VALUES
('80420e66-0594-65fd-5164-5f89927eb61e',	'system',	'system',	'1',	NULL,	NULL,	'SMTP',	'other',	'',	'25',	'',	'',	1,	'0',	NULL,	NULL,	NULL,	NULL,	0,	NULL);

DROP TABLE IF EXISTS `outbound_email_audit`;
CREATE TABLE `outbound_email_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_outbound_email_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `estimated_start_date` date DEFAULT NULL,
  `estimated_end_date` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `override_business_hours` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `projects_accounts`;
CREATE TABLE `projects_accounts` (
  `id` varchar(36) NOT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_proj_acct_proj` (`project_id`),
  KEY `idx_proj_acct_acct` (`account_id`),
  KEY `projects_accounts_alt` (`project_id`,`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `projects_bugs`;
CREATE TABLE `projects_bugs` (
  `id` varchar(36) NOT NULL,
  `bug_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_proj_bug_proj` (`project_id`),
  KEY `idx_proj_bug_bug` (`bug_id`),
  KEY `projects_bugs_alt` (`project_id`,`bug_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `projects_cases`;
CREATE TABLE `projects_cases` (
  `id` varchar(36) NOT NULL,
  `case_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_proj_case_proj` (`project_id`),
  KEY `idx_proj_case_case` (`case_id`),
  KEY `projects_cases_alt` (`project_id`,`case_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `projects_contacts`;
CREATE TABLE `projects_contacts` (
  `id` varchar(36) NOT NULL,
  `contact_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_proj_con_proj` (`project_id`),
  KEY `idx_proj_con_con` (`contact_id`),
  KEY `projects_contacts_alt` (`project_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `projects_opportunities`;
CREATE TABLE `projects_opportunities` (
  `id` varchar(36) NOT NULL,
  `opportunity_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_proj_opp_proj` (`project_id`),
  KEY `idx_proj_opp_opp` (`opportunity_id`),
  KEY `projects_opportunities_alt` (`project_id`,`opportunity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `projects_products`;
CREATE TABLE `projects_products` (
  `id` varchar(36) NOT NULL,
  `product_id` varchar(36) DEFAULT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_proj_prod_project` (`project_id`),
  KEY `idx_proj_prod_product` (`product_id`),
  KEY `projects_products_alt` (`project_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `project_contacts_1_c`;
CREATE TABLE `project_contacts_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `project_contacts_1project_ida` varchar(36) DEFAULT NULL,
  `project_contacts_1contacts_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_contacts_1_alt` (`project_contacts_1project_ida`,`project_contacts_1contacts_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `project_task`;
CREATE TABLE `project_task` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `project_id` char(36) NOT NULL,
  `project_task_id` int(11) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `relationship_type` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `predecessors` text DEFAULT NULL,
  `date_start` date DEFAULT NULL,
  `time_start` int(11) DEFAULT NULL,
  `time_finish` int(11) DEFAULT NULL,
  `date_finish` date DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `duration_unit` text DEFAULT NULL,
  `actual_duration` int(11) DEFAULT NULL,
  `percent_complete` int(11) DEFAULT NULL,
  `date_due` date DEFAULT NULL,
  `time_due` time DEFAULT NULL,
  `parent_task_id` int(11) DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `priority` varchar(255) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `milestone_flag` tinyint(1) DEFAULT NULL,
  `order_number` int(11) DEFAULT 1,
  `task_number` int(11) DEFAULT NULL,
  `estimated_effort` int(11) DEFAULT NULL,
  `actual_effort` int(11) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `utilization` int(11) DEFAULT 100,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `project_task_audit`;
CREATE TABLE `project_task_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_project_task_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `project_users_1_c`;
CREATE TABLE `project_users_1_c` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `project_users_1project_ida` varchar(36) DEFAULT NULL,
  `project_users_1users_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_users_1_alt` (`project_users_1project_ida`,`project_users_1users_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `prospects`;
CREATE TABLE `prospects` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `salutation` varchar(255) DEFAULT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `do_not_call` tinyint(1) DEFAULT 0,
  `phone_home` varchar(100) DEFAULT NULL,
  `phone_mobile` varchar(100) DEFAULT NULL,
  `phone_work` varchar(100) DEFAULT NULL,
  `phone_other` varchar(100) DEFAULT NULL,
  `phone_fax` varchar(100) DEFAULT NULL,
  `lawful_basis` text DEFAULT NULL,
  `date_reviewed` date DEFAULT NULL,
  `lawful_basis_source` varchar(100) DEFAULT NULL,
  `primary_address_street` varchar(150) DEFAULT NULL,
  `primary_address_city` varchar(100) DEFAULT NULL,
  `primary_address_state` varchar(100) DEFAULT NULL,
  `primary_address_postalcode` varchar(20) DEFAULT NULL,
  `primary_address_country` varchar(255) DEFAULT NULL,
  `alt_address_street` varchar(150) DEFAULT NULL,
  `alt_address_city` varchar(100) DEFAULT NULL,
  `alt_address_state` varchar(100) DEFAULT NULL,
  `alt_address_postalcode` varchar(20) DEFAULT NULL,
  `alt_address_country` varchar(255) DEFAULT NULL,
  `assistant` varchar(75) DEFAULT NULL,
  `assistant_phone` varchar(100) DEFAULT NULL,
  `tracker_key` int(11) NOT NULL AUTO_INCREMENT,
  `birthdate` date DEFAULT NULL,
  `lead_id` char(36) DEFAULT NULL,
  `account_name` varchar(150) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `prospect_auto_tracker_key` (`tracker_key`),
  KEY `idx_prospects_last_first` (`last_name`,`first_name`,`deleted`),
  KEY `idx_prospecs_del_last` (`last_name`,`deleted`),
  KEY `idx_prospects_id_del` (`id`,`deleted`),
  KEY `idx_prospects_assigned` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `prospect_lists`;
CREATE TABLE `prospect_lists` (
  `assigned_user_id` char(36) DEFAULT NULL,
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `list_type` varchar(100) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `domain_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_prospect_list_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `prospect_lists_prospects`;
CREATE TABLE `prospect_lists_prospects` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `related_id` varchar(36) DEFAULT NULL,
  `related_type` varchar(25) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_plp_pro_id` (`prospect_list_id`,`deleted`),
  KEY `idx_plp_rel_id` (`related_id`,`related_type`,`prospect_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `prospect_list_campaigns`;
CREATE TABLE `prospect_list_campaigns` (
  `id` varchar(36) NOT NULL,
  `prospect_list_id` varchar(36) DEFAULT NULL,
  `campaign_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_pro_id` (`prospect_list_id`),
  KEY `idx_cam_id` (`campaign_id`),
  KEY `idx_prospect_list_campaigns` (`prospect_list_id`,`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `relationships`;
CREATE TABLE `relationships` (
  `id` char(36) NOT NULL,
  `relationship_name` varchar(150) DEFAULT NULL,
  `lhs_module` varchar(100) DEFAULT NULL,
  `lhs_table` varchar(64) DEFAULT NULL,
  `lhs_key` varchar(64) DEFAULT NULL,
  `rhs_module` varchar(100) DEFAULT NULL,
  `rhs_table` varchar(64) DEFAULT NULL,
  `rhs_key` varchar(64) DEFAULT NULL,
  `join_table` varchar(64) DEFAULT NULL,
  `join_key_lhs` varchar(64) DEFAULT NULL,
  `join_key_rhs` varchar(64) DEFAULT NULL,
  `relationship_type` varchar(64) DEFAULT NULL,
  `relationship_role_column` varchar(64) DEFAULT NULL,
  `relationship_role_column_value` varchar(50) DEFAULT NULL,
  `reverse` tinyint(1) DEFAULT 0,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_rel_name` (`relationship_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `relationships` (`id`, `relationship_name`, `lhs_module`, `lhs_table`, `lhs_key`, `rhs_module`, `rhs_table`, `rhs_key`, `join_table`, `join_key_lhs`, `join_key_rhs`, `relationship_type`, `relationship_role_column`, `relationship_role_column_value`, `reverse`, `deleted`) VALUES
('10266e6d-19e0-7772-613c-5f899b5d96b7',	'opportunity_currencies',	'Opportunities',	'opportunities',	'currency_id',	'Currencies',	'currencies',	'id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('110ea013-17d0-fdc9-5d94-5f899b1f69e7',	'opportunities_campaign',	'Campaigns',	'campaigns',	'id',	'Opportunities',	'opportunities',	'campaign_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('117bd4f5-a9c5-dda7-4359-5f899b6ab002',	'oauth2clients_created_by',	'Users',	'users',	'id',	'OAuth2Clients',	'oauth2clients',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('11b0031d-3661-1ee5-0e14-5f899b395c3f',	'account_aos_invoices',	'Accounts',	'accounts',	'id',	'AOS_Invoices',	'aos_invoices',	'billing_account_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('1211a167-745a-f009-efc8-5f899b0be178',	'opportunity_aos_quotes',	'Opportunities',	'opportunities',	'id',	'AOS_Quotes',	'aos_quotes',	'opportunity_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('12156b9b-8ce3-1dcc-99c3-5f899bbdbbd7',	'oauth2clients_oauth2tokens',	'OAuth2Clients',	'oauth2clients',	'id',	'OAuth2Tokens',	'oauth2tokens',	'client',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('12ac31f3-bf36-daba-8ee7-5f899b77ee83',	'oauth2clients_assigned_user',	'Users',	'users',	'id',	'OAuth2Clients',	'oauth2clients',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('13149dc3-58c6-66b3-8f7b-5f899b6e9c17',	'opportunity_aos_contracts',	'Opportunities',	'opportunities',	'id',	'AOS_Contracts',	'aos_contracts',	'opportunity_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('14c97b44-dc10-da3d-dcba-5f899be2cae0',	'surveyresponses_modified_user',	'Users',	'users',	'id',	'SurveyResponses',	'surveyresponses',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('14ce0650-5d92-57f4-d1df-5f899bd198c5',	'securitygroups_created_by',	'Users',	'users',	'id',	'SecurityGroups',	'securitygroups',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('15502c2c-3667-50d6-ef00-5f899b827d48',	'surveyresponses_created_by',	'Users',	'users',	'id',	'SurveyResponses',	'surveyresponses',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('15f519ba-381f-f18d-447c-5f899b8b11df',	'surveyresponses_assigned_user',	'Users',	'users',	'id',	'SurveyResponses',	'surveyresponses',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('1613310c-33a3-0540-6a69-5f899b0abbf2',	'securitygroups_emailtemplates',	'SecurityGroups',	'securitygroups',	'id',	'EmailTemplates',	'email_templates',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'EmailTemplates',	0,	0),
('16f7048a-8b84-7b0c-3d42-5f899b0d528f',	'emailtemplates_assigned_user',	'Users',	'users',	'id',	'EmailTemplates',	'email_templates',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('178b6e73-c723-6773-d8a6-5f899bdc6f3f',	'securitygroups_surveyresponses',	'SecurityGroups',	'securitygroups',	'id',	'SurveyResponses',	'surveyresponses',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'SurveyResponses',	0,	0),
('1836a054-8de0-7d4b-18a1-5f899be00809',	'surveyresponses_surveyquestionresponses',	'SurveyResponses',	'surveyresponses',	'id',	'SurveyQuestionResponses',	'surveyquestionresponses',	'surveyresponse_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('1a13cb18-49e8-9e47-a3d6-5f899bda0cc5',	'surveys_modified_user',	'Users',	'users',	'id',	'Surveys',	'surveys',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('1a6c9d0c-d64e-0dab-7193-5f899b4a54bb',	'notes_assigned_user',	'Users',	'users',	'id',	'Notes',	'notes',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('1a8929db-2c20-7acd-48d0-5f899bf50f2d',	'surveys_created_by',	'Users',	'users',	'id',	'Surveys',	'surveys',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('1b1da3f3-bb9c-133e-b9de-5f899bc7f118',	'surveys_assigned_user',	'Users',	'users',	'id',	'Surveys',	'surveys',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('1b6481ff-1e8d-c314-e9fb-5f899bff94b5',	'securitygroups_notes',	'SecurityGroups',	'securitygroups',	'id',	'Notes',	'notes',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'Notes',	0,	0),
('1bb422e0-4c1d-0136-1137-5f899ba4b12b',	'securitygroups_surveys',	'SecurityGroups',	'securitygroups',	'id',	'Surveys',	'surveys',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'Surveys',	0,	0),
('1c47df12-efcc-b142-c446-5f899b750738',	'surveys_surveyquestions',	'Surveys',	'surveys',	'id',	'SurveyQuestions',	'surveyquestions',	'survey_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('1c9cc63d-d985-44b4-a196-5f899b60e83e',	'notes_modified_user',	'Users',	'users',	'id',	'Notes',	'notes',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('1ce4bf52-fce0-515e-3415-5f899befbaca',	'surveys_surveyresponses',	'Surveys',	'surveys',	'id',	'SurveyResponses',	'surveyresponses',	'survey_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('1d79dbaa-46af-1351-85a1-5f899bdbb9dc',	'surveys_campaigns',	'Surveys',	'surveys',	'id',	'Campaigns',	'campaigns',	'survey_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('1dd2030d-e18a-b604-1245-5f899bd1d6c1',	'account_aos_contracts',	'Accounts',	'accounts',	'id',	'AOS_Contracts',	'aos_contracts',	'contract_account_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('1dd2df26-f84f-aa8e-79c1-5f899bcd8e4f',	'notes_created_by',	'Users',	'users',	'id',	'Notes',	'notes',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('1f03d430-a69e-36e9-e3ee-5f899b34f016',	'surveyquestionresponses_modified_user',	'Users',	'users',	'id',	'SurveyQuestionResponses',	'surveyquestionresponses',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('1f7ed8eb-321d-1a59-6fa4-5f899b49ed9d',	'surveyquestionresponses_created_by',	'Users',	'users',	'id',	'SurveyQuestionResponses',	'surveyquestionresponses',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('2019940d-32f0-5f34-5660-5f899be9b92d',	'surveyquestionresponses_assigned_user',	'Users',	'users',	'id',	'SurveyQuestionResponses',	'surveyquestionresponses',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('20e8fc3d-312d-da9c-cf49-5f899b324edd',	'securitygroups_surveyquestionresponses',	'SecurityGroups',	'securitygroups',	'id',	'SurveyQuestionResponses',	'surveyquestionresponses',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'SurveyQuestionResponses',	0,	0),
('211a0205-8509-c9a3-9822-5f899b664d5e',	'calls_modified_user',	'Users',	'users',	'id',	'Calls',	'calls',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('21c80fbc-ad10-5747-0b5c-5f899b1453e2',	'calls_created_by',	'Users',	'users',	'id',	'Calls',	'calls',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('22660087-7d54-1d99-d249-5f899ba6c977',	'securitygroups_assigned_user',	'Users',	'users',	'id',	'SecurityGroups',	'securitygroups',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('23046e2d-969b-a05e-88a4-5f899bb46c83',	'calls_assigned_user',	'Users',	'users',	'id',	'Calls',	'calls',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('23da0427-a956-ef71-af48-5f899b887aac',	'securitygroups_calls',	'SecurityGroups',	'securitygroups',	'id',	'Calls',	'calls',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'Calls',	0,	0),
('24995e8b-09ee-3942-9a3e-5f899b8542a2',	'calls_notes',	'Calls',	'calls',	'id',	'Notes',	'notes',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Calls',	0,	0),
('2564b630-0889-d73e-8b78-5f899b31252b',	'calls_reschedule',	'Calls',	'calls',	'id',	'Calls_Reschedule',	'calls_reschedule',	'call_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('26adeef4-aba6-5c98-c606-5f899b832e0e',	'emails_modified_user',	'Users',	'users',	'id',	'Emails',	'emails',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('27182dae-5924-9f9d-6fa8-5f899b94399d',	'emails_created_by',	'Users',	'users',	'id',	'Emails',	'emails',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('27b0407d-2b54-7278-d852-5f899b4415a3',	'emails_assigned_user',	'Users',	'users',	'id',	'Emails',	'emails',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('28439af3-d8a4-43b7-763e-5f899b262c91',	'securitygroups_emails',	'SecurityGroups',	'securitygroups',	'id',	'Emails',	'emails',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'Emails',	0,	0),
('28a48496-cc94-badb-1389-5f899b9a7d83',	'surveyquestions_modified_user',	'Users',	'users',	'id',	'SurveyQuestions',	'surveyquestions',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('28d990db-6991-8c70-a31b-5f899be41f27',	'emails_notes_rel',	'Emails',	'emails',	'id',	'Notes',	'notes',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('29633cea-c4d2-c01b-c0db-5f899beac16c',	'emails_contacts_rel',	'Emails',	'emails',	'id',	'Contacts',	'contacts',	'id',	'emails_beans',	'email_id',	'bean_id',	'many-to-many',	'bean_module',	'Contacts',	0,	0),
('29eda456-1f5b-48ff-dc18-5f899b7d7149',	'emails_accounts_rel',	'Emails',	'emails',	'id',	'Accounts',	'accounts',	'id',	'emails_beans',	'email_id',	'bean_id',	'many-to-many',	'bean_module',	'Accounts',	0,	0),
('29f11bdd-f79f-8d1e-3d22-5f899bde6ece',	'surveyquestions_created_by',	'Users',	'users',	'id',	'SurveyQuestions',	'surveyquestions',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('2a7477eb-1325-4f39-9f00-5f899bed872e',	'emails_leads_rel',	'Emails',	'emails',	'id',	'Leads',	'leads',	'id',	'emails_beans',	'email_id',	'bean_id',	'many-to-many',	'bean_module',	'Leads',	0,	0),
('2b0d2fcf-a137-9253-edab-5f899bd0e7c1',	'emails_aos_contracts_rel',	'Emails',	'emails',	'id',	'AOS_Contracts',	'aos_contracts',	'id',	'emails_beans',	'email_id',	'bean_id',	'many-to-many',	'bean_module',	'AOS_Contracts',	0,	0),
('2b4483ad-8fd6-8b05-8f5d-5f899b78257a',	'surveyquestions_assigned_user',	'Users',	'users',	'id',	'SurveyQuestions',	'surveyquestions',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('2ba132c7-83e6-34e0-e818-5f899be9aa4b',	'emails_meetings_rel',	'Emails',	'emails',	'id',	'Meetings',	'meetings',	'id',	'emails_beans',	'email_id',	'bean_id',	'many-to-many',	'bean_module',	'Meetings',	0,	0),
('2cba3ab9-7843-64a2-ab42-5f899bfc8c52',	'securitygroups_surveyquestions',	'SecurityGroups',	'securitygroups',	'id',	'SurveyQuestions',	'surveyquestions',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'SurveyQuestions',	0,	0),
('2d6a91aa-083f-0272-e4c5-5f899b277fb4',	'meetings_modified_user',	'Users',	'users',	'id',	'Meetings',	'meetings',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('2dd9175b-2a87-6413-8eb7-5f899b7813fc',	'meetings_created_by',	'Users',	'users',	'id',	'Meetings',	'meetings',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('2e20b4d2-ce5c-25b9-3a99-5f899b167264',	'surveyquestions_surveyquestionoptions',	'SurveyQuestions',	'surveyquestions',	'id',	'SurveyQuestionOptions',	'surveyquestionoptions',	'survey_question_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('2e5e9dd4-7754-7d12-0deb-5f899b0feb39',	'meetings_assigned_user',	'Users',	'users',	'id',	'Meetings',	'meetings',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('2eeff232-b04f-5887-7e2e-5f899b223781',	'securitygroups_meetings',	'SecurityGroups',	'securitygroups',	'id',	'Meetings',	'meetings',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'Meetings',	0,	0),
('2f79e524-53da-77dd-1814-5f899b812547',	'meetings_notes',	'Meetings',	'meetings',	'id',	'Notes',	'notes',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Meetings',	0,	0),
('3104f3e3-1a2f-c7f8-4411-5f899bc397ea',	'tasks_modified_user',	'Users',	'users',	'id',	'Tasks',	'tasks',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('31706aca-af1f-d743-7e5a-5f899b349a9e',	'tasks_created_by',	'Users',	'users',	'id',	'Tasks',	'tasks',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('31fe0204-dc57-9560-cfc0-5f899b1d81cd',	'tasks_assigned_user',	'Users',	'users',	'id',	'Tasks',	'tasks',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('3286d6e4-e130-62f3-126b-5f899bfd2820',	'securitygroups_tasks',	'SecurityGroups',	'securitygroups',	'id',	'Tasks',	'tasks',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'Tasks',	0,	0),
('3324498c-17e4-51e2-2d42-5f899b9cfe58',	'tasks_notes',	'Tasks',	'tasks',	'id',	'Notes',	'notes',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('34b3881a-4c8b-a7f7-3870-5f899bdcff09',	'surveyquestionoptions_modified_user',	'Users',	'users',	'id',	'SurveyQuestionOptions',	'surveyquestionoptions',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('35fb5bcc-a2f5-1cd8-d6ec-5f899b770741',	'surveyquestionoptions_created_by',	'Users',	'users',	'id',	'SurveyQuestionOptions',	'surveyquestionoptions',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('370f9af1-76ea-74e6-2dda-5f899b072572',	'alerts_modified_user',	'Users',	'users',	'id',	'Alerts',	'alerts',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('3758979f-6285-d704-00fb-5f899b5ea9a5',	'surveyquestionoptions_assigned_user',	'Users',	'users',	'id',	'SurveyQuestionOptions',	'surveyquestionoptions',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('3776c7ec-820c-5c22-f602-5f899b3757ca',	'alerts_created_by',	'Users',	'users',	'id',	'Alerts',	'alerts',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('37fb1cc3-24a3-9392-8e8a-5f899b8ae9a4',	'alerts_assigned_user',	'Users',	'users',	'id',	'Alerts',	'alerts',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('38b5dc47-2cb0-5caf-0978-5f899bfe55e6',	'securitygroups_surveyquestionoptions',	'SecurityGroups',	'securitygroups',	'id',	'SurveyQuestionOptions',	'surveyquestionoptions',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'SurveyQuestionOptions',	0,	0),
('3a4083c2-0007-927a-a28e-5f899b6888d7',	'documents_modified_user',	'Users',	'users',	'id',	'Documents',	'documents',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('3abf393f-b256-24f3-2d1d-5f899b50672f',	'documents_created_by',	'Users',	'users',	'id',	'Documents',	'documents',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('3b64bc43-a239-e265-a874-5f899b45ae4a',	'documents_assigned_user',	'Users',	'users',	'id',	'Documents',	'documents',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('3c116993-dd28-3e7a-bb75-5f899b06b1e6',	'securitygroups_documents',	'SecurityGroups',	'securitygroups',	'id',	'Documents',	'documents',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'Documents',	0,	0),
('3cb7836e-fa77-2ccb-b62e-5f899b4c58bf',	'document_revisions',	'Documents',	'documents',	'id',	'DocumentRevisions',	'document_revisions',	'document_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('3d0ffbde-3e7e-720b-1516-5f899b91ab73',	'accounts_bugs',	'Accounts',	'accounts',	'id',	'Bugs',	'bugs',	'id',	'accounts_bugs',	'account_id',	'bug_id',	'many-to-many',	NULL,	NULL,	0,	0),
('3ece7d09-ba32-6794-d7c8-5f899be877e8',	'accounts_contacts',	'Accounts',	'accounts',	'id',	'Contacts',	'contacts',	'id',	'accounts_contacts',	'account_id',	'contact_id',	'many-to-many',	NULL,	NULL,	0,	0),
('3ee6157d-6ceb-58b2-b81e-5f899bfa35ac',	'revisions_created_by',	'Users',	'users',	'id',	'DocumentRevisions',	'document_revisions',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('3fa801bf-43c0-56d4-3d0c-5f899b21387f',	'outbound_email_modified_user',	'Users',	'users',	'id',	'OutboundEmailAccounts',	'outbound_email',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('40650b19-7c25-b899-b328-5f899b8afdde',	'accounts_opportunities',	'Accounts',	'accounts',	'id',	'Opportunities',	'opportunities',	'id',	'accounts_opportunities',	'account_id',	'opportunity_id',	'many-to-many',	NULL,	NULL,	0,	0),
('41544024-ef59-28a9-8ff6-5f899b327609',	'inbound_email_created_by',	'Users',	'users',	'id',	'InboundEmail',	'inbound_email',	'created_by',	NULL,	NULL,	NULL,	'one-to-one',	NULL,	NULL,	0,	0),
('41fc7f14-9609-2519-bf13-5f899bae4897',	'inbound_email_modified_user_id',	'Users',	'users',	'id',	'InboundEmail',	'inbound_email',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-one',	NULL,	NULL,	0,	0),
('427ddf2b-9093-2e72-e964-5f899b8c5791',	'calls_contacts',	'Calls',	'calls',	'id',	'Contacts',	'contacts',	'id',	'calls_contacts',	'call_id',	'contact_id',	'many-to-many',	NULL,	NULL,	0,	0),
('4344b65c-68b8-c0fa-eba4-5f899b9aad61',	'saved_search_assigned_user',	'Users',	'users',	'id',	'SavedSearch',	'saved_search',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('43ffab81-85d2-090c-50cb-5f899b467529',	'calls_users',	'Calls',	'calls',	'id',	'Users',	'users',	'id',	'calls_users',	'call_id',	'user_id',	'many-to-many',	NULL,	NULL,	0,	0),
('4568bb9c-6f06-ee5a-4379-5f899ba3619e',	'spots_modified_user',	'Users',	'users',	'id',	'Spots',	'spots',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('45863594-4b32-3a0d-3bde-5f899b594166',	'calls_leads',	'Calls',	'calls',	'id',	'Leads',	'leads',	'id',	'calls_leads',	'call_id',	'lead_id',	'many-to-many',	NULL,	NULL,	0,	0),
('46231233-0eb1-805a-bd17-5f899b784ead',	'spots_created_by',	'Users',	'users',	'id',	'Spots',	'spots',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('46d830f7-a023-413e-ac52-5f899bd99abe',	'cases_bugs',	'Cases',	'cases',	'id',	'Bugs',	'bugs',	'id',	'cases_bugs',	'case_id',	'bug_id',	'many-to-many',	NULL,	NULL,	0,	0),
('46e89202-e9e6-02b3-f32c-5f899b199a85',	'spots_assigned_user',	'Users',	'users',	'id',	'Spots',	'spots',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('47a96e56-02dd-ea8a-8950-5f899b0e2afd',	'securitygroups_spots',	'SecurityGroups',	'securitygroups',	'id',	'Spots',	'spots',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'Spots',	0,	0),
('47e0e19d-3a1a-e364-c94b-5f899b8ab9dd',	'contacts_bugs',	'Contacts',	'contacts',	'id',	'Bugs',	'bugs',	'id',	'contacts_bugs',	'contact_id',	'bug_id',	'many-to-many',	NULL,	NULL,	0,	0),
('48db6950-ad6e-44c5-b9a4-5f899b4c71ca',	'contacts_cases',	'Contacts',	'contacts',	'id',	'Cases',	'cases',	'id',	'contacts_cases',	'contact_id',	'case_id',	'many-to-many',	NULL,	NULL,	0,	0),
('49229cad-9128-9578-7689-5f899b3ecad4',	'aobh_businesshours_modified_user',	'Users',	'users',	'id',	'AOBH_BusinessHours',	'aobh_businesshours',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('49c6d74e-639f-c344-dc47-5f899bb50424',	'aobh_businesshours_created_by',	'Users',	'users',	'id',	'AOBH_BusinessHours',	'aobh_businesshours',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('49e3d688-504b-d2cb-9a14-5f899b3bc387',	'contacts_users',	'Contacts',	'contacts',	'id',	'Users',	'users',	'id',	'contacts_users',	'contact_id',	'user_id',	'many-to-many',	NULL,	NULL,	0,	0),
('4a9f0def-4555-aa4c-9f99-5f899b1c72fd',	'outbound_email_created_by',	'Users',	'users',	'id',	'OutboundEmailAccounts',	'outbound_email',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('4aec49a1-93e9-59a3-b210-5f899b3bda98',	'emails_bugs_rel',	'Emails',	'emails',	'id',	'Bugs',	'bugs',	'id',	'emails_beans',	'email_id',	'bean_id',	'many-to-many',	'bean_module',	'Bugs',	0,	0),
('4b85f073-4d51-2b4c-1549-5f899b9d70f2',	'sugarfeed_modified_user',	'Users',	'users',	'id',	'SugarFeed',	'sugarfeed',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('4be39c0d-8b7f-7a7c-c9ee-5f899bcce7e1',	'emails_cases_rel',	'Emails',	'emails',	'id',	'Cases',	'cases',	'id',	'emails_beans',	'email_id',	'bean_id',	'many-to-many',	'bean_module',	'Cases',	0,	0),
('4c398ee0-a59d-524e-c965-5f899b237320',	'sugarfeed_created_by',	'Users',	'users',	'id',	'SugarFeed',	'sugarfeed',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('4d01f0ee-1a71-0480-ba91-5f899b41cf71',	'sugarfeed_assigned_user',	'Users',	'users',	'id',	'SugarFeed',	'sugarfeed',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('4d11afdd-9c16-8db9-418b-5f899ba68502',	'emails_opportunities_rel',	'Emails',	'emails',	'id',	'Opportunities',	'opportunities',	'id',	'emails_beans',	'email_id',	'bean_id',	'many-to-many',	'bean_module',	'Opportunities',	0,	0),
('4df0d25b-1ed0-3fdd-78a8-5f899b890568',	'emails_tasks_rel',	'Emails',	'emails',	'id',	'Tasks',	'tasks',	'id',	'emails_beans',	'email_id',	'bean_id',	'many-to-many',	'bean_module',	'Tasks',	0,	0),
('4ed3d7a6-c3d5-454a-6d19-5f899b22fcfe',	'eapm_modified_user',	'Users',	'users',	'id',	'EAPM',	'eapm',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('4fe49106-7a6f-5550-c613-5f899b0f1c7a',	'emails_users_rel',	'Emails',	'emails',	'id',	'Users',	'users',	'id',	'emails_beans',	'email_id',	'bean_id',	'many-to-many',	'bean_module',	'Users',	0,	0),
('4ff43958-5355-6150-69ab-5f899b109a21',	'eapm_created_by',	'Users',	'users',	'id',	'EAPM',	'eapm',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('50b03123-9613-81e1-34ef-5f899bb60653',	'emails_project_task_rel',	'Emails',	'emails',	'id',	'ProjectTask',	'project_task',	'id',	'emails_beans',	'email_id',	'bean_id',	'many-to-many',	'bean_module',	'ProjectTask',	0,	0),
('50bd645a-6850-13f9-36b1-5f899b3586d1',	'eapm_assigned_user',	'Users',	'users',	'id',	'EAPM',	'eapm',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('5179f787-de71-130c-62a9-5f899b5d10d0',	'emails_projects_rel',	'Emails',	'emails',	'id',	'Project',	'project',	'id',	'emails_beans',	'email_id',	'bean_id',	'many-to-many',	'bean_module',	'Project',	0,	0),
('523a94c6-045b-1659-5e84-5f899b24ea07',	'emails_prospects_rel',	'Emails',	'emails',	'id',	'Prospects',	'prospects',	'id',	'emails_beans',	'email_id',	'bean_id',	'many-to-many',	'bean_module',	'Prospects',	0,	0),
('524bc359-ec58-5e67-1497-5f899bce9ab2',	'oauthkeys_modified_user',	'Users',	'users',	'id',	'OAuthKeys',	'oauth_consumer',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('52fc8225-b800-6a8d-80d3-5f899bf9747d',	'oauthkeys_created_by',	'Users',	'users',	'id',	'OAuthKeys',	'oauth_consumer',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('5302fda5-a60b-539a-8f32-5f899b114f0d',	'meetings_contacts',	'Meetings',	'meetings',	'id',	'Contacts',	'contacts',	'id',	'meetings_contacts',	'meeting_id',	'contact_id',	'many-to-many',	NULL,	NULL,	0,	0),
('53cb7da0-18cb-b101-d63f-5f899b065a9e',	'oauthkeys_assigned_user',	'Users',	'users',	'id',	'OAuthKeys',	'oauth_consumer',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('53ce2d07-9c62-da5e-5ac3-5f899b6ba73a',	'meetings_users',	'Meetings',	'meetings',	'id',	'Users',	'users',	'id',	'meetings_users',	'meeting_id',	'user_id',	'many-to-many',	NULL,	NULL,	0,	0),
('549721fc-0273-8336-158f-5f899bac77f2',	'meetings_leads',	'Meetings',	'meetings',	'id',	'Leads',	'leads',	'id',	'meetings_leads',	'meeting_id',	'lead_id',	'many-to-many',	NULL,	NULL,	0,	0),
('552e28e7-542c-e98a-8b1e-5f899bad1441',	'consumer_tokens',	'OAuthKeys',	'oauth_consumer',	'id',	'OAuthTokens',	'oauth_tokens',	'consumer',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('555abb3a-bfe7-3850-27a1-5f899bdbdbef',	'opportunities_contacts',	'Opportunities',	'opportunities',	'id',	'Contacts',	'contacts',	'id',	'opportunities_contacts',	'opportunity_id',	'contact_id',	'many-to-many',	NULL,	NULL,	0,	0),
('55e4f9bc-41de-344f-82d7-5f899b77476e',	'oauthtokens_assigned_user',	'Users',	'users',	'id',	'OAuthTokens',	'oauth_tokens',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('560bc4ec-4148-8a5a-2eee-5f899b41a74d',	'prospect_list_campaigns',	'ProspectLists',	'prospect_lists',	'id',	'Campaigns',	'campaigns',	'id',	'prospect_list_campaigns',	'prospect_list_id',	'campaign_id',	'many-to-many',	NULL,	NULL,	0,	0),
('56c67581-05c4-03f9-f552-5f899b33911f',	'prospect_list_contacts',	'ProspectLists',	'prospect_lists',	'id',	'Contacts',	'contacts',	'id',	'prospect_lists_prospects',	'prospect_list_id',	'related_id',	'many-to-many',	'related_type',	'Contacts',	0,	0),
('5789b5e7-cdf3-515e-4a53-5f899b7b0c0f',	'prospect_list_prospects',	'ProspectLists',	'prospect_lists',	'id',	'Prospects',	'prospects',	'id',	'prospect_lists_prospects',	'prospect_list_id',	'related_id',	'many-to-many',	'related_type',	'Prospects',	0,	0),
('579f65b5-c4b5-7adf-194e-5f899ba3264a',	'am_projecttemplates_modified_user',	'Users',	'users',	'id',	'AM_ProjectTemplates',	'am_projecttemplates',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('583e5a9d-8760-f403-2f4d-5f899b244dcf',	'prospect_list_leads',	'ProspectLists',	'prospect_lists',	'id',	'Leads',	'leads',	'id',	'prospect_lists_prospects',	'prospect_list_id',	'related_id',	'many-to-many',	'related_type',	'Leads',	0,	0),
('5845d295-c72d-e59c-5ba9-5f899ba697a5',	'am_projecttemplates_created_by',	'Users',	'users',	'id',	'AM_ProjectTemplates',	'am_projecttemplates',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('58ebb179-e9b8-327a-f666-5f899bdb9b83',	'prospect_list_users',	'ProspectLists',	'prospect_lists',	'id',	'Users',	'users',	'id',	'prospect_lists_prospects',	'prospect_list_id',	'related_id',	'many-to-many',	'related_type',	'Users',	0,	0),
('590e7a31-227c-363d-02ed-5f899bc2a53b',	'am_projecttemplates_assigned_user',	'Users',	'users',	'id',	'AM_ProjectTemplates',	'am_projecttemplates',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('5999b9ac-62c0-c6c4-54c6-5f899b08f6a7',	'prospect_list_accounts',	'ProspectLists',	'prospect_lists',	'id',	'Accounts',	'accounts',	'id',	'prospect_lists_prospects',	'prospect_list_id',	'related_id',	'many-to-many',	'related_type',	'Accounts',	0,	0),
('5a4750d9-d0cf-7646-2199-5f899bcc217e',	'roles_users',	'Roles',	'roles',	'id',	'Users',	'users',	'id',	'roles_users',	'role_id',	'user_id',	'many-to-many',	NULL,	NULL,	0,	0),
('5aec1822-b963-aba1-94d6-5f899b6d78b2',	'projects_bugs',	'Project',	'project',	'id',	'Bugs',	'bugs',	'id',	'projects_bugs',	'project_id',	'bug_id',	'many-to-many',	NULL,	NULL,	0,	0),
('5b1404df-6940-86ce-6674-5f899b02f298',	'am_tasktemplates_modified_user',	'Users',	'users',	'id',	'AM_TaskTemplates',	'am_tasktemplates',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('5b8006c9-f4aa-0efe-2c3c-5f899b779997',	'account_aos_quotes',	'Accounts',	'accounts',	'id',	'AOS_Quotes',	'aos_quotes',	'billing_account_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('5b954dea-b103-7a56-2793-5f899b9fe874',	'projects_cases',	'Project',	'project',	'id',	'Cases',	'cases',	'id',	'projects_cases',	'project_id',	'case_id',	'many-to-many',	NULL,	NULL,	0,	0),
('5bc8a59c-6df4-c7b3-2f0b-5f899b0d21a4',	'am_tasktemplates_created_by',	'Users',	'users',	'id',	'AM_TaskTemplates',	'am_tasktemplates',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('5c3ee9ca-4d88-e66d-2be4-5f899b4f172b',	'projects_accounts',	'Project',	'project',	'id',	'Accounts',	'accounts',	'id',	'projects_accounts',	'project_id',	'account_id',	'many-to-many',	NULL,	NULL,	0,	0),
('5c9605e2-705f-9117-d191-5f899b2b142a',	'am_tasktemplates_assigned_user',	'Users',	'users',	'id',	'AM_TaskTemplates',	'am_tasktemplates',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('5cd76fa2-a29d-2ba4-03d7-5f899b88c727',	'projects_contacts',	'Project',	'project',	'id',	'Contacts',	'contacts',	'id',	'projects_contacts',	'project_id',	'contact_id',	'many-to-many',	NULL,	NULL,	0,	0),
('5d6ddd60-863b-4419-2dfa-5f899b0e5b70',	'projects_opportunities',	'Project',	'project',	'id',	'Opportunities',	'opportunities',	'id',	'projects_opportunities',	'project_id',	'opportunity_id',	'many-to-many',	NULL,	NULL,	0,	0),
('5dcd848a-65c3-71da-65e7-5f899b954b52',	'favorites_modified_user',	'Users',	'users',	'id',	'Favorites',	'favorites',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('5e006f96-9e00-9065-887c-5f899b85a028',	'acl_roles_actions',	'ACLRoles',	'acl_roles',	'id',	'ACLActions',	'acl_actions',	'id',	'acl_roles_actions',	'role_id',	'action_id',	'many-to-many',	NULL,	NULL,	0,	0),
('5e7d842a-75f1-ab33-bfdc-5f899b235080',	'favorites_created_by',	'Users',	'users',	'id',	'Favorites',	'favorites',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('5e8fcd40-811f-59a2-75a1-5f899b2e11a4',	'acl_roles_users',	'ACLRoles',	'acl_roles',	'id',	'Users',	'users',	'id',	'acl_roles_users',	'role_id',	'user_id',	'many-to-many',	NULL,	NULL,	0,	0),
('5f20b7e9-93d9-8264-15c9-5f899b06a8cb',	'email_marketing_prospect_lists',	'EmailMarketing',	'email_marketing',	'id',	'ProspectLists',	'prospect_lists',	'id',	'email_marketing_prospect_lists',	'email_marketing_id',	'prospect_list_id',	'many-to-many',	NULL,	NULL,	0,	0),
('5f491fee-e37d-508a-d0e7-5f899b5ee480',	'favorites_assigned_user',	'Users',	'users',	'id',	'Favorites',	'favorites',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('5fbb6366-73e7-40d7-b22a-5f899b05eba7',	'leads_documents',	'Leads',	'leads',	'id',	'Documents',	'documents',	'id',	'linked_documents',	'parent_id',	'document_id',	'many-to-many',	'parent_type',	'Leads',	0,	0),
('60655019-a457-8819-8a17-5f899ba42427',	'documents_accounts',	'Documents',	'documents',	'id',	'Accounts',	'accounts',	'id',	'documents_accounts',	'document_id',	'account_id',	'many-to-many',	NULL,	NULL,	0,	0),
('60df7a90-aa20-cc80-6ade-5f899bc65b7b',	'aok_knowledge_base_categories_modified_user',	'Users',	'users',	'id',	'AOK_Knowledge_Base_Categories',	'aok_knowledge_base_categories',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('6104035d-5cd3-35ff-1f60-5f899bf19ea7',	'documents_contacts',	'Documents',	'documents',	'id',	'Contacts',	'contacts',	'id',	'documents_contacts',	'document_id',	'contact_id',	'many-to-many',	NULL,	NULL,	0,	0),
('619fe9d2-0200-b8e8-e943-5f899b074a03',	'documents_opportunities',	'Documents',	'documents',	'id',	'Opportunities',	'opportunities',	'id',	'documents_opportunities',	'document_id',	'opportunity_id',	'many-to-many',	NULL,	NULL,	0,	0),
('61aa1a2d-9622-4232-1352-5f899b649a5b',	'aok_knowledge_base_categories_created_by',	'Users',	'users',	'id',	'AOK_Knowledge_Base_Categories',	'aok_knowledge_base_categories',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('623b7077-572b-ad84-8e53-5f899b7f52d2',	'documents_cases',	'Documents',	'documents',	'id',	'Cases',	'cases',	'id',	'documents_cases',	'document_id',	'case_id',	'many-to-many',	NULL,	NULL,	0,	0),
('626eb843-00a9-6542-1c20-5f899bc7e8d0',	'aok_knowledge_base_categories_assigned_user',	'Users',	'users',	'id',	'AOK_Knowledge_Base_Categories',	'aok_knowledge_base_categories',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('62cfab6f-7db7-5afe-5411-5f899ba20a8a',	'documents_bugs',	'Documents',	'documents',	'id',	'Bugs',	'bugs',	'id',	'documents_bugs',	'document_id',	'bug_id',	'many-to-many',	NULL,	NULL,	0,	0),
('636cd363-5a41-7c72-c51f-5f899bb1e9b3',	'aok_knowledgebase_categories',	'AOK_KnowledgeBase',	'aok_knowledgebase',	'id',	'AOK_Knowledge_Base_Categories',	'aok_knowledge_base_categories',	'id',	'aok_knowledgebase_categories',	'aok_knowledgebase_id',	'aok_knowledge_base_categories_id',	'many-to-many',	NULL,	NULL,	0,	0),
('64383d26-c276-0d1d-6c90-5f899b28f8a4',	'am_projecttemplates_project_1',	'AM_ProjectTemplates',	'am_projecttemplates',	'id',	'Project',	'project',	'id',	'am_projecttemplates_project_1_c',	'am_projecttemplates_project_1am_projecttemplates_ida',	'am_projecttemplates_project_1project_idb',	'many-to-many',	NULL,	NULL,	0,	0),
('64703817-6304-29b8-33f9-5f899be8b80f',	'aok_knowledgebase_modified_user',	'Users',	'users',	'id',	'AOK_KnowledgeBase',	'aok_knowledgebase',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('6509e002-d0da-85f4-5feb-5f899b8a1f73',	'am_projecttemplates_contacts_1',	'AM_ProjectTemplates',	'am_projecttemplates',	'id',	'Contacts',	'contacts',	'id',	'am_projecttemplates_contacts_1_c',	'am_projecttemplates_ida',	'contacts_idb',	'many-to-many',	NULL,	NULL,	0,	0),
('658c5c70-ce33-c3f7-dc0c-5f899b820bea',	'aok_knowledgebase_created_by',	'Users',	'users',	'id',	'AOK_KnowledgeBase',	'aok_knowledgebase',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('65dd444e-9afa-f02f-ffa1-5f899b8e382e',	'am_projecttemplates_users_1',	'AM_ProjectTemplates',	'am_projecttemplates',	'id',	'Users',	'users',	'id',	'am_projecttemplates_users_1_c',	'am_projecttemplates_ida',	'users_idb',	'many-to-many',	NULL,	NULL,	0,	0),
('6679821c-2b20-3c14-3fa4-5f899b17df76',	'aok_knowledgebase_assigned_user',	'Users',	'users',	'id',	'AOK_KnowledgeBase',	'aok_knowledgebase',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('66b0a2b3-2e30-9656-9276-5f899baf14f7',	'am_tasktemplates_am_projecttemplates',	'AM_ProjectTemplates',	'am_projecttemplates',	'id',	'AM_TaskTemplates',	'am_tasktemplates',	'id',	'am_tasktemplates_am_projecttemplates_c',	'am_tasktemplates_am_projecttemplatesam_projecttemplates_ida',	'am_tasktemplates_am_projecttemplatesam_tasktemplates_idb',	'many-to-many',	NULL,	NULL,	0,	0),
('671f2c40-2c69-f7de-d939-5f899bc447ba',	'securitygroups_aok_knowledgebase',	'SecurityGroups',	'securitygroups',	'id',	'AOK_KnowledgeBase',	'aok_knowledgebase',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'AOK_KnowledgeBase',	0,	0),
('677ea6a5-35dc-5fb9-cc91-5f899b257c03',	'aos_contracts_documents',	'AOS_Contracts',	'aos_contracts',	'id',	'Documents',	'documents',	'id',	'aos_contracts_documents',	'aos_contracts_id',	'documents_id',	'many-to-many',	NULL,	NULL,	0,	0),
('68540a14-e915-4efb-dc4d-5f899bc37684',	'aos_quotes_aos_contracts',	'AOS_Quotes',	'aos_quotes',	'id',	'AOS_Contracts',	'aos_contracts',	'id',	'aos_quotes_os_contracts_c',	'aos_quotese81e_quotes_ida',	'aos_quotes4dc0ntracts_idb',	'many-to-many',	NULL,	NULL,	0,	0),
('68d304b2-69af-a0cd-1f45-5f899b52314e',	'reminders_modified_user',	'Users',	'users',	'id',	'Reminders',	'reminders',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('69308a60-23d2-67ee-1d24-5f899bc284ff',	'aos_quotes_aos_invoices',	'AOS_Quotes',	'aos_quotes',	'id',	'AOS_Invoices',	'aos_invoices',	'id',	'aos_quotes_aos_invoices_c',	'aos_quotes77d9_quotes_ida',	'aos_quotes6b83nvoices_idb',	'many-to-many',	NULL,	NULL,	0,	0),
('694e2680-1916-da52-6736-5f899b2d5d08',	'reminders_created_by',	'Users',	'users',	'id',	'Reminders',	'reminders',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('697109e3-10c9-119f-f03c-5f899b64323b',	'opportunities_modified_user',	'Users',	'users',	'id',	'Opportunities',	'opportunities',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('69e1955c-076a-3321-7960-5f899b62ee71',	'reminders_assigned_user',	'Users',	'users',	'id',	'Reminders',	'reminders',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('69fba39e-84a5-1dd2-6a1e-5f899b90b84d',	'aos_quotes_project',	'AOS_Quotes',	'aos_quotes',	'id',	'Project',	'project',	'id',	'aos_quotes_project_c',	'aos_quotes1112_quotes_ida',	'aos_quotes7207project_idb',	'many-to-many',	NULL,	NULL,	0,	0),
('6ace096b-f7a8-757e-7130-5f899bbeae7e',	'aow_processed_aow_actions',	'AOW_Processed',	'aow_processed',	'id',	'AOW_Actions',	'aow_actions',	'id',	'aow_processed_aow_actions',	'aow_processed_id',	'aow_action_id',	'many-to-many',	NULL,	NULL,	0,	0),
('6b31cccc-bf33-4d23-a9d5-5f899b8778ed',	'reminders_invitees_modified_user',	'Users',	'users',	'id',	'Reminders_Invitees',	'reminders_invitees',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('6ba08261-7552-4816-299e-5f899b93c340',	'fp_event_locations_fp_events_1',	'FP_Event_Locations',	'fp_event_locations',	'id',	'FP_events',	'fp_events',	'id',	'fp_event_locations_fp_events_1_c',	'fp_event_locations_fp_events_1fp_event_locations_ida',	'fp_event_locations_fp_events_1fp_events_idb',	'many-to-many',	NULL,	NULL,	0,	0),
('6ba155b6-de45-757a-e691-5f899bbe2c99',	'reminders_invitees_created_by',	'Users',	'users',	'id',	'Reminders_Invitees',	'reminders_invitees',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('6c3d29b1-c617-5a50-1b34-5f899bbe31ed',	'reminders_invitees_assigned_user',	'Users',	'users',	'id',	'Reminders_Invitees',	'reminders_invitees',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('6c685f1c-8458-d5ea-e9d7-5f899b8ce4fc',	'fp_events_contacts',	'FP_events',	'fp_events',	'id',	'Contacts',	'contacts',	'id',	'fp_events_contacts_c',	'fp_events_contactsfp_events_ida',	'fp_events_contactscontacts_idb',	'many-to-many',	NULL,	NULL,	0,	0),
('6d3e280f-0d1b-e97f-9e24-5f899b85b651',	'fp_events_fp_event_locations_1',	'FP_events',	'fp_events',	'id',	'FP_Event_Locations',	'fp_event_locations',	'id',	'fp_events_fp_event_locations_1_c',	'fp_events_fp_event_locations_1fp_events_ida',	'fp_events_fp_event_locations_1fp_event_locations_idb',	'many-to-many',	NULL,	NULL,	0,	0),
('6d592ad8-3bd1-2a0e-86e3-5f899bb9ba14',	'leads_modified_user',	'Users',	'users',	'id',	'Leads',	'leads',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('6e0f80e9-bea9-0567-7100-5f899b66e91e',	'leads_created_by',	'Users',	'users',	'id',	'Leads',	'leads',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('6e14108b-21f3-3bf6-29da-5f899bdd80b4',	'fp_events_modified_user',	'Users',	'users',	'id',	'FP_events',	'fp_events',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('6ea6ba98-d8c8-6e93-c481-5f899b0f222b',	'fp_events_created_by',	'Users',	'users',	'id',	'FP_events',	'fp_events',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('6eb38996-fe56-c738-e0d4-5f899b3e3a4d',	'leads_assigned_user',	'Users',	'users',	'id',	'Leads',	'leads',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('6f36bff3-8494-5e6f-611f-5f899bfea6ba',	'fp_events_assigned_user',	'Users',	'users',	'id',	'FP_events',	'fp_events',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('6f50c8c5-7643-4518-87bf-5f899b886c6d',	'fp_events_leads_1',	'FP_events',	'fp_events',	'id',	'Leads',	'leads',	'id',	'fp_events_leads_1_c',	'fp_events_leads_1fp_events_ida',	'fp_events_leads_1leads_idb',	'many-to-many',	NULL,	NULL,	0,	0),
('6f55074d-583e-828e-e9da-5f899b722b63',	'securitygroups_leads',	'SecurityGroups',	'securitygroups',	'id',	'Leads',	'leads',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'Leads',	0,	0),
('6fc617eb-9a1b-7ccc-582c-5f899bd12087',	'securitygroups_fp_events',	'SecurityGroups',	'securitygroups',	'id',	'FP_events',	'fp_events',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'FP_events',	0,	0),
('6ff2ab01-49e2-9802-7e7f-5f899b0f76ad',	'leads_email_addresses',	'Leads',	'leads',	'id',	'EmailAddresses',	'email_addresses',	'id',	'email_addr_bean_rel',	'bean_id',	'email_address_id',	'many-to-many',	'bean_module',	'Leads',	0,	0),
('701f26a4-60a4-f008-7c4a-5f899b142523',	'fp_events_prospects_1',	'FP_events',	'fp_events',	'id',	'Prospects',	'prospects',	'id',	'fp_events_prospects_1_c',	'fp_events_prospects_1fp_events_ida',	'fp_events_prospects_1prospects_idb',	'many-to-many',	NULL,	NULL,	0,	0),
('70874bc8-a0e2-cad8-eb7b-5f899bc13ae1',	'leads_email_addresses_primary',	'Leads',	'leads',	'id',	'EmailAddresses',	'email_addresses',	'id',	'email_addr_bean_rel',	'bean_id',	'email_address_id',	'many-to-many',	'primary_address',	'1',	0,	0),
('70f51ee3-0fe9-da33-6f91-5f899b077f09',	'jjwg_maps_jjwg_areas',	'jjwg_Maps',	'jjwg_maps',	'id',	'jjwg_Areas',	'jjwg_areas',	'id',	'jjwg_maps_jjwg_areas_c',	'jjwg_maps_5304wg_maps_ida',	'jjwg_maps_41f2g_areas_idb',	'many-to-many',	NULL,	NULL,	0,	0),
('711dbb73-0426-7542-6298-5f899b44e629',	'lead_direct_reports',	'Leads',	'leads',	'id',	'Leads',	'leads',	'reports_to_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('71390068-5f40-4057-b16a-5f899b9ffff8',	'outbound_email_assigned_user',	'Users',	'users',	'id',	'OutboundEmailAccounts',	'outbound_email',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('7139756c-0487-7217-0fc7-5f899ba24e07',	'fp_event_locations_modified_user',	'Users',	'users',	'id',	'FP_Event_Locations',	'fp_event_locations',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('71a72ee5-aeaa-ea19-ccbe-5f899b373e0f',	'fp_event_locations_created_by',	'Users',	'users',	'id',	'FP_Event_Locations',	'fp_event_locations',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('71be61dc-0f5f-098a-f340-5f899bccfa74',	'lead_tasks',	'Leads',	'leads',	'id',	'Tasks',	'tasks',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Leads',	0,	0),
('71bf3ca2-b52b-a38b-e0d5-5f899bab65d8',	'jjwg_maps_jjwg_markers',	'jjwg_Maps',	'jjwg_maps',	'id',	'jjwg_Markers',	'jjwg_markers',	'id',	'jjwg_maps_jjwg_markers_c',	'jjwg_maps_b229wg_maps_ida',	'jjwg_maps_2e31markers_idb',	'many-to-many',	NULL,	NULL,	0,	0),
('723c9939-469d-04d8-58ce-5f899bbce9e2',	'fp_event_locations_assigned_user',	'Users',	'users',	'id',	'FP_Event_Locations',	'fp_event_locations',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('724f6aa2-baaf-7b45-60b0-5f899bf5c923',	'lead_notes',	'Leads',	'leads',	'id',	'Notes',	'notes',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Leads',	0,	0),
('728c6b80-2b2b-e574-f90c-5f899bf03514',	'project_contacts_1',	'Project',	'project',	'id',	'Contacts',	'contacts',	'id',	'project_contacts_1_c',	'project_contacts_1project_ida',	'project_contacts_1contacts_idb',	'many-to-many',	NULL,	NULL,	0,	0),
('72d4bc6a-c7f6-09f9-36f9-5f899b608851',	'securitygroups_fp_event_locations',	'SecurityGroups',	'securitygroups',	'id',	'FP_Event_Locations',	'fp_event_locations',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'FP_Event_Locations',	0,	0),
('72eab6e7-4ce8-1015-678b-5f899b7a064f',	'lead_meetings',	'Leads',	'leads',	'id',	'Meetings',	'meetings',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Leads',	0,	0),
('7357612e-811a-5f77-4746-5f899b718437',	'project_users_1',	'Project',	'project',	'id',	'Users',	'users',	'id',	'project_users_1_c',	'project_users_1project_ida',	'project_users_1users_idb',	'many-to-many',	NULL,	NULL,	0,	0),
('738b3407-2f60-dc7b-3b7e-5f899b9af297',	'lead_calls',	'Leads',	'leads',	'id',	'Calls',	'calls',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Leads',	0,	0),
('738eaa73-335c-6540-0f9a-5f899b79fb13',	'optimistic_locking',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	0),
('7421a3e3-9f3a-f3a2-405a-5f899b8fc2b4',	'lead_emails',	'Leads',	'leads',	'id',	'Emails',	'emails',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Leads',	0,	0),
('7425bd74-840c-a833-12ea-5f899be9a4b3',	'securitygroups_acl_roles',	'SecurityGroups',	'securitygroups',	'id',	'ACLRoles',	'acl_roles',	'id',	'securitygroups_acl_roles',	'securitygroup_id',	'role_id',	'many-to-many',	NULL,	NULL,	0,	0),
('745bf8dc-3da5-c2bb-fabd-5f899bf3d04b',	'unified_search',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	0,	0),
('74ba287e-e883-0535-9207-5f899b95c294',	'lead_campaign_log',	'Leads',	'leads',	'id',	'CampaignLog',	'campaign_log',	'target_id',	NULL,	NULL,	NULL,	'one-to-many',	'target_type',	'Leads',	0,	0),
('75d3eaf7-c018-c1b6-ac2b-5f899b67d443',	'securitygroups_project_task',	'SecurityGroups',	'securitygroups',	'id',	'ProjectTask',	'project_task',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'ProjectTask',	0,	0),
('75dcee89-8164-399b-6148-5f899be84271',	'aod_indexevent_modified_user',	'Users',	'users',	'id',	'AOD_IndexEvent',	'aod_indexevent',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('76898acf-fdfb-d5ff-e07c-5f899b439462',	'aod_indexevent_created_by',	'Users',	'users',	'id',	'AOD_IndexEvent',	'aod_indexevent',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('76ab7325-0883-5aed-edba-5f899b493265',	'securitygroups_prospect_lists',	'SecurityGroups',	'securitygroups',	'id',	'ProspectLists',	'prospect_lists',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'ProspectLists',	0,	0),
('76d9b6e1-7571-b183-a4b4-5f899b1aae4e',	'cases_modified_user',	'Users',	'users',	'id',	'Cases',	'cases',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('7750afd4-7aab-c7c6-e0dc-5f899bc99e82',	'aod_indexevent_assigned_user',	'Users',	'users',	'id',	'AOD_IndexEvent',	'aod_indexevent',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('7757a00d-c6e5-d6c6-6666-5f899b06ba95',	'cases_created_by',	'Users',	'users',	'id',	'Cases',	'cases',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('77a9cd89-3e1c-9b29-ad96-5f899b86ab47',	'securitygroups_users',	'SecurityGroups',	'securitygroups',	'id',	'Users',	'users',	'id',	'securitygroups_users',	'securitygroup_id',	'user_id',	'many-to-many',	NULL,	NULL,	0,	0),
('77f745ba-f049-fb5d-06b2-5f899bf6fa53',	'cases_assigned_user',	'Users',	'users',	'id',	'Cases',	'cases',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('787bcc87-a9eb-fe6d-3fac-5f899b3889f6',	'surveyquestionoptions_surveyquestionresponses',	'SurveyQuestionOptions',	'surveyquestionoptions',	'id',	'SurveyQuestionResponses',	'surveyquestionresponses',	'id',	'surveyquestionoptions_surveyquestionresponses',	'surveyq72c7options_ida',	'surveyq10d4sponses_idb',	'many-to-many',	NULL,	NULL,	0,	0),
('7893b553-4874-ccb4-e7ea-5f899b4d8712',	'securitygroups_cases',	'SecurityGroups',	'securitygroups',	'id',	'Cases',	'cases',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'Cases',	0,	0),
('78fa21e8-6859-ffe5-abde-5f899bca5d14',	'aod_index_modified_user',	'Users',	'users',	'id',	'AOD_Index',	'aod_index',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('79317116-f444-9b2f-2686-5f899bdc940b',	'case_calls',	'Cases',	'cases',	'id',	'Calls',	'calls',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Cases',	0,	0),
('79a300a1-4aa9-26de-88c8-5f899b4978e2',	'aod_index_created_by',	'Users',	'users',	'id',	'AOD_Index',	'aod_index',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('79dc9e91-44e5-64d6-2623-5f899b4a292a',	'case_tasks',	'Cases',	'cases',	'id',	'Tasks',	'tasks',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Cases',	0,	0),
('7a703a19-4088-b0c4-0003-5f899b1cc6d0',	'aod_index_assigned_user',	'Users',	'users',	'id',	'AOD_Index',	'aod_index',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('7aa502cf-dc88-578a-57f5-5f899b0fb3f8',	'case_notes',	'Cases',	'cases',	'id',	'Notes',	'notes',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Cases',	0,	0),
('7b402895-58c6-5f53-97f3-5f899bebd843',	'case_meetings',	'Cases',	'cases',	'id',	'Meetings',	'meetings',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Cases',	0,	0),
('7bdfbbe1-436c-336e-b5b1-5f899b1ca984',	'case_emails',	'Cases',	'cases',	'id',	'Emails',	'emails',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Cases',	0,	0),
('7c0311f3-51a7-c9b0-5fb1-5f899b6de729',	'aop_case_events_modified_user',	'Users',	'users',	'id',	'AOP_Case_Events',	'aop_case_events',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('7c9a84a4-2b8e-208a-b995-5f899b37c61d',	'cases_created_contact',	'Contacts',	'contacts',	'id',	'Cases',	'cases',	'contact_created_by_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('7cb26033-3bd6-f742-0186-5f899b9eb34b',	'aop_case_events_created_by',	'Users',	'users',	'id',	'AOP_Case_Events',	'aop_case_events',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('7d788eee-0508-db13-84ca-5f899b0f34b5',	'aop_case_events_assigned_user',	'Users',	'users',	'id',	'AOP_Case_Events',	'aop_case_events',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('7e4d4b11-02f5-fd50-a6f7-5f899be6356c',	'cases_aop_case_events',	'Cases',	'cases',	'id',	'AOP_Case_Events',	'aop_case_events',	'case_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('7eed5326-f841-feb4-e7cc-5f899b968a04',	'bugs_modified_user',	'Users',	'users',	'id',	'Bugs',	'bugs',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('7fd6e744-f24f-da6d-78d6-5f899b400d52',	'aop_case_updates_modified_user',	'Users',	'users',	'id',	'AOP_Case_Updates',	'aop_case_updates',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('7ffdcade-17d4-abdf-e381-5f899becad01',	'bugs_created_by',	'Users',	'users',	'id',	'Bugs',	'bugs',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('807714b0-27f3-3fa1-28f6-5f899b06de5b',	'aop_case_updates_created_by',	'Users',	'users',	'id',	'AOP_Case_Updates',	'aop_case_updates',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('80ef4d90-d4ee-c294-e6cd-5f899bb16968',	'bugs_assigned_user',	'Users',	'users',	'id',	'Bugs',	'bugs',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('814091b6-d375-74b8-655a-5f899b14066f',	'aop_case_updates_assigned_user',	'Users',	'users',	'id',	'AOP_Case_Updates',	'aop_case_updates',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('819c2179-2df5-e52b-5806-5f899b82bc46',	'securitygroups_bugs',	'SecurityGroups',	'securitygroups',	'id',	'Bugs',	'bugs',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'Bugs',	0,	0),
('8206a7b6-368e-72d8-bdd8-5f899bec7f2c',	'cases_aop_case_updates',	'Cases',	'cases',	'id',	'AOP_Case_Updates',	'aop_case_updates',	'case_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('823d3fb1-1d65-ac8c-6f70-5f899b0c636e',	'bug_tasks',	'Bugs',	'bugs',	'id',	'Tasks',	'tasks',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Bugs',	0,	0),
('82d91e06-5710-9859-9481-5f899bde7da4',	'bug_meetings',	'Bugs',	'bugs',	'id',	'Meetings',	'meetings',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Bugs',	0,	0),
('82ee9f1e-b050-a820-9992-5f899baa70d8',	'aop_case_updates_notes',	'AOP_Case_Updates',	'aop_case_updates',	'id',	'Notes',	'notes',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'AOP_Case_Updates',	0,	0),
('837841f9-38ef-823b-2f64-5f899b834c8d',	'bug_calls',	'Bugs',	'bugs',	'id',	'Calls',	'calls',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Bugs',	0,	0),
('841e360e-3de5-0721-9bc3-5f899bb77844',	'bug_emails',	'Bugs',	'bugs',	'id',	'Emails',	'emails',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Bugs',	0,	0),
('84cd6934-a248-f621-1ab6-5f899b06fc0f',	'bug_notes',	'Bugs',	'bugs',	'id',	'Notes',	'notes',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Bugs',	0,	0),
('84ed4fa0-4c35-7aad-0508-5f899b71d358',	'aor_reports_modified_user',	'Users',	'users',	'id',	'AOR_Reports',	'aor_reports',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('8593d544-19ac-2952-55fe-5f899b959249',	'aor_reports_created_by',	'Users',	'users',	'id',	'AOR_Reports',	'aor_reports',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('85a2b1b6-94c8-861b-8924-5f899b11d73a',	'bugs_release',	'Releases',	'releases',	'id',	'Bugs',	'bugs',	'found_in_release',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('85b1067b-e31c-8496-7fe1-5f899bebec1f',	'opportunities_created_by',	'Users',	'users',	'id',	'Opportunities',	'opportunities',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('8656b7e8-98ab-b336-7002-5f899ba0f949',	'aor_reports_assigned_user',	'Users',	'users',	'id',	'AOR_Reports',	'aor_reports',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('8682b8e2-493a-04e1-fb96-5f899b040871',	'bugs_fixed_in_release',	'Releases',	'releases',	'id',	'Bugs',	'bugs',	'fixed_in_release',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('871d0df5-7abb-a2d4-0fe0-5f899bb723c4',	'securitygroups_aor_reports',	'SecurityGroups',	'securitygroups',	'id',	'AOR_Reports',	'aor_reports',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'AOR_Reports',	0,	0),
('87ac7159-37c2-b40d-83dc-5f899b4535a3',	'user_direct_reports',	'Users',	'users',	'id',	'Users',	'users',	'reports_to_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('87e3b6f0-9c69-8f52-ff39-5f899bdc8bd8',	'aor_reports_aor_fields',	'AOR_Reports',	'aor_reports',	'id',	'AOR_Fields',	'aor_fields',	'aor_report_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('88a4bc85-aaa4-72a4-f177-5f899baa7ac7',	'users_email_addresses',	'Users',	'users',	'id',	'EmailAddresses',	'email_addresses',	'id',	'email_addr_bean_rel',	'bean_id',	'email_address_id',	'many-to-many',	'bean_module',	'Users',	0,	0),
('88aaac91-c2c5-e7a2-82ae-5f899ba53298',	'aor_reports_aor_conditions',	'AOR_Reports',	'aor_reports',	'id',	'AOR_Conditions',	'aor_conditions',	'aor_report_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('89745a3b-2635-4a20-a6bd-5f899b5e8850',	'aor_scheduled_reports_aor_reports',	'AOR_Reports',	'aor_reports',	'id',	'AOR_Scheduled_Reports',	'aor_scheduled_reports',	'aor_report_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('8999d21d-25d0-9cde-866d-5f899bec095b',	'users_email_addresses_primary',	'Users',	'users',	'id',	'EmailAddresses',	'email_addresses',	'id',	'email_addr_bean_rel',	'bean_id',	'email_address_id',	'many-to-many',	'primary_address',	'1',	0,	0),
('8af005c7-314e-cf9d-d2ad-5f899bef2273',	'aor_fields_modified_user',	'Users',	'users',	'id',	'AOR_Fields',	'aor_fields',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('8b356638-5e0a-f2be-4a85-5f899bdf4db9',	'campaignlog_contact',	'CampaignLog',	'campaign_log',	'related_id',	'Contacts',	'contacts',	'id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('8b9336ae-956f-99bc-37bf-5f899b3fada2',	'aor_fields_created_by',	'Users',	'users',	'id',	'AOR_Fields',	'aor_fields',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('8be6dfbc-1c01-ddd6-e49d-5f899b2ef1f6',	'campaignlog_lead',	'CampaignLog',	'campaign_log',	'related_id',	'Leads',	'leads',	'id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('8cbe2a98-b292-bbbd-00f3-5f899b36847e',	'campaignlog_created_opportunities',	'CampaignLog',	'campaign_log',	'related_id',	'Opportunities',	'opportunities',	'id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('8cdf2d8f-fdd1-0804-510a-5f899b9cd8bb',	'aor_charts_modified_user',	'Users',	'users',	'id',	'AOR_Charts',	'aor_charts',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('8d875fdb-4616-13e3-3d06-5f899be2991c',	'aor_charts_created_by',	'Users',	'users',	'id',	'AOR_Charts',	'aor_charts',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('8d9053bf-3ab1-386f-dc8e-5f899bf2ad61',	'campaignlog_targeted_users',	'CampaignLog',	'campaign_log',	'target_id',	'Users',	'users',	'id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('8e194a0a-a07a-9b25-2ed5-5f899b342738',	'aor_charts_aor_reports',	'AOR_Reports',	'aor_reports',	'id',	'AOR_Charts',	'aor_charts',	'aor_report_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('8e6a5642-c03b-11de-40fe-5f899b0108bf',	'campaignlog_sent_emails',	'CampaignLog',	'campaign_log',	'related_id',	'Emails',	'emails',	'id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('8f6d27fd-7203-e268-3b75-5f899be9d77c',	'aor_conditions_modified_user',	'Users',	'users',	'id',	'AOR_Conditions',	'aor_conditions',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('8fde7a6b-8637-d3f4-8c16-5f899bc51b0d',	'aor_conditions_created_by',	'Users',	'users',	'id',	'AOR_Conditions',	'aor_conditions',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('9099d1e2-724b-6c89-576b-5f899bd65728',	'securitygroups_project',	'SecurityGroups',	'securitygroups',	'id',	'Project',	'project',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'Project',	0,	0),
('9171d2b7-acdc-79bf-f903-5f899b2ef6a6',	'aor_scheduled_reports_modified_user',	'Users',	'users',	'id',	'AOR_Scheduled_Reports',	'aor_scheduled_reports',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('91ca1e91-6e5e-c2ef-3dab-5f899b4e4822',	'projects_notes',	'Project',	'project',	'id',	'Notes',	'notes',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Project',	0,	0),
('91e15e5a-f823-94c9-0b36-5f899b396f73',	'aor_scheduled_reports_created_by',	'Users',	'users',	'id',	'AOR_Scheduled_Reports',	'aor_scheduled_reports',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('9273cdda-dad4-3d21-2358-5f899bffc2f5',	'securitygroups_aor_scheduled_reports',	'SecurityGroups',	'securitygroups',	'id',	'AOR_Scheduled_Reports',	'aor_scheduled_reports',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'AOR_Scheduled_Reports',	0,	0),
('92a7598f-067f-2758-e1f1-5f899bb9c0d1',	'projects_tasks',	'Project',	'project',	'id',	'Tasks',	'tasks',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Project',	0,	0),
('93879948-bc97-34ab-0734-5f899b260bb7',	'projects_meetings',	'Project',	'project',	'id',	'Meetings',	'meetings',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Project',	0,	0),
('943c0381-bc2e-3748-1ed0-5f899ba483d9',	'opportunities_assigned_user',	'Users',	'users',	'id',	'Opportunities',	'opportunities',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('9499b471-aa30-e1ae-90d0-5f899bea7a30',	'projects_calls',	'Project',	'project',	'id',	'Calls',	'calls',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Project',	0,	0),
('957a2c79-c205-fc06-740f-5f899b8ea896',	'projects_emails',	'Project',	'project',	'id',	'Emails',	'emails',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Project',	0,	0),
('959bd996-b715-8670-98fb-5f899ba45fc3',	'aos_contracts_modified_user',	'Users',	'users',	'id',	'AOS_Contracts',	'aos_contracts',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('960c0716-6962-b4af-2828-5f899b62c9da',	'aos_contracts_created_by',	'Users',	'users',	'id',	'AOS_Contracts',	'aos_contracts',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('96780b3b-a70c-2adc-e3ef-5f899bda8dc0',	'templatesectionline_modified_user',	'Users',	'users',	'id',	'TemplateSectionLine',	'templatesectionline',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('9698bb07-4919-f3c6-8272-5f899b14f272',	'aos_contracts_assigned_user',	'Users',	'users',	'id',	'AOS_Contracts',	'aos_contracts',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('9698e888-b08e-d99e-dc96-5f899bff6937',	'projects_project_tasks',	'Project',	'project',	'id',	'ProjectTask',	'project_task',	'project_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('97282f30-3143-bf23-a679-5f899bda8ba1',	'securitygroups_aos_contracts',	'SecurityGroups',	'securitygroups',	'id',	'AOS_Contracts',	'aos_contracts',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'AOS_Contracts',	0,	0),
('9796ba4e-d0da-c3f6-81c6-5f899bf1337b',	'projects_assigned_user',	'Users',	'users',	'id',	'Project',	'project',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('97c0b2ad-647a-74ef-5973-5f899be1f4b8',	'aos_contracts_tasks',	'AOS_Contracts',	'aos_contracts',	'id',	'Tasks',	'tasks',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'AOS_Contracts',	0,	0),
('984fd681-09eb-c640-366d-5f899b1ab509',	'aos_contracts_notes',	'AOS_Contracts',	'aos_contracts',	'id',	'Notes',	'notes',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'AOS_Contracts',	0,	0),
('986eaaf1-0a32-d8e9-3649-5f899bab708e',	'projects_modified_user',	'Users',	'users',	'id',	'Project',	'project',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('98e9ab49-1235-edd4-d5d5-5f899b273631',	'aos_contracts_meetings',	'AOS_Contracts',	'aos_contracts',	'id',	'Meetings',	'meetings',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'AOS_Contracts',	0,	0),
('994eea59-0808-4b15-e497-5f899b97d0d6',	'projects_created_by',	'Users',	'users',	'id',	'Project',	'project',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('997d102d-d117-cc03-a859-5f899bc10eea',	'aos_contracts_calls',	'AOS_Contracts',	'aos_contracts',	'id',	'Calls',	'calls',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'AOS_Contracts',	0,	0),
('9a0a5ee7-2765-0bd4-cdd5-5f899b956f82',	'aos_contracts_aos_products_quotes',	'AOS_Contracts',	'aos_contracts',	'id',	'AOS_Products_Quotes',	'aos_products_quotes',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('9b71fe3a-095f-bc08-0ccf-5f899b130d89',	'securitygroups_projecttask',	'SecurityGroups',	'securitygroups',	'id',	'ProjectTask',	'project_task',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'ProjectTask',	0,	0),
('9bbbd7bf-7478-6672-ec18-5f899b139a39',	'aos_contracts_aos_line_item_groups',	'AOS_Contracts',	'aos_contracts',	'id',	'AOS_Line_Item_Groups',	'aos_line_item_groups',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('9c7f3939-1c91-8da1-aa0d-5f899bfaa84a',	'project_tasks_notes',	'ProjectTask',	'project_task',	'id',	'Notes',	'notes',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'ProjectTask',	0,	0),
('9dd5754b-bac3-da83-3921-5f899b3d491a',	'project_tasks_tasks',	'ProjectTask',	'project_task',	'id',	'Tasks',	'tasks',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'ProjectTask',	0,	0),
('9df37e8d-4082-e9c5-2263-5f899b176e4b',	'aos_invoices_modified_user',	'Users',	'users',	'id',	'AOS_Invoices',	'aos_invoices',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('9e100a31-c785-e489-d27d-5f899b263725',	'securitygroups_modified_user',	'Users',	'users',	'id',	'SecurityGroups',	'securitygroups',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('9e9ccca2-fe50-8e1f-b663-5f899b38c8e6',	'aos_invoices_created_by',	'Users',	'users',	'id',	'AOS_Invoices',	'aos_invoices',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('9ecd44e7-a196-81d1-b432-5f899b75c7ff',	'project_tasks_meetings',	'ProjectTask',	'project_task',	'id',	'Meetings',	'meetings',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'ProjectTask',	0,	0),
('9f69bf32-fa47-d70b-a92f-5f899b07f4c8',	'aos_invoices_assigned_user',	'Users',	'users',	'id',	'AOS_Invoices',	'aos_invoices',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('9f887197-3d0b-1b7e-af7d-5f899bfdaeaf',	'project_tasks_calls',	'ProjectTask',	'project_task',	'id',	'Calls',	'calls',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'ProjectTask',	0,	0),
('a01b3e73-46cb-2a82-5906-5f899b89ebd9',	'project_tasks_emails',	'ProjectTask',	'project_task',	'id',	'Emails',	'emails',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'ProjectTask',	0,	0),
('a0288b74-4bc4-db08-3b1d-5f899be69672',	'securitygroups_aos_invoices',	'SecurityGroups',	'securitygroups',	'id',	'AOS_Invoices',	'aos_invoices',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'AOS_Invoices',	0,	0),
('a0a914e7-8ece-ab5f-3e55-5f899b1a4ec6',	'project_tasks_assigned_user',	'Users',	'users',	'id',	'ProjectTask',	'project_task',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('a1029327-61df-fd2b-f533-5f899b8c6e69',	'aos_invoices_aos_product_quotes',	'AOS_Invoices',	'aos_invoices',	'id',	'AOS_Products_Quotes',	'aos_products_quotes',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('a139b0c0-a215-4583-ea93-5f899ba82032',	'project_tasks_modified_user',	'Users',	'users',	'id',	'ProjectTask',	'project_task',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('a1cc3c56-0393-718b-ebc1-5f899b6e19b6',	'aos_invoices_aos_line_item_groups',	'AOS_Invoices',	'aos_invoices',	'id',	'AOS_Line_Item_Groups',	'aos_line_item_groups',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('a1cdb658-bac5-6766-205a-5f899b159b6a',	'project_tasks_created_by',	'Users',	'users',	'id',	'ProjectTask',	'project_task',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('a1dd0898-21bd-de46-0599-5f899b64efcc',	'templatesectionline_created_by',	'Users',	'users',	'id',	'TemplateSectionLine',	'templatesectionline',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('a213096e-c885-7bca-54bf-5f899b411ed6',	'securitygroups_opportunities',	'SecurityGroups',	'securitygroups',	'id',	'Opportunities',	'opportunities',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'Opportunities',	0,	0),
('a3969f6c-1513-cadb-44e5-5f899bc77f46',	'aos_pdf_templates_modified_user',	'Users',	'users',	'id',	'AOS_PDF_Templates',	'aos_pdf_templates',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('a436f020-11b3-143b-5bc2-5f899b6290f2',	'aos_pdf_templates_created_by',	'Users',	'users',	'id',	'AOS_PDF_Templates',	'aos_pdf_templates',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('a504c9c0-a3d2-8b43-ee5a-5f899b54001f',	'aos_pdf_templates_assigned_user',	'Users',	'users',	'id',	'AOS_PDF_Templates',	'aos_pdf_templates',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('a50f08b3-f65a-57a1-a80d-5f899b62c04e',	'campaigns_modified_user',	'Users',	'users',	'id',	'Campaigns',	'campaigns',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('a593341d-2bdb-1a87-56bc-5f899bbfc450',	'campaigns_created_by',	'Users',	'users',	'id',	'Campaigns',	'campaigns',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('a5c75a1f-88de-6d06-1aec-5f899b57ec7c',	'securitygroups_aos_pdf_templates',	'SecurityGroups',	'securitygroups',	'id',	'AOS_PDF_Templates',	'aos_pdf_templates',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'AOS_PDF_Templates',	0,	0),
('a62c4667-51f1-fbbc-7011-5f899bb3b260',	'campaigns_assigned_user',	'Users',	'users',	'id',	'Campaigns',	'campaigns',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('a6d1a9c5-5dd6-d7f2-9748-5f899be62aa2',	'securitygroups_campaigns',	'SecurityGroups',	'securitygroups',	'id',	'Campaigns',	'campaigns',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'Campaigns',	0,	0),
('a76a1731-4065-3ebb-31db-5f899b0b2764',	'aos_product_categories_modified_user',	'Users',	'users',	'id',	'AOS_Product_Categories',	'aos_product_categories',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('a781f323-45af-4906-ab46-5f899bf1f79a',	'campaign_accounts',	'Campaigns',	'campaigns',	'id',	'Accounts',	'accounts',	'campaign_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('a81c6c39-a135-7030-9504-5f899b239c71',	'aos_product_categories_created_by',	'Users',	'users',	'id',	'AOS_Product_Categories',	'aos_product_categories',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('a822f510-eede-ebe3-8560-5f899b91e2df',	'campaign_contacts',	'Campaigns',	'campaigns',	'id',	'Contacts',	'contacts',	'campaign_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('a8adea17-34a9-c798-431c-5f899b044d8b',	'campaign_leads',	'Campaigns',	'campaigns',	'id',	'Leads',	'leads',	'campaign_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('a8e5f11a-4121-734b-5b35-5f899bea8c94',	'aos_product_categories_assigned_user',	'Users',	'users',	'id',	'AOS_Product_Categories',	'aos_product_categories',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('a94395fe-2c14-602c-cfba-5f899b24ad83',	'campaign_prospects',	'Campaigns',	'campaigns',	'id',	'Prospects',	'prospects',	'campaign_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('a9a91c04-afaa-6974-a176-5f899bbe8c1e',	'securitygroups_aos_product_categories',	'SecurityGroups',	'securitygroups',	'id',	'AOS_Product_Categories',	'aos_product_categories',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'AOS_Product_Categories',	0,	0),
('a9dac9b2-b01a-7c31-7593-5f899b40264f',	'campaign_opportunities',	'Campaigns',	'campaigns',	'id',	'Opportunities',	'opportunities',	'campaign_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('aa73e303-cffc-51fc-944d-5f899be1fc1b',	'campaign_email_marketing',	'Campaigns',	'campaigns',	'id',	'EmailMarketing',	'email_marketing',	'campaign_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('ab04d297-10bf-f6ab-8dca-5f899bb0fd52',	'campaign_emailman',	'Campaigns',	'campaigns',	'id',	'EmailMan',	'emailman',	'campaign_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('abdc6f16-b996-a6b4-d287-5f899bab3077',	'sub_product_categories',	'AOS_Product_Categories',	'aos_product_categories',	'id',	'AOS_Product_Categories',	'aos_product_categories',	'parent_category_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('abfe4505-56a8-91aa-9808-5f899b41cd5a',	'campaign_campaignlog',	'Campaigns',	'campaigns',	'id',	'CampaignLog',	'campaign_log',	'campaign_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('ad1844b3-9eb2-bb30-ef56-5f899bd10842',	'campaign_assigned_user',	'Users',	'users',	'id',	'Campaigns',	'campaigns',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('adfaf723-1ecf-b410-e3af-5f899b62e774',	'aos_products_modified_user',	'Users',	'users',	'id',	'AOS_Products',	'aos_products',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('ae410c7c-4100-9dc7-eca8-5f899b52fd2f',	'campaign_modified_user',	'Users',	'users',	'id',	'Campaigns',	'campaigns',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('aeac575b-dde7-a5ca-8dba-5f899bcc6b09',	'aos_products_created_by',	'Users',	'users',	'id',	'AOS_Products',	'aos_products',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('af6299a1-d864-5890-ab50-5f899bb50b5b',	'surveyresponses_campaigns',	'Campaigns',	'campaigns',	'id',	'SurveyResponses',	'surveyresponses',	'campaign_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('af755ffb-233d-fed2-d80e-5f899b31d4a7',	'aos_products_assigned_user',	'Users',	'users',	'id',	'AOS_Products',	'aos_products',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('affd0771-7f44-dc78-1ba8-5f899ba0f070',	'opportunity_calls',	'Opportunities',	'opportunities',	'id',	'Calls',	'calls',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Opportunities',	0,	0),
('b09ade86-2b93-a754-44f2-5f899b6f6db7',	'securitygroups_aos_products',	'SecurityGroups',	'securitygroups',	'id',	'AOS_Products',	'aos_products',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'AOS_Products',	0,	0),
('b1f0ed8b-3017-b502-4c2e-5f899b478906',	'product_categories',	'AOS_Product_Categories',	'aos_product_categories',	'id',	'AOS_Products',	'aos_products',	'aos_product_category_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('b48fba25-c245-b4d7-a81c-5f899b94a212',	'prospectlists_assigned_user',	'Users',	'users',	'id',	'prospectlists',	'prospect_lists',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('b5a1e5f0-1272-7a02-9eef-5f899b064388',	'securitygroups_prospectlists',	'SecurityGroups',	'securitygroups',	'id',	'ProspectLists',	'prospect_lists',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'ProspectLists',	0,	0),
('b9654869-ed70-21c2-e1c1-5f899b50c00d',	'aos_products_quotes_modified_user',	'Users',	'users',	'id',	'AOS_Products_Quotes',	'aos_products_quotes',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('ba8e7ccf-848c-6199-6e8c-5f899b56f7b9',	'aos_products_quotes_created_by',	'Users',	'users',	'id',	'AOS_Products_Quotes',	'aos_products_quotes',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('bbd15e2c-1cf4-e429-b232-5f899bb1b897',	'aos_products_quotes_assigned_user',	'Users',	'users',	'id',	'AOS_Products_Quotes',	'aos_products_quotes',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('bd044b0b-ade4-1868-5768-5f899b8a0576',	'aos_product_quotes_aos_products',	'AOS_Products',	'aos_products',	'id',	'AOS_Products_Quotes',	'aos_products_quotes',	'product_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('bd8d0fe9-2377-9862-c992-5f899b1721ad',	'opportunity_meetings',	'Opportunities',	'opportunities',	'id',	'Meetings',	'meetings',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Opportunities',	0,	0),
('be1e2490-2648-6263-53cd-5f899baf43b3',	'prospects_modified_user',	'Users',	'users',	'id',	'Prospects',	'prospects',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('bee4afe8-9e0a-59bb-33ff-5f899b4b7f4b',	'prospects_created_by',	'Users',	'users',	'id',	'Prospects',	'prospects',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('bf9af46b-4ee7-c322-f84d-5f899bd6c156',	'prospects_assigned_user',	'Users',	'users',	'id',	'Prospects',	'prospects',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('c0080bac-b1f5-a8c9-7892-5f899b9c9702',	'oauth2tokens_modified_user',	'Users',	'users',	'id',	'OAuth2Tokens',	'oauth2tokens',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('c04823eb-cadd-1ac4-7294-5f899be7288b',	'securitygroups_prospects',	'SecurityGroups',	'securitygroups',	'id',	'Prospects',	'prospects',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'Prospects',	0,	0),
('c0fed7a9-005f-0a4d-5d60-5f899bc8e29b',	'prospects_email_addresses',	'Prospects',	'prospects',	'id',	'EmailAddresses',	'email_addresses',	'id',	'email_addr_bean_rel',	'bean_id',	'email_address_id',	'many-to-many',	'bean_module',	'Prospects',	0,	0),
('c1abf4ca-3ae8-0892-f659-5f899b47292d',	'prospects_email_addresses_primary',	'Prospects',	'prospects',	'id',	'EmailAddresses',	'email_addresses',	'id',	'email_addr_bean_rel',	'bean_id',	'email_address_id',	'many-to-many',	'primary_address',	'1',	0,	0),
('c258cecd-e5a8-5ae8-6a49-5f899bbdf421',	'prospect_tasks',	'Prospects',	'prospects',	'id',	'Tasks',	'tasks',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Prospects',	0,	0),
('c28a9aa0-0ea5-61a7-aa16-5f899bc7d0a8',	'aos_line_item_groups_modified_user',	'Users',	'users',	'id',	'AOS_Line_Item_Groups',	'aos_line_item_groups',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('c336e3b7-7921-b979-5acc-5f899b05aac4',	'prospect_notes',	'Prospects',	'prospects',	'id',	'Notes',	'notes',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Prospects',	0,	0),
('c3752551-8e5b-8775-0f05-5f899b81f65c',	'aos_line_item_groups_created_by',	'Users',	'users',	'id',	'AOS_Line_Item_Groups',	'aos_line_item_groups',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('c418f5d6-14f8-e304-325a-5f899bead277',	'prospect_meetings',	'Prospects',	'prospects',	'id',	'Meetings',	'meetings',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Prospects',	0,	0),
('c43a044a-0b40-ba28-9380-5f899b133c51',	'aos_line_item_groups_assigned_user',	'Users',	'users',	'id',	'AOS_Line_Item_Groups',	'aos_line_item_groups',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('c4eeb2eb-8947-bfcc-47c6-5f899b545f76',	'groups_aos_product_quotes',	'AOS_Line_Item_Groups',	'aos_line_item_groups',	'id',	'AOS_Products_Quotes',	'aos_products_quotes',	'group_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('c502c24b-23bf-bb56-4ac3-5f899b1f15d0',	'prospect_calls',	'Prospects',	'prospects',	'id',	'Calls',	'calls',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Prospects',	0,	0),
('c5e77623-1495-6b42-f3cd-5f899b56423b',	'prospect_emails',	'Prospects',	'prospects',	'id',	'Emails',	'emails',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Prospects',	0,	0),
('c6c8759f-88f9-5ab3-d0c6-5f899b917283',	'prospect_campaign_log',	'Prospects',	'prospects',	'id',	'CampaignLog',	'campaign_log',	'target_id',	NULL,	NULL,	NULL,	'one-to-many',	'target_type',	'Prospects',	0,	0),
('c8040c14-2a83-a749-cd6c-5f899b1dc4d5',	'aos_quotes_modified_user',	'Users',	'users',	'id',	'AOS_Quotes',	'aos_quotes',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('c88aea6a-282f-20ff-0928-5f899bca3798',	'aos_quotes_created_by',	'Users',	'users',	'id',	'AOS_Quotes',	'aos_quotes',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('c8c1671d-2441-a375-7d85-5f899b26df5c',	'securitygroups_emailmarketing',	'SecurityGroups',	'securitygroups',	'id',	'EmailMarketing',	'email_marketing',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'EmailMarketing',	0,	0),
('c92be24f-76fb-70af-e573-5f899be059bb',	'aos_quotes_assigned_user',	'Users',	'users',	'id',	'AOS_Quotes',	'aos_quotes',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('c98af3ff-562b-833f-2912-5f899b83429b',	'email_template_email_marketings',	'EmailTemplates',	'email_templates',	'id',	'EmailMarketing',	'email_marketing',	'template_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('c9ce9781-87fe-825d-2128-5f899b63ce22',	'securitygroups_aos_quotes',	'SecurityGroups',	'securitygroups',	'id',	'AOS_Quotes',	'aos_quotes',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'AOS_Quotes',	0,	0),
('ca7d01a4-bf3f-30d4-748c-5f899b3a99d5',	'aos_quotes_aos_product_quotes',	'AOS_Quotes',	'aos_quotes',	'id',	'AOS_Products_Quotes',	'aos_products_quotes',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('cb0f1bfe-cebf-74c5-fa96-5f899bc3bfd8',	'campaign_campaigntrakers',	'Campaigns',	'campaigns',	'id',	'CampaignTrackers',	'campaign_trkrs',	'campaign_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('cb16d5ab-bb32-34e8-f810-5f899b437774',	'aos_quotes_aos_line_item_groups',	'AOS_Quotes',	'aos_quotes',	'id',	'AOS_Line_Item_Groups',	'aos_line_item_groups',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('cb520cc9-3295-03ae-3a9e-5f899bb45193',	'opportunity_tasks',	'Opportunities',	'opportunities',	'id',	'Tasks',	'tasks',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Opportunities',	0,	0),
('cc470b95-92cf-f6f3-fbfe-5f899b6f648e',	'oauth2tokens_created_by',	'Users',	'users',	'id',	'OAuth2Tokens',	'oauth2tokens',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('ccb88427-774b-3eea-0653-5f899b740622',	'aow_actions_modified_user',	'Users',	'users',	'id',	'AOW_Actions',	'aow_actions',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('cd325ab7-42b0-00df-2288-5f899b07e327',	'aow_actions_created_by',	'Users',	'users',	'id',	'AOW_Actions',	'aow_actions',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('ceea3bcc-69c0-9861-b4bb-5f899be98b25',	'schedulers_created_by_rel',	'Users',	'users',	'id',	'Schedulers',	'schedulers',	'created_by',	NULL,	NULL,	NULL,	'one-to-one',	NULL,	NULL,	0,	0),
('cf34723e-ec6a-6e45-de43-5f899bf11c9b',	'aow_workflow_modified_user',	'Users',	'users',	'id',	'AOW_WorkFlow',	'aow_workflow',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('cfa9ddca-5608-7027-d623-5f899b8c16ba',	'schedulers_modified_user_id_rel',	'Users',	'users',	'id',	'Schedulers',	'schedulers',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('cfb10c14-5514-07ad-c5ec-5f899b4eb31a',	'aow_workflow_created_by',	'Users',	'users',	'id',	'AOW_WorkFlow',	'aow_workflow',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('d052c2c7-76e4-6817-dc88-5f899bde6ef1',	'aow_workflow_assigned_user',	'Users',	'users',	'id',	'AOW_WorkFlow',	'aow_workflow',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('d0829527-fc0f-b3a4-4dd6-5f899bfa02ca',	'schedulers_jobs_rel',	'Schedulers',	'schedulers',	'id',	'SchedulersJobs',	'job_queue',	'scheduler_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('d0f5ad74-e0af-3fc9-8430-5f899b90cb8f',	'securitygroups_aow_workflow',	'SecurityGroups',	'securitygroups',	'id',	'AOW_WorkFlow',	'aow_workflow',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'AOW_WorkFlow',	0,	0),
('d19ef008-0fad-17cf-6b9b-5f899b75292a',	'aow_workflow_aow_conditions',	'AOW_WorkFlow',	'aow_workflow',	'id',	'AOW_Conditions',	'aow_conditions',	'aow_workflow_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('d1ba2882-4897-8d21-9a33-5f899bf30f2d',	'schedulersjobs_assigned_user',	'Users',	'users',	'id',	'SchedulersJobs',	'job_queue',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('d237d248-b9d6-2dab-0400-5f899b3b56b7',	'aow_workflow_aow_actions',	'AOW_WorkFlow',	'aow_workflow',	'id',	'AOW_Actions',	'aow_actions',	'aow_workflow_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('d2cdb242-51d0-729a-2a51-5f899bea8fcf',	'aow_workflow_aow_processed',	'AOW_WorkFlow',	'aow_workflow',	'id',	'AOW_Processed',	'aow_processed',	'aow_workflow_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('d4863f5e-e730-71af-9e5c-5f899bce6db9',	'aow_processed_modified_user',	'Users',	'users',	'id',	'AOW_Processed',	'aow_processed',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('d51ef151-717a-b0b9-b5ac-5f899bef5526',	'aow_processed_created_by',	'Users',	'users',	'id',	'AOW_Processed',	'aow_processed',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('d68227be-8bbc-040c-ffab-5f899bb35d02',	'contacts_modified_user',	'Users',	'users',	'id',	'Contacts',	'contacts',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('d6d3cf50-acb3-d9d4-2373-5f899b324cb8',	'aow_conditions_modified_user',	'Users',	'users',	'id',	'AOW_Conditions',	'aow_conditions',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('d74a79e3-f1c5-8789-380b-5f899b7ef3ab',	'aow_conditions_created_by',	'Users',	'users',	'id',	'AOW_Conditions',	'aow_conditions',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('d7581722-5d0f-4438-9728-5f899bfe9164',	'contacts_created_by',	'Users',	'users',	'id',	'Contacts',	'contacts',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('d839bfff-cb49-6ba6-e102-5f899bb54b3a',	'contacts_assigned_user',	'Users',	'users',	'id',	'Contacts',	'contacts',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('d9229e08-56b9-012d-cafe-5f899b64f3dc',	'securitygroups_contacts',	'SecurityGroups',	'securitygroups',	'id',	'Contacts',	'contacts',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'Contacts',	0,	0),
('d9d006c6-6e2c-3cc5-21a9-5f899b4f8257',	'opportunity_notes',	'Opportunities',	'opportunities',	'id',	'Notes',	'notes',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Opportunities',	0,	0),
('d9e48b79-f404-f753-3153-5f899b9f9917',	'jjwg_maps_modified_user',	'Users',	'users',	'id',	'jjwg_Maps',	'jjwg_maps',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('d9e80943-4524-ec2b-da3f-5f899bf89922',	'oauth2tokens_assigned_user',	'Users',	'users',	'id',	'OAuth2Tokens',	'oauth2tokens',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('da06af7d-9e41-ce74-e72f-5f899bf3c377',	'contacts_email_addresses',	'Contacts',	'contacts',	'id',	'EmailAddresses',	'email_addresses',	'id',	'email_addr_bean_rel',	'bean_id',	'email_address_id',	'many-to-many',	'bean_module',	'Contacts',	0,	0),
('da659903-900d-802c-92db-5f899b065f47',	'jjwg_maps_created_by',	'Users',	'users',	'id',	'jjwg_Maps',	'jjwg_maps',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('daf4a355-8bb4-03dd-32a5-5f899b824507',	'contacts_email_addresses_primary',	'Contacts',	'contacts',	'id',	'EmailAddresses',	'email_addresses',	'id',	'email_addr_bean_rel',	'bean_id',	'email_address_id',	'many-to-many',	'primary_address',	'1',	0,	0),
('db04cf57-fea4-7962-3e5b-5f899b1a6592',	'jjwg_maps_assigned_user',	'Users',	'users',	'id',	'jjwg_Maps',	'jjwg_maps',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('dba57c60-7d4b-9408-1116-5f899b8b3244',	'securitygroups_jjwg_maps',	'SecurityGroups',	'securitygroups',	'id',	'jjwg_Maps',	'jjwg_maps',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'jjwg_Maps',	0,	0),
('dbe1735d-fd37-ff3e-d9bf-5f899b829e5c',	'contact_direct_reports',	'Contacts',	'contacts',	'id',	'Contacts',	'contacts',	'reports_to_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('dc3f6fea-5b16-4bf2-bf2d-5f899b5d3723',	'jjwg_Maps_accounts',	'jjwg_Maps',	'jjwg_Maps',	'parent_id',	'Accounts',	'accounts',	'id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Accounts',	0,	0),
('dcc1267d-ac4f-2344-aff5-5f899b052e27',	'contact_leads',	'Contacts',	'contacts',	'id',	'Leads',	'leads',	'contact_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('dcd51ec8-4521-3c55-4814-5f899b8da43f',	'jjwg_Maps_contacts',	'jjwg_Maps',	'jjwg_Maps',	'parent_id',	'Contacts',	'contacts',	'id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Contacts',	0,	0),
('dd70213e-2a89-c6db-09be-5f899b703a3a',	'jjwg_Maps_leads',	'jjwg_Maps',	'jjwg_Maps',	'parent_id',	'Leads',	'leads',	'id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Leads',	0,	0),
('dd9e1fcf-7d9c-f2ef-643d-5f899bf89038',	'contact_notes',	'Contacts',	'contacts',	'id',	'Notes',	'notes',	'contact_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('de450ccb-ac47-6d27-4dd2-5f899b652ba2',	'jjwg_Maps_opportunities',	'jjwg_Maps',	'jjwg_Maps',	'parent_id',	'Opportunities',	'opportunities',	'id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Opportunities',	0,	0),
('de838e05-9fb3-e221-70eb-5f899b991f8e',	'contact_tasks',	'Contacts',	'contacts',	'id',	'Tasks',	'tasks',	'contact_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('df1fe20f-9c28-6984-1aa4-5f899bdc2214',	'jjwg_Maps_cases',	'jjwg_Maps',	'jjwg_Maps',	'parent_id',	'Cases',	'cases',	'id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Cases',	0,	0),
('df5f1ce3-b950-6473-654c-5f899ba2e0b1',	'contact_tasks_parent',	'Contacts',	'contacts',	'id',	'Tasks',	'tasks',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Contacts',	0,	0),
('dff1950a-1f3a-ad10-add3-5f899b5fb800',	'jjwg_Maps_projects',	'jjwg_Maps',	'jjwg_Maps',	'parent_id',	'Project',	'project',	'id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Project',	0,	0),
('e04a7b22-5f1d-217e-5725-5f899bd496b0',	'contact_notes_parent',	'Contacts',	'contacts',	'id',	'Notes',	'notes',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Contacts',	0,	0),
('e0c5a5fe-8bcc-24c2-c2b5-5f899b82285b',	'jjwg_Maps_meetings',	'jjwg_Maps',	'jjwg_Maps',	'parent_id',	'Meetings',	'meetings',	'id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Meetings',	0,	0),
('e130d69d-e0e0-e174-00eb-5f899b2de937',	'contact_campaign_log',	'Contacts',	'contacts',	'id',	'CampaignLog',	'campaign_log',	'target_id',	NULL,	NULL,	NULL,	'one-to-many',	'target_type',	'Contacts',	0,	0),
('e198e578-d03f-d9d7-5e47-5f899b6cb473',	'jjwg_Maps_prospects',	'jjwg_Maps',	'jjwg_Maps',	'parent_id',	'Prospects',	'prospects',	'id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Prospects',	0,	0),
('e2244973-7b22-64fe-8d03-5f899bef9e9d',	'contact_aos_quotes',	'Contacts',	'contacts',	'id',	'AOS_Quotes',	'aos_quotes',	'billing_contact_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('e316444e-ca01-9e6e-5ae7-5f899bf69a6a',	'contact_aos_invoices',	'Contacts',	'contacts',	'id',	'AOS_Invoices',	'aos_invoices',	'billing_contact_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('e3fe0918-26a3-cf8a-f6e2-5f899b810132',	'contact_aos_contracts',	'Contacts',	'contacts',	'id',	'AOS_Contracts',	'aos_contracts',	'contact_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('e4141332-b8d1-3052-9486-5f899b1b67b3',	'jjwg_markers_modified_user',	'Users',	'users',	'id',	'jjwg_Markers',	'jjwg_markers',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('e4c9e729-c5f7-bfac-5d1b-5f899ba084c0',	'jjwg_markers_created_by',	'Users',	'users',	'id',	'jjwg_Markers',	'jjwg_markers',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('e4e03763-a61c-3be3-904f-5f899bfad1ff',	'contacts_aop_case_updates',	'Contacts',	'contacts',	'id',	'AOP_Case_Updates',	'aop_case_updates',	'contact_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('e5908052-f441-6f65-6612-5f899b4a8813',	'jjwg_markers_assigned_user',	'Users',	'users',	'id',	'jjwg_Markers',	'jjwg_markers',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('e66c66fd-f0d4-4cc0-20ef-5f899b1db081',	'securitygroups_jjwg_markers',	'SecurityGroups',	'securitygroups',	'id',	'jjwg_Markers',	'jjwg_markers',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'jjwg_Markers',	0,	0),
('e71c08a2-77b1-8004-60bd-5f899b8bb9e5',	'opportunity_emails',	'Opportunities',	'opportunities',	'id',	'Emails',	'emails',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Opportunities',	0,	0),
('e8e6876a-5411-fff3-14b9-5f899b9ccef8',	'jjwg_areas_modified_user',	'Users',	'users',	'id',	'jjwg_Areas',	'jjwg_areas',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('e973ddd8-c5fb-0035-37f1-5f899ba13baf',	'accounts_modified_user',	'Users',	'users',	'id',	'Accounts',	'accounts',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('e99301db-541a-2c2a-acd0-5f899bba2933',	'jjwg_areas_created_by',	'Users',	'users',	'id',	'jjwg_Areas',	'jjwg_areas',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('ea2327ac-44f6-8b42-f402-5f899be7cb99',	'accounts_created_by',	'Users',	'users',	'id',	'Accounts',	'accounts',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('ea67cc12-af91-3f13-322c-5f899b5b59ea',	'jjwg_areas_assigned_user',	'Users',	'users',	'id',	'jjwg_Areas',	'jjwg_areas',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('ead816f6-b62c-58a8-6506-5f899b35b66d',	'accounts_assigned_user',	'Users',	'users',	'id',	'Accounts',	'accounts',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('eb42da58-c6f5-e149-e481-5f899bc1739e',	'securitygroups_jjwg_areas',	'SecurityGroups',	'securitygroups',	'id',	'jjwg_Areas',	'jjwg_areas',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'jjwg_Areas',	0,	0),
('eb9038b3-b979-23af-9714-5f899b352e25',	'securitygroups_accounts',	'SecurityGroups',	'securitygroups',	'id',	'Accounts',	'accounts',	'id',	'securitygroups_records',	'securitygroup_id',	'record_id',	'many-to-many',	'module',	'Accounts',	0,	0),
('ec499e16-22b1-e6e0-41ba-5f899b734da6',	'accounts_email_addresses',	'Accounts',	'accounts',	'id',	'EmailAddresses',	'email_addresses',	'id',	'email_addr_bean_rel',	'bean_id',	'email_address_id',	'many-to-many',	'bean_module',	'Accounts',	0,	0),
('ed0181f3-dae7-e5c7-9460-5f899b9818a2',	'accounts_email_addresses_primary',	'Accounts',	'accounts',	'id',	'EmailAddresses',	'email_addresses',	'id',	'email_addr_bean_rel',	'bean_id',	'email_address_id',	'many-to-many',	'primary_address',	'1',	0,	0),
('ed7c8246-0559-c505-cf86-5f899b7909fe',	'jjwg_address_cache_modified_user',	'Users',	'users',	'id',	'jjwg_Address_Cache',	'jjwg_address_cache',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('edb4ee3d-66a3-9334-6f2d-5f899bb0d30e',	'member_accounts',	'Accounts',	'accounts',	'id',	'Accounts',	'accounts',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('ee39e207-8fbe-96d0-4843-5f899b35675f',	'jjwg_address_cache_created_by',	'Users',	'users',	'id',	'jjwg_Address_Cache',	'jjwg_address_cache',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('ee6c06c9-446c-02ee-9d8e-5f899bf31918',	'account_cases',	'Accounts',	'accounts',	'id',	'Cases',	'cases',	'account_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('ef10af30-288d-f730-5e61-5f899bb546f1',	'jjwg_address_cache_assigned_user',	'Users',	'users',	'id',	'jjwg_Address_Cache',	'jjwg_address_cache',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('ef27abe8-1056-d46d-2c37-5f899bb10f31',	'account_tasks',	'Accounts',	'accounts',	'id',	'Tasks',	'tasks',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Accounts',	0,	0),
('efe71cb6-0d4a-4b83-68ce-5f899bb080ac',	'account_notes',	'Accounts',	'accounts',	'id',	'Notes',	'notes',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Accounts',	0,	0),
('f0aafd39-69e5-13d0-7be3-5f899b3270f1',	'account_meetings',	'Accounts',	'accounts',	'id',	'Meetings',	'meetings',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Accounts',	0,	0),
('f102ad2d-6914-88fc-ad9a-5f899b3476eb',	'calls_reschedule_modified_user',	'Users',	'users',	'id',	'Calls_Reschedule',	'calls_reschedule',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('f1643256-b29f-e1ac-331c-5f899b3d927b',	'account_calls',	'Accounts',	'accounts',	'id',	'Calls',	'calls',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Accounts',	0,	0),
('f1bd39fb-ab61-636a-542a-5f899b7b3f2f',	'calls_reschedule_created_by',	'Users',	'users',	'id',	'Calls_Reschedule',	'calls_reschedule',	'created_by',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('f237e8e9-3a45-f01e-1128-5f899b5e743f',	'account_emails',	'Accounts',	'accounts',	'id',	'Emails',	'emails',	'parent_id',	NULL,	NULL,	NULL,	'one-to-many',	'parent_type',	'Accounts',	0,	0),
('f2986f30-f859-a6cd-41cf-5f899b0690f6',	'calls_reschedule_assigned_user',	'Users',	'users',	'id',	'Calls_Reschedule',	'calls_reschedule',	'assigned_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('f2fb2aa8-aae9-eaff-4bbf-5f899bbf89be',	'account_leads',	'Accounts',	'accounts',	'id',	'Leads',	'leads',	'account_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('f3bc055c-d90d-77f7-c760-5f899b7edd1f',	'account_campaign_log',	'Accounts',	'accounts',	'id',	'CampaignLog',	'campaign_log',	'target_id',	NULL,	NULL,	NULL,	'one-to-many',	'target_type',	'Accounts',	0,	0),
('f49f0138-16f3-d04d-8c93-5f899b3b1366',	'opportunity_leads',	'Opportunities',	'opportunities',	'id',	'Leads',	'leads',	'opportunity_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0),
('f81d0ae0-1492-e389-23d1-5f899b44e61b',	'oauth2clients_modified_user',	'Users',	'users',	'id',	'OAuth2Clients',	'oauth2clients',	'modified_user_id',	NULL,	NULL,	NULL,	'one-to-many',	NULL,	NULL,	0,	0);

DROP TABLE IF EXISTS `releases`;
CREATE TABLE `releases` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `list_order` int(4) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_releases` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `reminders`;
CREATE TABLE `reminders` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `popup` tinyint(1) DEFAULT NULL,
  `email` tinyint(1) DEFAULT NULL,
  `email_sent` tinyint(1) DEFAULT NULL,
  `timer_popup` varchar(32) DEFAULT NULL,
  `timer_email` varchar(32) DEFAULT NULL,
  `related_event_module` varchar(32) DEFAULT NULL,
  `related_event_module_id` char(36) NOT NULL,
  `date_willexecute` int(60) DEFAULT -1,
  `popup_viewed` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_reminder_name` (`name`),
  KEY `idx_reminder_deleted` (`deleted`),
  KEY `idx_reminder_related_event_module` (`related_event_module`),
  KEY `idx_reminder_related_event_module_id` (`related_event_module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `reminders_invitees`;
CREATE TABLE `reminders_invitees` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `reminder_id` char(36) NOT NULL,
  `related_invitee_module` varchar(32) DEFAULT NULL,
  `related_invitee_module_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_reminder_invitee_name` (`name`),
  KEY `idx_reminder_invitee_assigned_user_id` (`assigned_user_id`),
  KEY `idx_reminder_invitee_reminder_id` (`reminder_id`),
  KEY `idx_reminder_invitee_related_invitee_module` (`related_invitee_module`),
  KEY `idx_reminder_invitee_related_invitee_module_id` (`related_invitee_module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `modules` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_role_id_del` (`id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `roles_modules`;
CREATE TABLE `roles_modules` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `module_id` varchar(36) DEFAULT NULL,
  `allow` tinyint(1) DEFAULT 0,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_role_id` (`role_id`),
  KEY `idx_module_id` (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `roles_users`;
CREATE TABLE `roles_users` (
  `id` varchar(36) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_ru_role_id` (`role_id`),
  KEY `idx_ru_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `saved_search`;
CREATE TABLE `saved_search` (
  `id` char(36) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `search_module` varchar(150) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `contents` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_desc` (`name`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `schedulers`;
CREATE TABLE `schedulers` (
  `id` varchar(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `job` varchar(255) DEFAULT NULL,
  `date_time_start` datetime DEFAULT NULL,
  `date_time_end` datetime DEFAULT NULL,
  `job_interval` varchar(100) DEFAULT NULL,
  `time_from` time DEFAULT NULL,
  `time_to` time DEFAULT NULL,
  `last_run` datetime DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `catch_up` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_schedule` (`date_time_start`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `securitygroups`;
CREATE TABLE `securitygroups` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `noninheritable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `securitygroups_acl_roles`;
CREATE TABLE `securitygroups_acl_roles` (
  `id` char(36) NOT NULL,
  `securitygroup_id` char(36) DEFAULT NULL,
  `role_id` char(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `securitygroups_audit`;
CREATE TABLE `securitygroups_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_securitygroups_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `securitygroups_default`;
CREATE TABLE `securitygroups_default` (
  `id` char(36) NOT NULL,
  `securitygroup_id` char(36) DEFAULT NULL,
  `module` varchar(50) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `securitygroups_records`;
CREATE TABLE `securitygroups_records` (
  `id` char(36) NOT NULL,
  `securitygroup_id` char(36) DEFAULT NULL,
  `record_id` char(36) DEFAULT NULL,
  `module` char(36) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_securitygroups_records_mod` (`module`,`deleted`,`record_id`,`securitygroup_id`),
  KEY `idx_securitygroups_records_del` (`deleted`,`record_id`,`module`,`securitygroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `securitygroups_users`;
CREATE TABLE `securitygroups_users` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `securitygroup_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `primary_group` tinyint(1) DEFAULT NULL,
  `noninheritable` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `securitygroups_users_idxa` (`securitygroup_id`),
  KEY `securitygroups_users_idxb` (`user_id`),
  KEY `securitygroups_users_idxc` (`user_id`,`deleted`,`securitygroup_id`,`id`),
  KEY `securitygroups_users_idxd` (`user_id`,`deleted`,`securitygroup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `spots`;
CREATE TABLE `spots` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `config` longtext DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `sugarfeed`;
CREATE TABLE `sugarfeed` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `related_module` varchar(100) DEFAULT NULL,
  `related_id` char(36) DEFAULT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  `link_type` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sgrfeed_date` (`date_entered`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `surveyquestionoptions`;
CREATE TABLE `surveyquestionoptions` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `sort_order` int(255) DEFAULT NULL,
  `survey_question_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `surveyquestionoptions_audit`;
CREATE TABLE `surveyquestionoptions_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_surveyquestionoptions_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `surveyquestionoptions_surveyquestionresponses`;
CREATE TABLE `surveyquestionoptions_surveyquestionresponses` (
  `id` varchar(36) NOT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `surveyq72c7options_ida` varchar(36) DEFAULT NULL,
  `surveyq10d4sponses_idb` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `surveyquestionoptions_surveyquestionresponses_alt` (`surveyq72c7options_ida`,`surveyq10d4sponses_idb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `surveyquestionresponses`;
CREATE TABLE `surveyquestionresponses` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `answer_bool` tinyint(1) DEFAULT NULL,
  `answer_datetime` datetime DEFAULT NULL,
  `surveyquestion_id` char(36) DEFAULT NULL,
  `surveyresponse_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `surveyquestionresponses_audit`;
CREATE TABLE `surveyquestionresponses_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_surveyquestionresponses_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `surveyquestions`;
CREATE TABLE `surveyquestions` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `sort_order` int(255) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `happiness_question` tinyint(1) DEFAULT NULL,
  `survey_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `surveyquestions_audit`;
CREATE TABLE `surveyquestions_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_surveyquestions_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `surveyresponses`;
CREATE TABLE `surveyresponses` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `happiness` int(11) DEFAULT NULL,
  `email_response_sent` tinyint(1) DEFAULT NULL,
  `account_id` char(36) DEFAULT NULL,
  `campaign_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `survey_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `surveyresponses_audit`;
CREATE TABLE `surveyresponses_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_surveyresponses_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `surveys`;
CREATE TABLE `surveys` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Draft',
  `submit_text` varchar(255) DEFAULT 'Submit',
  `satisfied_text` varchar(255) DEFAULT 'Satisfied',
  `neither_text` varchar(255) DEFAULT 'Neither Satisfied nor Dissatisfied',
  `dissatisfied_text` varchar(255) DEFAULT 'Dissatisfied',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `surveys_audit`;
CREATE TABLE `surveys_audit` (
  `id` char(36) NOT NULL,
  `parent_id` char(36) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `field_name` varchar(100) DEFAULT NULL,
  `data_type` varchar(100) DEFAULT NULL,
  `before_value_string` varchar(255) DEFAULT NULL,
  `after_value_string` varchar(255) DEFAULT NULL,
  `before_value_text` text DEFAULT NULL,
  `after_value_text` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_surveys_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks` (
  `id` char(36) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `assigned_user_id` char(36) DEFAULT NULL,
  `status` varchar(100) DEFAULT 'Not Started',
  `date_due_flag` tinyint(1) DEFAULT 0,
  `date_due` datetime DEFAULT NULL,
  `date_start_flag` tinyint(1) DEFAULT 0,
  `date_start` datetime DEFAULT NULL,
  `parent_type` varchar(255) DEFAULT NULL,
  `parent_id` char(36) DEFAULT NULL,
  `contact_id` char(36) DEFAULT NULL,
  `priority` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_tsk_name` (`name`),
  KEY `idx_task_con_del` (`contact_id`,`deleted`),
  KEY `idx_task_par_del` (`parent_id`,`parent_type`,`deleted`),
  KEY `idx_task_assigned` (`assigned_user_id`),
  KEY `idx_task_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `templatesectionline`;
CREATE TABLE `templatesectionline` (
  `id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `thumbnail` varchar(255) DEFAULT NULL,
  `grp` varchar(255) DEFAULT NULL,
  `ord` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `tracker`;
CREATE TABLE `tracker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `monitor_id` char(36) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `module_name` varchar(255) DEFAULT NULL,
  `item_id` varchar(36) DEFAULT NULL,
  `item_summary` varchar(255) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `session_id` varchar(36) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT 0,
  `deleted` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_tracker_iid` (`item_id`),
  KEY `idx_tracker_userid_vis_id` (`user_id`,`visible`,`id`),
  KEY `idx_tracker_userid_itemid_vis` (`user_id`,`item_id`,`visible`),
  KEY `idx_tracker_monitor_id` (`monitor_id`),
  KEY `idx_tracker_date_modified` (`date_modified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `tracker` (`id`, `monitor_id`, `user_id`, `module_name`, `item_id`, `item_summary`, `date_modified`, `action`, `session_id`, `visible`, `deleted`) VALUES
(1,	'91b244df-8703-c35a-2fd0-5f899293ed3b',	NULL,	'Users',	NULL,	NULL,	'2020-10-16 12:32:41',	'login',	'ff6upshj9uplv6njofoq4b0bd0',	0,	0),
(2,	'5800f77a-51bc-0ff7-f35b-5f8992fd0523',	NULL,	'Users',	NULL,	NULL,	'2020-10-16 12:32:48',	'authenticate',	'ff6upshj9uplv6njofoq4b0bd0',	0,	0),
(3,	'5d0d5688-f615-5aab-d92c-5f8992f73183',	NULL,	'Users',	NULL,	NULL,	'2020-10-16 12:32:48',	'login',	'fkhigjt5tkv6dc91ep3b8eh1o3',	0,	0),
(4,	'92905674-bfcf-f8d3-136a-5f89926e87af',	NULL,	'Users',	NULL,	NULL,	'2020-10-16 12:32:50',	'login',	'fkhigjt5tkv6dc91ep3b8eh1o3',	0,	0),
(5,	'2c4981bf-f7d2-2364-4f0f-5f8993c93250',	NULL,	'Users',	NULL,	NULL,	'2020-10-16 12:34:10',	'authenticate',	'fkhigjt5tkv6dc91ep3b8eh1o3',	0,	0),
(6,	'6d6f2f74-a72f-256c-aed9-5f899318d3bd',	'1',	'Configurator',	NULL,	NULL,	'2020-10-16 12:34:10',	'adminwizard',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(7,	'c6d53bcb-5902-0df1-3370-5f8993e2695a',	'1',	'Users',	NULL,	NULL,	'2020-10-16 12:34:12',	'settimezone',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(8,	'b5ad7513-a881-aeb0-05c3-5f8993721a42',	'1',	'Users',	NULL,	NULL,	'2020-10-16 12:35:12',	'settimezone',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(9,	'ea8e0bbb-b3cb-3e64-6df3-5f89936ae4d7',	'1',	'Users',	NULL,	NULL,	'2020-10-16 12:35:25',	'settimezone',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(10,	'ad140a33-1870-fd67-d63c-5f8993044177',	'1',	'Users',	NULL,	NULL,	'2020-10-16 12:35:26',	'settimezone',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(11,	'69c17cb5-31e8-394c-1fb5-5f899373ba70',	'1',	'Users',	NULL,	NULL,	'2020-10-16 12:35:28',	'settimezone',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(12,	'78870865-ed45-68ee-8a75-5f8993227172',	'1',	'Users',	NULL,	NULL,	'2020-10-16 12:35:28',	'savetimezone',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(13,	'b914c4b3-f0fc-e917-d0b6-5f89932ea767',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 12:35:30',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(14,	'16d755e4-3b91-e294-74a8-5f899394b776',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 12:36:31',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(15,	'd44308f8-f0b8-c772-265c-5f8994d9fb5b',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 12:37:32',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(16,	'cdba07f9-8bc5-a5e7-7318-5f8994b3bf6b',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 12:38:34',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(17,	'1cc0f9a2-de9f-3d0c-96e4-5f8994da4a68',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 12:39:38',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(18,	'1a645d40-c9f8-1755-aee7-5f8994158e15',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 12:40:47',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(19,	'19b572f3-7d52-a14a-a2d0-5f89958ecd26',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 12:41:50',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(20,	'19944270-f772-f793-d8c8-5f899596d6e2',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 12:42:59',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(21,	'd85ff9f5-1ec3-ef4a-43da-5f8995a86bcf',	'1',	'Administration',	NULL,	NULL,	'2020-10-16 12:43:47',	'index',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(22,	'5ee6a1c9-7bc4-f4bb-0004-5f89958361a6',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 12:43:50',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(23,	'7a55ed3c-8631-551c-b5f4-5f89954c4230',	'1',	'Administration',	NULL,	NULL,	'2020-10-16 12:43:52',	'index',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(24,	'eb1bfd20-7f30-a2af-4e20-5f8995f1cbbd',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 12:43:54',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(25,	'9a3204ec-7728-d97e-e5d1-5f8995e4097c',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 12:44:55',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(26,	'e612cfaf-886b-af6a-79fc-5f8995fc045b',	'1',	'Administration',	NULL,	NULL,	'2020-10-16 12:45:42',	'index',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(27,	'3d23b66e-85b5-87b7-eecb-5f89959d52a0',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 12:45:45',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(28,	'b7a49475-754c-c726-5990-5f899539c91b',	'1',	'Home',	NULL,	NULL,	'2020-10-16 12:45:51',	'index',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(29,	'5aa2597a-b641-e285-178d-5f8996b3c082',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 12:45:54',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(30,	'bf590f86-efd6-149b-47d8-5f8996beafab',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 12:46:58',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(31,	'5c400d25-4221-a7f4-92a4-5f8996c04680',	'1',	'Home',	NULL,	NULL,	'2020-10-16 12:47:07',	'index',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(32,	'58f429d7-9076-1a5e-6acb-5f89963ab84a',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 12:47:10',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(33,	'6676c3f0-776d-9363-4974-5f8996d782e8',	'1',	'Administration',	NULL,	NULL,	'2020-10-16 12:47:11',	'index',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(34,	'a6474196-9771-c1dd-e5ec-5f899673d958',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 12:47:13',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(35,	'5419c14b-885d-73df-1132-5f89967841ad',	'1',	'Administration',	NULL,	NULL,	'2020-10-16 12:47:15',	'index',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(36,	'89d0b02b-165f-a80b-3e7a-5f8996134e9f',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 12:47:17',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(37,	'1dc08f93-b7b0-d912-b46d-5f8996674c59',	'1',	'Administration',	NULL,	NULL,	'2020-10-16 12:47:40',	'index',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(38,	'4b62ca93-6cd8-0d87-1639-5f89962793e8',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 12:47:42',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(39,	'dc2d8d4f-b7e1-af56-5c64-5f8996c4c0c3',	'1',	'Administration',	NULL,	NULL,	'2020-10-16 12:47:49',	'index',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(40,	'234517da-201d-335c-8347-5f8996ccddfa',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 12:47:52',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(41,	'784b1c03-b22b-1110-ca82-5f899699bbb7',	'1',	'Administration',	NULL,	NULL,	'2020-10-16 12:48:05',	'index',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(42,	'8a18a576-f144-9d31-3780-5f8996798bf2',	'1',	'Administration',	NULL,	NULL,	'2020-10-16 12:48:06',	'index',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(43,	'c74c9f37-bc7d-15e4-2cd1-5f89960ca2c4',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 12:48:08',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(44,	'1be4d844-8fc2-6812-8857-5f8996415461',	'1',	'Administration',	NULL,	NULL,	'2020-10-16 12:48:11',	'index',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(45,	'525a9b79-6237-e523-6233-5f8996afd3c0',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 12:48:13',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(46,	'5c509573-a1cb-cb73-2984-5f8996f272dc',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 12:49:13',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(47,	'4f2616bf-c69a-dd3b-1858-5f899778c23c',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 12:50:13',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(48,	'5ad83eb7-0b72-518a-b764-5f8997edaf8b',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 12:51:13',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(49,	'5a2caf0a-1372-816a-92ee-5f8997aa2ec8',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 12:52:13',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(50,	'b503019f-2922-259c-fb33-5f89973c0439',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 12:53:17',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(51,	'1e92c48f-8e89-3623-4707-5f8997e54f39',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 12:54:18',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(52,	'a049098f-72ed-2f68-8ffd-5f8998873ff9',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 12:55:21',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(53,	'5cc8189f-4abc-57e8-e0ee-5f899821d32e',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 12:56:24',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(54,	'2ad1d0fa-3819-ee38-b328-5f899810581b',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 12:57:29',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(55,	'80212802-08c1-dba8-875b-5f8998d88221',	'1',	'Administration',	NULL,	NULL,	'2020-10-16 12:57:37',	'index',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(56,	'2bb5155b-a04c-029b-8878-5f89985d6ccf',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 12:57:40',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(57,	'1c9c921e-a71f-ac48-444a-5f8999b9e662',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 12:58:45',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(58,	'f35d0b58-fb65-fa6c-a7d5-5f89999caed9',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 12:59:46',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(59,	'20c63dd6-fdf9-3612-02ac-5f899990c371',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:00:50',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(60,	'ed880192-bf6d-116c-8bb3-5f8999424771',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:01:57',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(61,	'20ad2bca-7e71-d4e9-8599-5f899a37f267',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:03:02',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(62,	'd6fb027c-3697-dda5-8367-5f899a9fac10',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:04:03',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(63,	'baa50031-f16b-9e7f-fdd9-5f899a2b0309',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:05:07',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(64,	'ad590463-4f6c-bb6d-5ea3-5f899aa68118',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:06:10',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(65,	'af5d0c12-e7f9-e26a-5d1a-5f899a32c39f',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:07:10',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(66,	'951201bb-cbb8-01c9-0ebc-5f899bc63f2a',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:08:15',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(67,	'1e275f11-2293-40ef-3111-5f899b942cae',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:09:21',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(68,	'94a1797c-b644-2759-fae0-5f899b284ff8',	'1',	'Administration',	NULL,	NULL,	'2020-10-16 13:09:33',	'index',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(69,	'3dd51c37-ffb9-936e-4cf1-5f899b9748f8',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:09:36',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(70,	'2be2c851-a707-915f-90eb-5f899b07fa4c',	'1',	'Administration',	NULL,	NULL,	'2020-10-16 13:09:37',	'upgrade',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(71,	'5b305e53-7f07-83f9-9976-5f899b47faf8',	'1',	'Administration',	NULL,	NULL,	'2020-10-16 13:09:38',	'repair',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(72,	'46fa3fa1-2edc-ad9a-0cd5-5f899b57878f',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:09:39',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(73,	'c01cffc2-f402-dce6-20fa-5f899bad2399',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:09:44',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(74,	'97b5eae1-e29d-cbf4-22e6-5f899bc9bab6',	'1',	'Administration',	NULL,	NULL,	'2020-10-16 13:09:46',	'repairdatabase',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(75,	'49182e33-066c-680b-837d-5f899bb25343',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:09:53',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(76,	'9a5c5d8f-0c46-cacb-ed84-5f899b07a0d7',	'1',	'Administration',	NULL,	NULL,	'2020-10-16 13:10:52',	'index',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(77,	'ef8f7e93-3cec-b344-7e67-5f899bce27d5',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:10:54',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(78,	'6a4daf3e-b1d4-e466-d1c4-5f899b1c5f8a',	'1',	'Administration',	NULL,	NULL,	'2020-10-16 13:11:20',	'upgradewizard',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(79,	'd4a9db5b-2f53-a7ef-d46e-5f899bdb4492',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:11:22',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(80,	'9b18f194-16c4-dc37-09e3-5f899c382b29',	'1',	'Administration',	NULL,	NULL,	'2020-10-16 13:11:58',	'upgradewizard',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(81,	'856c2c31-25af-8a43-7a3e-5f899c3fbae8',	'1',	'Administration',	NULL,	NULL,	'2020-10-16 13:12:00',	'upgradewizard_prepare',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(82,	'93f2e5c9-9a69-84c6-92fe-5f899c66e413',	'1',	'Administration',	NULL,	NULL,	'2020-10-16 13:12:02',	'upgradewizard_commit',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(83,	'93f2e5c9-9a69-84c6-92fe-5f899c66e413',	'1',	'Administration',	'a816dd01-06b7-05e2-2f89-5f899c38a463',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:12:02',	'save',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(84,	'652c6cfd-6985-0f69-c4f6-5f899c596658',	'1',	'Administration',	NULL,	NULL,	'2020-10-16 13:12:04',	'upgradewizard',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(85,	'652c6cfd-6985-0f69-c4f6-5f899c596658',	'1',	'Administration',	'a816dd01-06b7-05e2-2f89-5f899c38a463',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:12:04',	'save',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(86,	'b8dfb064-f188-e91a-8bda-5f899c0dc93a',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:12:06',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(87,	'dc3c7455-c237-db17-7d9e-5f899ce79587',	'1',	'Administration',	NULL,	NULL,	'2020-10-16 13:12:08',	'index',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(88,	'2acae40e-cb1e-9152-fe00-5f899cbb5fcd',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:12:11',	'get',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(89,	'77b33aa5-9804-532f-62d0-5f899c9c9c89',	'1',	'Users',	NULL,	NULL,	'2020-10-16 13:12:12',	'logout',	'rb8it58qbrpqkbdg9i402m8378',	0,	0),
(90,	'845e94ba-b0cb-a09d-b4e9-5f899c4507b3',	NULL,	'Users',	NULL,	NULL,	'2020-10-16 13:12:12',	'login',	'8nbg7kl399ih1mq0ug5tn19r76',	0,	0),
(91,	'81326f95-d8bc-8e30-9edb-5f899c5c0f05',	NULL,	'Users',	NULL,	NULL,	'2020-10-16 13:12:14',	'login',	'8nbg7kl399ih1mq0ug5tn19r76',	0,	0),
(92,	'f1fe6cca-ff67-a879-e07e-5f899c1f4247',	NULL,	'Users',	NULL,	NULL,	'2020-10-16 13:12:20',	'authenticate',	'8nbg7kl399ih1mq0ug5tn19r76',	0,	0),
(93,	'c3690a44-8f5e-a13f-3147-5f899c6da31a',	'1',	'Users',	NULL,	NULL,	'2020-10-16 13:12:21',	'wizard',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(94,	'c3690a44-8f5e-a13f-3147-5f899c6da31a',	'1',	'UserPreferences',	'1ce7de3a-7641-6c85-9bcc-5f899ced13f0',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:12:21',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(95,	'59acae92-08bd-135d-70eb-5f899c2228c7',	'1',	'Users',	NULL,	NULL,	'2020-10-16 13:12:23',	'settimezone',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(96,	'699a372c-a02c-49df-f011-5f899c6cc929',	'1',	'Users',	'1',	'Admin Administrator',	'2020-10-16 13:13:04',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(97,	'699a372c-a02c-49df-f011-5f899c6cc929',	'1',	'UserPreferences',	'1ce7de3a-7641-6c85-9bcc-5f899ced13f0',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:04',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(98,	'699a372c-a02c-49df-f011-5f899c6cc929',	'1',	'UserPreferences',	'1ce7de3a-7641-6c85-9bcc-5f899ced13f0',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:04',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(99,	'7ec99fee-dc94-d3a8-0f86-5f899c737cbb',	'1',	'Home',	NULL,	NULL,	'2020-10-16 13:13:04',	'index',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(100,	'7ec99fee-dc94-d3a8-0f86-5f899c737cbb',	'1',	'UserPreferences',	'1ce7de3a-7641-6c85-9bcc-5f899ced13f0',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:04',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(101,	'7ec99fee-dc94-d3a8-0f86-5f899c737cbb',	'1',	'UserPreferences',	'cc788489-00ed-8326-5695-5f899c4a37f7',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:04',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(102,	'7ec99fee-dc94-d3a8-0f86-5f899c737cbb',	'1',	'UserPreferences',	'ce3e50e6-070f-2940-a16b-5f899ca6b445',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:04',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(103,	'7ec99fee-dc94-d3a8-0f86-5f899c737cbb',	'1',	'UserPreferences',	'd022c215-11a8-c0d7-f75c-5f899c8049f2',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:04',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(104,	'7ec99fee-dc94-d3a8-0f86-5f899c737cbb',	'1',	'UserPreferences',	'd283eb7c-6724-8aae-c128-5f899cbeaa53',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:04',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(105,	'7ec99fee-dc94-d3a8-0f86-5f899c737cbb',	'1',	'UserPreferences',	'd48ad7e9-3ad1-ae46-cdb4-5f899c86ce03',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:04',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(106,	'7ec99fee-dc94-d3a8-0f86-5f899c737cbb',	'1',	'UserPreferences',	'd68f829e-ca6c-81a6-cc33-5f899c7821af',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:04',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(107,	'9b48dd0d-b300-5cf3-52f0-5f899cd474f1',	'1',	'UserPreferences',	'9a537b35-fe2b-e701-5bd4-5f899c2b2238',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:05',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(108,	'2a4fc263-249a-9d2e-b108-5f899c519751',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:13:07',	'get',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(109,	'4e41aefc-f566-0fd5-cda0-5f899c58fb8d',	'1',	'Users',	'1',	'Admin Administrator',	'2020-10-16 13:13:11',	'editview',	'6urvsjhd51256s6sv6utp3lv38',	1,	0),
(110,	'4e41aefc-f566-0fd5-cda0-5f899c58fb8d',	'1',	'UserPreferences',	'1ce7de3a-7641-6c85-9bcc-5f899ced13f0',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:11',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(111,	'd0433b3d-76f3-281c-4aa6-5f899cad8db2',	'1',	'Emails',	NULL,	NULL,	'2020-10-16 13:13:12',	'emailuiajax',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(112,	'd0433b3d-76f3-281c-4aa6-5f899cad8db2',	'1',	'UserPreferences',	'1ce7de3a-7641-6c85-9bcc-5f899ced13f0',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:12',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(113,	'd0433b3d-76f3-281c-4aa6-5f899cad8db2',	'1',	'UserPreferences',	'cc788489-00ed-8326-5695-5f899c4a37f7',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:12',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(114,	'd0433b3d-76f3-281c-4aa6-5f899cad8db2',	'1',	'UserPreferences',	'cc788489-00ed-8326-5695-5f899c4a37f7',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:12',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(115,	'd0433b3d-76f3-281c-4aa6-5f899cad8db2',	'1',	'UserPreferences',	'db962c2a-be35-9883-8097-5f899c0fedef',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:12',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(116,	'd0433b3d-76f3-281c-4aa6-5f899cad8db2',	'1',	'UserPreferences',	'ce3e50e6-070f-2940-a16b-5f899ca6b445',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:12',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(117,	'd0433b3d-76f3-281c-4aa6-5f899cad8db2',	'1',	'UserPreferences',	'd022c215-11a8-c0d7-f75c-5f899c8049f2',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:12',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(118,	'd0433b3d-76f3-281c-4aa6-5f899cad8db2',	'1',	'UserPreferences',	'd283eb7c-6724-8aae-c128-5f899cbeaa53',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:12',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(119,	'd0433b3d-76f3-281c-4aa6-5f899cad8db2',	'1',	'UserPreferences',	'd48ad7e9-3ad1-ae46-cdb4-5f899c86ce03',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:12',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(120,	'd0433b3d-76f3-281c-4aa6-5f899cad8db2',	'1',	'UserPreferences',	'e894a469-04ad-2d82-fd77-5f899c321737',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:12',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(121,	'd0433b3d-76f3-281c-4aa6-5f899cad8db2',	'1',	'UserPreferences',	'd68f829e-ca6c-81a6-cc33-5f899c7821af',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:12',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(122,	'd0433b3d-76f3-281c-4aa6-5f899cad8db2',	'1',	'UserPreferences',	'9a537b35-fe2b-e701-5bd4-5f899c2b2238',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:12',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(123,	'f191c039-9f23-8aae-cd7a-5f899cac027f',	'1',	'Emails',	NULL,	NULL,	'2020-10-16 13:13:12',	'emailuiajax',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(124,	'f191c039-9f23-8aae-cd7a-5f899cac027f',	'1',	'UserPreferences',	'1ce7de3a-7641-6c85-9bcc-5f899ced13f0',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:12',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(125,	'f191c039-9f23-8aae-cd7a-5f899cac027f',	'1',	'UserPreferences',	'cc788489-00ed-8326-5695-5f899c4a37f7',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:12',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(126,	'f191c039-9f23-8aae-cd7a-5f899cac027f',	'1',	'UserPreferences',	'cc788489-00ed-8326-5695-5f899c4a37f7',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:12',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(127,	'f191c039-9f23-8aae-cd7a-5f899cac027f',	'1',	'UserPreferences',	'db962c2a-be35-9883-8097-5f899c0fedef',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:12',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(128,	'f191c039-9f23-8aae-cd7a-5f899cac027f',	'1',	'UserPreferences',	'ce3e50e6-070f-2940-a16b-5f899ca6b445',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:12',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(129,	'f191c039-9f23-8aae-cd7a-5f899cac027f',	'1',	'UserPreferences',	'd022c215-11a8-c0d7-f75c-5f899c8049f2',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:12',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(130,	'f191c039-9f23-8aae-cd7a-5f899cac027f',	'1',	'UserPreferences',	'd283eb7c-6724-8aae-c128-5f899cbeaa53',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:12',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(131,	'f191c039-9f23-8aae-cd7a-5f899cac027f',	'1',	'UserPreferences',	'd48ad7e9-3ad1-ae46-cdb4-5f899c86ce03',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:12',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(132,	'f191c039-9f23-8aae-cd7a-5f899cac027f',	'1',	'UserPreferences',	'e894a469-04ad-2d82-fd77-5f899c321737',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:12',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(133,	'f191c039-9f23-8aae-cd7a-5f899cac027f',	'1',	'UserPreferences',	'd68f829e-ca6c-81a6-cc33-5f899c7821af',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:12',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(134,	'f191c039-9f23-8aae-cd7a-5f899cac027f',	'1',	'UserPreferences',	'9a537b35-fe2b-e701-5bd4-5f899c2b2238',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:12',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(135,	'26021714-8222-a1e5-741c-5f899c6a590b',	'1',	'Emails',	NULL,	NULL,	'2020-10-16 13:13:13',	'emailuiajax',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(136,	'26021714-8222-a1e5-741c-5f899c6a590b',	'1',	'UserPreferences',	'1ce7de3a-7641-6c85-9bcc-5f899ced13f0',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:13',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(137,	'26021714-8222-a1e5-741c-5f899c6a590b',	'1',	'UserPreferences',	'cc788489-00ed-8326-5695-5f899c4a37f7',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:13',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(138,	'26021714-8222-a1e5-741c-5f899c6a590b',	'1',	'UserPreferences',	'cc788489-00ed-8326-5695-5f899c4a37f7',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:13',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(139,	'26021714-8222-a1e5-741c-5f899c6a590b',	'1',	'UserPreferences',	'db962c2a-be35-9883-8097-5f899c0fedef',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:13',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(140,	'26021714-8222-a1e5-741c-5f899c6a590b',	'1',	'UserPreferences',	'ce3e50e6-070f-2940-a16b-5f899ca6b445',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:13',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(141,	'26021714-8222-a1e5-741c-5f899c6a590b',	'1',	'UserPreferences',	'd022c215-11a8-c0d7-f75c-5f899c8049f2',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:13',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(142,	'26021714-8222-a1e5-741c-5f899c6a590b',	'1',	'UserPreferences',	'd283eb7c-6724-8aae-c128-5f899cbeaa53',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:13',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(143,	'26021714-8222-a1e5-741c-5f899c6a590b',	'1',	'UserPreferences',	'd48ad7e9-3ad1-ae46-cdb4-5f899c86ce03',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:13',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(144,	'26021714-8222-a1e5-741c-5f899c6a590b',	'1',	'UserPreferences',	'e894a469-04ad-2d82-fd77-5f899c321737',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:13',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(145,	'26021714-8222-a1e5-741c-5f899c6a590b',	'1',	'UserPreferences',	'd68f829e-ca6c-81a6-cc33-5f899c7821af',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:13',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(146,	'26021714-8222-a1e5-741c-5f899c6a590b',	'1',	'UserPreferences',	'9a537b35-fe2b-e701-5bd4-5f899c2b2238',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:13:13',	'save',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(147,	'7da8c754-2fff-6482-9b07-5f899c078779',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:13:14',	'get',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(148,	'77127999-5455-7979-875a-5f899cd0a92b',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:14:14',	'get',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(149,	'7fa72188-1bdc-09bb-1171-5f899c3fa6e7',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:15:14',	'get',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(150,	'9cb6808d-59b9-3f4c-568f-5f899c76ed5e',	'1',	'Administration',	NULL,	NULL,	'2020-10-16 13:15:14',	'index',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(151,	'23f3f109-2ad1-dad1-0634-5f899c563757',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:15:17',	'get',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(152,	'3fb2dfa8-460d-8eba-1003-5f899c30b508',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:15:20',	'get',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(153,	'c13d58e8-cee8-3c80-2431-5f899c373956',	'1',	'Administration',	NULL,	NULL,	'2020-10-16 13:15:20',	'configureajaxui',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(154,	'1e1a81b3-ed4d-3869-574b-5f899c0ab4f2',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:15:23',	'get',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(155,	'319c28c4-536d-c4e3-2e2c-5f899dbe3711',	'1',	'Administration',	NULL,	NULL,	'2020-10-16 13:16:04',	'updateajaxui',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(156,	'890aa6ca-fda3-8f34-1ee9-5f899da4fccd',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:16:06',	'get',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(157,	'8c0487c9-180e-7342-1c85-5f899dbd4a60',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:17:06',	'get',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(158,	'86d80036-2a48-4acf-892f-5f899db60588',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:18:06',	'get',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(159,	'87dc73db-85c1-551d-afeb-5f899d1ce3ac',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:19:06',	'get',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(160,	'8af4242c-be39-0073-b310-5f899e849423',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:20:06',	'get',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(161,	'90235bc7-42b2-5c5c-9568-5f899e6d2fe4',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:21:06',	'get',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(162,	'896b7a0a-3ad6-4825-f719-5f899ed4fe51',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:22:06',	'get',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(163,	'8a39682e-949b-5cf0-86ba-5f899e276e56',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:23:06',	'get',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(164,	'9058e1b2-1ee2-1685-2485-5f899eba86af',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:24:06',	'get',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(165,	'8a0698e3-d457-1184-d496-5f899fdb6dee',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:25:06',	'get',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(166,	'8adc4079-7a09-8d6a-0064-5f899f64785d',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:26:06',	'get',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(167,	'8ab59bea-dee4-c345-fd24-5f899fcc5a1f',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:27:06',	'get',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(168,	'8b641abe-d455-126f-97fb-5f899f89a9d2',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:28:06',	'get',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(169,	'8c3224ad-9b27-c6d7-d7ca-5f89a0e3137e',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:29:06',	'get',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(170,	'e9d30eb8-2402-58e8-ee7d-5f89a05fb78a',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:30:09',	'get',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(171,	'11ad0b61-92d8-6a5c-48fd-5f89a021fabd',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:31:11',	'get',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(172,	'1c0d24f4-f5b5-4bd1-10db-5f89a03e37bb',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:32:20',	'get',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(173,	'cd53029c-87ea-62dd-aa4e-5f89a1ec989c',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:33:22',	'get',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(174,	'b2af03e8-598c-7bb2-0144-5f89a1c0ff98',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:34:27',	'get',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(175,	'6d2b9023-84f2-1794-850d-5f89a66d3544',	NULL,	'Users',	NULL,	NULL,	'2020-10-16 13:56:57',	'login',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(176,	'8aa805c8-cc11-bda3-a7b2-5f89a661d922',	NULL,	'Users',	NULL,	NULL,	'2020-10-16 13:57:04',	'authenticate',	'6urvsjhd51256s6sv6utp3lv38',	0,	0),
(177,	'1326dea6-2e10-a539-80c6-5f89a6d96efa',	'1',	'Administration',	NULL,	NULL,	'2020-10-16 13:57:04',	'index',	'4emrf3b0hqev6vmbb4q1efg5fb',	0,	0),
(178,	'1326dea6-2e10-a539-80c6-5f89a6d96efa',	'1',	'UserPreferences',	'1ce7de3a-7641-6c85-9bcc-5f899ced13f0',	'Base Implementation.  Should be overridden.',	'2020-10-16 13:57:04',	'save',	'4emrf3b0hqev6vmbb4q1efg5fb',	0,	0),
(179,	'8ab8306a-433d-ddf6-8609-5f89a6addd2b',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:57:06',	'get',	'4emrf3b0hqev6vmbb4q1efg5fb',	0,	0),
(180,	'8febc157-c6ae-d6c6-72e9-5f89a6f7a54e',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:58:06',	'get',	'4emrf3b0hqev6vmbb4q1efg5fb',	0,	0),
(181,	'18fcfd9c-bce5-696d-d49b-5f89a7523f32',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 13:59:10',	'get',	'4emrf3b0hqev6vmbb4q1efg5fb',	0,	0),
(182,	'fe6d0df9-c253-4fc2-2c53-5f89a72ddf67',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 14:00:13',	'get',	'4emrf3b0hqev6vmbb4q1efg5fb',	0,	0),
(183,	'f9ff0e59-b054-ee4d-34b0-5f89a794db3e',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 14:01:22',	'get',	'4emrf3b0hqev6vmbb4q1efg5fb',	0,	0),
(184,	'19c5cdfc-f887-9d86-2118-5f89a74d7697',	'1',	'Alerts',	NULL,	NULL,	'2020-10-16 14:02:29',	'get',	'4emrf3b0hqev6vmbb4q1efg5fb',	0,	0),
(185,	'325e5864-1658-f58b-30b0-5f89a81e75a8',	'1',	'Users',	NULL,	NULL,	'2020-10-16 14:02:46',	'logout',	'4emrf3b0hqev6vmbb4q1efg5fb',	0,	0),
(186,	'402e3629-4b14-5ca2-730b-5f89a8f304c4',	NULL,	'Users',	NULL,	NULL,	'2020-10-16 14:02:46',	'login',	'4fq84i4m30ic5789dr8n489lt3',	0,	0);

DROP TABLE IF EXISTS `upgrade_history`;
CREATE TABLE `upgrade_history` (
  `id` char(36) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `md5sum` varchar(32) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `version` varchar(64) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `id_name` varchar(255) DEFAULT NULL,
  `manifest` longtext DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `upgrade_history_md5_uk` (`md5sum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `upgrade_history` (`id`, `filename`, `md5sum`, `type`, `status`, `version`, `name`, `description`, `id_name`, `manifest`, `date_entered`, `enabled`) VALUES
('a816dd01-06b7-05e2-2f89-5f899c38a463',	'upload/upgrades/langpack/rapira-suite_pack_russian.zip',	'd43facd8f0fee04c5916105151db99e3',	'langpack',	'installed',	'7.11.15',	'RUSSIAN RAPIRA LANGUAGE PACK FOR SUITECRM',	'очередной перевод на великий и могучий',	'ru_ru',	'YTozOntzOjg6Im1hbmlmZXN0IjthOjk6e3M6NDoibmFtZSI7czo0MToiUlVTU0lBTiBSQVBJUkEgTEFOR1VBR0UgUEFDSyBGT1IgU1VJVEVDUk0iO3M6MTE6ImRlc2NyaXB0aW9uIjtzOjcxOiLQvtGH0LXRgNC10LTQvdC+0Lkg0L/QtdGA0LXQstC+0LQg0L3QsCDQstC10LvQuNC60LjQuSDQuCDQvNC+0LPRg9GH0LjQuSI7czo0OiJ0eXBlIjtzOjg6ImxhbmdwYWNrIjtzOjE2OiJpc191bmluc3RhbGxhYmxlIjtzOjM6IlllcyI7czoyNToiYWNjZXB0YWJsZV9zdWdhcl92ZXJzaW9ucyI7YTowOnt9czoyNDoiYWNjZXB0YWJsZV9zdWdhcl9mbGF2b3JzIjthOjE6e2k6MDtzOjI6IkNFIjt9czo2OiJhdXRob3IiO3M6OToibGlraG9ib3J5IjtzOjc6InZlcnNpb24iO3M6NzoiNy4xMS4xNSI7czoxNDoicHVibGlzaGVkX2RhdGUiO3M6MTA6IjIwMjAvMDcvMzEiO31zOjExOiJpbnN0YWxsZGVmcyI7YToyOntzOjI6ImlkIjtzOjU6InJ1X3J1IjtzOjQ6ImNvcHkiO2E6Mzp7aTowO2E6Mjp7czo0OiJmcm9tIjtzOjE4OiI8YmFzZXBhdGg+L2luY2x1ZGUiO3M6MjoidG8iO3M6NzoiaW5jbHVkZSI7fWk6MTthOjI6e3M6NDoiZnJvbSI7czoxODoiPGJhc2VwYXRoPi9tb2R1bGVzIjtzOjI6InRvIjtzOjc6Im1vZHVsZXMiO31pOjI7YToyOntzOjQ6ImZyb20iO3M6MTg6IjxiYXNlcGF0aD4vaW5zdGFsbCI7czoyOiJ0byI7czo3OiJpbnN0YWxsIjt9fX1zOjE2OiJ1cGdyYWRlX21hbmlmZXN0IjtzOjA6IiI7fQ==',	'2020-10-16 13:12:02',	1);

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` char(36) NOT NULL,
  `user_name` varchar(60) DEFAULT NULL,
  `user_hash` varchar(255) DEFAULT NULL,
  `system_generated_password` tinyint(1) DEFAULT NULL,
  `pwd_last_changed` datetime DEFAULT NULL,
  `authenticate_id` varchar(100) DEFAULT NULL,
  `sugar_login` tinyint(1) DEFAULT 1,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT 0,
  `external_auth_only` tinyint(1) DEFAULT 0,
  `receive_notifications` tinyint(1) DEFAULT 1,
  `description` text DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `modified_user_id` char(36) DEFAULT NULL,
  `created_by` char(36) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `department` varchar(50) DEFAULT NULL,
  `phone_home` varchar(50) DEFAULT NULL,
  `phone_mobile` varchar(50) DEFAULT NULL,
  `phone_work` varchar(50) DEFAULT NULL,
  `phone_other` varchar(50) DEFAULT NULL,
  `phone_fax` varchar(50) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `address_street` varchar(150) DEFAULT NULL,
  `address_city` varchar(100) DEFAULT NULL,
  `address_state` varchar(100) DEFAULT NULL,
  `address_country` varchar(100) DEFAULT NULL,
  `address_postalcode` varchar(20) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `portal_only` tinyint(1) DEFAULT 0,
  `show_on_employees` tinyint(1) DEFAULT 1,
  `employee_status` varchar(100) DEFAULT NULL,
  `messenger_id` varchar(100) DEFAULT NULL,
  `messenger_type` varchar(100) DEFAULT NULL,
  `reports_to_id` char(36) DEFAULT NULL,
  `is_group` tinyint(1) DEFAULT NULL,
  `factor_auth` tinyint(1) DEFAULT NULL,
  `factor_auth_interface` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_name` (`user_name`,`is_group`,`status`,`last_name`(30),`first_name`(30),`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `users` (`id`, `user_name`, `user_hash`, `system_generated_password`, `pwd_last_changed`, `authenticate_id`, `sugar_login`, `first_name`, `last_name`, `is_admin`, `external_auth_only`, `receive_notifications`, `description`, `date_entered`, `date_modified`, `modified_user_id`, `created_by`, `title`, `photo`, `department`, `phone_home`, `phone_mobile`, `phone_work`, `phone_other`, `phone_fax`, `status`, `address_street`, `address_city`, `address_state`, `address_country`, `address_postalcode`, `deleted`, `portal_only`, `show_on_employees`, `employee_status`, `messenger_id`, `messenger_type`, `reports_to_id`, `is_group`, `factor_auth`, `factor_auth_interface`) VALUES
('1',	'admin',	'21232f297a57a5a743894a0e4a801fc3',	0,	'2020-03-13 07:28:00',	NULL,	1,	'Admin',	'Administrator',	1,	0,	1,	NULL,	'2019-09-11 07:50:13',	'2020-10-16 13:13:04',	'1',	'',	'Administrator',	'suslick.jpg',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	'Active',	NULL,	NULL,	NULL,	NULL,	NULL,	0,	0,	1,	'Active',	'admin@mail.ru',	NULL,	'',	0,	0,	NULL);

DROP TABLE IF EXISTS `users_feeds`;
CREATE TABLE `users_feeds` (
  `user_id` varchar(36) DEFAULT NULL,
  `feed_id` varchar(36) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  KEY `idx_ud_user_id` (`user_id`,`feed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `users_last_import`;
CREATE TABLE `users_last_import` (
  `id` char(36) NOT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `import_module` varchar(36) DEFAULT NULL,
  `bean_type` varchar(36) DEFAULT NULL,
  `bean_id` char(36) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`assigned_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `users_password_link`;
CREATE TABLE `users_password_link` (
  `id` char(36) NOT NULL,
  `username` varchar(36) DEFAULT NULL,
  `date_generated` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `users_signatures`;
CREATE TABLE `users_signatures` (
  `id` char(36) NOT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `signature` text DEFAULT NULL,
  `signature_html` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_usersig_uid` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `user_preferences`;
CREATE TABLE `user_preferences` (
  `id` char(36) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT 0,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `assigned_user_id` char(36) DEFAULT NULL,
  `contents` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_userprefnamecat` (`assigned_user_id`,`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `user_preferences` (`id`, `category`, `deleted`, `date_entered`, `date_modified`, `assigned_user_id`, `contents`) VALUES
('1ce7de3a-7641-6c85-9bcc-5f899ced13f0',	'global',	0,	'2020-10-16 13:12:21',	'2020-10-16 13:57:04',	'1',	'YTozMzp7czoxMDoidXNlcl90aGVtZSI7czo2OiJTdWl0ZVAiO3M6MTM6InJlbWluZGVyX3RpbWUiO2k6MTgwMDtzOjE5OiJlbWFpbF9yZW1pbmRlcl90aW1lIjtpOjM2MDA7czoxMjoibWFpbG1lcmdlX29uIjtzOjI6Im9uIjtzOjg6InRpbWV6b25lIjtzOjEzOiJFdXJvcGUvTW9zY293IjtzOjE2OiJzd2FwX2xhc3Rfdmlld2VkIjtzOjA6IiI7czoxNDoic3dhcF9zaG9ydGN1dHMiO3M6MDoiIjtzOjE5OiJuYXZpZ2F0aW9uX3BhcmFkaWdtIjtzOjI6ImdtIjtzOjIwOiJzb3J0X21vZHVsZXNfYnlfbmFtZSI7czowOiIiO3M6MTM6InN1YnBhbmVsX3RhYnMiO3M6MDoiIjtzOjI1OiJjb3VudF9jb2xsYXBzZWRfc3VicGFuZWxzIjtzOjA6IiI7czoxNDoibW9kdWxlX2Zhdmljb24iO3M6MDoiIjtzOjk6ImhpZGVfdGFicyI7YTowOnt9czoxMToicmVtb3ZlX3RhYnMiO2E6MDp7fXM6Nzoibm9fb3BwcyI7czozOiJvZmYiO3M6MTY6InJlbWluZGVyX2NoZWNrZWQiO3M6MToiMSI7czoyMjoiZW1haWxfcmVtaW5kZXJfY2hlY2tlZCI7czoxOiIxIjtzOjI6InV0IjtzOjE6IjEiO3M6ODoiY3VycmVuY3kiO3M6MzoiLTk5IjtzOjM1OiJkZWZhdWx0X2N1cnJlbmN5X3NpZ25pZmljYW50X2RpZ2l0cyI7czoxOiIyIjtzOjExOiJudW1fZ3JwX3NlcCI7czoxOiIsIjtzOjc6ImRlY19zZXAiO3M6MToiLiI7czo1OiJkYXRlZiI7czo1OiJkLm0uWSI7czo1OiJ0aW1lZiI7czozOiJILmkiO3M6MjY6ImRlZmF1bHRfbG9jYWxlX25hbWVfZm9ybWF0IjtzOjM6ImYgbCI7czoxNDoidXNlX3JlYWxfbmFtZXMiO3M6Mjoib24iO3M6MTc6Im1haWxfc210cGF1dGhfcmVxIjtzOjA6IiI7czoxMjoibWFpbF9zbXRwc3NsIjtpOjA7czoxNzoiZW1haWxfc2hvd19jb3VudHMiO2k6MDtzOjEwOiJkYXRlZm9ybWF0IjtzOjU6ImQubS5ZIjtzOjEwOiJ0aW1lZm9ybWF0IjtzOjM6IkguaSI7czoxOToidGhlbWVfY3VycmVudF9ncm91cCI7czozOiJBbGwiO3M6MTE6ImVkaXRvcl90eXBlIjtzOjY6Im1vemFpayI7fQ=='),
('9a537b35-fe2b-e701-5bd4-5f899c2b2238',	'Home2_LEAD_b68de790-aab3-97bb-8a2f-5f899ce7a28c',	0,	'2020-10-16 13:13:05',	'2020-10-16 13:13:13',	'1',	'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('cc788489-00ed-8326-5695-5f899c4a37f7',	'home',	0,	'2020-10-16 13:13:04',	'2020-10-16 13:13:13',	'1',	'YTowOnt9'),
('ce3e50e6-070f-2940-a16b-5f899ca6b445',	'Home2_CALL',	0,	'2020-10-16 13:13:04',	'2020-10-16 13:13:13',	'1',	'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('d022c215-11a8-c0d7-f75c-5f899c8049f2',	'Home2_MEETING',	0,	'2020-10-16 13:13:04',	'2020-10-16 13:13:13',	'1',	'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('d283eb7c-6724-8aae-c128-5f899cbeaa53',	'Home2_OPPORTUNITY',	0,	'2020-10-16 13:13:04',	'2020-10-16 13:13:13',	'1',	'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('d48ad7e9-3ad1-ae46-cdb4-5f899c86ce03',	'Home2_ACCOUNT',	0,	'2020-10-16 13:13:04',	'2020-10-16 13:13:13',	'1',	'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('d68f829e-ca6c-81a6-cc33-5f899c7821af',	'Home2_LEAD',	0,	'2020-10-16 13:13:04',	'2020-10-16 13:13:13',	'1',	'YToxOntzOjEzOiJsaXN0dmlld09yZGVyIjthOjI6e3M6Nzoib3JkZXJCeSI7czoxMjoiZGF0ZV9lbnRlcmVkIjtzOjk6InNvcnRPcmRlciI7czo0OiJERVNDIjt9fQ=='),
('db962c2a-be35-9883-8097-5f899c0fedef',	'Dashboard',	0,	'2020-10-16 13:13:12',	'2020-10-16 13:13:13',	'1',	'YTowOnt9'),
('e894a469-04ad-2d82-fd77-5f899c321737',	'Emails',	0,	'2020-10-16 13:13:12',	'2020-10-16 13:13:13',	'1',	'YTowOnt9');

DROP TABLE IF EXISTS `vcals`;
CREATE TABLE `vcals` (
  `id` char(36) NOT NULL,
  `deleted` tinyint(1) DEFAULT NULL,
  `date_entered` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `user_id` char(36) NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `source` varchar(100) DEFAULT NULL,
  `content` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_vcal` (`type`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- 2020-10-16 14:39:43
