/*
SQLyog Trial v13.1.8 (64 bit)
MySQL - 5.7.22 : Database - admin
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`admin` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `admin`;

/*Table structure for table `model_has_permissions` */

DROP TABLE IF EXISTS `model_has_permissions`;

CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `admin_model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `admin_model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `model_has_permissions` */

/*Table structure for table `model_has_roles` */

DROP TABLE IF EXISTS `model_has_roles`;

CREATE TABLE `model_has_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `admin_model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `admin_model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `model_has_roles` */

insert  into `model_has_roles`(`role_id`,`model_type`,`model_id`) values 
(1,'adminUser',1),
(6,'user',1),
(1,'adminUser',2),
(6,'user',2),
(1,'adminUser',3),
(6,'user',3),
(1,'adminUser',4),
(6,'user',4);

/*Table structure for table `notes` */

DROP TABLE IF EXISTS `notes`;

CREATE TABLE `notes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `note` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `hubspot_engagement_id` bigint(20) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_notes_account_id_foreign` (`account_id`),
  KEY `admin_notes_user_id_foreign` (`user_id`),
  CONSTRAINT `admin_notes_account_id_foreign` FOREIGN KEY (`account_id`) REFERENCES `merchant`.`accounts` (`id`),
  CONSTRAINT `admin_notes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `notes` */

/*Table structure for table `notifications` */

DROP TABLE IF EXISTS `notifications`;

