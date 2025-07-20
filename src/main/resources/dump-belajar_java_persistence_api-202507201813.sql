-- MySQL dump 10.13  Distrib 9.2.0, for Win64 (x86_64)
--
-- Host: localhost    Database: belajar_java_persistence_api
-- ------------------------------------------------------
-- Server version	9.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES ('001','Honda','Honda semakin didepan');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Gadget','Mobile Gadget',NULL,NULL),(2,'Food','Tasty Delicious Food','2025-07-14 03:01:23','2025-07-14 03:06:03'),(3,'Travel','Travel to your destination',NULL,'2025-07-17 04:19:10');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credentials`
--

DROP TABLE IF EXISTS `credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credentials` (
  `id` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credentials`
--

LOCK TABLES `credentials` WRITE;
/*!40000 ALTER TABLE `credentials` DISABLE KEYS */;
INSERT INTO `credentials` VALUES ('001','khannedy@email.com','1234');
/*!40000 ALTER TABLE `credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `primary_email` varchar(150) DEFAULT NULL,
  `married` tinyint(1) DEFAULT NULL,
  `age` tinyint DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('1','Eko Kurnia','test-1-aBej3@example.com',NULL,NULL,NULL),('2','Budi','bHk0j@example.com',NULL,NULL,NULL),('3','Yono','yono2196@example.com',1,20,NULL),('4','Steven','steven_1123@example.com',0,34,'PREMIUM');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `company_id` varchar(100) NOT NULL,
  `department_id` varchar(100) NOT NULL,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`company_id`,`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES ('pzn','tech','Resources');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `id` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `total_manager` int DEFAULT NULL,
  `total_employee` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES ('budianto','MANAGER','Budianto',NULL,10),('joko','VP','Joko',5,NULL),('khannedy','EMPLOYEE','Khannedy',NULL,NULL);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hobbies`
--

DROP TABLE IF EXISTS `hobbies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hobbies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_members_hobbies` (`member_id`),
  CONSTRAINT `hobbies_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hobbies`
--

LOCK TABLES `hobbies` WRITE;
/*!40000 ALTER TABLE `hobbies` DISABLE KEYS */;
INSERT INTO `hobbies` VALUES (1,3,'Coding'),(2,3,'Eating'),(4,2,'Traveling'),(5,2,'Cooking'),(6,1,'Reading');
/*!40000 ALTER TABLE `hobbies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `image` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (1,'Contoh Image','Contoh Deskripsi Image',_binary '�PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0U\0\0\0i\0\0\0KMo�\0\0\0sRGB\0�\�\�\0\0\0gAMA\0\0���a\0\0\0	pHYs\0\0t\0\0t\�fx\0\0�IDATx^\�]k�\�U^3sι\�ھ~�N��N;u��\�T���BkA!�PS�A��Ui���(X \� T���44�8iU!Q�D�*U�;�ش�c��\�kf���\���\�\�9\�9\�^_\�_\�:{\��\��\�~\�\�9N�{\�=�L�\r\�CVAP\���º���\��\�\�\�\����\�%MӾ�^\�T�n\\W�y�/\�\�F5�תaؿ}k=\�-!�}��\��\�ݵn������\r�!n*R\�	ed�p\�S\�\0��T7�ƕA(\�n_�\�\rOEDɍ5u\r�#\�m#�\�֮�\�\�u\�\�5\�˶{P�\�^\�����\�����g��\�E�U���\�T*�\�jdt@\�\�$��WYn0\�\�G���aǊ\�Awde\�<u$R��\�P\"\�+r\�\��v\Z�\�\�\�.�v\�k?�%Hdq)����*O|�*o�5~ǋ\�\�%M߲($uԋ\�Τ\�\�Ϭ\�\��5n\�ߩ#�9�Ȝ�xy��\�D\���?���\�\�#\��\�\�Z�\�0�5uϮTn�l\0�za\�!\nzz�\�C�\�ٜ#�\�{\�A��y�!�v[cI�LG\�zK�\"5B\�\�Nu@	\"Q�#L\�J>\�$^\�mup\�\�f�.\'�|�)[���\��\'1X+$�4��\nK�i2;D�L\�M}\�艚\�4�@\"�Sfc�_�\�X~��ma�͈\�퇵\�\�Q�ȑ��|\�\�ٳ=���\�@��w��\�\Z�\�ttK��/5y\�\�9�v�N3���:��.�Ơ{Y2�m�D.\\\n\�\�B�_�\�\�H�A곏\�e\����E�\�\���I7\�H�\�\�U��Q�^ǩ��=+Ӊs`Y�\�eӥ���5\� ��\�\�_\�\�W�F\�&��r����\�]S\���He�I\�\ZyF\�û�[\�(�P�d&�?[\��D�M�B�B\�y�\�\�\��e�y�+\�^xg\�X~\�Ѫ|\�u���\�HU�Tx\�\�\�`�o[����\��Έ1i�`\Z�d�\�5�aV\�\�u�\�B%� Y�U\�\�(Fw\�2�43�6]�&mi��WI�\�\�_\��o��(�{\��A	\��:,�\�5^[l�\�;�uR�>�\�p�:\�;\�\�\�g�݂�\�\�\�\�K \�Gj\�t�_#P�O�-\nP�i\�ԞJ\������|\�H���s�\�0�s�\Z`\�Zn�\�8cS+tM�&\�6\�j5��0�M�p�6e\�Yh\�S�C�LP��\�m?\'2�\�^\�\\\�!\�3�k\r�\n��O�ˣ{�\�\�a2G*\r�bH�h\�@m\r�\�\�P�\�z\\��\�5�^�Ze��;%�$�F\�\�\��N\�0���:�\�慚\�\�-r\�\�05�\�C\�\�,\�|{��\�u)k\�_>L��OlZ6ؓb�@C��\\s$\�nv5�qv¨���\�z����H�$kw<�q֊q�#1�t�\\�:.�.\�c�\�\�r娰\���mkh��ܝ\\\n)a��z�\nΖ\� \�nE\����or�I��JG<dQ\�\�\�2\�\�����h\�h4di%���OJZ\�m2\0ZƉ�����I�`���p���R�#V��\�nTTJ�ӆ�֛��!�\�\�\�ruT��\�\�l1\�\�4\�ٺm���]X\�h��s]j\�l�\�\�*,4�R�u\�\�ƭ\�5U\�0҉z6��&dyF��2���\�.F�&e���c\�N#;ma��p!k��\�)�i�1C\�P\�-��U:\�^��m^\�@��T6\�(�iZm;�ZȠF��\�yL\�\�jպ\�񷱖\�oЙhU��h�\"l�c\�.�c��E� c*u\�8L \�ը0��hc\�\�\n�3i��y�e+4۴Nɷ�u��~\�\�0���8^�ӧ?\'��|�\�͟\�|\n�:���1\���V�HB\�\�2��\�\�\��.\��D���\�n���\�\n?�\n��F+\�h�\�:@զ� !�\�w\�\�?a�< ��\�כsfM\�\��e9��\���3l�nC�c-� Na�C��D\r\�0\��#�k\'\�(�}�\��@E�x胢%�%:<iL\r���%3�\�A\�Q\�9#��Qt�D�[tg�4-\�I݊\����\�\�\�hڐy�M\�kBoI�	i྾C�@o�\�@Y\�\Z\�Z�N�\�c�q\�8	k\�\\5��&M\�){:�\�͍���,�f*\�bm4��\�U\�1\�*\�ӷ\�\�$\�&ss�d~~2/\�s�W\�.#\\)[;i\�6���,�\r��,,\�M�`\�+s\r�[`��/\�!�V,+u�MW�\�\�C\�\r%ow�C�\��ͨ-m0\��\"�cܶ?��jȻ\��	\��2H���d2��a��\���xk\�/Iu\�!�1\�\�ۂ�^�rZ�/}E\�=$[�f���jy\�O�xWa\�,�\���jcZ���4\'\���<��\�s\�\�5\nH��m�MT�V\�����\�5A�N%N7L�z�Ӯ��7�\n\�eņ\�za�\Z�7Y^^��ŋ�;8#w�\�a\�5EZW�m_�2g�5���`e��� .\�)��PV�C�c\�\0�\�N��%\�8\�\�?�>ܧ�wg&�\"awN�#�Q�0�/y\�\�F\�V�\�+\�N��N�\n6\�9�\�\�Jڼ�����!��\�e6~U\�U^�\�S\� -i\�\"ؠþ\�}�\�ǐ<l\�9�,�ݻnK[��\�zZiW\�U�x\�\�T�\�O\�\�?�DUL\�lZ9\�Ż���@�ӎ�ыbH6-M�U���\�\�:\���\�N˓_�?\�W�\�luȦ\�\�\0<�a\�{�/yխ�\�\�H`�5�1��\rU\�B�\�BB���_�\��\�)[\�ӆW?\�l �\�^��\�\��\�P�\�5��\��\n�3Rú�S�\r\�C\���z�ә\�|V\�8��\�\�{�\�\�\�\�\��zW>g\�\�~O)BȃYk\�T0-¢ʜ�	\�φy\�eq\�Fݦ��P��z�K\�\��� �7y6_\n\�2\�u\�\�-�}*F\�\�\�\�!�j/\��1�\�p-��R�d\�f\�Y[�\'{�4\�\�\���\�B�-�\�\�-ӝX[6H	qg\�Λy�\�\�\�6�\�\�\�`\�I\�\�l\Zy��\�\�\�z�\�/M\�\�l]\�C�YkWa�v�#\�t\'���%��\�\��\\Nc��wi_V�^\�c�װ��\�ǫ��\��H扔b(]y\�bӲ�2�\�\�q�n�-\�\�\�\���jeTtMg�\�\"��q4<��SL\�:�v\�cmY9\�.C�\��,\�<\�^~�;)�{\��5�°�͉\�Ao4�@O��*�l�%SO��,\�K�oU9\'.�\�=[�w��\�\�\�x\�y�+;�\�ժ\�T,z,\Zλ���k,C�P�\�\�lٞ�|a>�7#\�I̧Q\�\��2�gO�S�Iŭ&\�\�]�ݴzI!���%\�\������l�Z\�:\�d�}�͆�\�/�\�~\�k�\"\�$�?w(���*�\�:4X\0di\�P\�\�\�]�r�lG�<\�\�\�+�y�g\�ĳz+\�\'8T�\�왰}\�\��\�L���x�+\�T\�\'����#�;�Wu\�\�\�\�2\�\�NA\Zg��g\��\�|�\r��<�\�]܈��)�0OA�y0\Zڭ�\�Mޯ�\��z�\�!�oC\�J���\�\'V�8�\�g��</�\�\Z6/\�\�͎4n\�\�BĮ>N�\"a\�\�]�tt\\�ܒ7�\�_ׯv76\�H^wB��\�ڴ�v�\�\�O�W�k9�\�4-omYykwyU����|_\�\��\�\�\� ^��\�\�\�F�(Q�\�8�4��!q\�`*�}B\�\���7u�2�K4k\� *4�\�>�\�.��\�\0d_j@\��A��\Z\�ik\r\0=\�)4��ڌn\�LZ\�\�{\�\�y:�\��-�/��wl\�\�3m���G+\�C�Q1;#r3�펾\�\��m�O\�\�Rl�V��\�-\��tu2\���};��M�C�QP_��TC|Kg�|�V�\�ƽ\�iC\�oE�^С\��>\�}A�ӿ�\��?\��JL!\��\�q�\�v��yn$\�]g\�\�a7\���ǔ(�R��EQ��\\\�p\�-\�;\�\�Bs�2߄\�`���\�\�xЧT�ajm&���RU�\�\�6�f\��w:z\�\�\r\�5���\�\�K6B�}0L�\�\�\�;7\�x?�\�)�\�y\�\�\�9�/ \��\�^��^��ca\�\�<\�a\�	=d�QtM_�\� I\�?��\0�\Z\�KY\�9��˧j\�zJs�\�\'�H\�\0!\r\�\�\������p\�\�\�?#�\�F\�N�;\�7�\�zɵ�\�\�]GS>\�#\�\\\n\�kF9R\�U0�\�^	\��{D\rG��+�M� \�\�\�;F]�0\���Q���k\�\�\�WL$fXɃ\�O\�\�\�)��\�{�Z.����w\��\n\Z�\�:��\�\�\���\\|\�\�\�\�jH\� \�=}��*5�\���}w\�\��8\��\�V;n(N\�q]�\�e\�Ҍ,\�Z\\�I|1b�s*Fa�s�\�Q\�r\�o<\�ߒ>~�\�\�\�E\��9\"�JƑG����\�ۋo@�!���J\�\�\'�\�>��sr\�3\�\��\�\�\Z�=u��/�\�|X�Oc]|\�c�%����\'\�8�\��\'��4\�\�}C^�\�)�m��	y\�\�/>/\��\\����c9\��9yܥ�Һ�\�Į��f>�%L��\�|q�2\�\�\���F\�\Ze���K�_��9��\�+��:�\�o��g\���\�|\�%����\'�\��\�^k�v�5\������\�zA�\�\'O\�\�r��J��R����(��^zJN�\�\�\�\0\�\�g��Vb\�\�k	 ո�S\�=>\��\Z/\��\�ZeFfj\�u�o�\�%\'���\�ȧ�\�Hp��y��\����\�U\�ڲ\�H\�kL\�H5,\�Ǒ\�����Q⻯\�Y9\"\�>d\� a\�o��	�\�\�\�y�F\�!\��\���¼�o�\�Y�d}\�N�\�\�\�\�X�\�8*�=���w���\�i\�A\�`�\�6%[�9:�\�\���~W&�0г��8\�$�F\�ŇNY�	q�l?\�q�DӺ�\�����5\�ï=%ߝƆO6Ӟ_���\�q�տ�]UW��\�\�z3\��\�];\�H+Y6������擟\'kX\�\�Cz�\�P����D��#��\�!O\� �^���!?\�&��6\�Ci\�\�T�\�\�D\����-\�\��\�=��ʾ�XR9��� ,\n;���\�Iu\�˧�\�����a\�ԇ�y\\\�\�C��w\�.����RmIR5�;o\�\n�\�;\��\�ڛP��\�%\��+���������N�\�vW\Z�X�@��WԂu!�\�r�1t\�r�֋T�9\��\0/\�O���/��(��QeX�\�αc���5�:\�K�-?\n���w�	���;��v�q>\�\�H�5q�\�7k�~\ZBo`�&#v��C�\�4\�%7`�_\'��mQr���(r$_\�\��q�*��n4\�\�(�v\�HehݬXO2�\�O_\�v\�a5\�\\\nz	\�}�\�B�Ȩ����70nz\��\�\�\�\��\r�o��QE�o.3\��~D�\�7,�~iÀ\�TǠt\�rԠ(�{:��T,��\0W��a1�?�\���˗��J\�u\�>G�_\�z;)\�]=���aˆ	�����dv\�\�E}\ZE�\�\��TC\�wE7\0\0\0\0IEND�B`�');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(150) NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'example-1@email.com','Mr.','Eko','Budiarty','Khannedy'),(2,'example-1@email.com','Mr.','Toha','Ahmad','Baihaqi'),(3,'b1n3m4@example.com','Mr.','Budi','Yono','Bakrie'),(4,'b1n3m4@example.com','Mr.','Budi','Yono','Bakrie');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` varchar(100) NOT NULL,
  `amount` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments_credit_card`
--

DROP TABLE IF EXISTS `payments_credit_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments_credit_card` (
  `id` varchar(100) NOT NULL,
  `masked_card` varchar(100) NOT NULL,
  `bank` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `payments_credit_card_ibfk_1` FOREIGN KEY (`id`) REFERENCES `payments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments_credit_card`
--

LOCK TABLES `payments_credit_card` WRITE;
/*!40000 ALTER TABLE `payments_credit_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments_credit_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments_gopay`
--

DROP TABLE IF EXISTS `payments_gopay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments_gopay` (
  `id` varchar(100) NOT NULL,
  `gopay_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `payments_gopay_ibfk_1` FOREIGN KEY (`id`) REFERENCES `payments` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments_gopay`
--

LOCK TABLES `payments_gopay` WRITE;
/*!40000 ALTER TABLE `payments_gopay` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments_gopay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` varchar(100) NOT NULL,
  `brand_id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` bigint NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_brands_products` (`brand_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('001','001','Vario 160',18000000,'Vario 2025 160cc'),('002','001','Beat',16000000,'Beat 2025 120cc');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills` (
  `id` int NOT NULL AUTO_INCREMENT,
  `member_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `skills_unique` (`member_id`,`name`),
  CONSTRAINT `skills_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (1,4,'CSS',8),(2,4,'HTML',6),(3,4,'NextJs',9);
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` varchar(100) NOT NULL,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('001','Eko Khannedy');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_like_products`
--

DROP TABLE IF EXISTS `users_like_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_like_products` (
  `user_id` varchar(100) NOT NULL,
  `product_id` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`,`product_id`),
  KEY `fk_products_users_like_products` (`product_id`),
  CONSTRAINT `users_like_products_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `users_like_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_like_products`
--

LOCK TABLES `users_like_products` WRITE;
/*!40000 ALTER TABLE `users_like_products` DISABLE KEYS */;
INSERT INTO `users_like_products` VALUES ('001','001'),('001','002');
/*!40000 ALTER TABLE `users_like_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wallet`
--

DROP TABLE IF EXISTS `wallet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wallet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) NOT NULL,
  `balance` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users_wallets` (`user_id`),
  CONSTRAINT `wallet_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallet`
--

LOCK TABLES `wallet` WRITE;
/*!40000 ALTER TABLE `wallet` DISABLE KEYS */;
INSERT INTO `wallet` VALUES (1,'001',5000000);
/*!40000 ALTER TABLE `wallet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'belajar_java_persistence_api'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-20 18:13:58
