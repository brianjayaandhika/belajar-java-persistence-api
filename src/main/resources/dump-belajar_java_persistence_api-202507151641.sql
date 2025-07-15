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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Gadget','Mobile Gadget',NULL,NULL),(2,'Food','Tasty Delicious Food','2025-07-14 03:01:23','2025-07-14 03:06:03');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hobbies`
--

LOCK TABLES `hobbies` WRITE;
/*!40000 ALTER TABLE `hobbies` DISABLE KEYS */;
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
INSERT INTO `images` VALUES (1,'Contoh Image','Contoh Deskripsi Image',_binary '‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0\0U\0\0\0i\0\0\0KMoŒ\0\0\0sRGB\0®\Î\é\0\0\0gAMA\0\0±üa\0\0\0	pHYs\0\0t\0\0t\Şfx\0\0–IDATx^\í]k¬\×U^3sÎ¹\÷Ú¾~¥Nü¢N;uœ¦\ÊTƒ„¢BkA!„PS©A‘©Ui” ü(X \Ñ T‚­”44”8iU!Q¤D­*U­;Ø´±cû¾\Ïkfø¾µ\÷³\Ï\Ü9\Ï9\÷^_\Ç_\î:{\íµ³\÷·\×~\Ì\Ì9N°{\ö=©L¡\r\ÇCVAP\îú“Âº¶‚¤\õ“\ë\×\Æ\Ğ‰¢\ğ%MÓ¾²^\ØT¤n\\W¤y¯/\ë…\ÜF5×ªaØ¿}k=\Ã-!®}›Š\ÔÁ\èİµn—«ÿºšş\r·!n*R\é	ed½p\ÃS\×\0›ŠT7½Æ•A(\òn_†\Å\rOEDÉ5u\r€#\Õm#Ÿ\îÖ®\å\êu\í\ê5\ÕË¶{Pù\Ğ^\öºœşù\Î»¦‚«gŒ\ì©E£U«¤²\ï¦T*›\æjdt@\í\í$•‹WYn0\ó\êºG»£aÇŠ\ÂAwde\á<u$R‹½\ãP\"\ñ+r\ì\Ö•v\Z\ñ\Ê\Í.v\Êk?™%Hdq)§ÿ½*O|­*o¾5~Ç‹\Ú\ç%Mß²($uÔ‹\ÎÎ¤\ò\ÅÏ¬\È\Ï‹5n\Úß©#†9ŒÈœşxyœ\å’D\äù½?Ÿ‘³\ç\Ç#\Ö˜\ï\ÇZ“\é0‘5uÏ®Tn½l\0©za\Ğ!\nzz„\òC“\ÇÙœ#…\È{\ÇA‘¿y°!ûv[cILG\èzK”\"5B\é\ë¨Nu@	\"QŒ#L\à©J>\èµ$^\ãmup\æ\åf¨.\'|¢)[¦üœ\ÃÁ\'1X+$¸4¥©\nK†i2;D’L\ÜM}\Úè‰š\Ì4•@\"¦Sfc¦_ü\éX~ÿ£ma‘Íˆ\à¦í‡µ\Û\ÉQ§È‘ƒ‰|\å\ÑÙ³=•«€\ç@’Àw¯ú\à\Z¾\ÓttK°/5y\ò\ë9ÿv§N3˜¡û:®ı.‹Æ {Y2ømÀD.\\\n\ä•\×B™_¶\Æ\ÈH‡Aê³\Ôe\ÏŠ©E¦\Æ\ãº·»I7\÷H°\È\ìU…´Q–^Ç©†š=+Ó‰s`Y”\éeÓ¥‡±ü5\Í ·À\ì\×_\å\ÓW‘F\Ë&‰r¤ §‚\Ô]S\ìø He»I\Ğ\ZyF\àÃ»‚[\Û(§P¼d&š?[\ÆÁDM³BB\×y—\Ö\à\Óüe´y­+\Ò^xg\æX~\ëÑª|\çu¦\ìHUšTx\ê\Í\ï”`ÿo[–¶”\öªÎˆ1i“`\ZŸdÁ\Ä5°aV\Ö\æuº\ÑB%– Y±U\ã\Ã(Fw\Ğ243¨6]¤&miÿWI—\å\Ó_\å™ÿo«™(©{\ŞıA	\÷ı:,¨\Ê5^[l«\ö;›uR¤>û\Îp¹:\Ù;\Ï\Æ\ág»İ‚‡\Í\Ë\ì\ÊK \ãGj\×t­_#P¹O»-\nP±i\ÔÔJ\óŸ“¤ş–|\æ‰Hş¦s\Ñ0‘sª\Z`\æZnº\Å8cS+tM³&\Ş6\Öj5™‚0¬M™pª6e\âYh\íSˆC²LP™•\åm?\'2µ\×^\Ç\\\Ù!\Ñ3¯k\rš\nÁŸO¨Ë£{\Ú\Êa2G*\rbH£h\Ô@m\r™\İ\ÏPˆ\İz\\¤¶\Ç5Á^›Ze¶˜;%Á$£F\Ë\â“\á¤N\ğ0˜š:­\Îæ…š\Ï\Å-r\Ñ\Ş05ª\çC\Ú\éŒ,\Ì|{‹©\×u)k\Ö_>L±ùOlZ6Ø“bù@C‰›\\s$\Ñnv5ŠqvÂ¨™¨\æz¾¹ƒ®H‡$kw<´qÖŠq–#1­t‹\\:.©.\Ìcˆ\÷\ërå¨°\Ê¡„mkh™Ü\\\n)a†z¬\nÎ–\Ã \õnE\í¯®ªorŠI¢®JG<dQ\×\Ø\Ğ2\ê\õº¬¬¬h\Øh4di%‘‹ÁOJZ\İm2\0ZÆ‰§ºº¨¤I‚`¼şûp¤‡R#V‚»\ñ…nTTJ‰Ó†»Ö›‹‚!œ\è\Ô\ê—ruT¢Š\Ì\Ìl1\×\ô4\ôÙºm›„µ]X\öh—·s]j\àl\Ğ\İ*,4¨R½u\ğ\ÅÆ­\Ú5U\ó0Ò‰z6«š&dyFüÿ2¸¶\ì.F‘&eû²c\ÇN#;maš©p!k§\Ù)´iŠ1C\ÊP\ê-Œ¡U:\Æ^’‡m^\Ó@«¸T6\Ü(úiZm;¨ZÈ F¬“\íyL\ë\ËjÕº\Óñ·±–\æoĞ™hU…h«\"l·c\Ü.›c–³Eÿ c*u\Ï8L \æ±Õ¨0hc\ğ\á·\nº3i´ùy”e+4Û´NÉ·¿uŸ¼~\ö\ó0™›ú8^–Ó§?\'¯¼|¿\ÌÍŸ\Ö|\n¿:­Ÿ1\Òœ‡V¢HB\Ü\Ç2®¢\Ù\ó\í®.\ÌûDš„\ín†¶\Ê\n?²\n¨›F+\Øh\ç:@Õ¦© !Á\îw\î\Ü?a< ş¦\Ş×›sfM\ã\õúe9ş”\îü´3l«nCúc-“ NaC‰ùD\r\Ç0\Øµ#k\'\ğ(¾}˜\Â€@E§xèƒ¢%%:<iL\r“±©%3´\ÓA\ÔQ\Ù9#œªQt“D•[tg§4-\ÜIİŠ\ôš´š\í\Ì\ŞhÚyšM\äkBoI½	ià¾¾C‡@oÀ\Ö@Y\Ú\Z\ØZšN²\ÍcÀq\á8	k\è\\5€—&M\Ë){:¬\ØÍª‰ÿ,¡f*\à¨bm4ú¡\ÂU\è1\ô*\ÜÓ·\Ğ\ñ$\Ù&ss—d~~2/\ós„W\ç.#\\)[;i\ó6´²°,‹\r™‡,,\ÖM¸`\Â+s\r™[`šµ/\Õ!V,+u´MWš\Õ\ÎC\á\r%ow¤C‚\Û¥Í¨-m0\É’\"“cÜ¶?•§jÈ»\Şı	\÷ı2H‚‘–d2¨a’Š\Ñù‰xk\×/Iu\Û!µ1\Î\éÛ‚‡^½rZ–/}E\ï=$[¦fŒjy\ÎOºxWa\Ş,\Õı²jcZ·­¾4\'\ßü¾<üù\Ës\ß\ê5\nH¨†m„MTV\ë¼¡‰\Æ5A„N%N7L­zÓ®…‘7¡\n\íª·eÅ†\õzaù\Z²7Y^^’•Å‹²;8#wı\Äa\Ù5EZW°m_µ2g¤5²`e»­— .\Ä)’PV C¸c\Ò\0‘\ÌN•´%\Ó8\ç\î?ü>Ü§Áwg&\"awN±#†Qµ0£/y\Ğ\ÔF\ÛVš\î¿+\ÒNª­N‘\n6\ê´9Á\ñ\ÍJÚ¼„¾Ÿƒ¼!•ú\÷e6~U\öU^–\İS\Ä -i\á\"Ø Ã¾\Â}Á\ÓÇ<l\Å9·,‚İ»nK[¸­\âzZiW\ŞUùx\Ï\ŞTş\áO\É\í?ŸDUL\ÓlZ9\ÉÅ»¦£¨@½ÓÑ‹bH6-M¾Uú ø\È\å:\×û£\ÇNË“_ı?\ÄW£\×luÈ¦\Ú\æ\0<¨a\È{§/yÕ­²\ó\è¯H`ª5ù1¦¦\rU\ŞB’\éBB‚¶‹_‚\à\Ï)[\ÂÓ†W?\Âl ®\Ï^©¯\î\ç¨«\ÍP¦\Û5½ÿ\õ¡\n½3RÃº¤S\r\ã¨C\÷§¢z¬Ó™\Æ|V\ô8—‹\÷\Ò{¥\å\Ó\ó\Ù\ëûzW>g\ã\ì~O)BÈƒYk\İT0-Â¢Êœ¬	\ä¢Ï†y\Äeq\ßFİ¦©‡P·¡z‰K\ó\ô®ú ™7y6_\n\Ë2\ôu\ß\æ‹-§}*F\Ñ\ì\õ\Å!Œj/\õ®1 \õp-²Rd\ãf\ÄY[—\'{ù4\ô\Ä\÷¢\ôB›-‹\ë\ä-ÓX[6H	qg\åÎ›y¡\Ó\õ\ä6°\Ï\ô\ğ`\×I\Û\Øl\Zyº¦\å\È\èšz\Ş/M\ë\ôl]\õC™YkWaœv§#\Ìt\'´¡%¶ù\ô\÷ÿ\\Nc”wi_Vƒ^\Êc×°®©\ÜÇ«ü\öµHæ‰”b(]y\òbÓ²¶2¿\Ó\Çq®n„-\Ü\Å\ğ\é”şùjeTtMgˆ\ó\"µûq4<‹³SL\÷:®v\ÖcmY9\ê.C§\ÛÁ,\ô<\ê^~µ;)²{\õ˜5­Â°‚Í‰\ËAo4¶@Oµ„*±l˜%SO±¶,\ŞKoU9\'.\Ï=[ªwúº\Ë\ç\òx\éy»+;‰\éÕª\ğT,z,\ZÎ»º¦½k,CŸP—\Ï\ÙlÙù|a>›7#\ÌIÌ§Q\÷\Òı2™gOÀS¹IÅ­&\ê\Â]•İ´zI!º¦¡%\É\÷¤¬Á–´lŠZ\É:\ãd€}•Í†¬\×/“\é~\è¥k™\"\Û$¦?w(¬¥µ*ÿ\Ö:4X\0di\ã¼P\Ç\Ğ\ê]rùlGº<\Ü\å£\İ+“y¾g\ËÄ³z+\Ä\'8T›\æì™°}\å\òÁ\îL¥†úxÁ+\äT\Ñ\'»®‘¬#§;¢Wu\Æ\êš\Ç\Ú2\İ\ÕNA\Zgšµg\õø\ö|š\r³ú<›\Ú]Üˆ¾º)‰0ÂœOAŒy0\ZÚ­†\ÄMŞ¯»\Æˆz\ß!ŠoC\èJ–·\Ù\'V™8»\Ëg¥‹</½\ë\Z6/\Û\æÍ4n\Ë\ÂBÄ®>N\"a\á\î]½tt\\ºÜ’7¾\÷_×¯v76\ëH^wB›Ÿ\ßÚ´“v\î\ÊO»W¦k9 \Ø4-omYykwyU·ù½²|_\õ\æÿ\Ô\å\Õ ^Á\í\Ç\ÒF¼(Q•\Ï8«4™”!q\ä`*}B\ä\à¾Œ7u°2øK4k\Å *4À\÷>¾\â›.ıƒ\Ë\0d_j@\Ü¦A§³\Z\×ik\r\0=\Û)4½’ÚŒn\ÒLZ\Ê\Ù{\Ë\Çy:·\Ëÿ-•/“¯wlÂ˜\ö\ï¼3m´–„G+\÷C†Q1;#r3Ÿí¾\Ó\õm‡O\Ä\ĞRlµV¨Œ\õ-\Ö¹tu2\ïıƒ};¥M®C¼QP_‹‹TC|Kg„|“Vª\ÒÆ½\êiC\áoE²^Ğ¡\áÁ>\á¢}A°Ó¿´\ôş?\àªJL!\÷\÷qÁ\ïv–Ÿyn$\Ü]g\Ø\Æa7\à—Ç”(šR¾”EQ¾\\\ëp\í-\Ã;\Ê\×BsŒ2ß„\÷`¥—¼\Ó\áxĞ§T›ajm&„• RU…\ô\÷6·f\ô’w:z\ïŸ\ò\r\â5°¦º\é\ÓK6Bı}0L£\ó\Ì\Ë;7\ïx?–\Ç)«\Æy\ñ\ç¡\ì9•/ \ËÀ\÷^„µ^¢œca\÷\ß<\ëa\æ	=d­QtM_”\Ô I\Ë?Œ˜\0Š\Z\êKY\Õ9Š‚Ë§j\æ©zJs½\Â\'¸H\Â\0!\r\×\Â\à–¢’²p\ä\ê\á?#µ\äF\õN‡;\ß7™\ÎzÉµ‚\à\æ]GS>\ò#\Ã\\\n\ÊkF9R\ñU0„\æ^	\óÿ{D\rG…«+ˆM‚ \Â\Ä\Ö;F]ı0\ìÀ…Q…¿„k\é\Ş\ÏWL$fXÉƒ\ÒO\Ü\ï\á)ü¦\á¥{ÿZ.½ú ¼w\ñœ´ù\n\Z¤\ä¿:Œ°\Ü\Û\÷ü•\\|\õ\å\ö\ÅjH\ò \ä=}ş*5û\Ñ¢“}w\×\ô¬8\îş\îV;n(N\Úq]š\íe\ê½ÒŒ,\ÙZ\\şI|1b˜s*Fa”sª\ó¼Q\ár\Êo<\õß’>~·\È\á\äE\Ä9\"šJÆ‘G—‹¯\ËÛ‹o@¾!½ÿ‡J\å\â½\'»\Ò>ûsr\Ï3\ç»\êšû\ç\à\Zƒ=u­ /ş\è|XOc]|\écû%¸ÿ‘³\'\å8µ\ö‘\'¥4\ä\èŸ}C^ü\ğ)µm›¾	y\Î\È/>/\÷¬\\¹Ÿúc9\óø9yÜ¥Òºş\ñÄ®®ºf>ú%Lÿ\Û|q¤2\÷\Ë\ôµF\÷\ZeœªK_“‡9ù»\Ê+•­:µ\åo•“g\ï–Ÿ´\åŒ|\ï%‘–‹™\'–\Ïş\ç^k¿v€5\Õü€Ÿ…›\ÏzA§\ë\'O\È\İr™J£µRù¯£½(¶™^zJN\à\Ç\á\0\Ï\Şg–ƒVb\Ö\Ïk	 Õ¸S\ë=>\Ù²\Z/\Èı\äZeFfj\Ûušo™\Ú%\'¾°¶\ïÈ§\ÎHpü¤yœ¿\Ùÿù\æU\ŞÚ²\æH\ÅkL\öH5,\ÂÇ‘\õ˜ú„¿Qâ»¯\ÉY9\"\Ç>d\ã a\Õoÿ‰	\ë²\ğ©¿\ì“yƒF\ö!\õ¸\Ç„Â¼‡o—\÷Y•d}\îNÿ\ç\å\ã\öX´\Ô8*=û°üwÿû\Öi\ïŸA\Ï`\Í6%[ÿ9:ÿ\Æ\ÂÁ¿~W&Œ0Ğ³¼Á8\Ç$ùF\çÅ‡NY»	ql?\÷q©DÓº“\ßÿ‚±¹5\õÃ¯=%ßÆ†O6Ó_§‡ı\ÔqùÕ¿Ÿ]UWı«\÷\âz3\õ‰\à];\ïH+Y6Á­¯ƒ¾§æ“Ÿ\'kX\ğ°\ÏCz»\İP¯Š¢ªDú»#¶£\ã‰!O\Ğ ˆ^‡¡‡!?\ö&¿6\ÓCi\ç\àT£\È\ôD\É¶¯Á-\Û\ï‡\Ø=ù„Ê¾XR9µˆ† ,\n;¤’ú\æIu\ßË§\÷ø±–©a\ÍÔ‡y\\\Ë\îC“ºw\ö.´·ŒüRmIR5º;o\ç\n‰\Ğ;\é¤\ÄÚ›P§¡\É%\ÌŸ+ƒúœ„‡¡Ÿ¾N¤\ØvW\Z‡X£@ªùWÔ‚u!µ\ærƒ1t\çrùÖ‹Tı9\ö“\0/\ÚO¡¨Œ/£ (¾¾QeX€\ÑÎ±c‡®5Š:\âK”-?\n‚ı³w¤	¦¾ş;ªºvq>\ë\ÚH¬5qƒ\ë7k¿~\ZBo`¸&#vú‡Cü\İ4\ì%7` _\'¡ümQrƒ˜¾(r$_\à©\ÜùqŒ*±–n4\ò\Ú(¸v\àHehİ¬XO2‹\ÖO_\Ìv\ğa5\Í\\\nz	\Î}¥\èB£È¨¸¼³©70nz\÷‡\à\à\ö\÷¦\rşo‰°QE¸o.3\öú~Dø\ê7,~iÃ€\×TÇ t\órÔ (¯{:‰şT,’µ\0W–°a1¨?ù\ô¼‚Ë—½™ÂJ\éu\ß>G¡_\Ãz;)\Ò]=¾ŒŠaË†	¦½™ıdv\Ô\×E}\ZEÁ\ä\äÿTC\æwE7\0\0\0\0IEND®B`‚');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'example-1@email.com','Mr.','Eko','Budiarty','Khannedy'),(2,'example-1@email.com','Mr.','Toha','Ahmad','Baihaqi');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
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

-- Dump completed on 2025-07-15 16:41:25