CREATE TABLE `notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `viewed` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_notifications_user_id_index` (`user_id`),
  KEY `admin_notifications_viewed_index` (`viewed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `notifications` */

/*Table structure for table `permissions` */

DROP TABLE IF EXISTS `permissions`;

CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `permissions` */

insert  into `permissions`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values 
(1,'account_list_view','admin','2022-03-10 14:04:11','2022-03-10 14:04:11'),
(2,'account_add','admin','2022-03-10 14:04:11','2022-03-10 14:04:11'),
(3,'account_view','admin','2022-03-10 14:04:11','2022-03-10 14:04:11'),
(4,'account_update','admin','2022-03-10 14:04:11','2022-03-10 14:04:11'),
(5,'account_gateway_list_view','admin','2022-03-10 14:04:11','2022-03-10 14:04:11'),
(6,'account_user_list_view','admin','2022-03-10 14:04:11','2022-03-10 14:04:11'),
(7,'account_transaction_list_view','admin','2022-03-10 14:04:11','2022-03-10 14:04:11'),
(8,'account_audit_list_view','admin','2022-03-10 14:04:11','2022-03-10 14:04:11'),
(9,'account_payment_list_view','admin','2022-03-10 14:04:11','2022-03-10 14:04:11'),
(10,'account_change_status','admin','2022-03-10 14:04:11','2022-03-10 14:04:11'),
(11,'account_status_suspend','admin','2022-03-10 14:04:11','2022-03-10 14:04:11'),
(12,'account_status_approve','admin','2022-03-10 14:04:11','2022-03-10 14:04:11'),
(13,'account_status_active','admin','2022-03-10 14:04:11','2022-03-10 14:04:11'),
(14,'account_associate_user','admin','2022-03-10 14:04:11','2022-03-10 14:04:11'),
(15,'account_access_crm','admin','2022-03-10 14:04:11','2022-03-10 14:04:11'),
(16,'user_list_view','admin','2022-03-10 14:04:11','2022-03-10 14:04:11'),
(17,'user_add','admin','2022-03-10 14:04:12','2022-03-10 14:04:12'),
(18,'user_view','admin','2022-03-10 14:04:12','2022-03-10 14:04:12'),
(19,'user_update','admin','2022-03-10 14:04:12','2022-03-10 14:04:12'),
(20,'user_delete','admin','2022-03-10 14:04:12','2022-03-10 14:04:12'),
(21,'gateway_list_view','admin','2022-03-10 14:04:12','2022-03-10 14:04:12'),
(22,'gateway_add','admin','2022-03-10 14:04:12','2022-03-10 14:04:12'),
(23,'gateway_view','admin','2022-03-10 14:04:12','2022-03-10 14:04:12'),
(24,'gateway_update','admin','2022-03-10 14:04:12','2022-03-10 14:04:12'),
(25,'gateway_change_status','admin','2022-03-10 14:04:12','2022-03-10 14:04:12'),
(26,'gateway_status_activate','admin','2022-03-10 14:04:12','2022-03-10 14:04:12'),
(27,'gateway_status_disable','admin','2022-03-10 14:04:12','2022-03-10 14:04:12'),
(28,'transaction_list_view','admin','2022-03-10 14:04:12','2022-03-10 14:04:12'),
(29,'transaction_view','admin','2022-03-10 14:04:12','2022-03-10 14:04:12'),
(30,'transaction_refund','admin','2022-03-10 14:04:12','2022-03-10 14:04:12'),
(31,'dispute_list_view','admin','2022-03-10 14:04:12','2022-03-10 14:04:12'),
(32,'dispute_view','admin','2022-03-10 14:04:12','2022-03-10 14:04:12'),
(33,'dispute_init','admin','2022-03-10 14:04:12','2022-03-10 14:04:12'),
(34,'dispute_respond','admin','2022-03-10 14:04:12','2022-03-10 14:04:12'),
(35,'refund_list_view','admin','2022-03-10 14:04:12','2022-03-10 14:04:12'),
(36,'audit_list_view','admin','2022-03-10 14:04:12','2022-03-10 14:04:12'),
(37,'staff_list_view','admin','2022-03-10 14:04:12','2022-03-10 14:04:12'),
(38,'staff_add','admin','2022-03-10 14:04:12','2022-03-10 14:04:12'),
(39,'staff_view','admin','2022-03-10 14:04:12','2022-03-10 14:04:12'),
(40,'staff_update','admin','2022-03-10 14:04:12','2022-03-10 14:04:12'),
(41,'staff_delete','admin','2022-03-10 14:04:12','2022-03-10 14:04:12'),
(42,'staff_payment_list_view','admin','2022-03-10 14:04:12','2022-03-10 14:04:12'),
(43,'staff_link_to_hubspot','admin','2022-03-10 14:04:12','2022-03-10 14:04:12'),
(44,'security_view','admin','2022-03-10 14:04:12','2022-03-10 14:04:12'),
(45,'psp_list_view','admin','2022-03-10 14:04:14','2022-03-10 14:04:14'),
(46,'psp_view','admin','2022-03-10 14:04:14','2022-03-10 14:04:14'),
(47,'psp_update','admin','2022-03-10 14:04:14','2022-03-10 14:04:14'),
(48,'psp_change_active','admin','2022-03-10 14:04:14','2022-03-10 14:04:14'),
(49,'psp_edit_fees','admin','2022-03-10 14:04:14','2022-03-10 14:04:14'),
(50,'gateway_archive','admin','2022-03-10 14:04:15','2022-03-10 14:04:15'),
(51,'gateway_restore','admin','2022-03-10 14:04:15','2022-03-10 14:04:15'),
(52,'plugins_view','admin','2022-03-10 14:04:15','2022-03-10 14:04:15'),
(53,'system_view','admin','2022-03-10 14:04:15','2022-03-10 14:04:15'),
(55,'gateway_delete','admin','2022-03-10 14:04:16','2022-03-10 14:04:16'),
(56,'send_merchant_get_started_email','admin','2022-03-10 14:04:16','2022-03-10 14:04:16'),
(60,'industry_list_view','admin','2022-03-10 14:04:17','2022-03-10 14:04:17'),
(61,'industry_view','admin','2022-03-10 14:04:17','2022-03-10 14:04:17'),
(62,'industry_add','admin','2022-03-10 14:04:17','2022-03-10 14:04:17'),
(63,'industry_update','admin','2022-03-10 14:04:17','2022-03-10 14:04:17'),
(64,'industry_delete','admin','2022-03-10 14:04:17','2022-03-10 14:04:17'),
(65,'partner_list_view','admin','2022-03-10 14:04:17','2022-03-10 14:04:17'),
(66,'partner_view','admin','2022-03-10 14:04:17','2022-03-10 14:04:17'),
(67,'partner_add','admin','2022-03-10 14:04:17','2022-03-10 14:04:17'),
(68,'partner_update','admin','2022-03-10 14:04:17','2022-03-10 14:04:17'),
(69,'partner_delete','admin','2022-03-10 14:04:17','2022-03-10 14:04:17'),
(70,'account_partner_list_view','admin','2022-03-10 14:04:18','2022-03-10 14:04:18'),
(71,'account_actions_list_view','admin','2022-03-10 14:04:18','2022-03-10 14:04:18'),
(72,'account_actions_add','admin','2022-03-10 14:04:18','2022-03-10 14:04:18'),
(73,'account_actions_update','admin','2022-03-10 14:04:18','2022-03-10 14:04:18'),
(74,'account_actions_delete','admin','2022-03-10 14:04:18','2022-03-10 14:04:18'),
(75,'account_partner_accept','admin','2022-03-10 14:04:19','2022-03-10 14:04:19'),
(76,'account_list_view','partner','2022-03-10 14:04:19','2022-03-10 14:04:19'),
(77,'account_view','partner','2022-03-10 14:04:19','2022-03-10 14:04:19'),
(78,'user_list_view','partner','2022-03-10 14:04:19','2022-03-10 14:04:19'),
(79,'user_view','partner','2022-03-10 14:04:19','2022-03-10 14:04:19'),
(80,'user_add','partner','2022-03-10 14:04:19','2022-03-10 14:04:19'),
(81,'user_update','partner','2022-03-10 14:04:19','2022-03-10 14:04:19'),
(82,'user_delete','partner','2022-03-10 14:04:19','2022-03-10 14:04:19'),
(83,'account_actions_list_view','partner','2022-03-10 14:04:19','2022-03-10 14:04:19'),
(84,'account_actions_add','partner','2022-03-10 14:04:19','2022-03-10 14:04:19'),
(85,'account_actions_update','partner','2022-03-10 14:04:19','2022-03-10 14:04:19'),
(86,'account_actions_delete','partner','2022-03-10 14:04:19','2022-03-10 14:04:19'),
(87,'resend_user_activation_email','partner','2022-03-10 14:04:19','2022-03-10 14:04:19'),
(88,'send_user_password_reset','partner','2022-03-10 14:04:19','2022-03-10 14:04:19'),
(89,'partner_update','partner','2022-03-10 14:04:20','2022-03-10 14:04:20'),
(90,'asset_list_view','admin','2022-03-10 14:04:27','2022-03-10 14:04:27'),
(91,'asset_view','admin','2022-03-10 14:04:27','2022-03-10 14:04:27'),
(92,'asset_add','admin','2022-03-10 14:04:27','2022-03-10 14:04:27'),
(93,'asset_update','admin','2022-03-10 14:04:27','2022-03-10 14:04:27'),
(94,'asset_delete','admin','2022-03-10 14:04:27','2022-03-10 14:04:27'),
(95,'show_hide_documents_and_misc','admin','2022-03-10 14:04:28','2022-03-10 14:04:28'),
(96,'account_statement_list_view','admin','2022-03-10 14:04:28','2022-03-10 14:04:28'),
(97,'account_statement_markpaid','admin','2022-03-10 14:04:28','2022-03-10 14:04:28'),
(98,'account_banking_view','admin','2022-03-10 14:04:29','2022-03-10 14:04:29'),
(99,'account_banking_edit','admin','2022-03-10 14:04:29','2022-03-10 14:04:29'),
(100,'reports_view','admin','2022-03-10 14:04:29','2022-03-10 14:04:29'),
(101,'transaction_report_view','admin','2022-03-10 14:04:29','2022-03-10 14:04:29'),
(102,'resend_merchant_activation_email','admin','2022-03-10 14:04:29','2022-03-10 14:04:29'),
(103,'send_merchant_password_reset','admin','2022-03-10 14:04:29','2022-03-10 14:04:29'),
(104,'account_archive','admin','2022-03-10 14:04:29','2022-03-10 14:04:29'),
(105,'account_restore','admin','2022-03-10 14:04:29','2022-03-10 14:04:29');

/*Table structure for table `role_has_permissions` */

DROP TABLE IF EXISTS `role_has_permissions`;

CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `admin_role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `admin_role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `admin_role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `role_has_permissions` */

insert  into `role_has_permissions`(`permission_id`,`role_id`) values 
(1,1),
(2,1),
(3,1),
(4,1),
(5,1),
(6,1),
(7,1),
(8,1),
(9,1),
(10,1),
(11,1),
(12,1),
(13,1),
(14,1),
(15,1),
(16,1),
(17,1),
(18,1),
(19,1),
(20,1),
(21,1),
(22,1),
(23,1),
(24,1),
(25,1),
(26,1),
(27,1),
(28,1),
(29,1),
(30,1),
(31,1),
(32,1),
(33,1),
(34,1),
(35,1),
(36,1),
(37,1),
(38,1),
(39,1),
(40,1),
(41,1),
(42,1),
(43,1),
(44,1),
(45,1),
(46,1),
(47,1),
(48,1),
(49,1),
(50,1),
(51,1),
(52,1),
(53,1),
(55,1),
(56,1),
(60,1),
(61,1),
(62,1),
(63,1),
(64,1),
(65,1),
(66,1),
(67,1),
(68,1),
(69,1),
(70,1),
(71,1),
(72,1),
(73,1),
(74,1),
(75,1),
(90,1),
(91,1),
(92,1),
(93,1),
(94,1),
(95,1),
(96,1),
(97,1),
(98,1),
(99,1),
(100,1),
(101,1),
(102,1),
(103,1),
(104,1),
(105,1),
(1,2),
(3,2),
(9,2),
(97,4),
(98,4),
(99,4),
(100,4),
(101,4),
(1,5),
(2,5),
(3,5),
(4,5),
(9,5),
(10,5),
(14,5),
(16,5),
(18,5),
(21,5),
(22,5),
(23,5),
(24,5),
(96,5),
(1,9),
(2,9),
(3,9),
(5,9),
(21,9),
(23,9),
(24,9),
(71,9),
(72,9),
(73,9),
(74,9),
(76,11),
(77,11),
(78,11),
(79,11),
(80,11),
(81,11),
(82,11),
(83,11),
(84,11),
(85,11),
(86,11),
(87,11),
(88,11),
(89,11);

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`guard_name`,`created_at`,`updated_at`) values 
(1,'Admin','admin','2022-03-10 14:04:12','2022-03-10 14:04:12'),
(2,'Sales','admin','2022-03-10 14:04:12','2022-03-10 14:04:12'),
(3,'Marketing','admin','2022-03-10 14:04:12','2022-03-10 14:04:12'),
(4,'Finance','admin','2022-03-10 14:04:12','2022-03-10 14:04:12'),
(5,'Execs','admin','2022-03-10 14:04:12','2022-03-10 14:04:12'),
(6,'Owner','merchant','2022-03-10 14:04:12','2022-03-10 14:04:12'),
(7,'Basic','merchant','2022-03-10 14:04:12','2022-03-10 14:04:12'),
(8,'Reseller','reseller','2022-03-10 14:04:12','2022-03-10 14:04:12'),
(9,'Agent','admin','2022-03-10 14:04:15','2022-03-10 14:04:15'),
(10,'Sync API','admin','2022-03-10 14:04:16','2022-03-10 14:04:16'),
(11,'Partner','partner','2022-03-10 14:04:19','2022-03-10 14:04:19');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(320) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hubspot_owner_id` int(11) DEFAULT NULL,
  `referer` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_referer_unique` (`referer`),
  UNIQUE KEY `admin_users_api_token_unique` (`api_token`),
  KEY `admin_users_referer_index` (`referer`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`first_name`,`last_name`,`username`,`email`,`password`,`hubspot_owner_id`,`referer`,`remember_token`,`created_at`,`updated_at`,`deleted_at`,`last_login`,`api_token`) values 
