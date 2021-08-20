--
-- Database: `dbneh2t4x4w6tm`
--

-- --------------------------------------------------------
--
--Procedure
--
	DELIMITER $$
--
-- Procedures
--
	CREATE DEFINER=`root`@`localhost` PROCEDURE `ecourierDbCreate`(IN `dbname` VARCHAR(100) CHARSET utf8)
	BEGIN
	   SET @db = dbname;
	   SET @sql_text = CONCAT('create database `',@db,'`;');
		PREPARE stmt FROM @sql_text;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		CALL ecourierTableCreate(@db);
	END$$
	CREATE DEFINER=`root`@`localhost` PROCEDURE `ecourierTableCreate`(IN `dbname` VARCHAR(100) CHARSET utf8)
	BEGIN
		SET @db = dbname;
		SET @sql_all_total_details = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`all_total_details` (
			`id` int(11) NOT NULL,
			`unique_key_id` int(11) NOT NULL,
			`wallet_total` int(11) DEFAULT NULL,
			`cod_withdraw_total` int(11) DEFAULT NULL,
			`cod_pending_total` int(11) DEFAULT NULL,
			`walllet_pending_total` int(11) DEFAULT NULL,
			`status` int(11) NOT NULL DEFAULT '1'
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_all_total_details;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_auth_details = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`auth_details` (
			`id` int(11) NOT NULL,
			`name` varchar(250) NOT NULL,
			`type` varchar(250) NOT NULL,
			`auth_key` text NOT NULL,
			`auth_password` text NOT NULL,
			`company_id` int(11) NOT NULL,
			`notes` text NOT NULL,
			`added_date` varchar(100) NOT NULL,
			`status` tinyint(2) NOT NULL
			) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_auth_details;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_city = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`city` (
			`id` int(11) NOT NULL,
			`states_id` int(11) NOT NULL,
			`name` text NOT NULL,
			`latitude` varchar(255) DEFAULT NULL,
			`longitude` varchar(255) DEFAULT NULL,
			`status` tinyint(4) NOT NULL DEFAULT '1'
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_city;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_cod_order_transaction = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`cod_order_transaction` (
			`id` bigint(20) NOT NULL,
			`unique_key` varchar(50) NOT NULL,
			`order_id` varchar(50) NOT NULL,
			`code_amount` decimal(10,3) NOT NULL DEFAULT '0.000',
			`added_date` varchar(50) NOT NULL,
			`order_status` int(11) DEFAULT NULL,
			`status` tinyint(4) NOT NULL
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_cod_order_transaction;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_color = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`color` (
			`id` int(11) NOT NULL,
			`name` varchar(255) NOT NULL,
			`color` varchar(255) NOT NULL,
			`status` int(11) NOT NULL
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_color;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_commission_cancel_order_transaction = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`commission_cancel_order_transaction` (
			`id` int(11) NOT NULL,
			`order_id` varchar(250) NOT NULL,
			`user_id` varchar(200) NOT NULL,
			`commission_amount` decimal(10,2) NOT NULL,
			`commission_id` int(11) NOT NULL COMMENT 'commission_transaction.id',
			`added_date` varchar(150) NOT NULL,
			`status` tinyint(4) NOT NULL
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_commission_cancel_order_transaction;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_commission_order_transaction = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`commission_order_transaction` (
			`id` int(11) NOT NULL,
			`commission_id` int(11) NOT NULL COMMENT 'commission_transaction.id',
			`commission_amount` decimal(10,2) NOT NULL,
			`order_id` varchar(250) NOT NULL,
			`wallet_id` int(11) NOT NULL DEFAULT '0' COMMENT 'wallet_transaction.id, 0-cancel_order',
			`added_date` varchar(200) NOT NULL
			) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_commission_order_transaction;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_commission_transaction = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`commission_transaction` (
			`id` int(11) NOT NULL,
			`order_id` varchar(255) NOT NULL,
			`user_id` varchar(150) NOT NULL,
			`child_user_id` varchar(150) NOT NULL,
			`subscribe_flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'subscribe_ 1-active,2-deactive Commission || user deactive -> commission admin user',
			`commission_percentage` decimal(10,2) NOT NULL COMMENT 'user commission',
			`commission_amount` decimal(10,2) NOT NULL,
			`commission_status` tinyint(4) NOT NULL COMMENT '0-expired,1-pending,2-paid off,3-order_cancel,4-cancel_order_verified',
			`courier_final_price` decimal(10,2) NOT NULL,
			`commission_json` text NOT NULL,
			`description` text NOT NULL,
			`added_date` varchar(150) NOT NULL,
			`status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1-pending,2-initialized,3-initialized_done,4-release_payment,5-stop_commission'
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_commission_transaction;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_company_info = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`company_info` (
			`id` int(11) NOT NULL,
			`name` varchar(200) NOT NULL,
			`owner_name` varchar(200) DEFAULT NULL,
			`address` text,
			`started_date` varchar(50) DEFAULT NULL,
			`company_logo` text,
			`support_no` varchar(25) DEFAULT NULL,
			`website` text,
			`added_date` varchar(50) NOT NULL,
			`status` tinyint(2) NOT NULL DEFAULT '1'
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_company_info;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_company_info = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`company_info` (
			`id` int(11) NOT NULL,
			`name` varchar(200) NOT NULL,
			`owner_name` varchar(200) DEFAULT NULL,
			`address` text,
			`started_date` varchar(50) DEFAULT NULL,
			`company_logo` text,
			`support_no` varchar(25) DEFAULT NULL,
			`website` text,
			`added_date` varchar(50) NOT NULL,
			`status` tinyint(2) NOT NULL DEFAULT '1'
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_company_info;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_countries = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`countries` (
			`id` int(11) NOT NULL,
			`name` text NOT NULL,
			`iso3` varchar(10) DEFAULT NULL,
			`short_code` varchar(10) NOT NULL,
			`phone_code` varchar(10) NOT NULL,
			`capital` varchar(30) DEFAULT NULL,
			`currency` varchar(10) DEFAULT NULL,
			`status` tinyint(2) NOT NULL DEFAULT '1'
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_countries;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_customers = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`customers` (
			`id` bigint(20) NOT NULL,
			`first_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
			`last_name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
			`email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
			`address` text COLLATE utf8_unicode_ci,
			`password` text COLLATE utf8_unicode_ci NOT NULL,
			`og_password` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
			`forget_code` text COLLATE utf8_unicode_ci,
			`phone_no` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
			`profile_img` text COLLATE utf8_unicode_ci,
			`added_date` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
			`register_status` tinyint(2) NOT NULL DEFAULT '0',
			`status` tinyint(2) NOT NULL DEFAULT '1'
			 ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;");
		PREPARE stmt FROM @sql_customers;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_customer_details = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`customer_details` (
			`id` bigint(20) NOT NULL,
			`unique_key` varchar(50) NOT NULL,
			`address` text,
			`birth_date` varchar(25) DEFAULT NULL,
			`ip_address` varchar(15) DEFAULT NULL,
			`modify_date` varchar(25) DEFAULT NULL,
			`last_login` varchar(25) DEFAULT NULL,
			`is_login` tinyint(4) NOT NULL DEFAULT '0',
			`status` tinyint(4) NOT NULL DEFAULT '1'
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_customer_details;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_email_settings = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`email_settings` (
			 `id` int(11) NOT NULL,
				`name` varchar(200) DEFAULT NULL,
				`protocol` varchar(50) DEFAULT NULL,
				`smtp_host` varchar(100) DEFAULT NULL,
				`smtp_port` varchar(5) DEFAULT NULL,
				`smtp_user` varchar(100) DEFAULT NULL,
				`smtp_pass` varchar(100) DEFAULT NULL,
				`reply_to` varchar(100) DEFAULT NULL,
				`status` tinyint(2) NOT NULL DEFAULT '1'
				 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_email_settings;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_error_history = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`error_history` (
			`id` int(11) NOT NULL,
			`error_type` int(11) NOT NULL COMMENT 'error_type.id | 1-shipment_status,',
			`order_id` varchar(250) NOT NULL DEFAULT '0',
			`message` text NOT NULL,
			`description` text NOT NULL,
			`res_json` text NOT NULL,
			`added_date` varchar(200) NOT NULL
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_error_history;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_error_type = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`error_type` (
			`id` int(11) NOT NULL,
			`type` varchar(255) NOT NULL,
			`description` text NOT NULL
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_error_type;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_global_settings = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`global_settings` (
			`id` int(11) NOT NULL,
			`slug` varchar(255) NOT NULL,
			`value` text NOT NULL,
			`name` text NOT NULL,
			`description` text NOT NULL,
			`status` int(11) NOT NULL DEFAULT '1'
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_global_settings;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_master_role_package = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`master_role_package` (
			`id` bigint(20) NOT NULL,
			`master_id` bigint(20) NOT NULL,
			`role_id` int(11) NOT NULL,
			`unique_key` varchar(50) NOT NULL,
			`parent_id` varchar(200) NOT NULL,
			`wallet_balance` decimal(10,2) DEFAULT '0.00',
			`cod_balance` decimal(10,2) DEFAULT '0.00',
			`commission_balance` decimal(10,2) NOT NULL DEFAULT '0.00',
			`pkg_id` int(11) NOT NULL,
			`permission` text COMMENT 'sub user permission',
			`own_user_list` text COMMENT 'all child list',
			`our_courier_company_id` text COMMENT 'shiprocket_courier_company.id',
			`shiprocket_courier_company_id` text,
			`commission_type` int(11) NOT NULL COMMENT '1-percentage,2-fix',
			`commission_amount` varchar(50) NOT NULL,
			`commission_all_percentage` text,
			`commission_release_days` int(11) NOT NULL DEFAULT '2',
			`subscribe_id` int(11) DEFAULT '0',
			`forgot_password` varchar(50) DEFAULT NULL,
			`salt_key` text NOT NULL,
			`is_level` int(50) NOT NULL,
			`ip_address` varchar(15) DEFAULT NULL,
			`auth_id` int(11) NOT NULL DEFAULT '1' COMMENT 'tbl-auth_details.id',
			`payment_paid` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-system ,1-manually',
			`status` tinyint(4) NOT NULL DEFAULT '1',
			`sadmin` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1-sadmin,0-other'
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_master_role_package;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_members = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`members` (
			`id` bigint(20) NOT NULL,
			`first_name` varchar(255) NOT NULL,
			`last_name` varchar(255) NOT NULL,
			`country_prefix` varchar(50) NOT NULL DEFAULT '91',
			`profile_img` text,
			`phone_no` text NOT NULL,
			`email_id` text NOT NULL,
			`country_id` int(20) NOT NULL,
			`state_id` int(20) NOT NULL,
			`city_id` varchar(100) NOT NULL,
			`pincode` varchar(20) NOT NULL,
			`password` text NOT NULL,
			`og_password` varchar(200) NOT NULL,
			`added_by` varchar(250) NOT NULL,
			`added_date` varchar(100) DEFAULT NULL,
			`status` tinyint(4) NOT NULL DEFAULT '1'
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_members;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_members_staff = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`members_staff` (
			`id` bigint(20) NOT NULL,
			`name` text NOT NULL,
			`phone_no` text NOT NULL,
			`email_id` text NOT NULL,
			`password` text NOT NULL,
			`og_password` varchar(200) NOT NULL,
			`usertype_id` int(11) NOT NULL,
			`parent_id` bigint(20) NOT NULL DEFAULT '0',
			`added_by` int(11) NOT NULL DEFAULT '1',
			`added_usertypeid` int(11) NOT NULL DEFAULT '1',
			`profile_pic` text NOT NULL,
			`proof_name` varchar(200) DEFAULT NULL,
			`proof_image` text,
			`address_proof` text,
			`gst_no` varchar(100) DEFAULT NULL,
			`address` text NOT NULL,
			`added_date` varchar(100) DEFAULT NULL,
			`last_login` varchar(100) DEFAULT NULL,
			`forget_code` varchar(100) DEFAULT NULL,
			`status` tinyint(4) NOT NULL DEFAULT '1'
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_members_staff;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_newsletter = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`newsletter` (
			`id` int(11) NOT NULL,
			`email` text NOT NULL,
			`status` int(11) NOT NULL,
			`Subscries_date` text NOT NULL
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_newsletter;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_order_billing_details = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`order_billing_details` (
			`id` bigint(20) NOT NULL,
			`random_order_id` varchar(200) NOT NULL,
			`billing_f_name` varchar(255) NOT NULL,
			`billing_l_name` varchar(255) DEFAULT NULL,
			`billing_address` varchar(255) NOT NULL,
			`billing_address_2` varchar(255) DEFAULT NULL,
			`billing_city` varchar(255) NOT NULL,
			`billing_pincode` varchar(50) NOT NULL,
			`billing_state` varchar(50) NOT NULL,
			`billing_country` varchar(50) NOT NULL,
			`billing_email` varchar(255) DEFAULT NULL,
			`billing_phone` varchar(50) DEFAULT NULL,
			`billind_is_shipping` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:yes,0:no',
			`added_date` varchar(50) DEFAULT NULL,
			`status` tinyint(4) NOT NULL
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_order_billing_details;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_order_cancel_details = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`order_cancel_details` (
			`id` int(11) NOT NULL,
			`random_order_id` varchar(255) DEFAULT NULL,
			`description` text,
			`cancel_status` tinyint(2) NOT NULL DEFAULT '1' COMMENT 'payment :- 1-pending,2-confirm',
			`cancel_date` varchar(200) DEFAULT '1',
			`status` tinyint(4) NOT NULL DEFAULT '1'
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_order_cancel_details;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_order_payment_failure = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`order_payment_failure` (
			`id` int(11) NOT NULL,
			`order_id` varchar(255) NOT NULL,
			`transaction_order_id` varchar(255) NOT NULL,
			`transaction_id` text,
			`amount` decimal(10,2) NOT NULL,
			`resp_code` varchar(255) NOT NULL,
			`type` int(11) NOT NULL DEFAULT '1' COMMENT '1-order payment,2-user subscribe payment,3-add wallet payment',
			`transaction_date` varchar(255) NOT NULL,
			`transaction_status` varchar(200) NOT NULL,
			`transaction_json` text NOT NULL,
			`transaction_desc` text,
			`added_date` varchar(150) NOT NULL
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_order_payment_failure;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_order_payment_transaction = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`order_payment_transaction` (
			`id` bigint(20) NOT NULL,
			`random_order_id` varchar(50) NOT NULL,
			`user_id` varchar(50) NOT NULL,
			`transaction_id` varchar(255) NOT NULL,
			`mert_id` varchar(50) NOT NULL,
			`actual_price` varchar(20) NOT NULL,
			`pay_price` varchar(20) NOT NULL,
			`payment_status` int(11) NOT NULL,
			`payment_res` text,
			`status` tinyint(4) NOT NULL DEFAULT '1'
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_order_payment_transaction;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_order_products = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`order_products` (
			`id` bigint(20) NOT NULL,
			`random_order_id` varchar(200) NOT NULL,
			`product_sku` varchar(200) NOT NULL,
			`user_id` varchar(50) NOT NULL,
			`parent_id` varchar(50) NOT NULL,
			`hsn_code` varchar(50) DEFAULT NULL,
			`qty` int(11) NOT NULL,
			`tax` decimal(10,2) DEFAULT NULL,
			`price` decimal(10,2) NOT NULL,
			`discount` decimal(10,2) DEFAULT NULL,
			`product_name` text NOT NULL,
			`status` tinyint(4) NOT NULL DEFAULT '1'
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_order_products;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_order_shipment_details = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`order_shipment_details` (
			`id` bigint(20) NOT NULL,
			`order_id` varchar(50) NOT NULL,
			`ship_order_id` varchar(200) NOT NULL,
			`our_courier_id` int(11) NOT NULL DEFAULT '0' COMMENT 'our customer courier company id',
			`ship_courier_id` int(11) NOT NULL DEFAULT '0' COMMENT 'shiprocket cour. company id',
			`shipment_id` varchar(255) NOT NULL,
			`ship_awb_code` varchar(200) DEFAULT NULL,
			`shipment_status_id` int(11) DEFAULT NULL COMMENT 'shipping_status_type.id',
			`order_status_id` int(11) DEFAULT NULL,
			`added_date` varchar(50) DEFAULT NULL,
			`status` tinyint(4) NOT NULL DEFAULT '1'
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_order_shipment_details;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_order_shipment_history = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`order_shipment_history` (
			`id` int(11) NOT NULL,
			`random_order_id` varchar(255) NOT NULL COMMENT 'order_transaction.random_order_id',
			`shipment_status` int(11) NOT NULL COMMENT 'shipping_status_type.id',
			`status_label` varchar(255) NOT NULL,
			`resp_json` text,
			`added_date` varchar(255) NOT NULL
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_order_shipment_history;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_order_shipping_details = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`order_shipping_details` (
			`id` bigint(20) NOT NULL,
			`random_order_id` varchar(200) NOT NULL,
			`shipping_f_name` varchar(255) NOT NULL,
			`shipping_l_name` varchar(255) DEFAULT NULL,
			`shipping_address` varchar(255) NOT NULL,
			`shipping_address_2` varchar(255) DEFAULT NULL,
			`shipping_city` varchar(255) NOT NULL,
			`shipping_pincode` varchar(50) NOT NULL,
			`shipping_state` varchar(50) NOT NULL,
			`shipping_country` varchar(50) NOT NULL,
			`shipping_email` varchar(255) DEFAULT NULL,
			`shipping_phone` varchar(50) DEFAULT NULL,
			`added_date` varchar(50) DEFAULT NULL,
			`status` tinyint(4) NOT NULL
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_order_shipping_details;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_order_status_type = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`order_status_type` (
			`id` int(11) NOT NULL,
			`name` varchar(200) NOT NULL,
			`slug` text NOT NULL,
			`company_status` int(11) NOT NULL,
			`added_by` varchar(200) NOT NULL,
			`added_date` varchar(50) DEFAULT NULL,
			`status` tinyint(4) NOT NULL DEFAULT '1'
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_order_status_type;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_order_transaction = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`order_transaction` (
			`id` bigint(20) NOT NULL,
			`auth_id` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'master_role_package.auth_id/auth_details.id',
			`random_order_id` varchar(200) NOT NULL,
			`actual_order_id` varchar(200) DEFAULT NULL,
			`order_payment_type` tinyint(1) NOT NULL COMMENT '1:prepaid,2:cod',
			`user_id` varchar(50) NOT NULL,
			`parent_id` varchar(50) NOT NULL,
			`pickup_id` bigint(20) NOT NULL,
			`eway_bill_no` varchar(50) DEFAULT NULL,
			`order_date` varchar(50) NOT NULL,
			`order_price` varchar(100) NOT NULL,
			`courier_charges` varchar(250) NOT NULL DEFAULT '0.000',
			`courier_original_price` decimal(10,2) NOT NULL DEFAULT '0.00',
			`user_commission_json` text,
			`cod_charges` decimal(10,3) NOT NULL DEFAULT '0.000',
			`weight` double NOT NULL,
			`length` double NOT NULL,
			`breadth` double NOT NULL,
			`height` double NOT NULL,
			`extra_details` text COMMENT 'billing details or extra',
			`added_date` varchar(50) NOT NULL,
			`system_order_status` int(11) DEFAULT '1',
			`courier_order_status` int(11) DEFAULT '1',
			`status` tinyint(4) NOT NULL COMMENT '1:Active,2:deactive'
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_order_transaction;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_package_list = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`package_list` (
			`id` int(11) NOT NULL,
			`name` varchar(200) NOT NULL,
			`slug` text NOT NULL,
			`price` varchar(100) NOT NULL,
			`user_commission` int(11) NOT NULL,
			`description` text,
			`meta_keyword` text,
			`meta_description` text,
			`added_date` varchar(255) NOT NULL,
			`status` tinyint(4) NOT NULL DEFAULT '1'
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_package_list;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_pending_user_list = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`pending_user_list` (
			`id` int(11) NOT NULL,
			`first_name` varchar(200) NOT NULL,
			`last_name` varchar(200) NOT NULL,
			`phone_no` varchar(100) NOT NULL,
			`email` varchar(250) NOT NULL,
			`pincode` varchar(100) NOT NULL,
			`city` varchar(250) NOT NULL,
			`state` int(11) NOT NULL,
			`countries` int(11) NOT NULL,
			`password` varchar(250) NOT NULL,
			`added_date` varchar(100) NOT NULL,
			`status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0-disapproval,1-pending,2-approved'
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_pending_user_list;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_permission = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`permission` (
			`id` int(11) NOT NULL,
			`name` varchar(200) DEFAULT NULL,
			`code_name` text,
			`parent_status` varchar(200) DEFAULT NULL,
			`description` text,
			`status` tinyint(4) NOT NULL DEFAULT '1'
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_permission;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_pickup_address = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`pickup_address` (
			`id` int(11) NOT NULL,
			`user_id` varchar(250) DEFAULT NULL COMMENT 'master_role_package.unique_key',
			`parent_id` varchar(250) DEFAULT NULL,
			`mobile` varchar(250) DEFAULT NULL,
			`email` varchar(250) DEFAULT NULL,
			`contact_name` varchar(250) DEFAULT NULL,
			`address_nickname` varchar(250) DEFAULT NULL,
			`auth_id` int(11) NOT NULL COMMENT 'tbl-auth_details.id',
			`address_line_1` text,
			`address_line_2` text,
			`pincode` int(100) DEFAULT NULL,
			`country_id` int(11) DEFAULT NULL,
			`state_id` int(11) DEFAULT NULL,
			`city_id` text,
			`default_status` tinyint(4) DEFAULT '0',
			`company_id` int(11) DEFAULT NULL,
			`pickup_id` int(11) DEFAULT NULL COMMENT 'shiprocket-pickup-id',
			`json_resp` text,
			`added_date` varchar(200) DEFAULT NULL,
			`status` tinyint(4) DEFAULT '1' COMMENT '1-active,0-deactive'
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_pickup_address;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_pincode_details = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`pincode_details` (
			`id` int(11) NOT NULL,
			`pincode` varchar(10) NOT NULL,
			`is_in_shiprocekt` tinyint(4) NOT NULL DEFAULT '1',
			`city_name` varchar(50) DEFAULT NULL,
			`city_id` int(11) DEFAULT NULL,
			`state_name` varchar(50) DEFAULT NULL,
			`state_id` int(11) DEFAULT NULL,
			`coutry_name` varchar(50) DEFAULT NULL,
			`country_id` int(11) DEFAULT NULL,
			`status` tinyint(4) NOT NULL DEFAULT '1'
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_pincode_details;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_products_old = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`products_old` (
			`id` int(11) NOT NULL,
			`name` varchar(250) NOT NULL,
			`company_name` varchar(250) DEFAULT NULL,
			`product_img` text,
			`status` tinyint(2) NOT NULL DEFAULT '1'
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_products_old;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_product_image = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`product_image` (
			`id` int(11) NOT NULL,
			`product_id` int(11) NOT NULL,
			`image` text NOT NULL
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_product_image;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_product_master = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`product_master` (
			`id` int(11) NOT NULL,
			`parent_id` int(11) NOT NULL,
			`name` text NOT NULL,
			`sku` varchar(200) NOT NULL,
			`color` varchar(255) NOT NULL,
			`quantity` int(255) NOT NULL,
			`description` text NOT NULL,
			`price` int(11) NOT NULL,
			`meta_title` text NOT NULL,
			`meta_keyword` text NOT NULL,
			`meta_description` text NOT NULL,
			`image` varchar(255) NOT NULL,
			`user_id` varchar(250) NOT NULL COMMENT 'tbl-,master_role_packageunique_key',
			`added_date` varchar(60) NOT NULL,
			`status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1-active,2-deactive'
			) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_product_master;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_refund_request_manually = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`refund_request_manually` (
			`id` int(11) NOT NULL,
			`user_id` text NOT NULL,
			`order_id` text NOT NULL,
			`status` int(10) NOT NULL COMMENT '0.pending,1.Approval,3.No Approval',
			`added_date` text NOT NULL
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_refund_request_manually;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_role = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`role` (
			`id` tinyint(4) NOT NULL,
			`name` varchar(200) NOT NULL,
			`slug` varchar(200) DEFAULT NULL,
			`permission` longtext,
			`description` longtext,
			`user_type` tinyint(4) DEFAULT '2' COMMENT '1-admin_staff,2-franchisee,3-retailer,4-user',
			`status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:active 0:inactive'
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_role;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_salt_key = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`salt_key` (
			`id` int(11) NOT NULL,
			`name` varchar(255) NOT NULL,
			`date` varchar(255) NOT NULL,
			`salt_key` text NOT NULL,
			`status` tinyint(4) NOT NULL
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_salt_key;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_shipping_status_type = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`shipping_status_type` (
			`id` int(11) NOT NULL,
			`name` varchar(200) NOT NULL,
			`slug` text NOT NULL,
			`company_status` int(11) NOT NULL,
			`added_by` varchar(200) NOT NULL,
			`added_date` varchar(50) DEFAULT NULL,
			`status` tinyint(4) NOT NULL DEFAULT '1'
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_shipping_status_type;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_shiprocket_courier_company = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`shiprocket_courier_company` (
			`id` int(11) NOT NULL,
			`courier_company_id` int(11) NOT NULL,
			`name` varchar(255) NOT NULL,
			`courier_image` text NOT NULL,
			`is_shiprocket_couriers` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1-shiprocket,0-other',
			`status` int(11) NOT NULL DEFAULT '1'
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_shiprocket_courier_company;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_states = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`states` (
			`id` int(11) NOT NULL,
			`name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
			`short_code` varchar(20) NOT NULL,
			`country_id` int(11) NOT NULL,
			`status` tinyint(2) NOT NULL DEFAULT '1'
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_states;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_subscribe_date_history = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`subscribe_date_history` (
			`id` int(11) NOT NULL,
			`old_from_date` varchar(255) NOT NULL,
			`old_to_date` varchar(250) NOT NULL,
			`new_to_date` varchar(250) NOT NULL,
			`user_id` varchar(250) NOT NULL,
			`added_date` varchar(250) NOT NULL,
			`added_day` int(11) NOT NULL DEFAULT '0',
			`subscribe_transaction_id` int(11) NOT NULL COMMENT 'subscribe_transaction.id',
			`subscribe_id` int(11) NOT NULL COMMENT 'subscribe_user.id'
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_subscribe_date_history;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_subscribe_transaction = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`subscribe_transaction` (
			`id` int(11) NOT NULL,
			`subscribe_id` int(11) DEFAULT NULL COMMENT 'subscribe_user.id',
			`package_id` int(11) NOT NULL,
			`amount` int(11) NOT NULL,
			`from_date` varchar(200) NOT NULL,
			`to_date` varchar(200) NOT NULL,
			`transaction_id` text,
			`merchant_id` text,
			`res_order_id` text COMMENT 'paytm_order_id/razorpay_order_id',
			`resp_code` varchar(250) DEFAULT NULL COMMENT 'paytm_respcode/razorpay 01 Default  set',
			`transaction_response` text,
			`plan_status` int(11) DEFAULT '0' COMMENT '0-expired,1-current activity,2-upcoming',
			`payment_type` int(11) NOT NULL DEFAULT '1' COMMENT '1-paytm,2-razorpay',
			`payment_paid` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-system ,1-manually',
			`added_day` int(11) NOT NULL DEFAULT '0',
			`added_date` int(11) NOT NULL,
			`status` tinyint(4) NOT NULL
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_subscribe_transaction;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_subscribe_transaction_old = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`subscribe_transaction_old` (
			`id` int(11) NOT NULL,
			`subscribe_id` int(11) NOT NULL COMMENT 'subscribe_user.id',
			`package_id` int(11) NOT NULL,
			`amount` int(11) NOT NULL,
			`from_date` varchar(200) NOT NULL,
			`to_date` varchar(200) NOT NULL,
			`transaction_id` text NOT NULL,
			`transaction_response` text NOT NULL,
			`added_date` int(11) NOT NULL,
			`status` tinyint(4) NOT NULL
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_subscribe_transaction_old;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_subscribe_user = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`subscribe_user` (
			`id` int(11) NOT NULL,
			`user_id` varchar(200) NOT NULL COMMENT 'user_unique_key',
			`from_date` varchar(200) NOT NULL,
			`to_date` varchar(200) NOT NULL,
			`package_id` int(11) NOT NULL,
			`amount` int(11) NOT NULL,
			`update_date` varchar(200) NOT NULL,
			`status` tinyint(4) NOT NULL
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_subscribe_user;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_tbl_cms = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`tbl_cms` (
			`id` int(11) NOT NULL,
			`title` text NOT NULL,
			`identifier` text NOT NULL,
			`content` text NOT NULL,
			`creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
			`update_time` varchar(200) NOT NULL DEFAULT '0000-00-00 00:00:00',
			`is_active` int(11) NOT NULL
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_tbl_cms;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_tbl_faq = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`tbl_faq` (
			`id` int(11) NOT NULL,
			`faq_name` text NOT NULL,
			`faq_content` text NOT NULL,
			`create_date` text NOT NULL,
			`status` int(11) NOT NULL
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_tbl_faq;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_tbl_offers = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`tbl_offers` (
			`id` int(11) NOT NULL,
			`name` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
			`description` text,
			`image_1` text,
			`image_2` text NOT NULL,
			`price` int(11) NOT NULL,
			`status` tinyint(4) NOT NULL DEFAULT '1',
			`added_date` tinyint(4) NOT NULL
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_tbl_offers;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_tbl_order_cart = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`tbl_order_cart` (
			`id` int(11) NOT NULL,
			`cookies_id` text NOT NULL,
			`customer_id` text NOT NULL,
			`cat_id` text NOT NULL,
			`brand_id` bigint(20) DEFAULT NULL,
			`model_id` text NOT NULL,
			`carries_id` text NOT NULL,
			`models_type` text NOT NULL,
			`added_date` varchar(50) NOT NULL,
			`status` tinyint(4) NOT NULL DEFAULT '1',
			`cart_price` text NOT NULL,
			`offer_id` text NOT NULL,
			`offer_value` text NOT NULL,
			`offer_status` text,
			`isin_cart` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:in cart, 0:not in cart',
			`billing_address` text NOT NULL COMMENT 'order Billing Address',
			`order_status` int(11) NOT NULL DEFAULT '1' COMMENT '1-pending,2-confirm,3-tracking,4-pickup,5-	Problem with Address',
			`cust_email` text NOT NULL,
			`payment_email` text NOT NULL,
			`payout_type` text NOT NULL,
			`shipping_label` varchar(50) NOT NULL,
			`order_id` int(11) DEFAULT NULL,
			`offer_expires` varchar(50) NOT NULL,
			`tracking_number` text NOT NULL,
			`modify_date` varchar(50) DEFAULT NULL
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_tbl_order_cart;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_tbl_slider = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`tbl_slider` (
			`id` int(11) NOT NULL,
			`slider_image` text NOT NULL,
			`slider_link` text NOT NULL,
			`status` int(11) NOT NULL
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_tbl_slider;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_tbl_testimonial = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`tbl_testimonial` (
			`id` int(11) NOT NULL,
			`client_name` text NOT NULL,
			`client_image` text NOT NULL,
			`testimonial` text NOT NULL,
			`creation_date` text NOT NULL,
			`statue` int(11) NOT NULL
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_tbl_testimonial;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_transaction_type = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`transaction_type` (
			`id` int(11) NOT NULL,
			`name` varchar(255) NOT NULL,
			`slug` varchar(255) NOT NULL,
			`status` tinyint(4) NOT NULL DEFAULT '1'
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_transaction_type;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_user_type = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`user_type` (
			`id` int(11) NOT NULL,
			`name` varchar(50) NOT NULL,
			`list_status` tinyint(2) NOT NULL DEFAULT '1',
			`status` tinyint(4) NOT NULL DEFAULT '1'
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_user_type;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_wallet_order_cancel_transaction = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`wallet_order_cancel_transaction` (
			`id` int(11) NOT NULL,
			`user_id` varchar(250) NOT NULL,
			`order_id` varchar(255) NOT NULL,
			`wallet_id` int(11) NOT NULL,
			`actual_value` decimal(10,2) NOT NULL,
			`added_date` varchar(250) NOT NULL,
			`status` tinyint(4) NOT NULL
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_wallet_order_cancel_transaction;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_wallet_order_transaction = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`wallet_order_transaction` (
			`id` int(11) NOT NULL,
			`user_id` varchar(250) NOT NULL,
			`order_id` varchar(255) NOT NULL,
			`wallet_id` int(11) NOT NULL,
			`actual_value` decimal(10,2) NOT NULL,
			`added_date` varchar(200) NOT NULL,
			`status` tinyint(4) NOT NULL
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_wallet_order_transaction;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_wallet_recharge_transaction = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`wallet_recharge_transaction` (
			`id` int(11) NOT NULL,
			`user_id` varchar(250) NOT NULL,
			`wallet_id` int(11) NOT NULL COMMENT 'wallet_transaction.id',
			`actual_value` decimal(10,2) NOT NULL,
			`payment_resp` text NOT NULL,
			`payment_type` int(11) NOT NULL DEFAULT '1' COMMENT '1-paytm,2-razorpay',
			`transaction_id` text NOT NULL,
			`added_date` varchar(150) NOT NULL,
			`status` tinyint(4) NOT NULL
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_wallet_recharge_transaction;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_wallet_transaction = CONCAT("CREATE TABLE IF NOT EXISTS `",@db,"`.`wallet_transaction` (
			`id` int(11) NOT NULL,
			`unique_key` varchar(200) NOT NULL,
			`transaction_type_id` tinyint(4) NOT NULL COMMENT 'from transaction type table',
			`prev_total` decimal(10,2) DEFAULT NULL,
			`current_total` decimal(10,2) DEFAULT NULL,
			`actual_value` decimal(10,2) NOT NULL,
			`in_out_for_user` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1-in, 2-out',
			`description` text,
			`name` text,
			`added_date` varchar(250) NOT NULL,
			`status` tinyint(4) NOT NULL DEFAULT '1'
			 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;");
		PREPARE stmt FROM @sql_wallet_transaction;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		CALL ecourierTableInsert(@db);
	END$$
	CREATE DEFINER=`root`@`localhost` PROCEDURE `ecourierTableInsert`(IN `dbname` VARCHAR(100) CHARSET utf8)
	BEGIN
		SET @db = dbname;
		SET @sql_auth_details_in = CONCAT("INSERT INTO `",@db,"`.`auth_details` (`id`, `name`, `type`, `auth_key`, `auth_password`, `company_id`, `notes`, `added_date`, `status`) VALUES
			(1, 'itabtech_aip', 'shiprocket', 'ecourierindiain@gmail.com', 'Myname123', 2, 'desc', '', 1),
			(10, 'itabtech_aip', 'shiprocket', 'itabtechinfosys1@gmail.com', 'Myname123', 2, 'desc', '', 1);");
		PREPARE stmt FROM @sql_auth_details_in;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_email_settings_in = CONCAT("INSERT INTO `",@db,"`.`email_settings` (`id`, `name`, `protocol`, `smtp_host`, `smtp_port`, `smtp_user`, `smtp_pass`, `reply_to`, `status`) VALUES
			(1, 'kuldip ladola', 'smtp', 'ssl://smtp.googlemail.com', '465', 'kuldipladola@gmail.com', 'S3VsRGlwMTIz', 'kuldipladola@gmail.com', 1);");
		PREPARE stmt FROM @sql_email_settings_in;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_error_type_in = CONCAT("INSERT INTO `",@db,"`.`error_type` (`id`, `type`, `description`) VALUES
			(1, 'shipment_status', 'shipment status '),
			(2, 'order_ship_now', 'Order ship now'),
			(3, 'order_cancel_request', 'Order cancel request');");
		PREPARE stmt FROM @sql_error_type_in;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_global_settings_in = CONCAT("INSERT INTO `",@db,"`.`global_settings` (`id`, `slug`, `value`, `name`, `description`, `status`) VALUES
			(1, 'user_commission_default_value', '15', 'User commission default value', 'User commission default value', 1);");
		PREPARE stmt FROM @sql_global_settings_in;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_order_status_type_in = CONCAT("INSERT INTO `",@db,"`.`order_status_type` (`id`, `name`, `slug`, `company_status`, `added_by`, `added_date`, `status`) VALUES
			(1, 'new', 'new', 1, '1', '20191016', 1),
			(2, 'invoice', 'invoice', 2, '1', '20191016', 1),
			(3, 'ready to ship', 'ready_to_ship', 3, '1', NULL, 1),
			(4, 'pickup scheduled', 'pickup_scheduled', 4, '1', NULL, 1),
			(5, 'cancelled', 'cancelled', 5, '1', NULL, 1),
			(6, 'shipped', 'shipped', 6, '1', NULL, 1),
			(7, 'delivered', 'delivered', 7, '1', NULL, 1);");
		PREPARE stmt FROM @sql_order_status_type_in;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_package_list_in = CONCAT("INSERT INTO `",@db,"`.`package_list` (`id`, `name`, `slug`, `price`, `user_commission`, `description`, `meta_keyword`, `meta_description`, `added_date`, `status`) VALUES
			(4, 'franchise', 'franchise', '1', 10, 'Starter', 'Starter', 'Starter', '1569846071', 1),
			(5, 'Business', 'business', '1', 30, 'Economy', 'Economy', 'Economy', '1569846089', 1),
			(6, 'individual', 'individual', '1', 40, 'Deluxe', 'Deluxe', 'Deluxe', '1569846108', 0),
			(7, 'Complimentary', 'Covid_Package', '1', 20, 'Trial Package', 'Interim Arrangement', 'Interim Arrangement', '1589523543', 0),
			(8, 'Balance Payment', 'Balance_Payment', '519', 10, 'Undercharge for your transactions done on 19/06/2020 for 141123201831903, 141123201832287, 141123201832735, 1904134135403, 141123201820436, 1904134135101, 141123201819220, 141123201818516, 141123201818260, 1504812931386', 'Undercharge for your transactions done on 19/06/2020 ', 'Undercharge for your transactions done on 19/06/2020 ', '1592533580', 0);");
		PREPARE stmt FROM @sql_package_list_in;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_permission_in = CONCAT("INSERT INTO `",@db,"`.`permission` (`id`, `name`, `code_name`, `parent_status`, `description`, `status`) VALUES
			(150, 'product', 'product', 'parent', 'product tab', 0),
			(151, 'product list', 'product_list', '150', 'product list', 0),
			(152, 'product_add', 'product_add', '150', 'product_add', 0),
			(153, 'product_edit', 'product_edit', '150', 'product_edit', 0),
			(154, 'package', 'package', 'parent', 'package', 1),
			(155, 'package_list', 'package_list', '154', 'package_list', 1),
			(156, 'package_add', 'package_add', '154', 'package_add', 1),
			(157, 'package_edit', 'package_edit', '154', 'package_edit', 1),
			(158, 'color', 'color', 'parent', 'color', 0),
			(159, 'color_add', 'color_add', '158', 'color_add', 0),
			(160, 'color_edit', 'color_edit', '158', 'color_edit', 0),
			(161, 'color_list', 'color_list', '158', 'color_list', 0),
			(162, 'user', 'user', 'parent', 'user', 1),
			(163, 'user_list', 'user_list', '162', 'user_list', 1),
			(164, 'user_add', 'user_add', '162', 'user_add', 1),
			(165, 'user_edit', 'user_edit', '162', 'user_edit', 1),
			(166, 'dashboard', 'dashboard', 'parent', 'dashboard', 1),
			(167, 'order', 'order', 'parent', 'order', 1),
			(168, 'order_add', 'order_add', '167', 'order_add', 1),
			(169, 'order_edit', 'order_edit', '167', 'order_edit', 1),
			(170, 'order_list', 'order_list', '167', 'order_list', 1),
			(171, 'customer', 'customer', 'parent', 'customer', 0),
			(172, 'customer_add', 'customer_add', '171', 'customer_add', 0),
			(173, 'customer_edit', 'customer_edit', '171', 'customer_edit', 0),
			(174, 'customer_list', 'customer_list', '171', 'customer_list', 0),
			(175, 'permission_roll', 'permission_roll', 'parent', 'permission_roll', 0),
			(176, 'subscribe', 'subscribe', 'parent', 'subscribe', 1),
			(177, 'subscribe_list', 'subscribe_list', '176', 'subscribe_list', 1),
			(178, 'pickup_address', 'pickup_address', 'parent', 'pickup_address', 1),
			(179, 'pickup_address_list', 'pickup_address_list', '178', 'pickup_address_list', 1),
			(180, 'pickup_address_add', 'pickup_address_add', '178', 'pickup_address_add', 1),
			(181, 'pickup_address_edit', 'pickup_address_edit', '178', 'pickup_address_edit', 1),
			(182, 'General Settings', 'general_settings', 'parent', 'general_settings ', 0),
			(183, 'api_setting', 'api_setting', '182', 'api_setting', 0),
			(184, 'Import', 'import', 'parent', 'Import', 1),
			(186, 'track_order', 'track_order', 'parent', 'track_order', 1),
			(187, 'courier list', 'courier_list', 'parent', 'courier_list', 1),
			(188, 'view_courier_list', 'View', '187', 'view_courier_list', 1);");
		PREPARE stmt FROM @sql_permission_in;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_shipping_status_type_in = CONCAT("INSERT INTO `",@db,"`.`shipping_status_type` (`id`, `name`, `slug`, `company_status`, `added_by`, `added_date`, `status`) VALUES
			(1, 'awb assigned', 'awb_assigned', 1, '1', NULL, 1),
			(2, 'label generated', 'label_generated', 2, '1', NULL, 1),
			(3, 'pickup scheduled', 'pickup_scheduled', 3, '1', NULL, 1),
			(4, 'pickup queued', 'pickup_queued', 4, '1', NULL, 1),
			(5, 'manifest generated', 'manifest_generated', 5, '1', NULL, 1),
			(6, 'shipped', 'shipped', 6, '1', NULL, 1),
			(7, 'Delivered', 'delivered', 7, '1', '1575635968', 1),
			(8, 'cancelled', 'cancelled', 8, '1', NULL, 1),
			(9, 'rto initiated', 'rto_initiated', 9, '1', NULL, 1),
			(10, 'rto delivered', 'rto_delivered', 10, '1', NULL, 1),
			(11, 'Pending', 'pending', 11, '1', NULL, 1),
			(12, 'Lost', 'lost', 12, '1', NULL, 1),
			(13, 'Pickup Error', 'pickup_error', 13, '1', NULL, 1),
			(14, 'RTO Acknowledged', 'rto_acknowledged', 14, '1', NULL, 1),
			(15, 'Pickup Rescheduled', 'pickup_rescheduled', 15, '1', NULL, 1),
			(16, 'Cancellation Requested', 'cancellation_requested', 16, '1', NULL, 1),
			(17, 'Out For Delivery', 'out_for_delivery', 17, '1', NULL, 1),
			(18, 'In Transit', '	in_transit', 18, '1', NULL, 1),
			(19, 'Out For Pickup', 'out_for_pickup', 19, '1', NULL, 1),
			(20, 'Pickup Exception', 'pickup_exception', 20, '1', NULL, 1),
			(21, 'undelivered', 'undelivered', 21, '1', NULL, 1),
			(22, 'Delayed', 'delayed', 22, '1', NULL, 1),
			(23, 'REACHED AT DESTINATION HUB', 'reached_at_destination_hub', 38, '1', NULL, 1);");
		PREPARE stmt FROM @sql_shipping_status_type_in;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_shiprocket_courier_company_in = CONCAT("INSERT INTO `",@db,"`.`shiprocket_courier_company` (`id`, `courier_company_id`, `name`, `courier_image`, `is_shiprocket_couriers`, `status`) VALUES
			(1, 1, 'Bluedart', 'patner-10.png', 1, 1),
			(2, 55, 'Dart Plus', 'patner-101.png', 1, 1),
			(3, 10, 'Delhivery', 'delhivery_logo3.png', 1, 1),
			(4, 39, 'Delhivery Surface', 'delhivery_logo2.png', 1, 1),
			(5, 62, 'FEDEX-SURFACE 1KG', 'unnamed13.png', 1, 1),
			(6, 12, 'Fedex Surface', 'unnamed12.png', 1, 1),
			(7, 44, 'Delhivery Surface Lite', 'delhivery_logo1.png', 1, 1),
			(8, 43, 'Delhivery Surface Standard', 'delhivery_logo.png', 1, 1),
			(9, 51, 'Xpressbees Surface', 'PU7d7j0Z_400x4001.jpg', 1, 1),
			(10, 16, 'Dotzot', 'dotzot-512.png', 1, 1),
			(11, 33, 'Xpressbees', 'PU7d7j0Z_400x400.jpg', 1, 1),
			(12, 14, 'Ecom Exp', 'ecomexpress-5122.png', 1, 1),
			(13, 50, 'Wow Express', 'wow-express-moosarambagh-hyderabad-c0q45.jpg', 1, 1),
			(14, 46, 'Shadowfax Reverse', 'download2.png', 1, 1),
			(15, 45, 'Ecom Exp Reverse', 'ecomexpress-5121.png', 1, 1),
			(16, 60, 'Ecom ROS', 'ecomexpress-512.png', 1, 1),
			(17, 58, 'ShadowFax Forward', 'download.png', 1, 1),
			(18, 54, 'Ekart Surface', 'E-kart-logo.png', 1, 1),
			(19, 52, 'Rapid Delivery', 'rapiddelivery1-sm0nEbcicbacb_small.jpg', 1, 1),
			(20, 57, 'Professional', 'images.jpg', 1, 1),
			(21, 2, 'Fedex', 'unnamed11.png', 1, 1),
			(22, 41, 'Fedex FR', 'download_(1).png', 1, 1),
			(23, 40, 'Gati Surface', 'logo.png', 1, 1),
			(24, 42, 'Fedex SL', 'unnamed1.png', 1, 1),
			(25, 53, 'Gati SG', 'gati-limited-raipur-ho-raipur-chhattisgarh-courier-services-xlls8ct.jpg', 1, 1),
			(26, 35, 'ARAMEX-INTERNATIONAL', 'download1.png', 1, 1),
			(48, 555, 'balaji courier', 'shree-balaji-courier-service-chembur-east-mumbai-domestic-courier-services-y7ijb.jpg', 0, 1);");
		PREPARE stmt FROM @sql_shiprocket_courier_company_in;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_transaction_type_in = CONCAT("INSERT INTO `",@db,"`.`transaction_type` (`id`, `name`, `slug`, `status`) VALUES
			(1, 'reffer', 'reffer', 1),
			(2, 'add in wallet', 'add_in_wallet', 1),
			(3, 'out from wallet', 'out_from_wallet', 1),
			(4, 'cod balance', 'cod_balance', 1),
			(5, 'wallet recharge', 'wallet_recharge', 1),
			(6, 'order commission received', 'commission_received', 1),
			(7, 'order ship now', 'order_ship_now', 1),
			(8, 'order cancel', 'order_cancel', 1);");
		PREPARE stmt FROM @sql_transaction_type_in;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
		SET @sql_user_type_in = CONCAT("INSERT INTO `",@db,"`.`user_type` (`id`, `name`, `list_status`, `status`) VALUES
			(1, 'super admin', 1, 1),
			(2, 'admin', 1, 1),
			(3, 'distributor', 1, 1),
			(4, 'retailer', 1, 1),
			(5, 'distributor''s staff', 1, 1),
			(6, 'retailer''s staff', 1, 1);");
		PREPARE stmt FROM @sql_user_type_in;
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
	END$$
DELIMITER ;