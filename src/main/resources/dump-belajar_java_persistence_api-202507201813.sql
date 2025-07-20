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
INSERT INTO `images` VALUES (1,'Contoh Image','Contoh Deskripsi Image',_binary 'âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0U\0\0\0i\0\0\0KMoå\0\0\0sRGB\0Æ\Œ\È\0\0\0gAMA\0\0±è¸a\0\0\0	pHYs\0\0t\0\0t\ﬁfx\0\0ñIDATx^\Ì]k¨\◊U^3sŒπ\˜⁄æ~•N¸¢N;uú¶\ TÉÑ¢BkA!ÑPS©Aë©Uiî†¸(X \— TÇ≠î44î8iU!Q§D≠*U≠;çÿ¥±c˚æ\œkf¯æµ\˜û≥\œ\‹9\œ9\˜^_\«_\Ó:{\Ìµ≥\˜∑\◊~\Ã\Ã9N∞{\ˆ=©L°\r\«CVAP\Ó˙ì¬∫∂Ç§\ıì\Î\◊\∆\–â¢Å\%M”æ≤^\ÿT§n\\W§yØ/\ÎÖ\‹F5é◊™aÿø}k=\√-!Æ}õä\‘¡\Ë›µnó´ˇ∫ö˛\r∑!n*R\È	edΩp\√S\◊\0õäT7Ω∆ïA(\Ún_Ü\≈\rOED…ç5u\rÄ#\’m#ü\Ó÷ÆÅ\Â\Íu\Ì\Í5\’À∂{P˘\–^\ˆ∫ú˛˘\Œª¶Ç´gêå\Ï©E£U´§≤\Ô¶T*õ\Êjdt@\Ì\Ì$ïãWYn0\Û\Í∫GÅª£a«ä\¬Awde\·<u$RãΩ\„P\"\Ò+r\Ï\÷ïv\Zç\Ò\ \Õ.êv\ k?ô%Hdq)êßˇΩ*O|≠*oæ5~«ã\⁄\Á%Mﬂ≤($u‘ã\ŒŒ§\Ú\≈œ¨\»\œã5n\⁄ﬂ©#Ü9å»ú˛xyúç\ÂíD\‰˘Ω?üë≥\Á\«#\÷ò\Ô\«Zì\È0ë5uœÆTnΩl\0©za\–!\nzzÑ\ÚCì\«Ÿú#Ö\»{\«Aëøy∞!˚v[cIêLG\ËzKî\"5B\È\Î®Nu@	\"Qå#L\‡©J>\Ëµ$^\„mup\Ê\Âf®.\'è|¢)[¶¸ú\√¡\'1X+$∏4•©\nKÜi2;DíL\‹M}\⁄Ëâö\Ã4ï@\"¶Sfc¶_¸\ÈX~ˇ£maëÕà\‡¶Ìáµ\€\…Qß»ëÉâ|\Â\—Ÿ≥=ï´Ä\Á@í¿wØ˙\‡\Zæ\”ttK∞ç/5y\Ú\Î9ˇvßN3ò°˚:Æ˝.ã∆†{Y2¯m¿D.\\\n\‰ï\◊Bô_∂\∆\»HáAÍ≥è\‘e\œêä©E¶\∆\„∫∑ªI7\˜H∞\»\ÏUÖ¥Qñ^«©Üö=+”âs`Yî\Èêe”•á±¸5\Õ ∑¿\Ï\◊_\Â\”WëF\À&çâr§†ßÇ\‘]S\Ï¯†HeªI\–\ZyF\‡√ªÇ[\€(ßPºd&ö?[\∆¡DçM≥BêB\◊yó\÷\‡\”¸e¥y≠+\“^xg\ÊX~\Î—™|\Áu¶èé\ÏHUöTx\Í\Õ\Ôî`ˇo[ñ∂îç\ˆ™Œà1iì`\Züd¡\ƒ5∞aV\÷\Êu∫\—B%ñ Y±U\„\√(Fw\–2ù43®6]§&miûˇWIó\Â\”_\Âôˇo´ô(©{\ﬁ˝A	\˜˝:,®\ 5^[l´\ˆ;õuR§>˚\Œpπ:\Ÿ;\œ\∆\·gª›Çá\Õ\À\Ï\ K \„Gj\◊t≠_#PπOª-\nP±i\‘‘ûJ\Ûüì§˛ñ|\ÊâHû˛¶sé\—0ës™\Z`\ÊZn∫\≈8cS+tM≥&\ﬁ6\÷j5ôÇ0¨Môp™6e\‚Yh\ÌSàC≤LPôï\Âm?\'2µ\◊^\«\\\Ÿ!\—3Øk\rö\n¡üO®À£{Å\⁄\ a2G*\rçbH£h\‘@m\rô\›\œPà\›z\\§∂\«5¡^õZe∂ò;%¡$£F\À\‚ì\·§N\0òöÅ:≠\ŒÊÖö\œ\≈-r\—\ﬁ05™\ÁC\⁄\Èå,\Ã|{ã©\◊u)k\÷_>L±˘OlZ6ÿìb˘@Câõ\\s$\—nv5äqv¬®ô®ù\ÊzæπÉÆHá$kw<¥q÷äqñ#1≠tã\\ù:.©.\Ãcà\˜\ÎrÂ®∞\ °Ñmkhùô‹ù\\\n)aêÜz¨\nŒñ\√ \ınE\ÌØÆ™oräI¢ÆJG<dQ\◊\ÿ\–2\Í\ı∫¨¨¨h\ÿh4di%ëã¡OJZ\›m2\0Z∆âß∫∫®§IÇ`º˛˚p§áêRç#VÇª\ÒÖnTTJâ”Üª÷õãÇ!ú\Ë\‘\ÍóruT¢ä\Ã\Ãl1\◊\Ù4\ÙŸ∫mõÑµ]X\ˆhó∑s]j\‡lù\–\›*,4®RΩu\û\≈∆≠\⁄5U\Û0“âz6´ö&dyF¸ˇ2∏∂è\Ï.Fë&e˚é≤c\«N#;maö©p!kßû\Ÿ)¥iä1C\ P\Í-å°U:\∆^íám^\”@´∏T6\‹(˙iZm;®Z»†F¨ì\ÌyL\Î\Àj’∫\”Ò∑±ñ\Êo–ôhUÖçh´\"l∑c\‹.õcñ≥Eˇ c*u\œ8L \Ê±’®0çÅhc\\·∑\n∫3i¥˘yîe+4€¥N…∑øuüº~\ˆ\Û0ôõ˙8^ñ”ß?\'Øº|ø\ÃÕü\÷|\nø:≠üÅ1\“úáV¢HB\‹\«2Æ¢\Ÿ\Û\ÌÆ.\Ã˚DêöÑ\ÌnÜÅ∂\ \n?≤\n®õF+\ÿhç\Á:@’¶© !¡\Ów\Ó\‹?aù< ˛¶\ﬁ◊õsfM\„\ı˙e9˛î\Ó¸¥3l´nC˙c-ì NaéCâ˘D\r\«0\ÿµ#ék\'\(æ}ò\¬Ä@EßxËÉ¢%Å%:<iL\rì±©%3¥\”A\‘Q\Ÿ9#ú™QtìDï[tgß4-\‹I›ä\Ùö¥ö\Ì\Ã\ﬁh⁄êyöM\‰kBoIΩ	i‡ææCá@o¿\÷@Y\⁄\Z\ÿZöN≤\Õc¿q\·8	k\Ë\\5Äó&M\À){:¨\ÿÕç™âˇ,°f*\‡®bm4˙°\¬U\Ë1\Ù*\‹”∑\–\Ò$\Ÿ&ssód~~2/\ÛsÑW\Á.#\\)[;i\Û6¥≤∞,ã\rôá,,\÷M∏`\¬+s\rô[`öµ/\’!êV,+u¥MWö\’\ŒC\·\r%ow§CÇ\€•Õ®-m0\…í\"ìc‹∂?ïßj»ª\ﬁ˝	\˜˝2HÇëñd2®Åaíä\—˘âxk\◊/Iu\€!µ1\Œ\È€Çá^ΩrZñ/}E\Ô=$[¶fêåûjy\ŒO∫xWa\ﬁ,è\’˝≤jcZ∑≠æ4\'\ﬂ¸æ<¸˘\Às\ﬂ\Í5\nH®ÜmÑMTûV\ÎÅº°â\∆5AÑN%N7L≠zù”ÆÖë7°\n\Ì™∑e≈Ü\ıza˘\Z≤7Y^^íï≈ã≤;8#w˝\ƒa\Ÿ5EZW∞m_µ2g§5èê≤`eª≠ó .\ƒ)ÅíPV†C∏c\“\0ë\ÃNï¥%\”8\Á\Ó?¸>‹ß¡wg&ç\"awN±#ÜQµ0£/y\–\‘F\€Vö\Óø+\“N™≠Në\n6\Í¥9¡\Ò\ÕJ⁄ºÑæüÉº!ï˙\˜e6~U\ˆU^ñ\›S\ƒ -i\·\"ÿ†√æ\¬}¡\”«ê<l\≈9∑,Ç›ªnK[∏≠\‚zZiW\ﬁU˘x\œ\ﬁT˛\·O\…\Ì?üDUL\”lZ9\…≈ª¶£®@Ω”éé—ãbH6-MæU˙†¯\»\Â:\◊˚£\«NÀì_˝?\ƒW£\◊lu»¶\⁄\Ê\0<®a\»{ß/y’≠≤\Û\ËØH`™5˘1¶¶\rU\ﬁBí\ÈBBÇ∂ã_Ç\‡ê\œ)[\¬”ÜW?\¬l Æ\œ^©Ø\Ó\Á®´\ÕP¶\€5Ωˇ\ı°\nΩ3R√∫§Sè\r\„®C\˜ß¢z¨”ô\∆|V\Ù8óã\˜\“{•\Â\”\Û\Ÿ\Î˚zW>g\„\Ï~O)B»ÉYk\›T0-¬¢ ú¨	\‰¢œÜy\ƒeq\ﬂF›¶©áP∑°zâK\Û\ÙÆ˙ ô7y6_\n\À2\Ùu\ﬂ\Êã-ß}*F\—\Ï\ı\≈!åj/\ıÆ1†\ıp-≤çRèd\„f\ƒY[ó\'{˘4\Ù\ƒ\˜û¢\ÙBõ-ã\Î\‰-”ùX[6H	qg\ÂŒõy°\”\ı\‰6∞\œ\Ù\`\◊I\€\ÿl\Zy∫¶\Â\»\Ëözû\ﬁ/M\Î\Ùl]\ıCôYkWaúvß#\Ãt\'¥°ù%∂˘\Ù\˜ˇ\\Ncêîwi_VÉ^\ cè◊∞Æ©\‹«´¸é\ˆµHÊâîb(]y\Úb”≤∂2ø\”\«qÆnÑ-\‹\≈\\Èî˛˘jeTtMgà\Û\"µ˚q4<ã≥SL\˜:Æv\÷cmY9\Í.Cß\€¡,\Ù<\Í^~µ;)≤{\ıò5≠¬∞ÇÕâ\ÀAo4∂@OµÑ*±lò%SO±∂,\ﬁKêoU9\'.û\œ=[™w˙∫\À\Á\Úx\Èyª+;â\È’™\T,z,\ZŒª∫¶Ωk,CüPó\œ\ŸlŸû˘|a>õ7#\ÃIÃßQ\˜\“˝2ôgO¿SπI≈≠&\Í\¬]ï›¥zI!∫¶°%\…\˜§¨¡ñ¥läZ\…:\„dÄ}ïÕÜ¨\◊/ì\È~\Ë•kô\"\€$¶?w(¨•µ*ˇ\÷:4X\0di\„ºP\«\–\Í]ùr˘lG∫<\‹\Â£\›+ìyæg\Àƒ≥z+\ƒ\'8Tõ\ÊÏô∞}\Â\Ú¡\ÓL•Ü˙x¡+\‰T\—\'ªÆë¨#ß;¢Wu\∆\Íö\«\⁄2\›\’NA\Zgöµg\ı¯\ˆ|ö\r≥˙<õ\⁄]‹àæ∫)â0¬úOAåy0\Z⁄≠Ü\ƒMﬁØª\∆àzè\ﬂ!äoC\ËJñû∑\Ÿ\'Vô8ª\Àg•ã</Ω\Î\Z6/\€\ÊÕé4n\À\¬BƒÆ>Né\"a\·\Ó]Ωtt\\∫‹í7æ\˜_◊Øv76\ÎH^wBõü\ﬂ⁄¥ìvç\Ó\ OªW¶k9†\ÿ4-omYykwyU∑˘Ω≤|_\ı\Êˇ\‘\Â\’ ^¡Å\Ì\«\“Fº(Qï\œ8´4ôî!q\‰`*è}B\‰\‡æåê7u∞2¯K4k\≈ *4¿\˜>æ\‚õ.˝É\À\0d_j@\‹¶Aß≥\Z\◊ik\r\0=\€)4Ωí⁄ån\“LZ\ \Ÿ{\À\«y:∑\Àˇ-ï/ìØwl¬ò\ˆ\Ôº3m¥ñÑG+\˜CÜQ1;#r3üÌéæ\”\ıÅmáO\ƒ\–RlµV®å\ı-\÷πtu2\Ô˝É};é•MÆCºQP_ããTC|KgÑ|ìV™\“∆Ω\ÍiC\·oE≤^–°\·¡>\·¢}A∞”ø¥\Ù˛?\‡™JL!\˜ù\˜q¡\Ôvñüyn$\‹]g\ÿ\∆a7\‡Åó«î(öRæîEQùæ\\\Îp\Ì-\√;\ \◊Bså2ﬂÑ\˜`•óº\”\·x–ßTõajm&Ñï†RUÖ\Ù\˜6∑f\Ùíw:z\Ôü\Ú\r\‚5∞¶∫\È\”K6B˝}0L£\Ûù\Ã\À;7\Ôx?ñ\«)´\∆y\Ò\Á°\Ï9ï/ \À¿\˜^Ñµ^¢úca\˜\ﬂ<\Îa\Ê	=d≠QtM_î\‘ I\À?åò\0ä\Z\ÍKY\’9äÇÀßj\Ê©zJsΩ\¬\'∏H\¬\0!\r\◊\¬\‡ñ¢çí≤p\‰\Í\·?#µ\‰F\ıNá;\ﬂ7ô\Œz…µÇ\‡\Ê]GS>\Ú#\√\\\n\ kF9R\ÒU0Ñ\Ê^	\Ûˇ{D\rGÖ´+àMÇ \¬\ƒ\÷;F]˝0\Ï¿ÖQÖøÑk\È\ﬁ\œWL$fX…É\“O\‹\Ô\·)¸¶\·•{ˇZ.Ω˙†ºw\Òú¥˘\n\Z§\‰ø:å∞\‹\€\˜¸ï\\|\ı\Â\ˆ\≈jH\Ú \‰=}ê˛*5˚\—¢ì}w\◊\Ù¨8\Ó˛\ÓV;n(N\⁄q]ö\Ìe\ÍΩ“å,\ŸZ\\˛I|1bòs*Faîs™\ÛºQ\·r\ o<\ıﬂí>~∑\»\·\‰E\ƒû9\"öJ∆ëGûóãØ\À€ão@æ!ΩˇáJ\Â\‚Ω\'ª\“>˚Åsr\œ3\Áª\Íö˚\Áè\‡\ZÉ=u≠†/˛\Ëù|XçOc]|\Èc˚%∏ˇë≥\'\Â8µ\ˆë\'•ù4\‰\Ëü}C^¸\)µmõæ	y\Œ\»/>/\˜¨\\êπü˙c9\Û¯9y‹•ù“∫˛\ÒƒÆÆ∫f>˙%Lˇç\€|q§2\˜\À\ÙûµF\˜\Zeçú™Kç_ìá9˘ª\ +ï≠:µ\Âoïìg\Ôñü¥\Âå|\Ô%ëñãô\'ñ\œ˛\Á^køvÄ5\’¸ÄüÖõ\œzAß\Î\'O\»\›rûôJ£µR˘Ø£Ω(∂ô^zJNÅ\‡\«\·\0\œ\ﬁgñÉVb\÷\œk	 ’∏èS\Î=>\Ÿ≤\Z/\»˝\‰ZeFfj\€uöoô\⁄%\'æ∞∂\Ô»ßé\ŒHp¸§yúø\Ÿˇ˘ù\ÊU\ﬁ⁄≤\ÊH\≈kL\ˆH5,\¬«ë\ıò˙ÑøQ‚ªØ\…Y9\"\«>d\„ a\’oˇâ	é\Î≤\©ø\ÏìyÉF\ˆ!\ı∏\«ùÑ¬ºáoó\˜Yïd}\ÓNˇ\Á\Â\„\ˆX¥\‘8*è=˚∞¸wˇ˚û\÷i\ÔüA\œ`Å\Õ6%[ˇ9:ˇ\∆\¬¡ø~W&å0–≥º¡8\«$˘F\Á≈áNYª	qçl?\˜q©D”∫ì\ﬂˇÇ±π5\ı√Ø=%ﬂù∆ÜO6”û_ßá˝\‘q˘’øü]UW˝´\˜\‚z3\ıâ\‡];\ÔH+Y6¡≠ØÉæßÊìü\'kX\∞\œCzª\›PØä¢™D˙ª#∂£\„â!O\– à^á°á!?\ˆ&èø6\”Ci\Á\‡T£\»\ÙD\…∂Ø¡-\€\Ôá\ÿ=˘Ñ æéXR9µàÜ ,\n;§í˙\ÊIu\ﬂÀßù\˜¯±ñ©a\Õ‘áêy\\\À\ÓCì∫w\ˆ.¥∑å¸RmIR5∫;o\ÁÅ\nâ\–;\È§\ƒ⁄õPß°\…%\Ãü+É˙úùÑá°üæN§\ÿvW\ZáX£@™˘W‘Çu!µ\ÊrÉ1t\Ár˘÷ãT˝9\ˆì\0/\⁄O°®å/£†(ææQeXÄ\—Œ±cêáÆ5ä:\‚Kî-?\nÇ˝≥w§	¶æ˛;™∫vçq>\Î\⁄H¨5qÉ\Î7kø~\ZBo`∏&#v˙áC¸\›4\Ï%7`†_\'°¸mQrÉòæ(r$_\‡©\‹˘qå*±ñn4\Úù\⁄(∏v\‡Heh›¨XO2ã\÷O_\Ãv\a5\Õ\\\nz	\Œ}•\ËB£»®∏º≥©70nz\˜á\‡\‡\ˆ\˜¶\r˛oâ∞QE∏o.3\ˆ˙~D¯\Í7,è~i√Ä\◊T«†t\Ûr‘†(Ø{:â˛T,íµ\0Wñ∞a1®?˘\ÙºÇÀóΩô¬ÅJ\Èu\ﬂ>G°_\√z;)\“]=æåäaÀÜ	¶ΩÅô˝dv\‘\◊E}\ZE¡\‰\‰ˇTC\ÊwE7\0\0\0\0IENDÆB`Ç');
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