(1,'Daniel','Rodwell','daniel','dan@cannpay.co','$2y$10$YAMapMUOm39KG67i86g7GOqrFVpM/1ST4zixQ5dwnHyvClo4rPioa',NULL,'USR-17a7-y0vt2','ZgVpv99nyD','2022-03-10 14:04:13','2022-03-10 14:04:13',NULL,NULL,NULL),
(2,'Adrian','Lynch','adrian','adrian@cannpay.co','$2y$10$iHd3DDtdZoRnxBR8.PbZEuFsUcUZItoUFpa9.GB3zM8uMLgJT1amK',NULL,'USR-n17w-c5t21','lIRimQdjvG','2022-03-10 14:04:13','2022-03-10 14:04:13',NULL,NULL,NULL),
(3,'Claudiu','Talmaciu','claudiu','claudiu.talmaciu@paywithclear.com','$2y$10$zR4u9KqAXIGyMplBkkAUyeW1AIQ3lJk8cXS8ZTiqgbNwAIjTalXLK',NULL,'USR-3g6r-55ed3','iseaKqwzOB','2022-03-10 14:04:13','2022-03-10 14:04:13',NULL,NULL,NULL),
(4,'Jasper','Dirsha','jasper','jasper@yopmail.com','$2y$10$O6A/7mRN7DuANo194HzoTegkpUKNIpUQMBJLZVkghyZyICoTwx14S',NULL,'USR-7u25-gv299','6gTdEoCtBx','2022-03-10 14:04:13','2022-03-10 14:04:13',NULL,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
