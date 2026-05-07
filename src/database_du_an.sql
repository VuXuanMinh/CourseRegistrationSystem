-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: course_registration_system
-- ------------------------------------------------------
-- Server version	9.5.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '638f2f53-c3ba-11f0-81eb-40c2ba25455a:1-699';

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ACTIVE',
  `last_login` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `student_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `idx_username` (`username`),
  KEY `idx_role` (`role`),
  KEY `idx_account_status` (`account_status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'sinhvien01','$2a$10$T/YceuXBbnT1zuoztMBQi.OEgA2ZSBOizHGyaIiYXG8/Nf1jrApji','STUDENT','ACTIVE',NULL,'2026-05-06 21:18:04','2026-05-06 21:24:41',NULL),(2,'canbo01','$2a$10$T/YceuXBbnT1zuoztMBQi.OEgA2ZSBOizHGyaIiYXG8/Nf1jrApji','STAFF','ACTIVE',NULL,'2026-05-06 21:18:04','2026-05-06 21:24:41',NULL),(3,'2024001','123456','STUDENT','ACTIVE',NULL,'2026-05-07 20:18:23',NULL,1);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activity_logs`
--

DROP TABLE IF EXISTS `activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `user_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `detail_data` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_user_type` (`user_type`),
  KEY `idx_action` (`action`),
  KEY `idx_action_time` (`action_time`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_logs`
--

LOCK TABLES `activity_logs` WRITE;
/*!40000 ALTER TABLE `activity_logs` DISABLE KEYS */;
INSERT INTO `activity_logs` VALUES (1,2,'STAFF','LOGIN','2026-05-07 22:39:34','Người dùng [canbo01] đã đăng nhập thành công.','0:0:0:0:0:0:0:1'),(2,2,'STAFF','LOGIN','2026-05-07 22:46:26','Người dùng [canbo01] đã đăng nhập thành công.','0:0:0:0:0:0:0:1'),(3,2,'STAFF','LOGIN','2026-05-07 22:50:35','Người dùng [canbo01] đã đăng nhập thành công.','0:0:0:0:0:0:0:1'),(4,2,'STAFF','LOGIN','2026-05-07 22:55:12','Người dùng [canbo01] đã đăng nhập thành công.','0:0:0:0:0:0:0:1');
/*!40000 ALTER TABLE `activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class_sections`
--

DROP TABLE IF EXISTS `class_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class_sections` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `section_code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_id` bigint unsigned NOT NULL,
  `lecturer_id` bigint unsigned NOT NULL,
  `semester_id` bigint unsigned NOT NULL,
  `section_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `max_capacity` int unsigned NOT NULL,
  `current_capacity` int unsigned NOT NULL DEFAULT '0',
  `registration_status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `schedule_info` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `classroom` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `registration_plan_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `section_code` (`section_code`),
  KEY `idx_section_code` (`section_code`),
  KEY `idx_course_id` (`course_id`),
  KEY `idx_lecturer_id` (`lecturer_id`),
  KEY `idx_semester_id` (`semester_id`),
  KEY `idx_registration_status` (`registration_status`),
  KEY `idx_section_type` (`section_type`),
  KEY `fk_class_section_plan` (`registration_plan_id`),
  CONSTRAINT `fk_class_section_plan` FOREIGN KEY (`registration_plan_id`) REFERENCES `registration_plans` (`id`),
  CONSTRAINT `fk_section_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_section_lecturer` FOREIGN KEY (`lecturer_id`) REFERENCES `lecturers` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_section_semester` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class_sections`
--

LOCK TABLES `class_sections` WRITE;
/*!40000 ALTER TABLE `class_sections` DISABLE KEYS */;
INSERT INTO `class_sections` VALUES (1,'LHP2025_01',1,2,1,'Lý thuyết',40,0,'PENDING',NULL,NULL,'2026-05-07 19:06:47',NULL,1),(3,'LHP2025_02',1,2,1,'Thực hành',40,0,'PENDING',NULL,NULL,'2026-05-07 19:12:55',NULL,1);
/*!40000 ALTER TABLE `class_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_offering_plans`
--

DROP TABLE IF EXISTS `course_offering_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_offering_plans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `plan_code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester_id` bigint unsigned NOT NULL,
  `course_id` bigint unsigned NOT NULL,
  `expected_sections` int unsigned NOT NULL,
  `expected_students` int unsigned NOT NULL,
  `approval_status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDING',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plan_code` (`plan_code`),
  KEY `idx_plan_code` (`plan_code`),
  KEY `idx_semester_id` (`semester_id`),
  KEY `idx_course_id` (`course_id`),
  KEY `idx_approval_status` (`approval_status`),
  CONSTRAINT `fk_cop_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_cop_semester` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_offering_plans`
--

LOCK TABLES `course_offering_plans` WRITE;
/*!40000 ALTER TABLE `course_offering_plans` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_offering_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `course_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `credits` tinyint unsigned NOT NULL,
  `course_type` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `course_status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ACTIVE',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `course_code` (`course_code`),
  KEY `idx_course_code` (`course_code`),
  KEY `idx_course_name` (`course_name`),
  KEY `idx_course_type` (`course_type`),
  KEY `idx_course_status` (`course_status`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'IT101','Lập trình Java',3,'Bắt buộc','ACTIVE','2026-05-07 11:21:05','2026-05-07 11:21:05'),(2,'IT102','Cấu trúc dữ liệu',4,'Bắt buộc','ACTIVE','2026-05-07 11:21:05','2026-05-07 11:21:05'),(3,'IT103','Cơ sở dữ liệu',3,'Bắt buộc','ACTIVE','2026-05-07 11:21:05','2026-05-07 11:21:05'),(4,'IT104','Kỹ Thuật Phần Mềm',2,'Bắt buộc','ACTIVE','2026-05-07 16:33:30',NULL),(5,'IT105','Lập trình C',3,'Bắt buộc','ACTIVE','2026-05-07 16:45:23',NULL);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curriculum_courses`
--

DROP TABLE IF EXISTS `curriculum_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curriculum_courses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `curriculum_id` bigint unsigned NOT NULL,
  `course_id` bigint unsigned NOT NULL,
  `is_mandatory` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_curriculum_course` (`curriculum_id`,`course_id`),
  KEY `idx_curriculum_id` (`curriculum_id`),
  KEY `idx_course_id` (`course_id`),
  CONSTRAINT `fk_cc_course_main` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_cc_curriculum_main` FOREIGN KEY (`curriculum_id`) REFERENCES `curriculums` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curriculum_courses`
--

LOCK TABLES `curriculum_courses` WRITE;
/*!40000 ALTER TABLE `curriculum_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `curriculum_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curriculums`
--

DROP TABLE IF EXISTS `curriculums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curriculums` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `curriculum_code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `curriculum_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `major_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applicable_cohort` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_credits` smallint unsigned NOT NULL,
  `curriculum_status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ACTIVE',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `faculty_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `curriculum_code` (`curriculum_code`),
  KEY `idx_curriculum_code` (`curriculum_code`),
  KEY `idx_major_name` (`major_name`),
  KEY `idx_applicable_cohort` (`applicable_cohort`),
  KEY `idx_curriculum_status` (`curriculum_status`),
  KEY `fk_curriculum_faculty` (`faculty_id`),
  CONSTRAINT `fk_curriculum_faculty` FOREIGN KEY (`faculty_id`) REFERENCES `faculties` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curriculums`
--

LOCK TABLES `curriculums` WRITE;
/*!40000 ALTER TABLE `curriculums` DISABLE KEYS */;
INSERT INTO `curriculums` VALUES (1,'K18_CNTT','Kỹ sư CNTT Khóa 18','Kỹ thuật Phần mềm','K18',126,'ACTIVE','2026-05-07 08:56:15','2026-05-07 09:37:14',1),(2,'K19_CNTT','Kỹ sư CNTT Khóa 19','Kỹ thuật Phần mềm','K19',120,'ACTIVE','2026-05-07 09:44:02',NULL,1);
/*!40000 ALTER TABLE `curriculums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculties`
--

DROP TABLE IF EXISTS `faculties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faculties` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `faculty_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faculty_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `faculty_code` (`faculty_code`),
  KEY `idx_faculty_code` (`faculty_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculties`
--

LOCK TABLES `faculties` WRITE;
/*!40000 ALTER TABLE `faculties` DISABLE KEYS */;
INSERT INTO `faculties` VALUES (1,'CNTT','Công nghệ Thông tin','2026-05-07 08:56:15','2026-05-07 08:56:15'),(2,'KHMT','Khoa học máy tính','2026-05-07 14:57:11',NULL),(3,'An Toàn Thông Tin','ATTT','2026-05-07 20:55:57',NULL);
/*!40000 ALTER TABLE `faculties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturers`
--

DROP TABLE IF EXISTS `lecturers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecturers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lecturer_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `academic_degree` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `teaching_status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ACTIVE',
  `faculty_id` bigint unsigned DEFAULT NULL,
  `institutional_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lecturer_code` (`lecturer_code`),
  UNIQUE KEY `institutional_email` (`institutional_email`),
  KEY `idx_lecturer_code` (`lecturer_code`),
  KEY `idx_full_name` (`full_name`),
  KEY `idx_faculty_id` (`faculty_id`),
  KEY `idx_teaching_status` (`teaching_status`),
  KEY `idx_institutional_email` (`institutional_email`),
  CONSTRAINT `fk_lecturer_faculty` FOREIGN KEY (`faculty_id`) REFERENCES `faculties` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturers`
--

LOCK TABLES `lecturers` WRITE;
/*!40000 ALTER TABLE `lecturers` DISABLE KEYS */;
INSERT INTO `lecturers` VALUES (2,'GV001','Vũ Xuân Minh','Tiến Sĩ','ACTIVE',1,'vuxuanminh78@gmail.com','0965047395','2026-05-07 17:52:11',NULL);
/*!40000 ALTER TABLE `lecturers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prerequisite_courses`
--

DROP TABLE IF EXISTS `prerequisite_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prerequisite_courses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `course_id` bigint unsigned NOT NULL,
  `prerequisite_course_id` bigint unsigned NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_prereq_course` (`course_id`,`prerequisite_course_id`),
  KEY `idx_course_id` (`course_id`),
  KEY `idx_prerequisite_course_id` (`prerequisite_course_id`),
  CONSTRAINT `fk_prereq_condition_course` FOREIGN KEY (`prerequisite_course_id`) REFERENCES `courses` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_prereq_main_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prerequisite_courses`
--

LOCK TABLES `prerequisite_courses` WRITE;
/*!40000 ALTER TABLE `prerequisite_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `prerequisite_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_plan_courses`
--

DROP TABLE IF EXISTS `registration_plan_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration_plan_courses` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `plan_id` bigint unsigned NOT NULL,
  `course_id` bigint unsigned NOT NULL,
  `is_mandatory` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_plan_course` (`plan_id`,`course_id`),
  KEY `idx_plan_id` (`plan_id`),
  KEY `idx_course_id` (`course_id`),
  CONSTRAINT `fk_rpc_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_rpc_plan` FOREIGN KEY (`plan_id`) REFERENCES `registration_plans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_plan_courses`
--

LOCK TABLES `registration_plan_courses` WRITE;
/*!40000 ALTER TABLE `registration_plan_courses` DISABLE KEYS */;
/*!40000 ALTER TABLE `registration_plan_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration_plans`
--

DROP TABLE IF EXISTS `registration_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration_plans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `plan_code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `plan_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target_cohort` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester_id` bigint unsigned NOT NULL,
  `curriculum_id` bigint unsigned NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `plan_status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plan_code` (`plan_code`),
  KEY `idx_plan_code` (`plan_code`),
  KEY `idx_target_cohort` (`target_cohort`),
  KEY `idx_semester_id` (`semester_id`),
  KEY `idx_curriculum_id` (`curriculum_id`),
  KEY `idx_plan_status` (`plan_status`),
  KEY `idx_start_time` (`start_time`),
  KEY `idx_end_time` (`end_time`),
  CONSTRAINT `fk_plan_curriculum` FOREIGN KEY (`curriculum_id`) REFERENCES `curriculums` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_plan_semester` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration_plans`
--

LOCK TABLES `registration_plans` WRITE;
/*!40000 ALTER TABLE `registration_plans` DISABLE KEYS */;
INSERT INTO `registration_plans` VALUES (1,'REG_2025','Đăng ký HK1','K18',1,1,'2025-07-11 06:13:00','2026-03-11 06:13:00','INACTIVE','2026-05-07 17:03:48',NULL);
/*!40000 ALTER TABLE `registration_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registrations`
--

DROP TABLE IF EXISTS `registrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registrations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `student_id` bigint unsigned NOT NULL,
  `section_id` bigint unsigned NOT NULL,
  `registered_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `registration_status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'REGISTERED',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_student_section` (`student_id`,`section_id`),
  KEY `idx_student_id` (`student_id`),
  KEY `idx_section_id` (`section_id`),
  KEY `idx_registration_status` (`registration_status`),
  KEY `idx_registered_at` (`registered_at`),
  CONSTRAINT `fk_reg_section` FOREIGN KEY (`section_id`) REFERENCES `class_sections` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_reg_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registrations`
--

LOCK TABLES `registrations` WRITE;
/*!40000 ALTER TABLE `registrations` DISABLE KEYS */;
INSERT INTO `registrations` VALUES (1,1,1,'2026-05-08 05:46:11','SUCCESS','2026-05-08 05:46:11','2026-05-08 05:46:11');
/*!40000 ALTER TABLE `registrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semesters`
--

DROP TABLE IF EXISTS `semesters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `semesters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `semester_code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `academic_year` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `semester_status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'UPCOMING',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `semester_code` (`semester_code`),
  KEY `idx_semester_code` (`semester_code`),
  KEY `idx_academic_year` (`academic_year`),
  KEY `idx_start_date` (`start_date`),
  KEY `idx_end_date` (`end_date`),
  KEY `idx_semester_status` (`semester_status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semesters`
--

LOCK TABLES `semesters` WRITE;
/*!40000 ALTER TABLE `semesters` DISABLE KEYS */;
INSERT INTO `semesters` VALUES (1,'HK1-2526','Học kỳ 1','2025-2026','2025-11-07','2026-03-07','UPCOMING','2026-05-07 16:52:16',NULL);
/*!40000 ALTER TABLE `semesters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `student_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cohort` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `faculty_id` bigint unsigned DEFAULT NULL,
  `academic_status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ACTIVE',
  `curriculum_id` bigint unsigned NOT NULL,
  `account_id` bigint unsigned DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_code` (`student_code`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `account_id` (`account_id`),
  KEY `idx_student_code` (`student_code`),
  KEY `idx_email` (`email`),
  KEY `idx_faculty_id` (`faculty_id`),
  KEY `idx_curriculum_id` (`curriculum_id`),
  KEY `idx_account_id` (`account_id`),
  KEY `idx_cohort` (`cohort`),
  KEY `idx_academic_status` (`academic_status`),
  CONSTRAINT `fk_student_account` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_student_curriculum` FOREIGN KEY (`curriculum_id`) REFERENCES `curriculums` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_student_faculty` FOREIGN KEY (`faculty_id`) REFERENCES `faculties` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'SV2024001','Trần Lập Trình','012345678','tranlaptrinh@edu.vn','K18','CNTT1',1,'ACTIVE',1,NULL,'2026-05-07 08:56:15','2026-05-07 15:07:04');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_staffs`
--

DROP TABLE IF EXISTS `training_staffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `training_staffs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `staff_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `account_id` bigint unsigned NOT NULL,
  `position` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `working_status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ACTIVE',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `staff_code` (`staff_code`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `account_id` (`account_id`),
  KEY `idx_staff_code` (`staff_code`),
  KEY `idx_email` (`email`),
  KEY `idx_account_id` (`account_id`),
  KEY `idx_position` (`position`),
  KEY `idx_working_status` (`working_status`),
  CONSTRAINT `fk_staff_account` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_staffs`
--

LOCK TABLES `training_staffs` WRITE;
/*!40000 ALTER TABLE `training_staffs` DISABLE KEYS */;
/*!40000 ALTER TABLE `training_staffs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tuition_invoices`
--

DROP TABLE IF EXISTS `tuition_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tuition_invoices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_code` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `student_id` bigint unsigned NOT NULL,
  `semester_id` bigint unsigned NOT NULL,
  `total_credits` smallint unsigned NOT NULL,
  `total_amount` decimal(12,2) NOT NULL,
  `payment_status` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'UNPAID',
  `due_date` datetime NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `invoice_code` (`invoice_code`),
  KEY `idx_invoice_code` (`invoice_code`),
  KEY `idx_student_id` (`student_id`),
  KEY `idx_semester_id` (`semester_id`),
  KEY `idx_payment_status` (`payment_status`),
  KEY `idx_due_date` (`due_date`),
  CONSTRAINT `fk_invoice_semester` FOREIGN KEY (`semester_id`) REFERENCES `semesters` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_invoice_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tuition_invoices`
--

LOCK TABLES `tuition_invoices` WRITE;
/*!40000 ALTER TABLE `tuition_invoices` DISABLE KEYS */;
INSERT INTO `tuition_invoices` VALUES (1,'HD_202601',1,1,24,15000000.00,'PAID','2025-05-24 07:03:00','2026-05-07 19:52:25','2026-05-07 19:52:36');
/*!40000 ALTER TABLE `tuition_invoices` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-08  6:02:52
