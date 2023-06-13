-- MariaDB dump 10.19  Distrib 10.5.18-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB-1:10.4.28+maria~ubu2004-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `countryCode` varchar(255) NOT NULL,
  `administrativeArea` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `dependentLocality` varchar(255) DEFAULT NULL,
  `postalCode` varchar(255) DEFAULT NULL,
  `sortingCode` varchar(255) DEFAULT NULL,
  `addressLine1` varchar(255) DEFAULT NULL,
  `addressLine2` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `organizationTaxId` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `latitude` varchar(255) DEFAULT NULL,
  `longitude` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_wsdrqnqzasgxbmnfpiiwwbnvtsdxoyvjqzip` (`ownerId`),
  CONSTRAINT `fk_jodnxftatjazbeodfuvzbniznfsikyzixmlu` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wsdrqnqzasgxbmnfpiiwwbnvtsdxoyvjqzip` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `heading` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `unread` tinyint(1) NOT NULL DEFAULT 1,
  `dateRead` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_pjztummhowqcrtdchtwiiquhtpjjsnadkxtv` (`userId`,`unread`,`dateRead`,`dateCreated`),
  KEY `idx_jllpujdwipgkoftedyvfvrakkbyqifljjhey` (`dateRead`),
  KEY `fk_cuwcfaoplruwnmhykbqotzizzeltcnpnudzz` (`pluginId`),
  CONSTRAINT `fk_cuwcfaoplruwnmhykbqotzizzeltcnpnudzz` FOREIGN KEY (`pluginId`) REFERENCES `plugins` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wjfmkgycpyyiottfbczsvwltrkipqgupizww` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` int(11) NOT NULL,
  `volumeId` int(11) NOT NULL,
  `uri` text DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `isDir` tinyint(1) DEFAULT 0,
  `recordId` int(11) DEFAULT NULL,
  `isSkipped` tinyint(1) DEFAULT 0,
  `inProgress` tinyint(1) DEFAULT 0,
  `completed` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nfmquansctelazcnuykiaxcqloygpukcupsb` (`sessionId`,`volumeId`),
  KEY `idx_esneqzruosypogrlzroahffpwsiqpvynzlwv` (`volumeId`),
  CONSTRAINT `fk_joehtznhqkpijlglhuswpbjoylytnnvqfijh` FOREIGN KEY (`sessionId`) REFERENCES `assetindexingsessions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mqjagtvgisxuqihwstfilkmtxqekwukmwttf` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assetindexingsessions`
--

DROP TABLE IF EXISTS `assetindexingsessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexingsessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indexedVolumes` text DEFAULT NULL,
  `totalEntries` int(11) DEFAULT NULL,
  `processedEntries` int(11) NOT NULL DEFAULT 0,
  `cacheRemoteImages` tinyint(1) DEFAULT NULL,
  `listEmptyFolders` tinyint(1) DEFAULT 0,
  `isCli` tinyint(1) DEFAULT 0,
  `actionRequired` tinyint(1) DEFAULT 0,
  `processIfRootEmpty` tinyint(1) DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `alt` text DEFAULT NULL,
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_okwvizxxtipgkxemuwvhxubqrdnbynoyfjdi` (`filename`,`folderId`),
  KEY `idx_ebgxzzfxijeiwoemyodvvwfxwmvjxaxthodc` (`folderId`),
  KEY `idx_vmluecsubndyxsvcftffedygpedhbeocnzbg` (`volumeId`),
  KEY `fk_dzvwujvhrmipbzduhbxyxueabcccrnctcypu` (`uploaderId`),
  CONSTRAINT `fk_dzvwujvhrmipbzduhbxyxueabcccrnctcypu` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_lhzkfyrdehzgmlcjzbefgmhpfieulkwkzjyc` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nkmwryodgjxijaspxhziqcihgfndegajmvqz` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qenzscdemejdgqkzddilkntztovlqupzgtzu` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mnbpfhossvhisslotdkmcjdpgauovsldhcyq` (`groupId`),
  KEY `fk_uugufaclwidybertixtaghttyxyprymcmkxb` (`parentId`),
  CONSTRAINT `fk_amhudixfqkajllbnxrbzugwyervyuqpxlbpn` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_iafzndvwhbrbbvgkqxxiwlvyrsjvguoyfrca` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uugufaclwidybertixtaghttyxyprymcmkxb` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cgpxpwgrzqbxuieagyiwrbeufrroupdpsiut` (`name`),
  KEY `idx_lhucqfvfhqikgkgfojpvrqqpkkbyacxavgsk` (`handle`),
  KEY `idx_qqfeclitzswwexcwsratwvvjbfgaptrfodzw` (`structureId`),
  KEY `idx_brwkjfembcgkarkodtxshbuysmvubcogvzfv` (`fieldLayoutId`),
  KEY `idx_dgqonfnzhnaamibpotypljyeuaqqsqnyjxid` (`dateDeleted`),
  CONSTRAINT `fk_qjyjfzlmkdqardfcvmjbonafbljibyfczrqj` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zdtwyrkwmbwukxwumiindiewkqwnmffyxwhe` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mhhltzzvrdbhqgezyxgzixbralvordgnhuwn` (`groupId`,`siteId`),
  KEY `idx_hijntzzxvtnqjuruvbkchfrpxjzyaawdnrea` (`siteId`),
  CONSTRAINT `fk_avrqlmlgppshmjlmkedtwrrynyysuucwnflk` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_fxzieuykzlyallfvintbmiidqzsfmtsralmq` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_iktwictghfkliafdstyijmaqichdkvaurdbz` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_dkpkhghhjoxzxacfjghqvujnwmmmaxstyucw` (`siteId`),
  KEY `fk_xaupzoyehqyirochymstdpeogecrlkxpzrxa` (`userId`),
  CONSTRAINT `fk_dkpkhghhjoxzxacfjghqvujnwmmmaxstyucw` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pmqkhfzrseyybysfhgedgwcmehstzlmvufqe` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_xaupzoyehqyirochymstdpeogecrlkxpzrxa` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_uxvuyipofhinqsenwegvzfdsnalcwwklwiby` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_cwahhwwhdyrbmszkqbjclvnlvnwqcexmgzsc` (`siteId`),
  KEY `fk_pzqrhtpgtzenwjeaokszrzzceggjtbtrhebf` (`fieldId`),
  KEY `fk_mxyblrjvuyazsptwpjetrqpdgpvsoouxnpce` (`userId`),
  CONSTRAINT `fk_cwahhwwhdyrbmszkqbjclvnlvnwqcexmgzsc` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mxyblrjvuyazsptwpjetrqpdgpvsoouxnpce` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_pzqrhtpgtzenwjeaokszrzzceggjtbtrhebf` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_wchkpsnkhzifxhtfcxixvulrgqebyujzmsxl` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_altText_gvuxccdq` varchar(240) DEFAULT NULL,
  `field_copyright_gsucoquh` varchar(120) DEFAULT NULL,
  `field_siteName_fzwghcns` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_yxtfmsdhmlaozbnxdxlpyvzgfstokspvsdox` (`elementId`,`siteId`),
  KEY `idx_djglrbcnzgekvbgargwjxbtkrzdrishrhkpq` (`siteId`),
  KEY `idx_jzyosrjaxzfbcxyvihaooeayydlnjcdiaffd` (`title`),
  CONSTRAINT `fk_qrdtpllnhjkxozqsyqtfpjjwgrlnkmzfhfar` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rmisfoywwbrnclhimzhwoltwsonaabmflbqg` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_obdtsabyvlltcepxupliyafdtlcterxjmofi` (`userId`),
  CONSTRAINT `fk_obdtsabyvlltcepxupliyafdtlcterxjmofi` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text DEFAULT NULL,
  `traces` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_oeykrfnrhtbcdrefzudslmxxbxxrstszokoc` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `provisional` tinyint(1) NOT NULL DEFAULT 0,
  `name` varchar(255) NOT NULL,
  `notes` text DEFAULT NULL,
  `trackChanges` tinyint(1) NOT NULL DEFAULT 0,
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `idx_ffyqtehkqwpkcoyvcqeluxuwjelnofoskdlr` (`creatorId`,`provisional`),
  KEY `idx_cpaqckhuvueqqnsisnldwjdcyuvydkxkmzba` (`saved`),
  KEY `fk_kwshiwpbzwuurxmrzxyhqgmgkvynsvmfdhps` (`canonicalId`),
  CONSTRAINT `fk_eqaflncckgksuzbcaaqiyjltwfqpywfdkdbd` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_kwshiwpbzwuurxmrzxyhqgmgkvynsvmfdhps` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) DEFAULT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateLastMerged` datetime DEFAULT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ebnijnhavtxdfakzmhenrcaxxwzsbhhzqurz` (`dateDeleted`),
  KEY `idx_efzngjaitbzncmknduixjtrbznnkmbxyhcva` (`fieldLayoutId`),
  KEY `idx_uzzgjpyedfclcbfgomyuenlieslckvzydhmh` (`type`),
  KEY `idx_dismbxkeksapfsbbfmwgzbwnmhgendjodqeg` (`enabled`),
  KEY `idx_ywnwwlxrwoxdcjnngnzvhjsduujjvywjgbss` (`canonicalId`),
  KEY `idx_ixiqtyioukfwcmzucigsefaicwuinzecszmh` (`archived`,`dateCreated`),
  KEY `idx_fapssgilfxjevzuawluwghkdufmmryckzeyo` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`),
  KEY `idx_hbjnxjeexnkaspkwlbfyhijnvdakkufnorsv` (`archived`,`dateDeleted`,`draftId`,`revisionId`,`canonicalId`,`enabled`),
  KEY `fk_iubckfdzdixmrflavmonpzurvkmdalkiadbt` (`draftId`),
  KEY `fk_wfdqwsxpsrlyitfhjpddebafgfybbwkclggf` (`revisionId`),
  CONSTRAINT `fk_iubckfdzdixmrflavmonpzurvkmdalkiadbt` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wfdqwsxpsrlyitfhjpddebafgfybbwkclggf` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xkpaibbqrhotmgeewebcyvzzyxuteuxdwazb` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_yphrrubsgnsielfcdppvmbrxgidqjmkudwvz` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_szrwohsgfagemtliskazofwjhhmymdziobdt` (`elementId`,`siteId`),
  KEY `idx_tnjfjmevhrciktwlexbydxmcjjmunakfvaxf` (`siteId`),
  KEY `idx_afaolsmvorjuauklensygqghzbtocmtfofpt` (`slug`,`siteId`),
  KEY `idx_gryfrusyeucxvwihbemcomffgseisiitpamm` (`enabled`),
  KEY `idx_yfhgqcyklawyphfhbvejhszfigohxbntlvod` (`uri`,`siteId`),
  CONSTRAINT `fk_dchgmpmsguddbxnqhqniovelvlhwwtcgqogy` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_exuoyepjwztpwosuehlgrabiiqoeegfzevbf` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_ggmnvoyagyceuyetlfdiehuwvcnpsceazbls` (`postDate`),
  KEY `idx_hxpscqjodmrxgxcdbscwjchzjqjhfvpwyxmr` (`expiryDate`),
  KEY `idx_ciacqjdhfkrzvritvplthznkpvoiouxuismg` (`authorId`),
  KEY `idx_hlmshfmjzmdrtgldftmvqkcnknxlfzdewudh` (`sectionId`),
  KEY `idx_wknjfggptqptxlhpesxfpobenryqehuvgpuc` (`typeId`),
  KEY `fk_ruwmhskpnwzjneldtqxwgybhcwqxomydiyid` (`parentId`),
  CONSTRAINT `fk_doaiezdbiyukkltxzaegtdscnypgrbbtohlp` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ruwmhskpnwzjneldtqxwgybhcwqxomydiyid` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_txwduygzaaryanssjipvzkkfsrynudewmxch` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ulkttkeycthtlmdqeizwwwiwkkimwzrfloku` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uzsrefmqnnyuttpzvsqowsarzpxnzfasktgo` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT 1,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jhuucegpmfxluckdlubveygmoajxwluwcbuv` (`name`,`sectionId`),
  KEY `idx_saogawhevxxpwabcarpumwfiwwsshamlvkxg` (`handle`,`sectionId`),
  KEY `idx_tmaftatimgzhutinbmehryhspwpskeiifdek` (`sectionId`),
  KEY `idx_vjyufycynxerqhvqrqfvrrudicevhvzvrkcp` (`fieldLayoutId`),
  KEY `idx_sntmmhkxigvlhxyfepyhmrcxakolsqkgvgja` (`dateDeleted`),
  CONSTRAINT `fk_focalpkahwuilkdywcvgfeqofnejfvxmnwmc` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_irmlobkgymprmhgpikyqcvjpplmobfspvnqv` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ssltosqktjqzdhllbtpyxuqvkrgvdrrelgyg` (`name`),
  KEY `idx_lqiqgeigzlewisrfwfxwklgmawkbxhndadag` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_pgndmaolwqnxmnjffujddzpmzgmptvqopupg` (`layoutId`,`fieldId`),
  KEY `idx_hrsqmphogftzojbbjpuufgqssanoslyilpjm` (`sortOrder`),
  KEY `idx_rntrcayuejoykvglywjfiyrwujnpbdmrxyph` (`tabId`),
  KEY `idx_ncpbwhewcuaqnidagfgdgrywhbdnnbmoogzi` (`fieldId`),
  CONSTRAINT `fk_eiyxabsgpglsnpbkwcqvobhpkamjyeikifnn` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_euyoosqceyhvpsgdbsgusqrlljwxbxnsfynb` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_heliflpgimosglmonoqoypqgkxcygyqwdmdh` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_mqhmpzpcceonzgueemltmnvchbaujnhyliwd` (`dateDeleted`),
  KEY `idx_dapxkhokbxhronoyqfzuxwzmkgsubpgqxtxx` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `elements` text DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ogtnaeyncipcimtdoyheejjzyfsiusnjoqfp` (`sortOrder`),
  KEY `idx_wschhufzvtftbiklmblspbuntuevqpsuhsol` (`layoutId`),
  CONSTRAINT `fk_gnorylakxpihfovtpryrfhkpbfwdhngaqcis` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `columnSuffix` char(8) DEFAULT NULL,
  `instructions` text DEFAULT NULL,
  `searchable` tinyint(1) NOT NULL DEFAULT 1,
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_uhvonypcuwvlznodwrhbtubwtybxngcqnrfh` (`handle`,`context`),
  KEY `idx_robiumlgwtsjzqoktidslpakczijbotamunz` (`groupId`),
  KEY `idx_hhamkmmbgnvowulccrnglcluoxwdpsxyebxg` (`context`),
  CONSTRAINT `fk_azknhggwoazumawcbbqtettvkmrsqtdtmgzs` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hnzyyhpcjnmvwsldpopgocgmydcjovnprzvn` (`name`),
  KEY `idx_ltebemqsbkeanhyscupqoealsrtjydgvshfg` (`handle`),
  KEY `idx_wjnnqhvduyxkfwoxvimtuoxvndpddasephyk` (`fieldLayoutId`),
  KEY `idx_zrslvinwareqmveiahpsnzpazxmqcezusrkj` (`sortOrder`),
  CONSTRAINT `fk_gjtuufhsdbtucildsxcdzdbflouxnhsyaavs` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_hozuzkpqdxggrenaoygokveszhjtkedagqav` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `scope` text DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT 0,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_cqjwdlqwirmuwljlmtxozldbqprhbsvaqbrv` (`accessToken`),
  UNIQUE KEY `idx_ucnvlstzsygshbewimhpamzfsubjjtygezsw` (`name`),
  KEY `fk_jzpcculbsfwfhmyqzhojehwhuntycmkuilaf` (`schemaId`),
  CONSTRAINT `fk_jzpcculbsfwfhmyqzhojehwhuntycmkuilaf` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransformindex`
--

DROP TABLE IF EXISTS `imagetransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `transformer` varchar(255) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `transformString` varchar(255) NOT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT 0,
  `inProgress` tinyint(1) NOT NULL DEFAULT 0,
  `error` tinyint(1) NOT NULL DEFAULT 0,
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vktpxlfkhharkcjhcdqsoclbjzwtyzebzrbm` (`assetId`,`transformString`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `imagetransforms`
--

DROP TABLE IF EXISTS `imagetransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagetransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop','letterbox') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `fill` varchar(11) DEFAULT NULL,
  `upscale` tinyint(1) NOT NULL DEFAULT 1,
  `parameterChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jxjkfdnbmnnqkaaqmrchhwjqcqpgkszonimt` (`name`),
  KEY `idx_fwlcnpjztgaescmrztdlktysqmqrkpbhrfas` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT 0,
  `configVersion` char(12) NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `primaryOwnerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_htydqkclbdscglakfdhoagewqqcgfiftjyyr` (`primaryOwnerId`),
  KEY `idx_ghnwulaeozedevehzuisjafcmdddohyqogtc` (`fieldId`),
  KEY `idx_gsqvbownfzuyaecimxbmrcnaayqifuexsuhv` (`typeId`),
  CONSTRAINT `fk_dpjphsoaridwgecfktquazkseekaycususke` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_oniisriehjekxydggtpmebzvgqikpxockkza` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vgbiamehfaplfdxdzcjihglqebfqilsyztad` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zhdxmfyyfcsvlglpkyzvkvqergvgnrpmbgxm` FOREIGN KEY (`primaryOwnerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks_owners`
--

DROP TABLE IF EXISTS `matrixblocks_owners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks_owners` (
  `blockId` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned NOT NULL,
  PRIMARY KEY (`blockId`,`ownerId`),
  KEY `fk_vtpnxuxxjqhpvtumbbwoobuibmqtoryvdcqx` (`ownerId`),
  CONSTRAINT `fk_sskvtbmiyphmaaovwcydaghkrgzjzelesfmm` FOREIGN KEY (`blockId`) REFERENCES `matrixblocks` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vtpnxuxxjqhpvtumbbwoobuibmqtoryvdcqx` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_npztalspkxfuopolfvduztwssuqaiclqwskj` (`name`,`fieldId`),
  KEY `idx_shunsgujyepjtrggrfkefsdivumgbrwoogmk` (`handle`,`fieldId`),
  KEY `idx_fgmjaknhffpwoxhgsrqwoslccedqmkvumdrp` (`fieldId`),
  KEY `idx_scbranhisnnknkbgbtfvstwdloqznbhanmib` (`fieldLayoutId`),
  CONSTRAINT `fk_dngmlbnupgfulrerncvzgqmafkhlvchywixw` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_fmtttognlhdocvgvfowytijqupmomiqewawt` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixcontent_bodycontent`
--

DROP TABLE IF EXISTS `matrixcontent_bodycontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_bodycontent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  `field_quote_cite_ljffsgdr` varchar(240) DEFAULT NULL,
  `field_quote_text_yfidlzze` text DEFAULT NULL,
  `field_quote_style_vdcfeeit` varchar(255) DEFAULT NULL,
  `field_heading_headingLevel_xiqfbbjz` varchar(255) DEFAULT NULL,
  `field_heading_text_ehszctzg` varchar(240) DEFAULT NULL,
  `field_image_caption_xngnntxq` varchar(250) DEFAULT NULL,
  `field_text_text_badcaarf` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_urhmwvlowxfmzzwqpuasapbnkrxqbizvpefv` (`elementId`,`siteId`),
  KEY `fk_ocrfwghvwhipuxilsiaipluckknziqqlvwbe` (`siteId`),
  CONSTRAINT `fk_kqucqskvzobrhaxwgiplnuqwkhmabnynnxui` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ocrfwghvwhipuxilsiaipluckknziqqlvwbe` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_gbzplbegwdvkmhsbdavgbetrrfozkhheshof` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xzqatlffkazelcxhcutumkrhvryqjigzqgrt` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text DEFAULT NULL,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT 0,
  `priority` int(11) unsigned NOT NULL DEFAULT 1024,
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT 0,
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT 0,
  `dateFailed` datetime DEFAULT NULL,
  `error` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_myttscodfjfjmpnpdfsgwxaqnhjmfjnhctaf` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_pzukgsosahmjgwtfrvbwefuwzsemudzujukc` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xhdkiqmdfirgjvtverlrignnmkcmvmvlhbrc` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_rhgvnqeohlmqwfgxxndyjlyxqtyoeosgfksv` (`sourceId`),
  KEY `idx_sitjdoqqvadnimdcworbtengkgxjzcvjqkfh` (`targetId`),
  KEY `idx_ikzugyhibcrvvbspildmwsuffkomflmomxai` (`sourceSiteId`),
  CONSTRAINT `fk_jjdmqbscqgkgzftrlxgfobbumgaxvzyxbnfv` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kwdssuwphhlblkwvcfcjkyswjhkivhbbutfp` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_xyxjjmeppthgcyqjdglkrkmlujhpgkignbsd` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `canonicalId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_girfthybbvkjbxvokgrsmuzkznfcmowynecr` (`canonicalId`,`num`),
  KEY `fk_tpdcpwgzgtbdkxjlrolevxipjmwelkwsfdrb` (`creatorId`),
  CONSTRAINT `fk_mrevpjqcfmpdlepxoomjbzfnwtpqrpdsznyw` FOREIGN KEY (`canonicalId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tpdcpwgzgtbdkxjlrolevxipjmwelkwsfdrb` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_zqrohoadrjkjwxkfwpurptcycdlozwioilly` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT 0,
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `defaultPlacement` enum('beginning','end') NOT NULL DEFAULT 'end',
  `previewTargets` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dctoezudmfiowjexoxqqyjilxixjvdexhynh` (`handle`),
  KEY `idx_axffutbpeopvzobdkctorhnruzagjlzifptp` (`name`),
  KEY `idx_wpyhlhvffapmfgitucqwrtwoxuafknjwgqic` (`structureId`),
  KEY `idx_cxeledthbqyuanywlurrnogsuksivjjmznhh` (`dateDeleted`),
  CONSTRAINT `fk_xnyxminfnckojmljzlmiynnvvvptxlplccqa` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 1,
  `uriFormat` text DEFAULT NULL,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zvhfmwymzjvnzrbnpxnrgizqritbodjamxiv` (`sectionId`,`siteId`),
  KEY `idx_mglzwrqmnebgtebqkcrkjlzovhodajhfellx` (`siteId`),
  CONSTRAINT `fk_kyvigwwfztpxypaeuhszgxcvfmvzvkttzyfr` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rvtkjcoqdeciwmwspcottnbfskuuwlwgehmo` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_salaepqfrlbkfsmhmtgnuxomvjfchpjmgjiy` (`uid`),
  KEY `idx_zuvknntuzlcwngvhwroqhopwxxdposuycixh` (`token`),
  KEY `idx_xumypbjvmvlrtdlgkpvmdkoircrrhgxzpksm` (`dateUpdated`),
  KEY `idx_datyrlkomknwhpfzcltvtczkqkyuxvxqweoa` (`userId`),
  CONSTRAINT `fk_ekgrklmsuvhnzftkdkryqzkdegvttimrgzbj` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_yokspwzdvseattptrfgmidalsxvhxflgdllj` (`userId`,`message`),
  CONSTRAINT `fk_udijvwlcngfmxxtixugpfmphuwbaxmkfbkug` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_alboqqattdiburptcwgwgdaoqnqthxehoctg` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` varchar(255) NOT NULL DEFAULT 'true',
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT 0,
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_oazrtixiadfprafmrytnjgmfrtryahiejeef` (`dateDeleted`),
  KEY `idx_kckapfiqyblbjvjhvhjlukposvxeojnhhxmt` (`handle`),
  KEY `idx_jqhyojiwtvyqfjhnlypsqnkoddrygvyorhma` (`sortOrder`),
  KEY `fk_nwdgphivdzodeeiynyzyoypfbkfkklsiurnm` (`groupId`),
  CONSTRAINT `fk_nwdgphivdzodeeiynyzyoypfbkfkklsiurnm` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kiiguppxfdrkttmvnqtmxgnveofphcgwlddx` (`structureId`,`elementId`),
  KEY `idx_kcunnbvuphwqzwitgahvqkdcpntvhypnuaqx` (`root`),
  KEY `idx_iibekjugscgwsrpaxqjiciqowduwlpdmjzhw` (`lft`),
  KEY `idx_mqngxciuqrudhspgmghmdliwststngpsgdsu` (`rgt`),
  KEY `idx_vmseshwkzqispisuevqbqmougmfieziriemp` (`level`),
  KEY `idx_ziwuqmmfqkpvguszymfqqdmsfnfyvnpiehdk` (`elementId`),
  CONSTRAINT `fk_ttzzrbxrsrstwynxpnhlhlilixgfbiygbbzr` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jcaeoysxexyhidxcemlvrdrcprxbzaqfotas` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_udvianhtwjzynddzaveklqgyyzcmtwymxlht` (`key`,`language`),
  KEY `idx_dzmcrawrcxvihxzvikxsimgkjkyogpaobnia` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_jujuedgxxnpbwruzqqupmiajgptqajghsrbi` (`name`),
  KEY `idx_qrwyxrjgnrzyhjpcnfxuukcbxbduxpkpclmk` (`handle`),
  KEY `idx_hhfrlmxgqlmztidywoaxurqdyegpmklmbygp` (`dateDeleted`),
  KEY `fk_yigcppngyvayaiqmcgmvenadoownydqecrei` (`fieldLayoutId`),
  CONSTRAINT `fk_yigcppngyvayaiqmcgmvenadoownydqecrei` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_siijhmyznjinsyssjuqutwydpdzxcbqzevrf` (`groupId`),
  CONSTRAINT `fk_kliyxagndddpiyzwfrtxpsgvlookulxmvfck` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kvwaxotoiptcktltnroakdgcdnpnntnyguqh` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) NOT NULL,
  `route` text DEFAULT NULL,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dbqogggvwcybsbfvegixrxyxpvudafiosyup` (`token`),
  KEY `idx_onidxmbheallonrxgikfbflidvfkhjnanjgj` (`expiryDate`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_urlamtjpjwwemwmdxuvkuhifeduxcmggccrh` (`handle`),
  KEY `idx_wayqzjfglbvqgolcalsuxutsynrrhdzlxild` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_izrtwbzyofwucqxdceauzxqtannmlrwocykp` (`groupId`,`userId`),
  KEY `idx_fdaafxunhcpkujfmxzwritctsstzftyvgsma` (`userId`),
  CONSTRAINT `fk_qodbkjggoeplayeisslcyzhoxrymxpoaygsa` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yhdyddaesweinafdeivjmmzefnpqucpmfudp` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_iioeojowxyqmgollifkynfwtjelxpsqodkpm` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_zrokuqrlagozmqqkftvtjovggxvhnekiseto` (`permissionId`,`groupId`),
  KEY `idx_fhysdpmadvxhdtuvxreacxwpudpilnhdbdkz` (`groupId`),
  CONSTRAINT `fk_owaqxernwmhiyzoplxdeyvaxvjifezefapjn` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wewhrsckjqvvneseczccmanvnnnzpqvhleiz` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_sagmwhdkctdhtcidtqbxzlwqknhfkiegskut` (`permissionId`,`userId`),
  KEY `idx_lmwhugbdriorlplcwqzuvquvxleolditvjki` (`userId`),
  CONSTRAINT `fk_bjkfpnsadjooflnzvyopxgbmlqlnhtmmtxvy` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vetrolcpivdanwmbddomezkapozhwbbcruus` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_dnsofnlrgscnrevcisttegpglfhqadibndpm` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `pending` tinyint(1) NOT NULL DEFAULT 0,
  `locked` tinyint(1) NOT NULL DEFAULT 0,
  `suspended` tinyint(1) NOT NULL DEFAULT 0,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `username` varchar(255) DEFAULT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT 0,
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT 0,
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_kvnbkmxmfbqjytzzakbjtxqzxmwzpgssxztw` (`active`),
  KEY `idx_sroklnzuqrkjkeluzyrsplhrqadrwwyimawg` (`locked`),
  KEY `idx_lbraxbcgkeewpxrichytagwglcedbhnmsqme` (`pending`),
  KEY `idx_xvmdalyyhwyqoajwrlhbryyndbotjuxoflkr` (`suspended`),
  KEY `idx_kvlpajwpmisgvwvvamxewryvltxjortpuppp` (`verificationCode`),
  KEY `idx_tityxajxilvbvqmnryxnpfrxbeldzgkexizt` (`email`),
  KEY `idx_qzpojspxnirzrfudrsledvgdjgkcrjzggfts` (`username`),
  KEY `fk_xemickgqxvvwslwykuxxwdixtvqadgnvmpir` (`photoId`),
  CONSTRAINT `fk_uwexifwgtftxpagshxortxpmffokbsoujugb` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xemickgqxvvwslwykuxxwdixtvqadgnvmpir` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_noedxpvvacjnfmdtpiwuiwhxcshgrpccercd` (`name`,`parentId`,`volumeId`),
  KEY `idx_oprkrrbnjxsztsnmkhwwcwlbutzjldybuzhc` (`parentId`),
  KEY `idx_aquiakswqifsqjwuuocsgwknmzidbaqqmskd` (`volumeId`),
  CONSTRAINT `fk_bywffwfwmtcpytjbokgogjhzrnwaueqydros` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_dagojkhflpcsljfrphcithhtdvfjyowjticj` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fs` varchar(255) NOT NULL,
  `transformFs` varchar(255) DEFAULT NULL,
  `transformSubpath` varchar(255) DEFAULT NULL,
  `titleTranslationMethod` varchar(255) NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_axgpwijfijxbfbcwetjwbkxnnerckheppprd` (`name`),
  KEY `idx_mhjgwoqmbokupdactphazydgtyqexbyglxgu` (`handle`),
  KEY `idx_fxbfpgfrmpukgtwonhhluuydurwvsspiktnd` (`fieldLayoutId`),
  KEY `idx_zeyryxbbhaprlfmprdsbamlsrgvvrouocjyn` (`dateDeleted`),
  CONSTRAINT `fk_tpjaqgjbtpeksjwjjcahllwpgdngxebaweor` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 1,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rkqhqwxerhjqrbuavsvbuozuodkjbbkyxdvg` (`userId`),
  CONSTRAINT `fk_hfratxvlbdojbchbescyepmqoeprhntxgnfc` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-13  7:03:03
-- MariaDB dump 10.19  Distrib 10.5.18-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: db    Database: db
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB-1:10.4.28+maria~ubu2004-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assetindexingsessions`
--

LOCK TABLES `assetindexingsessions` WRITE;
/*!40000 ALTER TABLE `assetindexingsessions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assetindexingsessions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `assets` VALUES (30,1,3,NULL,'315662-org.jpg','image',NULL,1575,2362,495020,NULL,NULL,NULL,'2023-06-11 14:35:02','2023-06-11 14:35:02','2023-06-11 14:35:02'),(31,2,6,11,'flower-field-250016_1920.jpg','image',NULL,1920,1389,1046549,NULL,NULL,NULL,'2023-06-11 14:35:41','2023-06-11 14:35:41','2023-06-11 14:35:41'),(45,2,2,11,'penguin-1719608_1920.jpg','image',NULL,1920,1280,455175,NULL,NULL,NULL,'2023-06-12 08:32:25','2023-06-12 08:32:25','2023-06-12 08:32:25'),(50,2,6,11,'munich-1220908.jpg','image',NULL,1920,1372,899203,NULL,NULL,NULL,'2023-06-12 08:52:51','2023-06-12 08:52:51','2023-06-12 08:52:51'),(53,2,6,11,'germany-4055578_1920.jpg','image',NULL,1920,1279,859675,NULL,NULL,NULL,'2023-06-12 09:02:05','2023-06-12 09:02:05','2023-06-12 09:02:05');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedattributes` VALUES (11,1,'firstName','2023-06-11 15:22:11',0,11),(11,1,'fullName','2023-06-11 15:22:11',0,11),(11,1,'lastName','2023-06-11 15:22:11',0,11),(11,1,'photoId','2023-06-11 14:35:02',0,11),(26,1,'slug','2023-06-11 14:31:41',1,NULL),(26,1,'uri','2023-06-11 14:31:41',1,NULL),(26,2,'slug','2023-06-11 14:31:41',0,NULL),(26,2,'title','2023-06-11 14:31:41',0,NULL),(26,2,'uri','2023-06-11 14:31:41',0,NULL),(35,1,'postDate','2023-06-11 14:55:50',1,11),(35,1,'slug','2023-06-11 14:47:20',1,11),(35,1,'title','2023-06-11 14:47:20',1,11),(35,1,'uri','2023-06-11 14:47:20',1,11),(35,2,'postDate','2023-06-11 14:55:50',0,11),(35,2,'slug','2023-06-11 14:47:20',0,11),(35,2,'title','2023-06-11 14:47:20',0,11),(35,2,'uri','2023-06-11 14:47:20',0,11);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES (1,1,1,'2023-06-12 08:29:08',0,11),(1,2,1,'2023-06-12 08:29:08',0,11),(4,1,1,'2023-06-12 08:53:25',0,11),(4,1,4,'2023-06-11 14:31:41',0,NULL),(4,1,5,'2023-06-11 14:31:41',0,NULL),(4,2,1,'2023-06-12 08:53:25',0,11),(4,2,4,'2023-06-11 14:31:41',1,NULL),(4,2,5,'2023-06-11 14:31:41',1,NULL),(12,1,1,'2023-06-11 14:36:25',0,11),(12,2,1,'2023-06-11 14:36:25',0,11),(35,1,1,'2023-06-12 09:02:49',0,11),(35,1,3,'2023-06-11 14:55:50',1,11),(35,2,1,'2023-06-12 09:02:49',0,11),(35,2,3,'2023-06-11 14:49:24',0,11),(36,1,12,'2023-06-11 14:47:32',0,11),(37,1,12,'2023-06-11 14:49:07',0,11),(37,2,12,'2023-06-11 14:49:07',0,11);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `content` VALUES (1,1,1,'Home','2023-06-11 14:31:23','2023-06-12 08:29:08','a04896c4-dcd0-4e11-9aab-23c5a121224a',NULL,NULL,NULL),(2,1,2,'Home','2023-06-11 14:31:23','2023-06-12 08:29:08','14809664-948b-4553-87d3-793884249e55',NULL,NULL,NULL),(3,2,1,'Home','2023-06-11 14:31:23','2023-06-11 14:31:23','b15723b6-fde5-48c8-853f-53cabee16806',NULL,NULL,NULL),(4,2,2,'Home','2023-06-11 14:31:23','2023-06-11 14:31:23','37cb8086-1f13-4484-906a-f437818789a7',NULL,NULL,NULL),(5,3,2,'Home','2023-06-11 14:31:23','2023-06-11 14:31:23','6ea967f3-1f9d-4960-ab6b-0db89a745e48',NULL,NULL,NULL),(6,3,1,'Home','2023-06-11 14:31:23','2023-06-11 14:31:23','39ae4a7d-3af8-4d3c-8dbd-740f243da5d2',NULL,NULL,NULL),(7,4,1,'Site Info - Global Settings','2023-06-11 14:31:23','2023-06-12 08:53:25','3c8fa468-1ce8-425f-b99a-66f8f07b114f',NULL,'The Tutorial Inc.','Craft Tutorial'),(8,4,2,'Site Info - Global Settings','2023-06-11 14:31:23','2023-06-12 08:53:25','95780688-c305-425b-b027-fcb4338014cd',NULL,'The Tutorial Inc.','Craft Tutorial'),(9,5,1,'Site Info - Global Settings','2023-06-11 14:31:23','2023-06-11 14:31:23','07ed312e-4117-4e88-9d87-3ecddbadec7b',NULL,NULL,NULL),(10,5,2,'Site Info - Global Settings','2023-06-11 14:31:23','2023-06-11 14:31:23','96e23b78-7d4d-440c-bd92-9c158013d9fc',NULL,NULL,NULL),(11,6,1,'Site Info - Global Settings','2023-06-11 14:31:23','2023-06-11 14:31:23','8530c6ab-a734-469b-892c-07f6020a0ce6',NULL,NULL,NULL),(12,6,2,'Site Info - Global Settings','2023-06-11 14:31:23','2023-06-11 14:31:23','5293add0-fa3a-44ae-b7cc-daf7069c19fc',NULL,NULL,NULL),(13,7,1,'Home','2023-06-11 14:31:24','2023-06-11 14:31:24','c4b143ee-2e82-4b48-820b-f19fadee9032',NULL,NULL,NULL),(14,7,2,'Home','2023-06-11 14:31:24','2023-06-11 14:31:24','7b246af6-a5ea-42d0-8930-f1a7bc76adcb',NULL,NULL,NULL),(15,8,1,'Home','2023-06-11 14:31:24','2023-06-11 14:31:24','c2855f87-a3af-465a-80a5-24cee3b8d4c2',NULL,NULL,NULL),(16,8,2,'Home','2023-06-11 14:31:24','2023-06-11 14:31:24','f7e1dfd2-56fa-4fb5-8e07-aa0827114ea3',NULL,NULL,NULL),(17,9,1,'Site Info - Global Settings','2023-06-11 14:31:24','2023-06-11 14:31:24','cefe58f6-e9b6-43eb-ac18-501aeb3244c3',NULL,NULL,NULL),(18,9,2,'Site Info - Global Settings','2023-06-11 14:31:24','2023-06-11 14:31:24','055f9fb1-d6cb-4f5f-8d1d-ab46c87c3993',NULL,NULL,NULL),(19,10,1,'Site Info - Global Settings','2023-06-11 14:31:24','2023-06-11 14:31:24','3dda17c6-1779-4e3c-a0f1-3f03fe7919e8',NULL,NULL,NULL),(20,10,2,'Site Info - Global Settings','2023-06-11 14:31:24','2023-06-11 14:31:24','7268a0dd-c488-48b6-adbd-a24ba6c7b67d',NULL,NULL,NULL),(21,11,1,NULL,'2023-06-11 14:31:24','2023-06-11 15:22:11','3fa80741-b01d-4fa5-9417-896ecf3f60b7',NULL,NULL,NULL),(22,12,1,'Do These Five Things in an Elevator','2023-06-11 14:31:40','2023-06-11 14:36:25','4405a607-82ab-40e5-a0b4-a2cf5fd48d13',NULL,NULL,NULL),(23,12,2,'Do These Five Things in an Elevator','2023-06-11 14:31:40','2023-06-11 14:36:25','5a41d3f6-0095-49b3-8625-27bbaca8329f',NULL,NULL,NULL),(24,14,1,'Do These Five Things in an Elevator','2023-06-11 14:31:40','2023-06-11 14:31:40','ae9ca091-9bf7-4a28-826f-c4359f3a9486',NULL,NULL,NULL),(25,14,2,'Do These Five Things in an Elevator','2023-06-11 14:31:40','2023-06-11 14:31:40','314bd864-9f1b-4dc3-be28-e523ea27b933',NULL,NULL,NULL),(26,16,1,'Use This Trick to Save Money Dining Out','2023-06-11 14:31:40','2023-06-11 14:31:40','cdf9faf5-048b-46ab-a10e-c42a4a10fbef',NULL,NULL,NULL),(27,16,2,'Use This Trick to Save Money Dining Out','2023-06-11 14:31:40','2023-06-11 14:31:40','a07fa98b-c304-42b0-a201-ff612c56031c',NULL,NULL,NULL),(28,18,1,'Use This Trick to Save Money Dining Out','2023-06-11 14:31:40','2023-06-11 14:31:40','618394a1-206b-4773-aadf-0e05d0e39b95',NULL,NULL,NULL),(29,18,2,'Use This Trick to Save Money Dining Out','2023-06-11 14:31:40','2023-06-11 14:31:40','ec57b845-99a9-478f-9138-acb210799032',NULL,NULL,NULL),(30,20,1,'Don’t Leave Home Without This Quote','2023-06-11 14:31:41','2023-06-11 14:31:41','00eb6915-7ac5-4650-9f0d-1d1916e74900',NULL,NULL,NULL),(31,20,2,'Don’t Leave Home Without This Quote','2023-06-11 14:31:41','2023-06-11 14:31:41','55f6d042-42cb-4026-8223-48ac2f9287a0',NULL,NULL,NULL),(32,23,1,'Don’t Leave Home Without This Quote','2023-06-11 14:31:41','2023-06-11 14:31:41','1628db5b-34cb-45a5-969a-aebe30a22902',NULL,NULL,NULL),(33,23,2,'Don’t Leave Home Without This Quote','2023-06-11 14:31:41','2023-06-11 14:31:41','75fe1862-16db-414c-ab12-83ac05514163',NULL,NULL,NULL),(34,26,2,'Beiträge','2023-06-11 14:31:41','2023-06-11 14:31:41','a26e7254-29e2-4d0c-8e6d-0858d5b6adac',NULL,NULL,NULL),(35,26,1,'Posts','2023-06-11 14:31:41','2023-06-11 14:31:41','b55a934b-e01f-495f-83f4-5aaf0a9b1c92',NULL,NULL,NULL),(36,27,2,'Posts','2023-06-11 14:31:41','2023-06-11 14:31:41','533434cd-207a-4cb4-b845-1d9833a16f00',NULL,NULL,NULL),(37,27,1,'Posts','2023-06-11 14:31:41','2023-06-11 14:31:41','8105c292-ecd4-4d27-b7ba-caee55a4c4f4',NULL,NULL,NULL),(38,28,2,'Beiträge','2023-06-11 14:31:41','2023-06-11 14:31:41','5360b0a2-f2bd-43a9-bfdd-a40995b42502',NULL,NULL,NULL),(39,28,1,'Posts','2023-06-11 14:31:41','2023-06-11 14:31:41','bd3bd93a-0196-4ab3-9fb6-56b9cd06c562',NULL,NULL,NULL),(40,29,1,'Site Info - Global Settings','2023-06-11 14:31:41','2023-06-11 14:31:41','81ca2d4e-8af9-40fa-92db-d75167939068',NULL,'The Tutorial Inc.','Craft Tutorial'),(41,29,2,'Site Info - Global Settings','2023-06-11 14:31:41','2023-06-11 14:31:41','31591d99-e43a-4042-8329-bffa1b850c72',NULL,'The Tutorial Inc.','Craft Tutorial'),(42,30,1,'315662 org','2023-06-11 14:35:02','2023-06-11 14:35:02','cdd32aec-a814-4a47-80fd-60092dfac3d9',NULL,NULL,NULL),(43,30,2,'315662 org','2023-06-11 14:35:02','2023-06-11 14:35:02','411184f0-c501-4350-82a0-3910d0fcd2e5',NULL,NULL,NULL),(44,31,1,'Flower field 250016 1920','2023-06-11 14:35:41','2023-06-11 14:36:22','c1d2cfee-1ef8-4b1f-9cf1-7020f8be5ea6','Flower field in front of a forest',NULL,NULL),(45,31,2,'Flower field 250016 1920','2023-06-11 14:35:41','2023-06-11 14:36:22','4eb5a512-bf94-4624-96cf-7caa15590210','Blumenfeld vor einem Wald',NULL,NULL),(48,33,2,'Do These Five Things in an Elevator','2023-06-11 14:36:25','2023-06-11 14:36:25','1afdd6b5-88ad-484c-9076-fe586c0c8a4d',NULL,NULL,NULL),(49,33,1,'Do These Five Things in an Elevator','2023-06-11 14:36:25','2023-06-11 14:36:25','a8a0e884-1826-4001-be3a-d4772818c2eb',NULL,NULL,NULL),(50,35,2,'Mein erster Beitrag','2023-06-11 14:47:10','2023-06-12 09:02:49','2e302019-4005-4c38-921b-819d74382594',NULL,NULL,NULL),(51,35,1,'Mein erster Beitrag','2023-06-11 14:47:10','2023-06-12 09:02:49','8c6e4509-8272-42ca-972a-cb86792e74c4',NULL,NULL,NULL),(52,40,2,'Mein erster Beitrag','2023-06-11 14:55:50','2023-06-11 14:55:50','9329a0af-b416-4b52-97d9-75e1b07f5e7f',NULL,NULL,NULL),(53,40,1,'Mein erster Beitrag','2023-06-11 14:55:50','2023-06-11 14:55:50','1f037b6b-a646-410a-9d19-e6de10a7c761',NULL,NULL,NULL),(56,44,1,'Home','2023-06-12 08:29:08','2023-06-12 08:29:08','8b4e6b66-f585-42ee-b574-bb3d66619d49',NULL,NULL,NULL),(57,44,2,'Home','2023-06-12 08:29:08','2023-06-12 08:29:08','880ee694-8a64-4889-869e-9d799e8acefc',NULL,NULL,NULL),(58,45,1,'Penguin 1719608 1920','2023-06-12 08:32:25','2023-06-12 08:32:25','529b8171-996c-4b56-895b-a998949af02d',NULL,NULL,NULL),(59,45,2,'Penguin 1719608 1920','2023-06-12 08:32:25','2023-06-12 08:32:25','c3ca7225-ff3e-4e61-a904-3ca36c487b42',NULL,NULL,NULL),(60,46,1,'Site Info - Global Settings','2023-06-12 08:51:30','2023-06-12 08:51:30','e98b39c9-ae95-4a08-ad70-441294b463d9',NULL,'The Tutorial Inc.','Craft Tutorial'),(61,46,2,'Site Info - Global Settings','2023-06-12 08:51:30','2023-06-12 08:51:30','c0a8bf66-a16f-4b92-9f8d-1c1323fb4ca0',NULL,'The Tutorial Inc.','Craft Tutorial'),(64,48,1,'Site Info - Global Settings','2023-06-12 08:51:42','2023-06-12 08:51:42','759e77ff-524b-45ab-9aa6-7267246416ec',NULL,'The Tutorial Inc.','Craft Tutorial'),(65,48,2,'Site Info - Global Settings','2023-06-12 08:51:42','2023-06-12 08:51:42','0c171166-8dd1-4294-b826-5d23b0e40253',NULL,'The Tutorial Inc.','Craft Tutorial'),(68,50,1,'Munich 1220908','2023-06-12 08:52:50','2023-06-12 08:53:23','cdf8c684-e945-46cc-9c24-1c21cb3923b5','Fun',NULL,NULL),(69,50,2,'Munich 1220908','2023-06-12 08:52:51','2023-06-12 08:53:23','597384c5-42fb-42ce-b910-4e1a59f29090','Kettenkarussell',NULL,NULL),(70,51,2,'Site Info - Global Settings','2023-06-12 08:53:25','2023-06-12 08:53:25','b81cc638-45ef-49de-b44e-5fbc4cd20682',NULL,'The Tutorial Inc.','Craft Tutorial'),(71,51,1,'Site Info - Global Settings','2023-06-12 08:53:25','2023-06-12 08:53:25','409d3dae-9d62-4a60-8d57-f1eb2ed39929',NULL,'The Tutorial Inc.','Craft Tutorial'),(74,53,1,'Germany 4055578 1920','2023-06-12 09:02:05','2023-06-12 09:02:47','4984e131-0d6f-41b8-80b6-ab2e1c39e098','Eibsee',NULL,NULL),(75,53,2,'Germany 4055578 1920','2023-06-12 09:02:05','2023-06-12 09:02:47','dfdf711d-2251-43ec-b3ac-4210aa06caa1','Eibsee',NULL,NULL),(76,54,1,'Mein erster Beitrag','2023-06-12 09:02:49','2023-06-12 09:02:49','a19a69f6-c2d0-4e7a-a3a1-454617e78d35',NULL,NULL,NULL),(77,54,2,'Mein erster Beitrag','2023-06-12 09:02:49','2023-06-12 09:02:49','aca774b3-44d4-4f53-9c8b-0e8ab9d9d507',NULL,NULL,NULL);
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2023-06-11 14:31:23','2023-06-12 08:29:08',NULL,NULL,'92666341-0ce4-4e75-b08d-3933b344ade5'),(2,1,NULL,1,3,'craft\\elements\\Entry',1,0,'2023-06-11 14:31:23','2023-06-11 14:31:23',NULL,NULL,'f0793aeb-8f97-42a1-a053-9c7cc118bd8c'),(3,1,NULL,2,3,'craft\\elements\\Entry',1,0,'2023-06-11 14:31:23','2023-06-11 14:31:23',NULL,NULL,'11622f0d-5a8c-4f7c-913f-8b517bef033c'),(4,NULL,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2023-06-11 14:31:23','2023-06-12 08:53:25',NULL,NULL,'0c6a3b90-ce96-4856-85a5-7f6fb9d90d49'),(5,4,NULL,3,7,'craft\\elements\\Entry',1,0,'2023-06-11 14:31:23','2023-06-11 14:31:23',NULL,NULL,'f38adf99-b983-4920-8d75-dff4fe291a30'),(6,4,NULL,4,7,'craft\\elements\\Entry',1,0,'2023-06-11 14:31:23','2023-06-11 14:31:23',NULL,NULL,'eb57df95-b1e2-4d52-8143-5ee29f25840e'),(7,1,NULL,5,3,'craft\\elements\\Entry',1,0,'2023-06-11 14:31:24','2023-06-11 14:31:24',NULL,NULL,'919d22cc-6a04-4685-9791-f4baefd8eb46'),(8,1,NULL,6,3,'craft\\elements\\Entry',1,0,'2023-06-11 14:31:24','2023-06-11 14:31:24',NULL,NULL,'7448327b-bebe-45d6-aeb3-f679dc25f2ac'),(9,4,NULL,7,7,'craft\\elements\\Entry',1,0,'2023-06-11 14:31:24','2023-06-11 14:31:24',NULL,NULL,'99dcc3c2-918b-448e-b71f-692dc495794e'),(10,4,NULL,8,7,'craft\\elements\\Entry',1,0,'2023-06-11 14:31:24','2023-06-11 14:31:24',NULL,NULL,'7a74f1fe-45e6-49d6-87c3-3e2fde955cd9'),(11,NULL,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2023-06-11 14:31:24','2023-06-11 15:22:11',NULL,NULL,'0e587de9-dafa-4451-8918-754ecb6c5c9b'),(12,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2023-06-11 14:31:40','2023-06-11 14:36:25',NULL,NULL,'2054acb6-bab2-42ef-b47e-a5dadf3c8751'),(13,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-06-11 14:31:40','2023-06-11 14:31:40',NULL,NULL,'3e87113b-1cf0-4a6b-93be-407bd46cacde'),(14,12,NULL,9,4,'craft\\elements\\Entry',1,0,'2023-06-11 14:31:40','2023-06-11 14:31:40',NULL,NULL,'ccc03914-1b56-4ca0-8a00-1dc1a2d53fd8'),(15,13,NULL,10,11,'craft\\elements\\MatrixBlock',1,0,'2023-06-11 14:31:40','2023-06-11 14:31:40',NULL,NULL,'d756fd79-5847-4130-bd19-8108af572cc9'),(16,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2023-06-11 14:31:40','2023-06-11 14:31:40',NULL,NULL,'c9fe158f-6e90-4e1d-a3a2-9df5b85c49b1'),(17,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-06-11 14:31:40','2023-06-11 14:31:40',NULL,NULL,'bed2616a-1635-41ab-ad5a-ca6e3336216b'),(18,16,NULL,11,4,'craft\\elements\\Entry',1,0,'2023-06-11 14:31:40','2023-06-11 14:31:40',NULL,NULL,'5c973b4f-6b97-4da4-b1a5-063f907e0b18'),(19,17,NULL,12,11,'craft\\elements\\MatrixBlock',1,0,'2023-06-11 14:31:40','2023-06-11 14:31:40',NULL,NULL,'90415589-f6e5-4a34-934f-dfde6c151537'),(20,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2023-06-11 14:31:41','2023-06-11 14:31:41',NULL,NULL,'f5a8c62f-5cee-44a2-bd8c-ab8f48814728'),(21,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-06-11 14:31:41','2023-06-11 14:31:41',NULL,NULL,'b8c1acff-f941-4d4c-9eac-f95399cbd283'),(22,NULL,NULL,NULL,8,'craft\\elements\\MatrixBlock',1,0,'2023-06-11 14:31:41','2023-06-11 14:31:41',NULL,NULL,'7bfff729-4cdf-4dad-b99c-316fb9776774'),(23,20,NULL,13,4,'craft\\elements\\Entry',1,0,'2023-06-11 14:31:41','2023-06-11 14:31:41',NULL,NULL,'1cba8582-4f59-42b9-963b-ea7bd3906670'),(24,21,NULL,14,11,'craft\\elements\\MatrixBlock',1,0,'2023-06-11 14:31:41','2023-06-11 14:31:41',NULL,NULL,'7cccf5c1-d44f-4e76-932e-640ab660dff1'),(25,22,NULL,15,8,'craft\\elements\\MatrixBlock',1,0,'2023-06-11 14:31:41','2023-06-11 14:31:41',NULL,NULL,'c4aec2cc-2877-46f6-82bc-3c00ded7dad3'),(26,NULL,NULL,NULL,6,'craft\\elements\\Entry',1,0,'2023-06-11 14:31:41','2023-06-11 14:31:41',NULL,NULL,'f1a270b8-e667-445f-8309-f9dc33e2e84e'),(27,26,NULL,16,6,'craft\\elements\\Entry',1,0,'2023-06-11 14:31:41','2023-06-11 14:31:41',NULL,NULL,'9dd48b93-0253-4699-95d1-50d55775a434'),(28,26,NULL,17,6,'craft\\elements\\Entry',1,0,'2023-06-11 14:31:41','2023-06-11 14:31:41',NULL,NULL,'6b7740f8-1ffb-4163-aa37-dc4f88aa9bba'),(29,4,NULL,18,7,'craft\\elements\\Entry',1,0,'2023-06-11 14:31:41','2023-06-11 14:31:41',NULL,NULL,'a6c3b517-51bc-4b75-9163-b6ac69ec3e00'),(30,NULL,NULL,NULL,1,'craft\\elements\\Asset',1,0,'2023-06-11 14:35:02','2023-06-11 14:35:02',NULL,NULL,'86fbc179-f186-42f8-81e4-16526e9c5694'),(31,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-06-11 14:35:41','2023-06-11 14:36:22',NULL,NULL,'f6ca5f57-bcf3-4806-ab8b-ab7bc3f6ff94'),(33,12,NULL,19,4,'craft\\elements\\Entry',1,0,'2023-06-11 14:36:25','2023-06-11 14:36:25',NULL,NULL,'7da96dc1-af45-45da-8c2a-ce9bec564db2'),(34,13,NULL,20,11,'craft\\elements\\MatrixBlock',1,0,'2023-06-11 14:31:40','2023-06-11 14:36:25',NULL,NULL,'7f50df9b-0db9-4d3a-bf69-fa221c57f400'),(35,NULL,NULL,NULL,4,'craft\\elements\\Entry',1,0,'2023-06-11 14:47:10','2023-06-12 09:02:49',NULL,NULL,'43fb8e55-23d4-4e34-af5f-993aa9380ebc'),(36,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-06-11 14:47:32','2023-06-11 14:47:32',NULL,'2023-06-11 14:47:36','37a1a3ec-d0fa-4eef-a0f8-1df205912265'),(37,NULL,NULL,NULL,10,'craft\\elements\\MatrixBlock',1,0,'2023-06-11 14:47:36','2023-06-11 14:49:07',NULL,NULL,'26da6c5e-966c-4848-898b-63a48f7e1792'),(38,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-06-11 14:49:20','2023-06-11 14:49:20',NULL,'2023-06-11 14:49:24','3f5731a7-e10c-4682-bd13-150f246f2d43'),(39,NULL,NULL,NULL,11,'craft\\elements\\MatrixBlock',1,0,'2023-06-11 14:49:24','2023-06-11 14:49:24',NULL,NULL,'d1dd292e-3346-4929-9581-6f65d7f8d328'),(40,35,NULL,21,4,'craft\\elements\\Entry',1,0,'2023-06-11 14:55:50','2023-06-11 14:55:50',NULL,NULL,'32829877-405c-4e7e-b51e-e07840b81a8c'),(41,37,NULL,22,10,'craft\\elements\\MatrixBlock',1,0,'2023-06-11 14:49:07','2023-06-11 14:55:50',NULL,NULL,'ac583d3e-6710-4670-b948-ff711c342b8c'),(42,39,NULL,23,11,'craft\\elements\\MatrixBlock',1,0,'2023-06-11 14:49:24','2023-06-11 14:55:50',NULL,NULL,'19cefa16-bd17-4bd6-ada1-19c08dedf69f'),(44,1,NULL,24,3,'craft\\elements\\Entry',1,0,'2023-06-12 08:29:08','2023-06-12 08:29:08',NULL,NULL,'a27d43df-c3be-4e3c-aea6-12c36ab23ef5'),(45,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-06-12 08:32:25','2023-06-12 08:32:25',NULL,NULL,'ff11528c-355d-4738-8da5-6a86c5a7b894'),(46,4,NULL,25,7,'craft\\elements\\Entry',1,0,'2023-06-12 08:51:30','2023-06-12 08:51:30',NULL,NULL,'5889a221-da94-4ca3-9ef3-7db341411741'),(48,4,NULL,26,7,'craft\\elements\\Entry',1,0,'2023-06-12 08:51:42','2023-06-12 08:51:42',NULL,NULL,'792b5ed4-f500-4abb-9c18-53ed2e84a199'),(50,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-06-12 08:52:50','2023-06-12 08:53:23',NULL,NULL,'94cb5d24-3fcb-4ca1-b07d-ec7f2bf4e86d'),(51,4,NULL,27,7,'craft\\elements\\Entry',1,0,'2023-06-12 08:53:25','2023-06-12 08:53:25',NULL,NULL,'fa6702f2-97a2-4d65-9436-9bb37882b790'),(53,NULL,NULL,NULL,2,'craft\\elements\\Asset',1,0,'2023-06-12 09:02:05','2023-06-12 09:02:47',NULL,NULL,'70fcad67-7277-4bff-ace7-de26492169e8'),(54,35,NULL,28,4,'craft\\elements\\Entry',1,0,'2023-06-12 09:02:49','2023-06-12 09:02:49',NULL,NULL,'efb24325-0417-4d36-8190-38a587165db6'),(55,37,NULL,29,10,'craft\\elements\\MatrixBlock',1,0,'2023-06-11 14:49:07','2023-06-12 09:02:49',NULL,NULL,'1514d7d8-2182-4664-9ff8-73d2339d503f'),(56,39,NULL,30,11,'craft\\elements\\MatrixBlock',1,0,'2023-06-11 14:49:24','2023-06-12 09:02:49',NULL,NULL,'3f107413-616e-4029-b0de-9950f10ca707');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,'home','__home__',1,'2023-06-11 14:31:23','2023-06-11 14:31:23','3f6c1e1b-a076-4380-af01-3f2e87ec9b18'),(2,1,2,'home','__home__',1,'2023-06-11 14:31:23','2023-06-11 14:31:23','cac1816f-d6b5-4efa-afa1-519804bda321'),(3,2,1,'home','__home__',1,'2023-06-11 14:31:23','2023-06-11 14:31:23','7d3d7d2c-933c-4c5a-8a05-1e638e98bc8f'),(4,2,2,'home','__home__',1,'2023-06-11 14:31:23','2023-06-11 14:31:23','0ebc1e33-6b06-4b2e-81a4-0c8e346428e6'),(5,3,2,'home','__home__',1,'2023-06-11 14:31:23','2023-06-11 14:31:23','821137e8-4ef4-4659-88e0-f4a23cbe64e0'),(6,3,1,'home','__home__',1,'2023-06-11 14:31:23','2023-06-11 14:31:23','c449ed66-b437-4e61-aaf4-99d68ba96ecb'),(7,4,1,'site-info-global-settings',NULL,1,'2023-06-11 14:31:23','2023-06-11 14:31:23','3da5121a-f61f-4a34-a00f-65fd66a40e7d'),(8,4,2,'site-info-global-settings',NULL,1,'2023-06-11 14:31:23','2023-06-11 14:31:23','d1e6fa45-41d3-4b19-b06a-606a2afbee60'),(9,5,1,'site-info-global-settings',NULL,1,'2023-06-11 14:31:23','2023-06-11 14:31:23','1e888661-cfd6-4433-80bd-fc3c59c35555'),(10,5,2,'site-info-global-settings',NULL,1,'2023-06-11 14:31:23','2023-06-11 14:31:23','ef5f8ed2-5b1c-42a8-93c6-f2016fec58f8'),(11,6,1,'site-info-global-settings',NULL,1,'2023-06-11 14:31:23','2023-06-11 14:31:23','82cfa3fc-fa93-44a6-93a3-6ad8c3501434'),(12,6,2,'site-info-global-settings',NULL,1,'2023-06-11 14:31:23','2023-06-11 14:31:23','03d2845e-9d93-49a1-9503-a20e23cf303a'),(13,7,1,'home','__home__',1,'2023-06-11 14:31:24','2023-06-11 14:31:24','679ae298-60a2-436b-8779-a3c800f1bde3'),(14,7,2,'home','__home__',1,'2023-06-11 14:31:24','2023-06-11 14:31:24','34e5e76e-5fc2-4669-b394-d8d44e43b889'),(15,8,1,'home','__home__',1,'2023-06-11 14:31:24','2023-06-11 14:31:24','9a1c558a-f9f6-48bd-b815-a6f3d3b6c05e'),(16,8,2,'home','__home__',1,'2023-06-11 14:31:24','2023-06-11 14:31:24','ea082e30-2f08-40d7-8134-18bbb96837ba'),(17,9,1,'site-info-global-settings',NULL,1,'2023-06-11 14:31:24','2023-06-11 14:31:24','4b92f572-08be-4046-965f-a03241c52040'),(18,9,2,'site-info-global-settings',NULL,1,'2023-06-11 14:31:24','2023-06-11 14:31:24','cd50aa18-e899-4c25-8380-579ffa5c2aa0'),(19,10,1,'site-info-global-settings',NULL,1,'2023-06-11 14:31:24','2023-06-11 14:31:24','bbb7f059-5515-4bb1-a6bb-278107baff67'),(20,10,2,'site-info-global-settings',NULL,1,'2023-06-11 14:31:24','2023-06-11 14:31:24','24d302fa-7b37-4753-940f-5d5aabfb72a8'),(21,11,1,NULL,NULL,1,'2023-06-11 14:31:24','2023-06-11 14:31:24','36c2f210-198e-4c26-bda8-a16d106db943'),(22,12,1,'five-things-elevator','posts/five-things-elevator',1,'2023-06-11 14:31:40','2023-06-11 14:31:40','36bbec68-8415-4a06-9b67-203b4af43ec0'),(23,12,2,'five-things-elevator','beitraege/five-things-elevator',1,'2023-06-11 14:31:40','2023-06-11 14:31:40','c9e154fc-6eff-4c59-a77b-4f14ad80c203'),(24,13,1,NULL,NULL,1,'2023-06-11 14:31:40','2023-06-11 14:31:40','2569e68f-035d-4cd8-bc34-d514da8be2f0'),(25,13,2,NULL,NULL,1,'2023-06-11 14:31:40','2023-06-11 14:31:40','1d29d128-3e3b-4954-baf4-1c62a5329b2f'),(26,14,1,'five-things-elevator','posts/five-things-elevator',1,'2023-06-11 14:31:40','2023-06-11 14:31:40','302fa840-9ea6-44d9-96d9-2d4f221659bb'),(27,14,2,'five-things-elevator','beitraege/five-things-elevator',1,'2023-06-11 14:31:40','2023-06-11 14:31:40','35391f8c-c208-4ac4-ac51-e02cb1321a01'),(28,15,1,NULL,NULL,1,'2023-06-11 14:31:40','2023-06-11 14:31:40','fb125e6f-3f92-4a4a-91bc-08df34c9ffc6'),(29,15,2,NULL,NULL,1,'2023-06-11 14:31:40','2023-06-11 14:31:40','bc62a3df-50fa-4afe-ad10-65f03bfdb878'),(30,16,1,'trick-save-money-dining-out','posts/trick-save-money-dining-out',1,'2023-06-11 14:31:40','2023-06-11 14:31:40','af2a681f-352a-4360-9374-0d29233256a7'),(31,16,2,'trick-save-money-dining-out','beitraege/trick-save-money-dining-out',1,'2023-06-11 14:31:40','2023-06-11 14:31:40','9550ac69-230d-4788-8b10-8e204b79b050'),(32,17,1,NULL,NULL,1,'2023-06-11 14:31:40','2023-06-11 14:31:40','198d439c-9c65-4c77-ad16-8670fc96d0e2'),(33,17,2,NULL,NULL,1,'2023-06-11 14:31:40','2023-06-11 14:31:40','4dc5c865-feea-4719-9bc8-ca4dc2a312c9'),(34,18,1,'trick-save-money-dining-out','posts/trick-save-money-dining-out',1,'2023-06-11 14:31:40','2023-06-11 14:31:40','42364aa4-d8c0-4db5-811c-ba469a3e5000'),(35,18,2,'trick-save-money-dining-out','beitraege/trick-save-money-dining-out',1,'2023-06-11 14:31:40','2023-06-11 14:31:40','f247d58f-375c-46bd-a3e7-4c43a1fd1375'),(36,19,1,NULL,NULL,1,'2023-06-11 14:31:40','2023-06-11 14:31:40','ade597d9-42ae-4c3c-81d8-acf024a5571b'),(37,19,2,NULL,NULL,1,'2023-06-11 14:31:40','2023-06-11 14:31:40','ccda3b17-6a6a-4807-8df3-b577adb08890'),(38,20,1,'dont-leave-home-without-quote','posts/dont-leave-home-without-quote',1,'2023-06-11 14:31:41','2023-06-11 14:31:41','61e21979-06c9-470f-a412-ad152f1d2164'),(39,20,2,'dont-leave-home-without-quote','beitraege/dont-leave-home-without-quote',1,'2023-06-11 14:31:41','2023-06-11 14:31:41','9b9a7f62-8f02-42ff-83b4-ee1d393fcbd6'),(40,21,1,NULL,NULL,1,'2023-06-11 14:31:41','2023-06-11 14:31:41','eb309431-517c-4c4f-96fa-a38dfda1ebc9'),(41,21,2,NULL,NULL,1,'2023-06-11 14:31:41','2023-06-11 14:31:41','b788d04f-c298-4090-b1f1-ac3659309c81'),(42,22,1,NULL,NULL,1,'2023-06-11 14:31:41','2023-06-11 14:31:41','7b557f60-451e-41be-b79b-7c800d26b7aa'),(43,22,2,NULL,NULL,1,'2023-06-11 14:31:41','2023-06-11 14:31:41','f63fa1a3-48c2-4ee2-80c3-16b2b2ee605e'),(44,23,1,'dont-leave-home-without-quote','posts/dont-leave-home-without-quote',1,'2023-06-11 14:31:41','2023-06-11 14:31:41','777e16f3-f4c9-48b5-893e-ecabf9ba7634'),(45,23,2,'dont-leave-home-without-quote','beitraege/dont-leave-home-without-quote',1,'2023-06-11 14:31:41','2023-06-11 14:31:41','0703a551-843e-4a56-9306-b2a03e602acc'),(46,24,1,NULL,NULL,1,'2023-06-11 14:31:41','2023-06-11 14:31:41','b0a3317d-28d4-4097-9e7c-331d370c96bd'),(47,24,2,NULL,NULL,1,'2023-06-11 14:31:41','2023-06-11 14:31:41','d2ae938d-4efb-4ed4-a780-8a0ffbe4173f'),(48,25,1,NULL,NULL,1,'2023-06-11 14:31:41','2023-06-11 14:31:41','3df28bec-59a1-4026-9e18-9fa7a215f1db'),(49,25,2,NULL,NULL,1,'2023-06-11 14:31:41','2023-06-11 14:31:41','76defe6d-e035-4404-a98e-09f9c8b501ee'),(50,26,2,'beitraege','beitraege',1,'2023-06-11 14:31:41','2023-06-11 14:32:05','e40511a2-04db-4aa1-888b-f85a92a799e9'),(51,26,1,'posts','posts',1,'2023-06-11 14:31:41','2023-06-11 14:32:05','ad4545d5-da12-4394-96e5-45b376c1ec75'),(52,27,2,'posts','posts',1,'2023-06-11 14:31:41','2023-06-11 14:31:41','5e37d2e1-aa2a-4335-9b1b-cfb3798eb560'),(53,27,1,'posts','posts',1,'2023-06-11 14:31:41','2023-06-11 14:31:41','871fbb94-3677-4178-ab90-a834a83b99a1'),(54,28,2,'beitraege','beitraege',1,'2023-06-11 14:31:41','2023-06-11 14:31:41','e1054292-76f3-4558-a399-c27a2fab0b19'),(55,28,1,'posts','posts',1,'2023-06-11 14:31:41','2023-06-11 14:31:41','ea7b3f62-4e17-48a9-a69b-c04ca3e3b16a'),(56,29,1,'site-info-global-settings',NULL,1,'2023-06-11 14:31:41','2023-06-11 14:31:41','b022001d-cab5-40fa-be90-833f71d32769'),(57,29,2,'site-info-global-settings',NULL,1,'2023-06-11 14:31:41','2023-06-11 14:31:41','8a9d6391-db4f-48dc-900a-38323133c6e7'),(58,30,1,NULL,NULL,1,'2023-06-11 14:35:02','2023-06-11 14:35:02','6a0c5fae-cd13-41a4-9aef-6f96dd29a4f2'),(59,30,2,NULL,NULL,1,'2023-06-11 14:35:02','2023-06-11 14:35:02','aa54edce-73bf-4db8-8404-118cbab20719'),(60,31,1,NULL,NULL,1,'2023-06-11 14:35:41','2023-06-11 14:35:41','65dc486d-1a88-44d2-a5e1-2e974b13b2f1'),(61,31,2,NULL,NULL,1,'2023-06-11 14:35:41','2023-06-11 14:35:41','fb3e7ab9-5525-439f-9c2d-4aef39de5bac'),(64,33,2,'five-things-elevator','beitraege/five-things-elevator',1,'2023-06-11 14:36:25','2023-06-11 14:36:25','f780d622-ce9b-454a-99b9-5014d9395979'),(65,33,1,'five-things-elevator','posts/five-things-elevator',1,'2023-06-11 14:36:25','2023-06-11 14:36:25','1ebd49d4-e466-473c-b7c4-61138043c885'),(66,34,2,NULL,NULL,1,'2023-06-11 14:36:25','2023-06-11 14:36:25','fa27ee2a-4e02-4a38-8800-ec9294512f5b'),(67,34,1,NULL,NULL,1,'2023-06-11 14:36:25','2023-06-11 14:36:25','2f190e2b-497c-4cd0-81e4-ca979d7c19d2'),(68,35,2,'mein-erster-beitrag','beitraege/mein-erster-beitrag',1,'2023-06-11 14:47:10','2023-06-11 14:47:20','562d5cca-ff45-4320-9a0c-158e2d435e5f'),(69,35,1,'mein-erster-beitrag','posts/mein-erster-beitrag',1,'2023-06-11 14:47:10','2023-06-11 14:47:20','f77a9c1c-e752-442b-baf7-15128460b211'),(70,36,2,NULL,NULL,1,'2023-06-11 14:47:32','2023-06-11 14:47:32','66c67421-ff9f-4798-9229-501cab008c45'),(71,36,1,NULL,NULL,1,'2023-06-11 14:47:32','2023-06-11 14:47:32','b91cdd16-be29-4f30-80ef-ec01828fb94f'),(72,37,2,NULL,NULL,1,'2023-06-11 14:47:36','2023-06-11 14:47:36','a3dde23e-32e9-4e2b-b646-87e693db8ded'),(73,37,1,NULL,NULL,1,'2023-06-11 14:47:36','2023-06-11 14:47:36','1a530e65-2e37-4f63-8859-31e02f1797ee'),(74,38,2,NULL,NULL,1,'2023-06-11 14:49:20','2023-06-11 14:49:20','35f868bb-d9f3-43c3-98b7-8d69ac399375'),(75,38,1,NULL,NULL,1,'2023-06-11 14:49:20','2023-06-11 14:49:20','ccef3220-effa-4e67-ab2c-3e189ec00ab9'),(76,39,2,NULL,NULL,1,'2023-06-11 14:49:24','2023-06-11 14:49:24','85f4c821-92da-4f07-a67d-2df06623bc5b'),(77,39,1,NULL,NULL,1,'2023-06-11 14:49:24','2023-06-11 14:49:24','12d8984d-148a-4618-8a6c-0024656f7ff7'),(78,40,2,'mein-erster-beitrag','beitraege/mein-erster-beitrag',1,'2023-06-11 14:55:50','2023-06-11 14:55:50','09dd92f8-e06f-450b-ab84-3829994fc0fb'),(79,40,1,'mein-erster-beitrag','posts/mein-erster-beitrag',1,'2023-06-11 14:55:50','2023-06-11 14:55:50','3eaf88b0-7e40-4d39-b0e2-04de2fc239e6'),(80,41,2,NULL,NULL,1,'2023-06-11 14:55:50','2023-06-11 14:55:50','d1209729-d03e-4f91-8e61-337649bfb17e'),(81,41,1,NULL,NULL,1,'2023-06-11 14:55:50','2023-06-11 14:55:50','8083fb9b-01a6-4a82-82bf-3bcbd07775ac'),(82,42,2,NULL,NULL,1,'2023-06-11 14:55:50','2023-06-11 14:55:50','dcfb5ef7-610f-423e-919d-57f3581d46ff'),(83,42,1,NULL,NULL,1,'2023-06-11 14:55:50','2023-06-11 14:55:50','5837376a-3cc0-4ae6-9bed-c0e4e2190e4e'),(86,44,1,'home','__home__',1,'2023-06-12 08:29:08','2023-06-12 08:29:08','80380308-e283-4619-b24a-8e5af13fe29e'),(87,44,2,'home','__home__',1,'2023-06-12 08:29:08','2023-06-12 08:29:08','49fdbaa6-4df8-4457-874e-1149b18a696c'),(88,45,1,NULL,NULL,1,'2023-06-12 08:32:25','2023-06-12 08:32:25','61e39529-2519-42bc-b43a-e181570f4a1b'),(89,45,2,NULL,NULL,1,'2023-06-12 08:32:25','2023-06-12 08:32:25','9c253612-c88a-474e-a48b-00473ada2a8a'),(90,46,1,'site-info-global-settings',NULL,1,'2023-06-12 08:51:30','2023-06-12 08:51:30','c4ee589b-f75f-482d-8ea7-6294e68386e1'),(91,46,2,'site-info-global-settings',NULL,1,'2023-06-12 08:51:30','2023-06-12 08:51:30','b217621c-155f-495a-bbf4-66004b533465'),(94,48,1,'site-info-global-settings',NULL,1,'2023-06-12 08:51:42','2023-06-12 08:51:42','c34443f1-14c2-48d4-a3ec-67bed127e09f'),(95,48,2,'site-info-global-settings',NULL,1,'2023-06-12 08:51:42','2023-06-12 08:51:42','20912617-be33-4793-b830-a94fdf01204d'),(98,50,1,NULL,NULL,1,'2023-06-12 08:52:50','2023-06-12 08:52:50','a9648e6b-f1ca-4403-9d09-f5d55da7136e'),(99,50,2,NULL,NULL,1,'2023-06-12 08:52:51','2023-06-12 08:52:51','a3772ef2-599e-4363-83fe-6b1d47c8a469'),(100,51,2,'site-info-global-settings',NULL,1,'2023-06-12 08:53:25','2023-06-12 08:53:25','a4496af1-982a-4f12-b087-e0120c3773a2'),(101,51,1,'site-info-global-settings',NULL,1,'2023-06-12 08:53:25','2023-06-12 08:53:25','bd772c0b-3a51-4887-ac7a-71e380bad376'),(104,53,1,NULL,NULL,1,'2023-06-12 09:02:05','2023-06-12 09:02:05','17383dad-cfe1-4d65-b049-1df9f3dcc2a1'),(105,53,2,NULL,NULL,1,'2023-06-12 09:02:05','2023-06-12 09:02:05','5783c342-f189-40e5-b53f-c9f497f02954'),(106,54,1,'mein-erster-beitrag','posts/mein-erster-beitrag',1,'2023-06-12 09:02:49','2023-06-12 09:02:49','5e1f31d1-43c9-4aaf-94ea-7cc320b29ec2'),(107,54,2,'mein-erster-beitrag','beitraege/mein-erster-beitrag',1,'2023-06-12 09:02:49','2023-06-12 09:02:49','6149be0a-8838-4276-b3eb-3c3c039bbddd'),(108,55,1,NULL,NULL,1,'2023-06-12 09:02:49','2023-06-12 09:02:49','8199de58-e42c-4ec1-84dd-99ccadf5d7e5'),(109,55,2,NULL,NULL,1,'2023-06-12 09:02:49','2023-06-12 09:02:49','5e22e650-6e67-49dc-9ac8-4ba466d70505'),(110,56,1,NULL,NULL,1,'2023-06-12 09:02:49','2023-06-12 09:02:49','6f083e1c-f346-4ec8-b636-80992df8eafd'),(111,56,2,NULL,NULL,1,'2023-06-12 09:02:49','2023-06-12 09:02:49','1523d5d0-9304-453a-88bc-ef8a674de779');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (1,3,NULL,1,NULL,'2023-06-11 14:31:00',NULL,NULL,'2023-06-11 14:31:23','2023-06-11 14:31:23'),(2,3,NULL,1,NULL,'2023-06-11 14:31:00',NULL,NULL,'2023-06-11 14:31:23','2023-06-11 14:31:23'),(3,3,NULL,1,NULL,'2023-06-11 14:31:00',NULL,NULL,'2023-06-11 14:31:23','2023-06-11 14:31:23'),(4,2,NULL,5,NULL,'2023-06-11 14:31:00',NULL,NULL,'2023-06-11 14:31:23','2023-06-11 14:31:23'),(5,2,NULL,5,NULL,'2023-06-11 14:31:00',NULL,NULL,'2023-06-11 14:31:23','2023-06-11 14:31:23'),(6,2,NULL,5,NULL,'2023-06-11 14:31:00',NULL,NULL,'2023-06-11 14:31:23','2023-06-11 14:31:23'),(7,3,NULL,1,NULL,'2023-06-11 14:31:00',NULL,NULL,'2023-06-11 14:31:24','2023-06-11 14:31:24'),(8,3,NULL,1,NULL,'2023-06-11 14:31:00',NULL,NULL,'2023-06-11 14:31:24','2023-06-11 14:31:24'),(9,2,NULL,5,NULL,'2023-06-11 14:31:00',NULL,NULL,'2023-06-11 14:31:24','2023-06-11 14:31:24'),(10,2,NULL,5,NULL,'2023-06-11 14:31:00',NULL,NULL,'2023-06-11 14:31:24','2023-06-11 14:31:24'),(12,1,NULL,2,11,'2023-06-11 14:31:40',NULL,NULL,'2023-06-11 14:31:40','2023-06-11 14:31:40'),(14,1,NULL,2,11,'2023-06-11 14:31:40',NULL,NULL,'2023-06-11 14:31:40','2023-06-11 14:31:40'),(16,1,NULL,2,11,'2023-06-10 14:31:40',NULL,NULL,'2023-06-11 14:31:40','2023-06-11 14:31:40'),(18,1,NULL,2,11,'2023-06-10 14:31:40',NULL,NULL,'2023-06-11 14:31:40','2023-06-11 14:31:40'),(20,1,NULL,2,11,'2023-06-09 14:31:41',NULL,NULL,'2023-06-11 14:31:41','2023-06-11 14:31:41'),(23,1,NULL,2,11,'2023-06-09 14:31:41',NULL,NULL,'2023-06-11 14:31:41','2023-06-11 14:31:41'),(26,4,NULL,4,11,'2023-06-11 14:31:00',NULL,NULL,'2023-06-11 14:31:41','2023-06-11 14:31:41'),(27,4,NULL,4,11,'2023-06-11 14:31:00',NULL,NULL,'2023-06-11 14:31:41','2023-06-11 14:31:41'),(28,4,NULL,4,11,'2023-06-11 14:31:00',NULL,NULL,'2023-06-11 14:31:41','2023-06-11 14:31:41'),(29,2,NULL,5,NULL,'2023-06-11 14:31:00',NULL,NULL,'2023-06-11 14:31:41','2023-06-11 14:31:41'),(33,1,NULL,2,11,'2023-06-11 14:31:40',NULL,NULL,'2023-06-11 14:36:25','2023-06-11 14:36:25'),(35,1,NULL,2,11,'2023-06-11 14:55:00',NULL,NULL,'2023-06-11 14:47:10','2023-06-11 14:55:50'),(40,1,NULL,2,11,'2023-06-11 14:55:00',NULL,NULL,'2023-06-11 14:55:50','2023-06-11 14:55:50'),(44,3,NULL,1,NULL,'2023-06-11 14:31:00',NULL,NULL,'2023-06-12 08:29:08','2023-06-12 08:29:08'),(46,2,NULL,5,NULL,'2023-06-11 14:31:00',NULL,NULL,'2023-06-12 08:51:30','2023-06-12 08:51:30'),(48,2,NULL,5,NULL,'2023-06-11 14:31:00',NULL,NULL,'2023-06-12 08:51:42','2023-06-12 08:51:42'),(51,2,NULL,5,NULL,'2023-06-11 14:31:00',NULL,NULL,'2023-06-12 08:53:25','2023-06-12 08:53:25'),(54,1,NULL,2,11,'2023-06-11 14:55:00',NULL,NULL,'2023-06-12 09:02:49','2023-06-12 09:02:49');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,3,3,'Home','home',0,'site',NULL,'{section.name|raw}',1,'2023-06-11 14:31:23','2023-06-11 14:31:23',NULL,'ab2052c5-b53a-4cbd-b95d-96ea7489c375'),(2,1,4,'Default','default',1,'language',NULL,NULL,1,'2023-06-11 14:31:23','2023-06-11 14:31:23',NULL,'817d3d1a-d840-41a0-85a2-898d07aef769'),(3,4,5,'Default','default',1,'none',NULL,NULL,1,'2023-06-11 14:31:23','2023-06-11 14:31:23',NULL,'19a49103-3b3e-48c0-955b-996599d8c651'),(4,4,6,'Post Index','postIndex',1,'site',NULL,NULL,3,'2023-06-11 14:31:23','2023-06-11 14:31:23',NULL,'0e989e8d-658a-4a1e-acf5-edb2387959ab'),(5,2,7,'Site Info - Global Settings','siteInfo',0,'site',NULL,'{section.name|raw}',1,'2023-06-11 14:31:23','2023-06-11 14:31:23',NULL,'8937bb02-c9d0-460b-81ef-1f1bda00e1f7');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldgroups` VALUES (1,'Common','2023-06-11 14:31:22','2023-06-11 14:31:22',NULL,'761cddc2-d969-4560-b5de-4bf2a393cb8a'),(2,'Site','2023-06-11 14:31:22','2023-06-11 14:31:22',NULL,'bbbea387-f8a6-43f7-ab94-dc572bd0cc77');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayoutfields` VALUES (47,3,28,1,0,1,'2023-06-11 14:31:24','2023-06-11 14:31:24','e924dffc-db4f-4008-9025-0c4fec043a44'),(48,3,28,3,0,2,'2023-06-11 14:31:24','2023-06-11 14:31:24','22970f18-9a8e-4971-946b-3b50f8d8d304'),(51,4,30,1,1,1,'2023-06-11 14:31:24','2023-06-11 14:31:24','705f0f9d-37ef-4f2b-8d65-b449d574d08c'),(52,4,30,3,1,2,'2023-06-11 14:31:24','2023-06-11 14:31:24','723dd184-d671-47d1-81f7-cd9d61495591'),(55,5,32,1,0,1,'2023-06-11 14:31:24','2023-06-11 14:31:24','c70e4115-f011-48f5-9901-1be5073df78e'),(56,5,32,3,0,2,'2023-06-11 14:31:24','2023-06-11 14:31:24','7d0bc6a3-b5ab-4465-bfee-6bdb2266eb36'),(59,6,34,1,0,1,'2023-06-11 14:31:24','2023-06-11 14:31:24','7efb867d-a561-4073-9af2-4d46ee5890ba'),(60,6,34,3,0,2,'2023-06-11 14:31:24','2023-06-11 14:31:24','aaf61045-d204-46f0-be4c-9415ede39d4b'),(72,8,40,7,1,0,'2023-06-11 14:31:24','2023-06-11 14:31:24','b5106342-cdf0-4c42-89d6-7181f8569f5f'),(73,8,40,6,0,1,'2023-06-11 14:31:24','2023-06-11 14:31:24','cec9b960-93f6-4a3d-94e1-0aaa3e7552e9'),(74,8,40,8,0,2,'2023-06-11 14:31:24','2023-06-11 14:31:24','bdfdd0fd-f9ec-4ceb-9e40-88060fc36a03'),(77,9,42,10,1,0,'2023-06-11 14:31:24','2023-06-11 14:31:24','a9bc9dda-1496-4b77-8860-ab243985e6e6'),(78,9,42,9,1,1,'2023-06-11 14:31:24','2023-06-11 14:31:24','f7897f51-0ecb-4aae-85bf-ef449963f6ce'),(80,11,44,13,1,0,'2023-06-11 14:31:24','2023-06-11 14:31:24','e4d9f987-5338-4545-83ee-a75a09c7926b'),(81,1,45,2,0,1,'2023-06-11 14:33:13','2023-06-11 14:33:13','0c6ea01b-754d-46b5-834a-279a51cc79b5'),(83,2,47,2,1,1,'2023-06-11 14:33:45','2023-06-11 14:33:45','bc689724-f917-430a-a3c8-47bb3f098558'),(84,10,48,12,1,0,'2023-06-11 14:48:50','2023-06-11 14:48:50','88ea5ed1-8de8-4f53-8561-49248dc26e0e'),(85,10,48,11,0,1,'2023-06-11 14:48:50','2023-06-11 14:48:50','d320d02c-8019-4ad8-af1f-9c57f50d26ad'),(86,7,49,5,0,1,'2023-06-12 08:51:30','2023-06-12 08:51:30','c5c1588b-cd40-487b-ab02-f584078acb38'),(87,7,49,4,0,2,'2023-06-12 08:51:30','2023-06-12 08:51:30','08c81df2-9c06-458b-a8fe-ffd102a9988b'),(88,7,49,1,0,3,'2023-06-12 08:51:30','2023-06-12 08:51:30','09de3cdd-ba2a-4690-a6ec-6b61492458a6');
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'craft\\elements\\Asset','2023-06-11 14:31:23','2023-06-11 14:31:23',NULL,'1ee5afe0-0146-443b-abef-4a7ccb1d2137'),(2,'craft\\elements\\Asset','2023-06-11 14:31:23','2023-06-11 14:31:23',NULL,'a9d58556-baca-4c30-916a-bef0d1ee1f14'),(3,'craft\\elements\\Entry','2023-06-11 14:31:23','2023-06-11 14:31:23',NULL,'7401d309-e508-45cd-b5e8-a48f92283981'),(4,'craft\\elements\\Entry','2023-06-11 14:31:23','2023-06-11 14:31:23',NULL,'e3e14fe2-2ad5-4293-98c3-dc21e4272700'),(5,'craft\\elements\\Entry','2023-06-11 14:31:23','2023-06-11 14:31:23',NULL,'066117b4-ac70-4bb1-b6c2-b892f40a2428'),(6,'craft\\elements\\Entry','2023-06-11 14:31:23','2023-06-11 14:31:23',NULL,'3c0a4ae5-e759-4942-aa4e-c1737058ad0a'),(7,'craft\\elements\\Entry','2023-06-11 14:31:23','2023-06-11 14:31:23',NULL,'bde6c865-48ee-4415-9ac7-2ef82c0b9b2f'),(8,'craft\\elements\\MatrixBlock','2023-06-11 14:31:23','2023-06-11 14:31:23',NULL,'0a8eb920-774e-4467-b009-325d6a5b47a6'),(9,'craft\\elements\\MatrixBlock','2023-06-11 14:31:23','2023-06-11 14:31:23',NULL,'41e5d65a-c578-41e0-8470-21b000104054'),(10,'craft\\elements\\MatrixBlock','2023-06-11 14:31:23','2023-06-11 14:31:23',NULL,'b96ba22c-1dc3-4984-9618-dba5bf9072e1'),(11,'craft\\elements\\MatrixBlock','2023-06-11 14:31:23','2023-06-11 14:31:23',NULL,'6e414421-9c51-4c18-ae15-b858843720ed');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouttabs` VALUES (28,3,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"4a31dadb-3ebe-4829-8236-2bfce7d72b5e\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"6000495f-d20c-4d59-adac-23d09575d4f0\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"1d65442c-c0b9-46f4-8518-9a6c53e21bc1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"0442fdbb-7778-4e08-8d02-e35a73e9e416\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"95f98672-9562-44a0-8639-92d2b55ceeb6\"}]',1,'2023-06-11 14:31:24','2023-06-11 14:31:24','6aacb145-186e-49b1-9bd2-baaa3327a8ba'),(30,4,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"174bd17b-9d69-405c-b8b0-5d1bf6df167a\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"uid\":\"0bcdc5e3-aee1-418c-baf7-4913c1a9da66\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"1d65442c-c0b9-46f4-8518-9a6c53e21bc1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"uid\":\"ed5bf3fe-47cf-4f2e-bfa1-80966b3e0ac2\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"95f98672-9562-44a0-8639-92d2b55ceeb6\"}]',1,'2023-06-11 14:31:24','2023-06-11 14:31:24','547c5e84-0a14-4cb1-8567-8b569135baef'),(32,5,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"49fe3231-3a75-4fe7-a00e-79142a90f462\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"512724a6-2819-4625-a4d7-a9d4c0ad58b7\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"1d65442c-c0b9-46f4-8518-9a6c53e21bc1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"8707ff65-f32e-4002-852f-783d9891a7d6\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"95f98672-9562-44a0-8639-92d2b55ceeb6\"}]',1,'2023-06-11 14:31:24','2023-06-11 14:31:24','b120c952-7949-4f74-8505-d61aae23d0b2'),(34,6,'Inhalt','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"4e057a4a-237b-4fe7-9d2a-93c9a509b52d\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"97b747f6-bfd0-4219-8bc2-64570fc4d663\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"1d65442c-c0b9-46f4-8518-9a6c53e21bc1\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"4fd830e8-1079-4963-9692-82ad90a3b249\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"95f98672-9562-44a0-8639-92d2b55ceeb6\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\Tip\",\"tip\":\"Paginated post cards will be inserted here.\",\"dismissible\":true,\"style\":\"tip\",\"uid\":\"cdd60b12-4c1c-4f0a-9dd5-09d54e854a6a\",\"userCondition\":null,\"elementCondition\":null}]',1,'2023-06-11 14:31:24','2023-06-11 14:31:24','c1d81378-8365-4b0c-abf6-f2ded6662401'),(40,8,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"uid\":\"d6458e2f-6659-428f-bfed-105b9d672eea\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"63e734ee-d709-488a-bd8d-3a90ab070825\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"44761774-ed94-4a0a-8278-6ea13d3b3d48\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"1eac01fa-9e12-426e-a043-60ae35acf391\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"867dfbcf-588a-435f-8dbd-b31e4d4a9347\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"eb230d0c-f88a-40de-a743-994de14eb8f8\"}]',1,'2023-06-11 14:31:24','2023-06-11 14:31:24','756bc6cb-dc8c-4411-a1ce-c980d292105f'),(42,9,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":75,\"uid\":\"f4e83568-6458-4bf3-9b47-b1359fa7dd54\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"a4a0dfdc-289d-4d50-baae-6a3215a85701\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":25,\"uid\":\"fdcd6c78-b61f-4ad7-80cc-58b9e85b6e96\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"5c400efe-2716-4221-a54a-4ebaf6a3c6cb\"}]',1,'2023-06-11 14:31:24','2023-06-11 14:31:24','7d31a66e-6de9-46b8-8336-1205bfe7bb56'),(44,11,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"uid\":\"d5c0bca6-0d1b-41e4-b861-ef78e7dfc7c8\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"78ba6fca-0979-4552-a36e-f6f7a001b0f5\"}]',1,'2023-06-11 14:31:24','2023-06-11 14:31:24','cb85e172-be3d-443c-8def-36bee1a8c4a6'),(45,1,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"698de72a-7adc-45a6-a415-945a483e46fa\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"4b73ae21-1a9b-4f0a-bd0f-d5ad49071a82\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"a73e7c96-e9d2-4751-bf01-8a6baf5f3c46\"}]',1,'2023-06-11 14:33:13','2023-06-11 14:33:13','ad2ff98e-1e14-4839-9d89-9c33546f1ae6'),(47,2,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"be381213-38ff-4fec-a714-0d5578979925\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"uid\":\"64372242-c3cf-4a77-b3b3-90704f40d841\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"a73e7c96-e9d2-4751-bf01-8a6baf5f3c46\"}]',1,'2023-06-11 14:33:45','2023-06-11 14:33:45','c1e3a4d5-1e1c-4d1a-990f-39e3b823150c'),(48,10,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":true,\"width\":100,\"uid\":\"53b039bc-1e34-432c-adfd-6ebaa5e40260\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"abb455ba-032b-461d-9c8d-dca9ed3fc7bd\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"e7f50fae-c8f1-4a55-9231-3186509b9f19\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"4b9eed77-fa62-4ecc-9486-744a64f075d4\"}]',1,'2023-06-11 14:48:50','2023-06-11 14:48:50','76e79da0-ac5e-42ef-b095-ff42e4ff2b28'),(49,7,'Content','{\"userCondition\":null,\"elementCondition\":null}','[{\"type\":\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100,\"uid\":\"3bd488e7-e259-495d-94c6-7c255835294b\",\"userCondition\":null,\"elementCondition\":null},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"b371723f-8ccc-4454-b211-37d094110d75\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"0837f34c-eb77-4cca-bded-4b9c2d688a90\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"6e118f46-8419-4f4a-894a-ceeec190f3bc\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"560e7c36-f763-440f-b9b5-1d87228bc6df\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":\"Default Featured Image\",\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"uid\":\"3adb9569-f9be-4f86-9a6c-2df3d6816874\",\"userCondition\":null,\"elementCondition\":null,\"fieldUid\":\"1d65442c-c0b9-46f4-8518-9a6c53e21bc1\"}]',1,'2023-06-12 08:51:30','2023-06-12 08:51:30','44927ccf-a678-414e-bd93-d96a5fd71966');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES (1,1,'Featured Image','featuredImage','global',NULL,'At least 768px wide',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:c9a4fbad-6ca0-4e20-ba72-da2c14a38190\",\"defaultUploadLocationSubpath\":\"featured\",\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":null,\"previewMode\":\"thumbs\",\"restrictFiles\":true,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:c9a4fbad-6ca0-4e20-ba72-da2c14a38190\",\"restrictedLocationSubpath\":null,\"selectionCondition\":{\"elementType\":\"craft\\\\elements\\\\Asset\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\",\"conditionRules\":[{\"class\":\"craft\\\\elements\\\\conditions\\\\assets\\\\WidthConditionRule\",\"uid\":\"226805ac-3aea-4362-8bdc-7ddd00eab414\",\"operator\":\">=\",\"value\":\"768\",\"maxValue\":\"\"}]},\"selectionLabel\":\"Select an image\",\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":[\"volume:c9a4fbad-6ca0-4e20-ba72-da2c14a38190\"],\"targetSiteId\":null,\"validateRelatedElements\":true,\"viewMode\":\"large\"}','2023-06-11 14:31:22','2023-06-11 14:48:19','1d65442c-c0b9-46f4-8518-9a6c53e21bc1'),(2,1,'Alt Text','altText','global','gvuxccdq',NULL,0,'language',NULL,'craft\\fields\\PlainText','{\"byteLimit\":240,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2023-06-11 14:31:22','2023-06-11 14:31:22','a73e7c96-e9d2-4751-bf01-8a6baf5f3c46'),(3,1,'Body Content','bodyContent','global',NULL,NULL,1,'site',NULL,'craft\\fields\\Matrix','{\"minBlocks\":null,\"maxBlocks\":null,\"contentTable\":\"{{%matrixcontent_bodycontent}}\",\"propagationMethod\":\"all\",\"propagationKeyFormat\":null}','2023-06-11 14:31:22','2023-06-11 14:48:50','95f98672-9562-44a0-8639-92d2b55ceeb6'),(4,2,'Copyright','copyright','global','gsucoquh',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":30,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2023-06-11 14:31:22','2023-06-11 14:31:22','560e7c36-f763-440f-b9b5-1d87228bc6df'),(5,2,'Site Name','siteName','global','fzwghcns',NULL,0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":30,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2023-06-11 14:31:22','2023-06-11 14:31:22','0837f34c-eb77-4cca-bded-4b9c2d688a90'),(6,NULL,'Cite','cite','matrixBlockType:19d8011f-2129-4d06-b597-49d7125063c7','ljffsgdr',NULL,1,'language',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":60,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2023-06-11 14:31:23','2023-06-11 14:31:23','1eac01fa-9e12-426e-a043-60ae35acf391'),(7,NULL,'Text','text','matrixBlockType:19d8011f-2129-4d06-b597-49d7125063c7','yfidlzze',NULL,1,'language',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":1,\"multiline\":true,\"placeholder\":null,\"uiMode\":\"normal\"}','2023-06-11 14:31:23','2023-06-11 14:31:23','63e734ee-d709-488a-bd8d-3a90ab070825'),(8,NULL,'Style','style','matrixBlockType:19d8011f-2129-4d06-b597-49d7125063c7','vdcfeeit',NULL,0,'none',NULL,'craft\\fields\\Dropdown','{\"options\":[{\"label\":\"Default\",\"value\":\"default\",\"default\":\"1\"},{\"label\":\"Borders Top Bottom\",\"value\":\"bordersTopBottom\",\"default\":\"\"}]}','2023-06-11 14:31:23','2023-06-11 14:31:23','eb230d0c-f88a-40de-a743-994de14eb8f8'),(9,NULL,'Heading Level','headingLevel','matrixBlockType:a3605555-7165-4ea9-a338-870db2eba7ca','xiqfbbjz',NULL,0,'none',NULL,'craft\\fields\\Dropdown','{\"options\":[{\"label\":\"H2\",\"value\":\"h2\",\"default\":\"1\"},{\"label\":\"H3\",\"value\":\"h3\",\"default\":\"\"}]}','2023-06-11 14:31:23','2023-06-11 14:31:23','5c400efe-2716-4221-a54a-4ebaf6a3c6cb'),(10,NULL,'Text','text','matrixBlockType:a3605555-7165-4ea9-a338-870db2eba7ca','ehszctzg',NULL,1,'language',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":60,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2023-06-11 14:31:23','2023-06-11 14:31:23','a4a0dfdc-289d-4d50-baae-6a3215a85701'),(11,NULL,'Caption','caption','matrixBlockType:a33610ee-ece8-47a1-949e-94477da5fd4d','xngnntxq',NULL,1,'language',NULL,'craft\\fields\\PlainText','{\"byteLimit\":250,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":false,\"placeholder\":null,\"uiMode\":\"normal\"}','2023-06-11 14:31:23','2023-06-11 14:31:23','4b9eed77-fa62-4ecc-9486-744a64f075d4'),(12,NULL,'Image','image','matrixBlockType:a33610ee-ece8-47a1-949e-94477da5fd4d',NULL,'At least 768px wide',1,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowSubfolders\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"branchLimit\":null,\"defaultUploadLocationSource\":\"volume:c9a4fbad-6ca0-4e20-ba72-da2c14a38190\",\"defaultUploadLocationSubpath\":null,\"localizeRelations\":false,\"maintainHierarchy\":false,\"maxRelations\":1,\"minRelations\":null,\"previewMode\":\"thumbs\",\"restrictFiles\":true,\"restrictLocation\":false,\"restrictedDefaultUploadSubpath\":null,\"restrictedLocationSource\":\"volume:c9a4fbad-6ca0-4e20-ba72-da2c14a38190\",\"restrictedLocationSubpath\":null,\"selectionCondition\":{\"elementType\":\"craft\\\\elements\\\\Asset\",\"fieldContext\":\"global\",\"class\":\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\",\"conditionRules\":[{\"class\":\"craft\\\\elements\\\\conditions\\\\assets\\\\WidthConditionRule\",\"uid\":\"73c6baec-2203-47fa-bee7-633be75c6120\",\"operator\":\">=\",\"value\":\"768\",\"maxValue\":\"\"}]},\"selectionLabel\":\"Select an image\",\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"sources\":[\"volume:c9a4fbad-6ca0-4e20-ba72-da2c14a38190\"],\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":\"large\"}','2023-06-11 14:31:23','2023-06-11 14:48:50','abb455ba-032b-461d-9c8d-dca9ed3fc7bd'),(13,NULL,'Text','text','matrixBlockType:78f9590c-8302-4bbc-8e62-39e3f6a2bd57','badcaarf',NULL,1,'language',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":false,\"columnType\":null,\"initialRows\":4,\"multiline\":true,\"placeholder\":null,\"uiMode\":\"normal\"}','2023-06-11 14:31:23','2023-06-11 14:31:23','78ba6fca-0979-4552-a36e-f6f7a001b0f5');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `gqlschemas` VALUES (1,'Public Schema','[]',1,'2023-06-11 14:31:23','2023-06-11 14:31:23','2be01897-dbaf-4c19-a6d9-db80ada8fc8f');
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `imagetransforms`
--

LOCK TABLES `imagetransforms` WRITE;
/*!40000 ALTER TABLE `imagetransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `imagetransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'4.4.13','4.4.0.4',0,'pqjxwhnbpecq','3@fepllqpefe','2023-06-11 14:31:22','2023-06-12 08:51:30','4124967a-1b1b-407f-8fe4-62596d2f3775');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixblocks` VALUES (13,12,3,4,NULL,'2023-06-11 14:31:40','2023-06-11 14:31:40'),(15,14,3,4,NULL,'2023-06-11 14:31:40','2023-06-11 14:31:40'),(17,16,3,4,NULL,'2023-06-11 14:31:40','2023-06-11 14:31:40'),(19,18,3,4,NULL,'2023-06-11 14:31:40','2023-06-11 14:31:40'),(21,20,3,4,NULL,'2023-06-11 14:31:41','2023-06-11 14:31:41'),(22,20,3,1,NULL,'2023-06-11 14:31:41','2023-06-11 14:31:41'),(24,23,3,4,NULL,'2023-06-11 14:31:41','2023-06-11 14:31:41'),(25,23,3,1,NULL,'2023-06-11 14:31:41','2023-06-11 14:31:41'),(34,33,3,4,NULL,'2023-06-11 14:36:25','2023-06-11 14:36:25'),(36,35,3,3,0,'2023-06-11 14:47:32','2023-06-11 14:47:32'),(37,35,3,3,NULL,'2023-06-11 14:47:36','2023-06-11 14:47:36'),(38,35,3,4,0,'2023-06-11 14:49:20','2023-06-11 14:49:20'),(39,35,3,4,NULL,'2023-06-11 14:49:24','2023-06-11 14:49:24'),(41,40,3,3,NULL,'2023-06-11 14:55:50','2023-06-11 14:55:50'),(42,40,3,4,NULL,'2023-06-11 14:55:50','2023-06-11 14:55:50'),(55,54,3,3,NULL,'2023-06-12 09:02:49','2023-06-12 09:02:49'),(56,54,3,4,NULL,'2023-06-12 09:02:49','2023-06-12 09:02:49');
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks_owners`
--

LOCK TABLES `matrixblocks_owners` WRITE;
/*!40000 ALTER TABLE `matrixblocks_owners` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixblocks_owners` VALUES (13,12,1),(15,14,1),(17,16,1),(19,18,1),(21,20,1),(22,20,2),(24,23,1),(25,23,2),(34,33,1),(36,35,1),(37,35,1),(38,35,2),(39,35,2),(41,40,1),(42,40,2),(55,54,1),(56,54,2);
/*!40000 ALTER TABLE `matrixblocks_owners` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixblocktypes` VALUES (1,3,8,'Quote','quote',4,'2023-06-11 14:31:23','2023-06-11 14:31:23','19d8011f-2129-4d06-b597-49d7125063c7'),(2,3,9,'Heading','heading',1,'2023-06-11 14:31:23','2023-06-11 14:31:23','a3605555-7165-4ea9-a338-870db2eba7ca'),(3,3,10,'Image','image',3,'2023-06-11 14:31:23','2023-06-11 14:31:23','a33610ee-ece8-47a1-949e-94477da5fd4d'),(4,3,11,'Text','text',2,'2023-06-11 14:31:23','2023-06-11 14:31:23','78f9590c-8302-4bbc-8e62-39e3f6a2bd57');
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixcontent_bodycontent`
--

LOCK TABLES `matrixcontent_bodycontent` WRITE;
/*!40000 ALTER TABLE `matrixcontent_bodycontent` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixcontent_bodycontent` VALUES (1,13,1,'2023-06-11 14:31:40','2023-06-11 14:31:40','c91140a9-f21f-44d3-848b-1932e761abdf',NULL,NULL,NULL,NULL,NULL,NULL,'* Do not scream suddenly.\n* Hold anything you’re in the middle of eating until you’ve stepped off the elevator again.\n* If you brought any live animals with you, do your best to keep them on your person.\n* Avoid vigorous jumping or bouncing.\n* Face the same direction as everybody else.'),(2,13,2,'2023-06-11 14:31:40','2023-06-11 14:31:40','5fa1f493-80ee-4ec1-a718-b6dd2367b66a',NULL,NULL,NULL,NULL,NULL,NULL,'* Do not scream suddenly.\n* Hold anything you’re in the middle of eating until you’ve stepped off the elevator again.\n* If you brought any live animals with you, do your best to keep them on your person.\n* Avoid vigorous jumping or bouncing.\n* Face the same direction as everybody else.'),(3,15,1,'2023-06-11 14:31:40','2023-06-11 14:31:40','e87289d2-9bcb-4bab-9729-ad5ae48b8fe3',NULL,NULL,NULL,NULL,NULL,NULL,'* Do not scream suddenly.\n* Hold anything you’re in the middle of eating until you’ve stepped off the elevator again.\n* If you brought any live animals with you, do your best to keep them on your person.\n* Avoid vigorous jumping or bouncing.\n* Face the same direction as everybody else.'),(4,15,2,'2023-06-11 14:31:40','2023-06-11 14:31:40','3f4b90bc-4670-4b6c-8111-7ef28494cf58',NULL,NULL,NULL,NULL,NULL,NULL,'* Do not scream suddenly.\n* Hold anything you’re in the middle of eating until you’ve stepped off the elevator again.\n* If you brought any live animals with you, do your best to keep them on your person.\n* Avoid vigorous jumping or bouncing.\n* Face the same direction as everybody else.'),(5,17,1,'2023-06-11 14:31:40','2023-06-11 14:31:40','d2ddf022-c63e-455e-9651-86a8e2d87b39',NULL,NULL,NULL,NULL,NULL,NULL,'Find a recipe for the thing you want and make it at home.'),(6,17,2,'2023-06-11 14:31:40','2023-06-11 14:31:40','cae57577-2146-4c34-9419-1634526545b5',NULL,NULL,NULL,NULL,NULL,NULL,'Find a recipe for the thing you want and make it at home.'),(7,19,1,'2023-06-11 14:31:40','2023-06-11 14:31:40','c40bcbb9-6880-4725-8bf9-a87b0c5ad194',NULL,NULL,NULL,NULL,NULL,NULL,'Find a recipe for the thing you want and make it at home.'),(8,19,2,'2023-06-11 14:31:40','2023-06-11 14:31:40','853c3d00-308c-4162-9e83-3db637ce0b71',NULL,NULL,NULL,NULL,NULL,NULL,'Find a recipe for the thing you want and make it at home.'),(9,21,1,'2023-06-11 14:31:41','2023-06-11 14:31:41','12fbab22-600f-4003-baa3-ab5af4749a3a',NULL,NULL,NULL,NULL,NULL,NULL,'Philosopher Jack Handy was known to unpack some of the great complexities of the universe.'),(10,21,2,'2023-06-11 14:31:41','2023-06-11 14:31:41','d5d487cc-938a-4af3-a210-406e65af40f0',NULL,NULL,NULL,NULL,NULL,NULL,'Philosopher Jack Handy was known to unpack some of the great complexities of the universe.'),(11,22,1,'2023-06-11 14:31:41','2023-06-11 14:31:41','9373be0a-afe4-47f3-a67f-e8546d63aece','Jack Handy','The face of a child can say it all, especially the mouth part of the face.','default',NULL,NULL,NULL,NULL),(12,22,2,'2023-06-11 14:31:41','2023-06-11 14:31:41','ac91781a-2e37-4be9-9efc-47c2f624d81c','Jack Handy','The face of a child can say it all, especially the mouth part of the face.','default',NULL,NULL,NULL,NULL),(13,24,1,'2023-06-11 14:31:41','2023-06-11 14:31:41','7ba2684f-059a-4e44-8d94-676d53ba0dd6',NULL,NULL,NULL,NULL,NULL,NULL,'Philosopher Jack Handy was known to unpack some of the great complexities of the universe.'),(14,24,2,'2023-06-11 14:31:41','2023-06-11 14:31:41','a6b9d36f-1722-4396-ad3f-049ff69126e5',NULL,NULL,NULL,NULL,NULL,NULL,'Philosopher Jack Handy was known to unpack some of the great complexities of the universe.'),(15,25,1,'2023-06-11 14:31:41','2023-06-11 14:31:41','e7e45dec-42e9-4195-90e9-02eef6e4552c','Jack Handy','The face of a child can say it all, especially the mouth part of the face.','default',NULL,NULL,NULL,NULL),(16,25,2,'2023-06-11 14:31:41','2023-06-11 14:31:41','4d3c4c6f-c723-4f60-821d-e0c5cb948781','Jack Handy','The face of a child can say it all, especially the mouth part of the face.','default',NULL,NULL,NULL,NULL),(17,34,2,'2023-06-11 14:36:25','2023-06-11 14:36:25','725556bd-723f-4d6c-aab8-d5a4d8455189',NULL,NULL,NULL,NULL,NULL,NULL,'* Do not scream suddenly.\n* Hold anything you’re in the middle of eating until you’ve stepped off the elevator again.\n* If you brought any live animals with you, do your best to keep them on your person.\n* Avoid vigorous jumping or bouncing.\n* Face the same direction as everybody else.'),(18,34,1,'2023-06-11 14:36:25','2023-06-11 14:36:25','d7511fc1-eabc-4b4b-b460-9c4036b53306',NULL,NULL,NULL,NULL,NULL,NULL,'* Do not scream suddenly.\n* Hold anything you’re in the middle of eating until you’ve stepped off the elevator again.\n* If you brought any live animals with you, do your best to keep them on your person.\n* Avoid vigorous jumping or bouncing.\n* Face the same direction as everybody else.'),(19,36,2,'2023-06-11 14:47:32','2023-06-11 14:47:32','e55df173-1257-439d-a97b-b609c4dcfe71',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,36,1,'2023-06-11 14:47:32','2023-06-11 14:47:32','9c86a9bd-8411-4ff1-82b8-9b24d442103b',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,37,2,'2023-06-11 14:47:36','2023-06-11 14:49:07','d5043b88-9ae7-48c0-ae90-48e7bacb2fe9',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,37,1,'2023-06-11 14:47:36','2023-06-11 14:49:07','9c76b436-bfb0-4192-93e9-df148e6eb727',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,38,2,'2023-06-11 14:49:20','2023-06-11 14:49:20','4e53c740-a3de-4dc4-b24a-1a484c2b82ab',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,38,1,'2023-06-11 14:49:20','2023-06-11 14:49:20','f24cf5a5-a293-40d5-a019-a65e339b4b0f',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,39,2,'2023-06-11 14:49:24','2023-06-11 14:49:24','1dddfe53-0064-43f6-be02-2d45a650df28',NULL,NULL,NULL,NULL,NULL,NULL,'Vestibulum facilisis, purus nec pulvinar iaculis, ligula mi congue nunc, vitae euismod ligula urna in dolor. Cras sagittis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed aliquam, nisi quis porttitor congue, elit erat euismod orci, ac placerat dolor lectus quis orci. Pellentesque auctor neque nec urna. Morbi nec metus.\n\nFusce convallis metus id felis luctus adipiscing. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In consectetuer turpis ut velit. Fusce neque. Suspendisse nisl elit, rhoncus eget, elementum ac, condimentum eget, diam.'),(26,39,1,'2023-06-11 14:49:24','2023-06-11 14:49:24','aa3eaa3e-d6d2-4633-af8b-f68b98ad2fa9',NULL,NULL,NULL,NULL,NULL,NULL,'Vestibulum facilisis, purus nec pulvinar iaculis, ligula mi congue nunc, vitae euismod ligula urna in dolor. Cras sagittis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed aliquam, nisi quis porttitor congue, elit erat euismod orci, ac placerat dolor lectus quis orci. Pellentesque auctor neque nec urna. Morbi nec metus.\n\nFusce convallis metus id felis luctus adipiscing. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In consectetuer turpis ut velit. Fusce neque. Suspendisse nisl elit, rhoncus eget, elementum ac, condimentum eget, diam.'),(27,41,2,'2023-06-11 14:55:50','2023-06-11 14:55:50','ab3eb2e7-ef18-445c-9b77-7786f15e0699',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,41,1,'2023-06-11 14:55:50','2023-06-11 14:55:50','2e73c07c-3b7a-418f-b985-65fa31eb6ec3',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,42,2,'2023-06-11 14:55:50','2023-06-11 14:55:50','dac7c83f-bf77-4aad-a209-b93cba14a2c9',NULL,NULL,NULL,NULL,NULL,NULL,'Vestibulum facilisis, purus nec pulvinar iaculis, ligula mi congue nunc, vitae euismod ligula urna in dolor. Cras sagittis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed aliquam, nisi quis porttitor congue, elit erat euismod orci, ac placerat dolor lectus quis orci. Pellentesque auctor neque nec urna. Morbi nec metus.\n\nFusce convallis metus id felis luctus adipiscing. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In consectetuer turpis ut velit. Fusce neque. Suspendisse nisl elit, rhoncus eget, elementum ac, condimentum eget, diam.'),(30,42,1,'2023-06-11 14:55:50','2023-06-11 14:55:50','610cca9d-3579-426a-87c5-ced214cf8008',NULL,NULL,NULL,NULL,NULL,NULL,'Vestibulum facilisis, purus nec pulvinar iaculis, ligula mi congue nunc, vitae euismod ligula urna in dolor. Cras sagittis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed aliquam, nisi quis porttitor congue, elit erat euismod orci, ac placerat dolor lectus quis orci. Pellentesque auctor neque nec urna. Morbi nec metus.\n\nFusce convallis metus id felis luctus adipiscing. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In consectetuer turpis ut velit. Fusce neque. Suspendisse nisl elit, rhoncus eget, elementum ac, condimentum eget, diam.'),(31,55,1,'2023-06-12 09:02:49','2023-06-12 09:02:49','c35685a0-3634-46d6-aaa0-4c2a9acd0bda',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,55,2,'2023-06-12 09:02:49','2023-06-12 09:02:49','bbabb077-cb75-4953-8299-6909140e97e6',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,56,1,'2023-06-12 09:02:49','2023-06-12 09:02:49','70f9c8ec-7e79-4dfa-a96e-cf3423686fc5',NULL,NULL,NULL,NULL,NULL,NULL,'Vestibulum facilisis, purus nec pulvinar iaculis, ligula mi congue nunc, vitae euismod ligula urna in dolor. Cras sagittis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed aliquam, nisi quis porttitor congue, elit erat euismod orci, ac placerat dolor lectus quis orci. Pellentesque auctor neque nec urna. Morbi nec metus.\n\nFusce convallis metus id felis luctus adipiscing. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In consectetuer turpis ut velit. Fusce neque. Suspendisse nisl elit, rhoncus eget, elementum ac, condimentum eget, diam.'),(34,56,2,'2023-06-12 09:02:49','2023-06-12 09:02:49','78aee6a5-a574-4996-8a96-a91b560083a8',NULL,NULL,NULL,NULL,NULL,NULL,'Vestibulum facilisis, purus nec pulvinar iaculis, ligula mi congue nunc, vitae euismod ligula urna in dolor. Cras sagittis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed aliquam, nisi quis porttitor congue, elit erat euismod orci, ac placerat dolor lectus quis orci. Pellentesque auctor neque nec urna. Morbi nec metus.\n\nFusce convallis metus id felis luctus adipiscing. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. In consectetuer turpis ut velit. Fusce neque. Suspendisse nisl elit, rhoncus eget, elementum ac, condimentum eget, diam.');
/*!40000 ALTER TABLE `matrixcontent_bodycontent` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'craft','Install','2023-06-11 14:31:25','2023-06-11 14:31:25','2023-06-11 14:31:25','3aebec08-aee4-4be9-99e1-aebd48b99352'),(2,'craft','m210121_145800_asset_indexing_changes','2023-06-11 14:31:25','2023-06-11 14:31:25','2023-06-11 14:31:25','5b0bdf9e-bd10-4be5-842b-451c4939301f'),(3,'craft','m210624_222934_drop_deprecated_tables','2023-06-11 14:31:25','2023-06-11 14:31:25','2023-06-11 14:31:25','c422a463-2e5d-4021-b371-514c2fd02944'),(4,'craft','m210724_180756_rename_source_cols','2023-06-11 14:31:25','2023-06-11 14:31:25','2023-06-11 14:31:25','d34a336a-6c9a-4fda-8d3a-98007af1593e'),(5,'craft','m210809_124211_remove_superfluous_uids','2023-06-11 14:31:25','2023-06-11 14:31:25','2023-06-11 14:31:25','e53523db-9343-49a1-af4c-3a472bb22e7d'),(6,'craft','m210817_014201_universal_users','2023-06-11 14:31:25','2023-06-11 14:31:25','2023-06-11 14:31:25','6e87cb3e-6e05-4166-b632-ba6b9cf91263'),(7,'craft','m210904_132612_store_element_source_settings_in_project_config','2023-06-11 14:31:25','2023-06-11 14:31:25','2023-06-11 14:31:25','eb028fb0-613a-46cf-a7ac-4373338aa768'),(8,'craft','m211115_135500_image_transformers','2023-06-11 14:31:25','2023-06-11 14:31:25','2023-06-11 14:31:25','a39c6b2c-5aa7-4a2c-9dfe-34ab9d729889'),(9,'craft','m211201_131000_filesystems','2023-06-11 14:31:25','2023-06-11 14:31:25','2023-06-11 14:31:25','fef7b744-5f97-4e1c-9bbf-322e7c0ffde8'),(10,'craft','m220103_043103_tab_conditions','2023-06-11 14:31:25','2023-06-11 14:31:25','2023-06-11 14:31:25','58c10fee-17f5-442e-80b7-66216717ae63'),(11,'craft','m220104_003433_asset_alt_text','2023-06-11 14:31:25','2023-06-11 14:31:25','2023-06-11 14:31:25','c03b7b73-5a0f-46ec-8cdf-02be46efc5cc'),(12,'craft','m220123_213619_update_permissions','2023-06-11 14:31:25','2023-06-11 14:31:25','2023-06-11 14:31:25','88565107-b9b9-4bbe-b8b4-1e3c4dcbb168'),(13,'craft','m220126_003432_addresses','2023-06-11 14:31:25','2023-06-11 14:31:25','2023-06-11 14:31:25','cbfef688-f622-44f8-9a54-843cb6e12b7d'),(14,'craft','m220209_095604_add_indexes','2023-06-11 14:31:25','2023-06-11 14:31:25','2023-06-11 14:31:25','966a1ad7-248f-4c92-9c4f-b7dee34000a9'),(15,'craft','m220213_015220_matrixblocks_owners_table','2023-06-11 14:31:25','2023-06-11 14:31:25','2023-06-11 14:31:25','34112110-5a81-4688-ac52-7b8f001733c9'),(16,'craft','m220214_000000_truncate_sessions','2023-06-11 14:31:25','2023-06-11 14:31:25','2023-06-11 14:31:25','710aed48-2448-4416-bc4d-505062c18163'),(17,'craft','m220222_122159_full_names','2023-06-11 14:31:25','2023-06-11 14:31:25','2023-06-11 14:31:25','1d53da5b-09eb-4190-a5b7-1d9d3435d4cc'),(18,'craft','m220223_180559_nullable_address_owner','2023-06-11 14:31:25','2023-06-11 14:31:25','2023-06-11 14:31:25','e9516556-23f2-4ac9-9350-dfcb21255ceb'),(19,'craft','m220225_165000_transform_filesystems','2023-06-11 14:31:25','2023-06-11 14:31:25','2023-06-11 14:31:25','512700b7-f13a-4a3f-a2c3-4bb3d85d2b28'),(20,'craft','m220309_152006_rename_field_layout_elements','2023-06-11 14:31:25','2023-06-11 14:31:25','2023-06-11 14:31:25','00b5150c-546e-4218-96dd-61d90a514a92'),(21,'craft','m220314_211928_field_layout_element_uids','2023-06-11 14:31:25','2023-06-11 14:31:25','2023-06-11 14:31:25','53a8ad56-7abb-4fa8-b1f5-c2fdb09db799'),(22,'craft','m220316_123800_transform_fs_subpath','2023-06-11 14:31:25','2023-06-11 14:31:25','2023-06-11 14:31:25','cb41f354-2341-47b7-82f2-d46b715ed037'),(23,'craft','m220317_174250_release_all_jobs','2023-06-11 14:31:25','2023-06-11 14:31:25','2023-06-11 14:31:25','685a08dd-0a23-4666-9455-d38e10fe8a4a'),(24,'craft','m220330_150000_add_site_gql_schema_components','2023-06-11 14:31:25','2023-06-11 14:31:25','2023-06-11 14:31:25','83ca056a-cfba-4570-a541-b4990324cb61'),(25,'craft','m220413_024536_site_enabled_string','2023-06-11 14:31:25','2023-06-11 14:31:25','2023-06-11 14:31:25','ab373b29-033d-4d7b-912e-76af4f301d87'),(26,'craft','m221027_160703_add_image_transform_fill','2023-06-11 14:31:25','2023-06-11 14:31:25','2023-06-11 14:31:25','930e82e2-79b0-4761-a197-87b228d0c379'),(27,'craft','m221028_130548_add_canonical_id_index','2023-06-11 14:31:25','2023-06-11 14:31:25','2023-06-11 14:31:25','e5c97e7e-7867-4640-89b9-f3f93c1d79f4'),(28,'craft','m221118_003031_drop_element_fks','2023-06-11 14:31:25','2023-06-11 14:31:25','2023-06-11 14:31:25','0e889fc9-3fa0-4a1d-aa29-b184e06d48ef'),(29,'craft','m230131_120713_asset_indexing_session_new_options','2023-06-11 14:31:25','2023-06-11 14:31:25','2023-06-11 14:31:25','dedcee28-155b-420e-b495-7695f76669fa'),(30,'craft','m230226_013114_drop_plugin_license_columns','2023-06-11 14:31:25','2023-06-11 14:31:25','2023-06-11 14:31:25','41224dd5-df5c-4a21-87a3-6335351352d5'),(31,'content','m230611_085149_sample_content','2023-06-11 14:31:41','2023-06-11 14:31:41','2023-06-11 14:31:41','29aee0ab-8bd0-4b58-a76c-6808f9ad68b1');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('assets.tempSubpath','\"temporary-uploads\"'),('assets.tempVolumeUid','\"efd6d899-7b71-4318-8402-669e92416168\"'),('dateModified','1686559890'),('elementSources.craft\\elements\\Asset.0.heading','\"Volumes\"'),('elementSources.craft\\elements\\Asset.0.type','\"heading\"'),('elementSources.craft\\elements\\Asset.1.defaultSort.0','\"dateCreated\"'),('elementSources.craft\\elements\\Asset.1.defaultSort.1','\"desc\"'),('elementSources.craft\\elements\\Asset.1.disabled','false'),('elementSources.craft\\elements\\Asset.1.key','\"volume:c9a4fbad-6ca0-4e20-ba72-da2c14a38190\"'),('elementSources.craft\\elements\\Asset.1.tableAttributes.0','\"imageSize\"'),('elementSources.craft\\elements\\Asset.1.tableAttributes.1','\"field:a73e7c96-e9d2-4751-bf01-8a6baf5f3c46\"'),('elementSources.craft\\elements\\Asset.1.tableAttributes.2','\"dateModified\"'),('elementSources.craft\\elements\\Asset.1.tableAttributes.3','\"link\"'),('elementSources.craft\\elements\\Asset.1.type','\"native\"'),('elementSources.craft\\elements\\Asset.2.defaultSort.0','\"dateCreated\"'),('elementSources.craft\\elements\\Asset.2.defaultSort.1','\"desc\"'),('elementSources.craft\\elements\\Asset.2.disabled','false'),('elementSources.craft\\elements\\Asset.2.key','\"volume:efd6d899-7b71-4318-8402-669e92416168\"'),('elementSources.craft\\elements\\Asset.2.tableAttributes.0','\"filename\"'),('elementSources.craft\\elements\\Asset.2.tableAttributes.1','\"kind\"'),('elementSources.craft\\elements\\Asset.2.tableAttributes.2','\"imageSize\"'),('elementSources.craft\\elements\\Asset.2.tableAttributes.3','\"size\"'),('elementSources.craft\\elements\\Asset.2.tableAttributes.4','\"dateModified\"'),('elementSources.craft\\elements\\Asset.2.type','\"native\"'),('elementSources.craft\\elements\\Asset.3.heading','\"Work\"'),('elementSources.craft\\elements\\Asset.3.type','\"heading\"'),('elementSources.craft\\elements\\Asset.4.condition.class','\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"'),('elementSources.craft\\elements\\Asset.4.condition.conditionRules.0.class','\"craft\\\\fields\\\\conditions\\\\TextFieldConditionRule\"'),('elementSources.craft\\elements\\Asset.4.condition.conditionRules.0.fieldUid','\"a73e7c96-e9d2-4751-bf01-8a6baf5f3c46\"'),('elementSources.craft\\elements\\Asset.4.condition.conditionRules.0.operator','\"empty\"'),('elementSources.craft\\elements\\Asset.4.condition.conditionRules.0.uid','\"3c30e8ff-c879-49ed-a325-235c9a221596\"'),('elementSources.craft\\elements\\Asset.4.condition.conditionRules.0.value','\"\"'),('elementSources.craft\\elements\\Asset.4.condition.conditionRules.1.class','\"craft\\\\elements\\\\conditions\\\\assets\\\\VolumeConditionRule\"'),('elementSources.craft\\elements\\Asset.4.condition.conditionRules.1.operator','\"in\"'),('elementSources.craft\\elements\\Asset.4.condition.conditionRules.1.uid','\"f80300e6-e686-4b27-afb3-d9827b4a3732\"'),('elementSources.craft\\elements\\Asset.4.condition.conditionRules.1.values.0','\"c9a4fbad-6ca0-4e20-ba72-da2c14a38190\"'),('elementSources.craft\\elements\\Asset.4.condition.elementType','\"craft\\\\elements\\\\Asset\"'),('elementSources.craft\\elements\\Asset.4.condition.fieldContext','\"global\"'),('elementSources.craft\\elements\\Asset.4.defaultSort.0','\"title\"'),('elementSources.craft\\elements\\Asset.4.defaultSort.1','\"asc\"'),('elementSources.craft\\elements\\Asset.4.key','\"custom:b27f0d6e-cf07-4a3e-b45e-7f9fe4494f87\"'),('elementSources.craft\\elements\\Asset.4.label','\"Missing alt text\"'),('elementSources.craft\\elements\\Asset.4.tableAttributes.0','\"imageSize\"'),('elementSources.craft\\elements\\Asset.4.tableAttributes.1','\"location\"'),('elementSources.craft\\elements\\Asset.4.type','\"custom\"'),('elementSources.craft\\elements\\Entry.0.defaultSort.0','\"postDate\"'),('elementSources.craft\\elements\\Entry.0.defaultSort.1','\"desc\"'),('elementSources.craft\\elements\\Entry.0.disabled','false'),('elementSources.craft\\elements\\Entry.0.key','\"*\"'),('elementSources.craft\\elements\\Entry.0.tableAttributes.0','\"section\"'),('elementSources.craft\\elements\\Entry.0.tableAttributes.1','\"postDate\"'),('elementSources.craft\\elements\\Entry.0.tableAttributes.2','\"expiryDate\"'),('elementSources.craft\\elements\\Entry.0.tableAttributes.3','\"link\"'),('elementSources.craft\\elements\\Entry.0.type','\"native\"'),('elementSources.craft\\elements\\Entry.1.heading','\"Site\"'),('elementSources.craft\\elements\\Entry.1.type','\"heading\"'),('elementSources.craft\\elements\\Entry.2.defaultSort.0','\"title\"'),('elementSources.craft\\elements\\Entry.2.defaultSort.1','\"asc\"'),('elementSources.craft\\elements\\Entry.2.disabled','false'),('elementSources.craft\\elements\\Entry.2.key','\"singles\"'),('elementSources.craft\\elements\\Entry.2.tableAttributes.0','\"section\"'),('elementSources.craft\\elements\\Entry.2.tableAttributes.1','\"field:1d65442c-c0b9-46f4-8518-9a6c53e21bc1\"'),('elementSources.craft\\elements\\Entry.2.tableAttributes.2','\"link\"'),('elementSources.craft\\elements\\Entry.2.type','\"native\"'),('elementSources.craft\\elements\\Entry.3.heading','\"Content\"'),('elementSources.craft\\elements\\Entry.3.type','\"heading\"'),('elementSources.craft\\elements\\Entry.4.defaultSort.0','\"postDate\"'),('elementSources.craft\\elements\\Entry.4.defaultSort.1','\"desc\"'),('elementSources.craft\\elements\\Entry.4.disabled','false'),('elementSources.craft\\elements\\Entry.4.key','\"section:5f021491-7c29-4320-be70-454d594268af\"'),('elementSources.craft\\elements\\Entry.4.tableAttributes.0','\"type\"'),('elementSources.craft\\elements\\Entry.4.tableAttributes.1','\"field:1d65442c-c0b9-46f4-8518-9a6c53e21bc1\"'),('elementSources.craft\\elements\\Entry.4.tableAttributes.2','\"drafts\"'),('elementSources.craft\\elements\\Entry.4.tableAttributes.3','\"postDate\"'),('elementSources.craft\\elements\\Entry.4.tableAttributes.4','\"link\"'),('elementSources.craft\\elements\\Entry.4.type','\"native\"'),('elementSources.craft\\elements\\Entry.5.defaultSort.0','\"postDate\"'),('elementSources.craft\\elements\\Entry.5.defaultSort.1','\"desc\"'),('elementSources.craft\\elements\\Entry.5.disabled','false'),('elementSources.craft\\elements\\Entry.5.key','\"section:585f70b2-f84a-47ff-ad71-3faff9698ba9\"'),('elementSources.craft\\elements\\Entry.5.tableAttributes.0','\"field:1d65442c-c0b9-46f4-8518-9a6c53e21bc1\"'),('elementSources.craft\\elements\\Entry.5.tableAttributes.1','\"drafts\"'),('elementSources.craft\\elements\\Entry.5.tableAttributes.2','\"postDate\"'),('elementSources.craft\\elements\\Entry.5.tableAttributes.3','\"link\"'),('elementSources.craft\\elements\\Entry.5.type','\"native\"'),('email.fromEmail','\"admin@example.com\"'),('email.fromName','\"Craft 4 Blank\"'),('email.replyToEmail','null'),('email.template','null'),('email.transportSettings.host','\"$MAILHOG_SMTP_HOSTNAME\"'),('email.transportSettings.password','\"\"'),('email.transportSettings.port','\"$MAILHOG_SMTP_PORT\"'),('email.transportSettings.useAuthentication','\"0\"'),('email.transportSettings.username','\"\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Smtp\"'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elementCondition','null'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.0.autocapitalize','true'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.0.autocomplete','false'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.0.autocorrect','true'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.0.class','null'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.0.disabled','false'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.0.elementCondition','null'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.0.id','null'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.0.instructions','null'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.0.label','null'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.0.max','null'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.0.min','null'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.0.name','null'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.0.orientation','null'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.0.placeholder','null'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.0.readonly','false'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.0.requirable','false'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.0.size','null'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.0.step','null'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.0.tip','null'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.0.title','null'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.0.uid','\"4e057a4a-237b-4fe7-9d2a-93c9a509b52d\"'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.0.userCondition','null'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.0.warning','null'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.0.width','100'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.1.elementCondition','null'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.1.fieldUid','\"1d65442c-c0b9-46f4-8518-9a6c53e21bc1\"'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.1.instructions','null'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.1.label','null'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.1.required','false'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.1.tip','null'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.1.uid','\"97b747f6-bfd0-4219-8bc2-64570fc4d663\"'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.1.userCondition','null'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.1.warning','null'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.1.width','100'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.2.elementCondition','null'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.2.fieldUid','\"95f98672-9562-44a0-8639-92d2b55ceeb6\"'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.2.instructions','null'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.2.label','null'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.2.required','false'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.2.tip','null'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.2.uid','\"4fd830e8-1079-4963-9692-82ad90a3b249\"'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.2.userCondition','null'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.2.warning','null'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.2.width','100'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.3.dismissible','true'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.3.elementCondition','null'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.3.style','\"tip\"'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.3.tip','\"Paginated post cards will be inserted here.\"'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\Tip\"'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.3.uid','\"cdd60b12-4c1c-4f0a-9dd5-09d54e854a6a\"'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.elements.3.userCondition','null'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.name','\"Inhalt\"'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.uid','\"c1d81378-8365-4b0c-abf6-f2ded6662401\"'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.fieldLayouts.3c0a4ae5-e759-4942-aa4e-c1737058ad0a.tabs.0.userCondition','null'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.handle','\"postIndex\"'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.hasTitleField','true'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.name','\"Post Index\"'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.section','\"5f021491-7c29-4320-be70-454d594268af\"'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.sortOrder','3'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.titleFormat','null'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.titleTranslationKeyFormat','null'),('entryTypes.0e989e8d-658a-4a1e-acf5-edb2387959ab.titleTranslationMethod','\"site\"'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elementCondition','null'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.0.autocapitalize','true'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.0.autocomplete','false'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.0.autocorrect','true'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.0.class','null'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.0.disabled','false'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.0.elementCondition','null'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.0.id','null'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.0.instructions','null'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.0.label','null'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.0.max','null'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.0.min','null'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.0.name','null'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.0.orientation','null'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.0.placeholder','null'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.0.readonly','false'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.0.requirable','false'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.0.size','null'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.0.step','null'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.0.tip','null'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.0.title','null'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.0.uid','\"49fe3231-3a75-4fe7-a00e-79142a90f462\"'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.0.userCondition','null'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.0.warning','null'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.0.width','100'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.1.elementCondition','null'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.1.fieldUid','\"1d65442c-c0b9-46f4-8518-9a6c53e21bc1\"'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.1.instructions','null'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.1.label','null'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.1.required','false'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.1.tip','null'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.1.uid','\"512724a6-2819-4625-a4d7-a9d4c0ad58b7\"'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.1.userCondition','null'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.1.warning','null'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.1.width','100'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.2.elementCondition','null'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.2.fieldUid','\"95f98672-9562-44a0-8639-92d2b55ceeb6\"'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.2.instructions','null'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.2.label','null'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.2.required','false'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.2.tip','null'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.2.uid','\"8707ff65-f32e-4002-852f-783d9891a7d6\"'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.2.userCondition','null'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.2.warning','null'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.elements.2.width','100'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.name','\"Content\"'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.uid','\"b120c952-7949-4f74-8505-d61aae23d0b2\"'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.fieldLayouts.066117b4-ac70-4bb1-b6c2-b892f40a2428.tabs.0.userCondition','null'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.handle','\"default\"'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.hasTitleField','true'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.name','\"Default\"'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.section','\"5f021491-7c29-4320-be70-454d594268af\"'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.sortOrder','1'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.titleFormat','null'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.titleTranslationKeyFormat','null'),('entryTypes.19a49103-3b3e-48c0-955b-996599d8c651.titleTranslationMethod','\"none\"'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elementCondition','null'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.0.autocapitalize','true'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.0.autocomplete','false'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.0.autocorrect','true'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.0.class','null'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.0.disabled','false'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.0.elementCondition','null'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.0.id','null'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.0.instructions','null'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.0.label','null'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.0.max','null'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.0.min','null'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.0.name','null'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.0.orientation','null'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.0.placeholder','null'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.0.readonly','false'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.0.requirable','false'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.0.size','null'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.0.step','null'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.0.tip','null'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.0.title','null'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.0.uid','\"174bd17b-9d69-405c-b8b0-5d1bf6df167a\"'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.0.userCondition','null'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.0.warning','null'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.0.width','100'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.1.elementCondition','null'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.1.fieldUid','\"1d65442c-c0b9-46f4-8518-9a6c53e21bc1\"'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.1.instructions','null'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.1.label','null'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.1.required','true'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.1.tip','null'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.1.uid','\"0bcdc5e3-aee1-418c-baf7-4913c1a9da66\"'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.1.userCondition','null'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.1.warning','null'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.1.width','100'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.2.elementCondition','null'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.2.fieldUid','\"95f98672-9562-44a0-8639-92d2b55ceeb6\"'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.2.instructions','null'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.2.label','null'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.2.required','true'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.2.tip','null'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.2.uid','\"ed5bf3fe-47cf-4f2e-bfa1-80966b3e0ac2\"'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.2.userCondition','null'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.2.warning','null'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.elements.2.width','100'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.name','\"Content\"'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.uid','\"547c5e84-0a14-4cb1-8567-8b569135baef\"'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.fieldLayouts.e3e14fe2-2ad5-4293-98c3-dc21e4272700.tabs.0.userCondition','null'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.handle','\"default\"'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.hasTitleField','true'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.name','\"Default\"'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.section','\"585f70b2-f84a-47ff-ad71-3faff9698ba9\"'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.sortOrder','1'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.titleFormat','null'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.titleTranslationKeyFormat','null'),('entryTypes.817d3d1a-d840-41a0-85a2-898d07aef769.titleTranslationMethod','\"language\"'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elementCondition','null'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.0.autocapitalize','true'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.0.autocomplete','false'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.0.autocorrect','true'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.0.class','null'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.0.disabled','false'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.0.elementCondition','null'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.0.id','null'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.0.instructions','null'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.0.label','null'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.0.max','null'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.0.min','null'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.0.name','null'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.0.orientation','null'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.0.placeholder','null'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.0.readonly','false'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.0.requirable','false'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.0.size','null'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.0.step','null'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.0.tip','null'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.0.title','null'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.0.uid','\"3bd488e7-e259-495d-94c6-7c255835294b\"'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.0.userCondition','null'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.0.warning','null'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.0.width','100'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.1.elementCondition','null'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.1.fieldUid','\"0837f34c-eb77-4cca-bded-4b9c2d688a90\"'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.1.instructions','null'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.1.label','null'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.1.required','false'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.1.tip','null'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.1.uid','\"b371723f-8ccc-4454-b211-37d094110d75\"'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.1.userCondition','null'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.1.warning','null'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.1.width','100'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.2.elementCondition','null'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.2.fieldUid','\"560e7c36-f763-440f-b9b5-1d87228bc6df\"'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.2.instructions','null'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.2.label','null'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.2.required','false'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.2.tip','null'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.2.uid','\"6e118f46-8419-4f4a-894a-ceeec190f3bc\"'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.2.userCondition','null'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.2.warning','null'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.2.width','100'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.3.elementCondition','null'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.3.fieldUid','\"1d65442c-c0b9-46f4-8518-9a6c53e21bc1\"'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.3.instructions','null'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.3.label','\"Default Featured Image\"'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.3.required','false'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.3.tip','null'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.3.uid','\"3adb9569-f9be-4f86-9a6c-2df3d6816874\"'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.3.userCondition','null'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.3.warning','null'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.elements.3.width','100'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.name','\"Content\"'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.uid','\"44927ccf-a678-414e-bd93-d96a5fd71966\"'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.fieldLayouts.bde6c865-48ee-4415-9ac7-2ef82c0b9b2f.tabs.0.userCondition','null'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.handle','\"siteInfo\"'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.hasTitleField','false'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.name','\"Site Info - Global Settings\"'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.section','\"a7f4b9fd-a554-4545-af32-3b57544c9432\"'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.sortOrder','1'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.titleFormat','\"{section.name|raw}\"'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.titleTranslationKeyFormat','null'),('entryTypes.8937bb02-c9d0-460b-81ef-1f1bda00e1f7.titleTranslationMethod','\"site\"'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elementCondition','null'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.0.autocapitalize','true'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.0.autocomplete','false'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.0.autocorrect','true'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.0.class','null'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.0.disabled','false'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.0.elementCondition','null'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.0.id','null'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.0.instructions','null'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.0.label','null'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.0.max','null'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.0.min','null'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.0.name','null'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.0.orientation','null'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.0.placeholder','null'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.0.readonly','false'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.0.requirable','false'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.0.size','null'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.0.step','null'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.0.tip','null'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.0.title','null'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\entries\\\\EntryTitleField\"'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.0.uid','\"4a31dadb-3ebe-4829-8236-2bfce7d72b5e\"'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.0.userCondition','null'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.0.warning','null'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.0.width','100'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.1.elementCondition','null'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.1.fieldUid','\"1d65442c-c0b9-46f4-8518-9a6c53e21bc1\"'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.1.instructions','null'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.1.label','null'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.1.required','false'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.1.tip','null'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.1.uid','\"6000495f-d20c-4d59-adac-23d09575d4f0\"'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.1.userCondition','null'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.1.warning','null'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.1.width','100'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.2.elementCondition','null'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.2.fieldUid','\"95f98672-9562-44a0-8639-92d2b55ceeb6\"'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.2.instructions','null'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.2.label','null'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.2.required','false'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.2.tip','null'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.2.uid','\"0442fdbb-7778-4e08-8d02-e35a73e9e416\"'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.2.userCondition','null'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.2.warning','null'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.elements.2.width','100'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.name','\"Content\"'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.uid','\"6aacb145-186e-49b1-9bd2-baaa3327a8ba\"'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.fieldLayouts.7401d309-e508-45cd-b5e8-a48f92283981.tabs.0.userCondition','null'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.handle','\"home\"'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.hasTitleField','false'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.name','\"Home\"'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.section','\"21e8b35e-5b6d-4f11-bc0e-26fcaa107ce8\"'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.sortOrder','1'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.titleFormat','\"{section.name|raw}\"'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.titleTranslationKeyFormat','null'),('entryTypes.ab2052c5-b53a-4cbd-b95d-96ea7489c375.titleTranslationMethod','\"site\"'),('fieldGroups.761cddc2-d969-4560-b5de-4bf2a393cb8a.name','\"Common\"'),('fieldGroups.bbbea387-f8a6-43f7-ab94-dc572bd0cc77.name','\"Site\"'),('fields.0837f34c-eb77-4cca-bded-4b9c2d688a90.columnSuffix','\"fzwghcns\"'),('fields.0837f34c-eb77-4cca-bded-4b9c2d688a90.contentColumnType','\"string(120)\"'),('fields.0837f34c-eb77-4cca-bded-4b9c2d688a90.fieldGroup','\"bbbea387-f8a6-43f7-ab94-dc572bd0cc77\"'),('fields.0837f34c-eb77-4cca-bded-4b9c2d688a90.handle','\"siteName\"'),('fields.0837f34c-eb77-4cca-bded-4b9c2d688a90.instructions','null'),('fields.0837f34c-eb77-4cca-bded-4b9c2d688a90.name','\"Site Name\"'),('fields.0837f34c-eb77-4cca-bded-4b9c2d688a90.searchable','false'),('fields.0837f34c-eb77-4cca-bded-4b9c2d688a90.settings.byteLimit','null'),('fields.0837f34c-eb77-4cca-bded-4b9c2d688a90.settings.charLimit','30'),('fields.0837f34c-eb77-4cca-bded-4b9c2d688a90.settings.code','false'),('fields.0837f34c-eb77-4cca-bded-4b9c2d688a90.settings.columnType','null'),('fields.0837f34c-eb77-4cca-bded-4b9c2d688a90.settings.initialRows','4'),('fields.0837f34c-eb77-4cca-bded-4b9c2d688a90.settings.multiline','false'),('fields.0837f34c-eb77-4cca-bded-4b9c2d688a90.settings.placeholder','null'),('fields.0837f34c-eb77-4cca-bded-4b9c2d688a90.settings.uiMode','\"normal\"'),('fields.0837f34c-eb77-4cca-bded-4b9c2d688a90.translationKeyFormat','null'),('fields.0837f34c-eb77-4cca-bded-4b9c2d688a90.translationMethod','\"none\"'),('fields.0837f34c-eb77-4cca-bded-4b9c2d688a90.type','\"craft\\\\fields\\\\PlainText\"'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.columnSuffix','null'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.contentColumnType','\"string\"'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.fieldGroup','\"761cddc2-d969-4560-b5de-4bf2a393cb8a\"'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.handle','\"featuredImage\"'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.instructions','\"At least 768px wide\"'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.name','\"Featured Image\"'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.searchable','false'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.allowedKinds.0','\"image\"'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.allowSelfRelations','false'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.allowSubfolders','false'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.allowUploads','true'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.branchLimit','null'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.defaultUploadLocationSource','\"volume:c9a4fbad-6ca0-4e20-ba72-da2c14a38190\"'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.defaultUploadLocationSubpath','\"featured\"'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.localizeRelations','false'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.maintainHierarchy','false'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.maxRelations','1'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.minRelations','null'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.previewMode','\"thumbs\"'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.restrictedDefaultUploadSubpath','null'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.restrictedLocationSource','\"volume:c9a4fbad-6ca0-4e20-ba72-da2c14a38190\"'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.restrictedLocationSubpath','null'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.restrictFiles','true'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.restrictLocation','false'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.selectionCondition.__assoc__.0.0','\"elementType\"'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.selectionCondition.__assoc__.0.1','\"craft\\\\elements\\\\Asset\"'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.selectionCondition.__assoc__.1.0','\"fieldContext\"'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.selectionCondition.__assoc__.1.1','\"global\"'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.selectionCondition.__assoc__.2.0','\"class\"'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.selectionCondition.__assoc__.2.1','\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.selectionCondition.__assoc__.3.0','\"conditionRules\"'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.selectionCondition.__assoc__.3.1.0.__assoc__.0.0','\"class\"'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.selectionCondition.__assoc__.3.1.0.__assoc__.0.1','\"craft\\\\elements\\\\conditions\\\\assets\\\\WidthConditionRule\"'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.selectionCondition.__assoc__.3.1.0.__assoc__.1.0','\"uid\"'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.selectionCondition.__assoc__.3.1.0.__assoc__.1.1','\"226805ac-3aea-4362-8bdc-7ddd00eab414\"'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.selectionCondition.__assoc__.3.1.0.__assoc__.2.0','\"operator\"'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.selectionCondition.__assoc__.3.1.0.__assoc__.2.1','\">=\"'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.selectionCondition.__assoc__.3.1.0.__assoc__.3.0','\"value\"'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.selectionCondition.__assoc__.3.1.0.__assoc__.3.1','\"768\"'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.selectionCondition.__assoc__.3.1.0.__assoc__.4.0','\"maxValue\"'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.selectionCondition.__assoc__.3.1.0.__assoc__.4.1','\"\"'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.selectionLabel','\"Select an image\"'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.showSiteMenu','false'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.showUnpermittedFiles','false'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.showUnpermittedVolumes','false'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.sources.0','\"volume:c9a4fbad-6ca0-4e20-ba72-da2c14a38190\"'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.targetSiteId','null'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.validateRelatedElements','true'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.settings.viewMode','\"large\"'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.translationKeyFormat','null'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.translationMethod','\"site\"'),('fields.1d65442c-c0b9-46f4-8518-9a6c53e21bc1.type','\"craft\\\\fields\\\\Assets\"'),('fields.560e7c36-f763-440f-b9b5-1d87228bc6df.columnSuffix','\"gsucoquh\"'),('fields.560e7c36-f763-440f-b9b5-1d87228bc6df.contentColumnType','\"string(120)\"'),('fields.560e7c36-f763-440f-b9b5-1d87228bc6df.fieldGroup','\"bbbea387-f8a6-43f7-ab94-dc572bd0cc77\"'),('fields.560e7c36-f763-440f-b9b5-1d87228bc6df.handle','\"copyright\"'),('fields.560e7c36-f763-440f-b9b5-1d87228bc6df.instructions','null'),('fields.560e7c36-f763-440f-b9b5-1d87228bc6df.name','\"Copyright\"'),('fields.560e7c36-f763-440f-b9b5-1d87228bc6df.searchable','false'),('fields.560e7c36-f763-440f-b9b5-1d87228bc6df.settings.byteLimit','null'),('fields.560e7c36-f763-440f-b9b5-1d87228bc6df.settings.charLimit','30'),('fields.560e7c36-f763-440f-b9b5-1d87228bc6df.settings.code','false'),('fields.560e7c36-f763-440f-b9b5-1d87228bc6df.settings.columnType','null'),('fields.560e7c36-f763-440f-b9b5-1d87228bc6df.settings.initialRows','4'),('fields.560e7c36-f763-440f-b9b5-1d87228bc6df.settings.multiline','false'),('fields.560e7c36-f763-440f-b9b5-1d87228bc6df.settings.placeholder','null'),('fields.560e7c36-f763-440f-b9b5-1d87228bc6df.settings.uiMode','\"normal\"'),('fields.560e7c36-f763-440f-b9b5-1d87228bc6df.translationKeyFormat','null'),('fields.560e7c36-f763-440f-b9b5-1d87228bc6df.translationMethod','\"none\"'),('fields.560e7c36-f763-440f-b9b5-1d87228bc6df.type','\"craft\\\\fields\\\\PlainText\"'),('fields.95f98672-9562-44a0-8639-92d2b55ceeb6.columnSuffix','null'),('fields.95f98672-9562-44a0-8639-92d2b55ceeb6.contentColumnType','\"string\"'),('fields.95f98672-9562-44a0-8639-92d2b55ceeb6.fieldGroup','\"761cddc2-d969-4560-b5de-4bf2a393cb8a\"'),('fields.95f98672-9562-44a0-8639-92d2b55ceeb6.handle','\"bodyContent\"'),('fields.95f98672-9562-44a0-8639-92d2b55ceeb6.instructions','null'),('fields.95f98672-9562-44a0-8639-92d2b55ceeb6.name','\"Body Content\"'),('fields.95f98672-9562-44a0-8639-92d2b55ceeb6.searchable','true'),('fields.95f98672-9562-44a0-8639-92d2b55ceeb6.settings.contentTable','\"{{%matrixcontent_bodycontent}}\"'),('fields.95f98672-9562-44a0-8639-92d2b55ceeb6.settings.maxBlocks','null'),('fields.95f98672-9562-44a0-8639-92d2b55ceeb6.settings.minBlocks','null'),('fields.95f98672-9562-44a0-8639-92d2b55ceeb6.settings.propagationKeyFormat','null'),('fields.95f98672-9562-44a0-8639-92d2b55ceeb6.settings.propagationMethod','\"all\"'),('fields.95f98672-9562-44a0-8639-92d2b55ceeb6.translationKeyFormat','null'),('fields.95f98672-9562-44a0-8639-92d2b55ceeb6.translationMethod','\"site\"'),('fields.95f98672-9562-44a0-8639-92d2b55ceeb6.type','\"craft\\\\fields\\\\Matrix\"'),('fields.a73e7c96-e9d2-4751-bf01-8a6baf5f3c46.columnSuffix','\"gvuxccdq\"'),('fields.a73e7c96-e9d2-4751-bf01-8a6baf5f3c46.contentColumnType','\"string(240)\"'),('fields.a73e7c96-e9d2-4751-bf01-8a6baf5f3c46.fieldGroup','\"761cddc2-d969-4560-b5de-4bf2a393cb8a\"'),('fields.a73e7c96-e9d2-4751-bf01-8a6baf5f3c46.handle','\"altText\"'),('fields.a73e7c96-e9d2-4751-bf01-8a6baf5f3c46.instructions','null'),('fields.a73e7c96-e9d2-4751-bf01-8a6baf5f3c46.name','\"Alt Text\"'),('fields.a73e7c96-e9d2-4751-bf01-8a6baf5f3c46.searchable','false'),('fields.a73e7c96-e9d2-4751-bf01-8a6baf5f3c46.settings.byteLimit','240'),('fields.a73e7c96-e9d2-4751-bf01-8a6baf5f3c46.settings.charLimit','null'),('fields.a73e7c96-e9d2-4751-bf01-8a6baf5f3c46.settings.code','false'),('fields.a73e7c96-e9d2-4751-bf01-8a6baf5f3c46.settings.columnType','null'),('fields.a73e7c96-e9d2-4751-bf01-8a6baf5f3c46.settings.initialRows','4'),('fields.a73e7c96-e9d2-4751-bf01-8a6baf5f3c46.settings.multiline','false'),('fields.a73e7c96-e9d2-4751-bf01-8a6baf5f3c46.settings.placeholder','null'),('fields.a73e7c96-e9d2-4751-bf01-8a6baf5f3c46.settings.uiMode','\"normal\"'),('fields.a73e7c96-e9d2-4751-bf01-8a6baf5f3c46.translationKeyFormat','null'),('fields.a73e7c96-e9d2-4751-bf01-8a6baf5f3c46.translationMethod','\"language\"'),('fields.a73e7c96-e9d2-4751-bf01-8a6baf5f3c46.type','\"craft\\\\fields\\\\PlainText\"'),('fs.imagesFs.hasUrls','true'),('fs.imagesFs.name','\"Images FS\"'),('fs.imagesFs.settings.path','\"@webroot/images\"'),('fs.imagesFs.type','\"craft\\\\fs\\\\Local\"'),('fs.imagesFs.url','\"@web/images\"'),('fs.internalFs.hasUrls','true'),('fs.internalFs.name','\"Internal FS\"'),('fs.internalFs.settings.path','\"@webroot/files\"'),('fs.internalFs.type','\"craft\\\\fs\\\\Local\"'),('fs.internalFs.url','\"@web/files\"'),('graphql.publicToken.enabled','true'),('graphql.publicToken.expiryDate','null'),('graphql.schemas.2be01897-dbaf-4c19-a6d9-db80ada8fc8f.isPublic','true'),('graphql.schemas.2be01897-dbaf-4c19-a6d9-db80ada8fc8f.name','\"Public Schema\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.field','\"95f98672-9562-44a0-8639-92d2b55ceeb6\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fieldLayouts.0a8eb920-774e-4467-b009-325d6a5b47a6.tabs.0.elementCondition','null'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fieldLayouts.0a8eb920-774e-4467-b009-325d6a5b47a6.tabs.0.elements.0.elementCondition','null'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fieldLayouts.0a8eb920-774e-4467-b009-325d6a5b47a6.tabs.0.elements.0.fieldUid','\"63e734ee-d709-488a-bd8d-3a90ab070825\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fieldLayouts.0a8eb920-774e-4467-b009-325d6a5b47a6.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fieldLayouts.0a8eb920-774e-4467-b009-325d6a5b47a6.tabs.0.elements.0.label','null'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fieldLayouts.0a8eb920-774e-4467-b009-325d6a5b47a6.tabs.0.elements.0.required','true'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fieldLayouts.0a8eb920-774e-4467-b009-325d6a5b47a6.tabs.0.elements.0.tip','null'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fieldLayouts.0a8eb920-774e-4467-b009-325d6a5b47a6.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fieldLayouts.0a8eb920-774e-4467-b009-325d6a5b47a6.tabs.0.elements.0.uid','\"d6458e2f-6659-428f-bfed-105b9d672eea\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fieldLayouts.0a8eb920-774e-4467-b009-325d6a5b47a6.tabs.0.elements.0.userCondition','null'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fieldLayouts.0a8eb920-774e-4467-b009-325d6a5b47a6.tabs.0.elements.0.warning','null'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fieldLayouts.0a8eb920-774e-4467-b009-325d6a5b47a6.tabs.0.elements.0.width','100'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fieldLayouts.0a8eb920-774e-4467-b009-325d6a5b47a6.tabs.0.elements.1.elementCondition','null'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fieldLayouts.0a8eb920-774e-4467-b009-325d6a5b47a6.tabs.0.elements.1.fieldUid','\"1eac01fa-9e12-426e-a043-60ae35acf391\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fieldLayouts.0a8eb920-774e-4467-b009-325d6a5b47a6.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fieldLayouts.0a8eb920-774e-4467-b009-325d6a5b47a6.tabs.0.elements.1.label','null'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fieldLayouts.0a8eb920-774e-4467-b009-325d6a5b47a6.tabs.0.elements.1.required','false'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fieldLayouts.0a8eb920-774e-4467-b009-325d6a5b47a6.tabs.0.elements.1.tip','null'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fieldLayouts.0a8eb920-774e-4467-b009-325d6a5b47a6.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fieldLayouts.0a8eb920-774e-4467-b009-325d6a5b47a6.tabs.0.elements.1.uid','\"44761774-ed94-4a0a-8278-6ea13d3b3d48\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fieldLayouts.0a8eb920-774e-4467-b009-325d6a5b47a6.tabs.0.elements.1.userCondition','null'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fieldLayouts.0a8eb920-774e-4467-b009-325d6a5b47a6.tabs.0.elements.1.warning','null'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fieldLayouts.0a8eb920-774e-4467-b009-325d6a5b47a6.tabs.0.elements.1.width','100'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fieldLayouts.0a8eb920-774e-4467-b009-325d6a5b47a6.tabs.0.elements.2.elementCondition','null'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fieldLayouts.0a8eb920-774e-4467-b009-325d6a5b47a6.tabs.0.elements.2.fieldUid','\"eb230d0c-f88a-40de-a743-994de14eb8f8\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fieldLayouts.0a8eb920-774e-4467-b009-325d6a5b47a6.tabs.0.elements.2.instructions','null'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fieldLayouts.0a8eb920-774e-4467-b009-325d6a5b47a6.tabs.0.elements.2.label','null'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fieldLayouts.0a8eb920-774e-4467-b009-325d6a5b47a6.tabs.0.elements.2.required','false'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fieldLayouts.0a8eb920-774e-4467-b009-325d6a5b47a6.tabs.0.elements.2.tip','null'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fieldLayouts.0a8eb920-774e-4467-b009-325d6a5b47a6.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fieldLayouts.0a8eb920-774e-4467-b009-325d6a5b47a6.tabs.0.elements.2.uid','\"867dfbcf-588a-435f-8dbd-b31e4d4a9347\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fieldLayouts.0a8eb920-774e-4467-b009-325d6a5b47a6.tabs.0.elements.2.userCondition','null'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fieldLayouts.0a8eb920-774e-4467-b009-325d6a5b47a6.tabs.0.elements.2.warning','null'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fieldLayouts.0a8eb920-774e-4467-b009-325d6a5b47a6.tabs.0.elements.2.width','100'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fieldLayouts.0a8eb920-774e-4467-b009-325d6a5b47a6.tabs.0.name','\"Content\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fieldLayouts.0a8eb920-774e-4467-b009-325d6a5b47a6.tabs.0.uid','\"756bc6cb-dc8c-4411-a1ce-c980d292105f\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fieldLayouts.0a8eb920-774e-4467-b009-325d6a5b47a6.tabs.0.userCondition','null'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.1eac01fa-9e12-426e-a043-60ae35acf391.columnSuffix','\"ljffsgdr\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.1eac01fa-9e12-426e-a043-60ae35acf391.contentColumnType','\"string(240)\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.1eac01fa-9e12-426e-a043-60ae35acf391.fieldGroup','null'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.1eac01fa-9e12-426e-a043-60ae35acf391.handle','\"cite\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.1eac01fa-9e12-426e-a043-60ae35acf391.instructions','null'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.1eac01fa-9e12-426e-a043-60ae35acf391.name','\"Cite\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.1eac01fa-9e12-426e-a043-60ae35acf391.searchable','true'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.1eac01fa-9e12-426e-a043-60ae35acf391.settings.byteLimit','null'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.1eac01fa-9e12-426e-a043-60ae35acf391.settings.charLimit','60'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.1eac01fa-9e12-426e-a043-60ae35acf391.settings.code','false'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.1eac01fa-9e12-426e-a043-60ae35acf391.settings.columnType','null'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.1eac01fa-9e12-426e-a043-60ae35acf391.settings.initialRows','4'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.1eac01fa-9e12-426e-a043-60ae35acf391.settings.multiline','false'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.1eac01fa-9e12-426e-a043-60ae35acf391.settings.placeholder','null'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.1eac01fa-9e12-426e-a043-60ae35acf391.settings.uiMode','\"normal\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.1eac01fa-9e12-426e-a043-60ae35acf391.translationKeyFormat','null'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.1eac01fa-9e12-426e-a043-60ae35acf391.translationMethod','\"language\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.1eac01fa-9e12-426e-a043-60ae35acf391.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.63e734ee-d709-488a-bd8d-3a90ab070825.columnSuffix','\"yfidlzze\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.63e734ee-d709-488a-bd8d-3a90ab070825.contentColumnType','\"text\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.63e734ee-d709-488a-bd8d-3a90ab070825.fieldGroup','null'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.63e734ee-d709-488a-bd8d-3a90ab070825.handle','\"text\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.63e734ee-d709-488a-bd8d-3a90ab070825.instructions','null'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.63e734ee-d709-488a-bd8d-3a90ab070825.name','\"Text\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.63e734ee-d709-488a-bd8d-3a90ab070825.searchable','true'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.63e734ee-d709-488a-bd8d-3a90ab070825.settings.byteLimit','null'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.63e734ee-d709-488a-bd8d-3a90ab070825.settings.charLimit','null'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.63e734ee-d709-488a-bd8d-3a90ab070825.settings.code','false'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.63e734ee-d709-488a-bd8d-3a90ab070825.settings.columnType','null'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.63e734ee-d709-488a-bd8d-3a90ab070825.settings.initialRows','1'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.63e734ee-d709-488a-bd8d-3a90ab070825.settings.multiline','true'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.63e734ee-d709-488a-bd8d-3a90ab070825.settings.placeholder','null'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.63e734ee-d709-488a-bd8d-3a90ab070825.settings.uiMode','\"normal\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.63e734ee-d709-488a-bd8d-3a90ab070825.translationKeyFormat','null'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.63e734ee-d709-488a-bd8d-3a90ab070825.translationMethod','\"language\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.63e734ee-d709-488a-bd8d-3a90ab070825.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.eb230d0c-f88a-40de-a743-994de14eb8f8.columnSuffix','\"vdcfeeit\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.eb230d0c-f88a-40de-a743-994de14eb8f8.contentColumnType','\"string\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.eb230d0c-f88a-40de-a743-994de14eb8f8.fieldGroup','null'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.eb230d0c-f88a-40de-a743-994de14eb8f8.handle','\"style\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.eb230d0c-f88a-40de-a743-994de14eb8f8.instructions','null'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.eb230d0c-f88a-40de-a743-994de14eb8f8.name','\"Style\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.eb230d0c-f88a-40de-a743-994de14eb8f8.searchable','false'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.eb230d0c-f88a-40de-a743-994de14eb8f8.settings.options.0.__assoc__.0.0','\"label\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.eb230d0c-f88a-40de-a743-994de14eb8f8.settings.options.0.__assoc__.0.1','\"Default\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.eb230d0c-f88a-40de-a743-994de14eb8f8.settings.options.0.__assoc__.1.0','\"value\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.eb230d0c-f88a-40de-a743-994de14eb8f8.settings.options.0.__assoc__.1.1','\"default\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.eb230d0c-f88a-40de-a743-994de14eb8f8.settings.options.0.__assoc__.2.0','\"default\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.eb230d0c-f88a-40de-a743-994de14eb8f8.settings.options.0.__assoc__.2.1','\"1\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.eb230d0c-f88a-40de-a743-994de14eb8f8.settings.options.1.__assoc__.0.0','\"label\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.eb230d0c-f88a-40de-a743-994de14eb8f8.settings.options.1.__assoc__.0.1','\"Borders Top Bottom\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.eb230d0c-f88a-40de-a743-994de14eb8f8.settings.options.1.__assoc__.1.0','\"value\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.eb230d0c-f88a-40de-a743-994de14eb8f8.settings.options.1.__assoc__.1.1','\"bordersTopBottom\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.eb230d0c-f88a-40de-a743-994de14eb8f8.settings.options.1.__assoc__.2.0','\"default\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.eb230d0c-f88a-40de-a743-994de14eb8f8.settings.options.1.__assoc__.2.1','\"\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.eb230d0c-f88a-40de-a743-994de14eb8f8.translationKeyFormat','null'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.eb230d0c-f88a-40de-a743-994de14eb8f8.translationMethod','\"none\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.fields.eb230d0c-f88a-40de-a743-994de14eb8f8.type','\"craft\\\\fields\\\\Dropdown\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.handle','\"quote\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.name','\"Quote\"'),('matrixBlockTypes.19d8011f-2129-4d06-b597-49d7125063c7.sortOrder','4'),('matrixBlockTypes.78f9590c-8302-4bbc-8e62-39e3f6a2bd57.field','\"95f98672-9562-44a0-8639-92d2b55ceeb6\"'),('matrixBlockTypes.78f9590c-8302-4bbc-8e62-39e3f6a2bd57.fieldLayouts.6e414421-9c51-4c18-ae15-b858843720ed.tabs.0.elementCondition','null'),('matrixBlockTypes.78f9590c-8302-4bbc-8e62-39e3f6a2bd57.fieldLayouts.6e414421-9c51-4c18-ae15-b858843720ed.tabs.0.elements.0.elementCondition','null'),('matrixBlockTypes.78f9590c-8302-4bbc-8e62-39e3f6a2bd57.fieldLayouts.6e414421-9c51-4c18-ae15-b858843720ed.tabs.0.elements.0.fieldUid','\"78ba6fca-0979-4552-a36e-f6f7a001b0f5\"'),('matrixBlockTypes.78f9590c-8302-4bbc-8e62-39e3f6a2bd57.fieldLayouts.6e414421-9c51-4c18-ae15-b858843720ed.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.78f9590c-8302-4bbc-8e62-39e3f6a2bd57.fieldLayouts.6e414421-9c51-4c18-ae15-b858843720ed.tabs.0.elements.0.label','null'),('matrixBlockTypes.78f9590c-8302-4bbc-8e62-39e3f6a2bd57.fieldLayouts.6e414421-9c51-4c18-ae15-b858843720ed.tabs.0.elements.0.required','true'),('matrixBlockTypes.78f9590c-8302-4bbc-8e62-39e3f6a2bd57.fieldLayouts.6e414421-9c51-4c18-ae15-b858843720ed.tabs.0.elements.0.tip','null'),('matrixBlockTypes.78f9590c-8302-4bbc-8e62-39e3f6a2bd57.fieldLayouts.6e414421-9c51-4c18-ae15-b858843720ed.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.78f9590c-8302-4bbc-8e62-39e3f6a2bd57.fieldLayouts.6e414421-9c51-4c18-ae15-b858843720ed.tabs.0.elements.0.uid','\"d5c0bca6-0d1b-41e4-b861-ef78e7dfc7c8\"'),('matrixBlockTypes.78f9590c-8302-4bbc-8e62-39e3f6a2bd57.fieldLayouts.6e414421-9c51-4c18-ae15-b858843720ed.tabs.0.elements.0.userCondition','null'),('matrixBlockTypes.78f9590c-8302-4bbc-8e62-39e3f6a2bd57.fieldLayouts.6e414421-9c51-4c18-ae15-b858843720ed.tabs.0.elements.0.warning','null'),('matrixBlockTypes.78f9590c-8302-4bbc-8e62-39e3f6a2bd57.fieldLayouts.6e414421-9c51-4c18-ae15-b858843720ed.tabs.0.elements.0.width','100'),('matrixBlockTypes.78f9590c-8302-4bbc-8e62-39e3f6a2bd57.fieldLayouts.6e414421-9c51-4c18-ae15-b858843720ed.tabs.0.name','\"Content\"'),('matrixBlockTypes.78f9590c-8302-4bbc-8e62-39e3f6a2bd57.fieldLayouts.6e414421-9c51-4c18-ae15-b858843720ed.tabs.0.uid','\"cb85e172-be3d-443c-8def-36bee1a8c4a6\"'),('matrixBlockTypes.78f9590c-8302-4bbc-8e62-39e3f6a2bd57.fieldLayouts.6e414421-9c51-4c18-ae15-b858843720ed.tabs.0.userCondition','null'),('matrixBlockTypes.78f9590c-8302-4bbc-8e62-39e3f6a2bd57.fields.78ba6fca-0979-4552-a36e-f6f7a001b0f5.columnSuffix','\"badcaarf\"'),('matrixBlockTypes.78f9590c-8302-4bbc-8e62-39e3f6a2bd57.fields.78ba6fca-0979-4552-a36e-f6f7a001b0f5.contentColumnType','\"text\"'),('matrixBlockTypes.78f9590c-8302-4bbc-8e62-39e3f6a2bd57.fields.78ba6fca-0979-4552-a36e-f6f7a001b0f5.fieldGroup','null'),('matrixBlockTypes.78f9590c-8302-4bbc-8e62-39e3f6a2bd57.fields.78ba6fca-0979-4552-a36e-f6f7a001b0f5.handle','\"text\"'),('matrixBlockTypes.78f9590c-8302-4bbc-8e62-39e3f6a2bd57.fields.78ba6fca-0979-4552-a36e-f6f7a001b0f5.instructions','null'),('matrixBlockTypes.78f9590c-8302-4bbc-8e62-39e3f6a2bd57.fields.78ba6fca-0979-4552-a36e-f6f7a001b0f5.name','\"Text\"'),('matrixBlockTypes.78f9590c-8302-4bbc-8e62-39e3f6a2bd57.fields.78ba6fca-0979-4552-a36e-f6f7a001b0f5.searchable','true'),('matrixBlockTypes.78f9590c-8302-4bbc-8e62-39e3f6a2bd57.fields.78ba6fca-0979-4552-a36e-f6f7a001b0f5.settings.byteLimit','null'),('matrixBlockTypes.78f9590c-8302-4bbc-8e62-39e3f6a2bd57.fields.78ba6fca-0979-4552-a36e-f6f7a001b0f5.settings.charLimit','null'),('matrixBlockTypes.78f9590c-8302-4bbc-8e62-39e3f6a2bd57.fields.78ba6fca-0979-4552-a36e-f6f7a001b0f5.settings.code','false'),('matrixBlockTypes.78f9590c-8302-4bbc-8e62-39e3f6a2bd57.fields.78ba6fca-0979-4552-a36e-f6f7a001b0f5.settings.columnType','null'),('matrixBlockTypes.78f9590c-8302-4bbc-8e62-39e3f6a2bd57.fields.78ba6fca-0979-4552-a36e-f6f7a001b0f5.settings.initialRows','4'),('matrixBlockTypes.78f9590c-8302-4bbc-8e62-39e3f6a2bd57.fields.78ba6fca-0979-4552-a36e-f6f7a001b0f5.settings.multiline','true'),('matrixBlockTypes.78f9590c-8302-4bbc-8e62-39e3f6a2bd57.fields.78ba6fca-0979-4552-a36e-f6f7a001b0f5.settings.placeholder','null'),('matrixBlockTypes.78f9590c-8302-4bbc-8e62-39e3f6a2bd57.fields.78ba6fca-0979-4552-a36e-f6f7a001b0f5.settings.uiMode','\"normal\"'),('matrixBlockTypes.78f9590c-8302-4bbc-8e62-39e3f6a2bd57.fields.78ba6fca-0979-4552-a36e-f6f7a001b0f5.translationKeyFormat','null'),('matrixBlockTypes.78f9590c-8302-4bbc-8e62-39e3f6a2bd57.fields.78ba6fca-0979-4552-a36e-f6f7a001b0f5.translationMethod','\"language\"'),('matrixBlockTypes.78f9590c-8302-4bbc-8e62-39e3f6a2bd57.fields.78ba6fca-0979-4552-a36e-f6f7a001b0f5.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.78f9590c-8302-4bbc-8e62-39e3f6a2bd57.handle','\"text\"'),('matrixBlockTypes.78f9590c-8302-4bbc-8e62-39e3f6a2bd57.name','\"Text\"'),('matrixBlockTypes.78f9590c-8302-4bbc-8e62-39e3f6a2bd57.sortOrder','2'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.field','\"95f98672-9562-44a0-8639-92d2b55ceeb6\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fieldLayouts.b96ba22c-1dc3-4984-9618-dba5bf9072e1.tabs.0.elementCondition','null'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fieldLayouts.b96ba22c-1dc3-4984-9618-dba5bf9072e1.tabs.0.elements.0.elementCondition','null'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fieldLayouts.b96ba22c-1dc3-4984-9618-dba5bf9072e1.tabs.0.elements.0.fieldUid','\"abb455ba-032b-461d-9c8d-dca9ed3fc7bd\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fieldLayouts.b96ba22c-1dc3-4984-9618-dba5bf9072e1.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fieldLayouts.b96ba22c-1dc3-4984-9618-dba5bf9072e1.tabs.0.elements.0.label','null'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fieldLayouts.b96ba22c-1dc3-4984-9618-dba5bf9072e1.tabs.0.elements.0.required','true'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fieldLayouts.b96ba22c-1dc3-4984-9618-dba5bf9072e1.tabs.0.elements.0.tip','null'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fieldLayouts.b96ba22c-1dc3-4984-9618-dba5bf9072e1.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fieldLayouts.b96ba22c-1dc3-4984-9618-dba5bf9072e1.tabs.0.elements.0.uid','\"53b039bc-1e34-432c-adfd-6ebaa5e40260\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fieldLayouts.b96ba22c-1dc3-4984-9618-dba5bf9072e1.tabs.0.elements.0.userCondition','null'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fieldLayouts.b96ba22c-1dc3-4984-9618-dba5bf9072e1.tabs.0.elements.0.warning','null'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fieldLayouts.b96ba22c-1dc3-4984-9618-dba5bf9072e1.tabs.0.elements.0.width','100'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fieldLayouts.b96ba22c-1dc3-4984-9618-dba5bf9072e1.tabs.0.elements.1.elementCondition','null'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fieldLayouts.b96ba22c-1dc3-4984-9618-dba5bf9072e1.tabs.0.elements.1.fieldUid','\"4b9eed77-fa62-4ecc-9486-744a64f075d4\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fieldLayouts.b96ba22c-1dc3-4984-9618-dba5bf9072e1.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fieldLayouts.b96ba22c-1dc3-4984-9618-dba5bf9072e1.tabs.0.elements.1.label','null'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fieldLayouts.b96ba22c-1dc3-4984-9618-dba5bf9072e1.tabs.0.elements.1.required','false'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fieldLayouts.b96ba22c-1dc3-4984-9618-dba5bf9072e1.tabs.0.elements.1.tip','null'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fieldLayouts.b96ba22c-1dc3-4984-9618-dba5bf9072e1.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fieldLayouts.b96ba22c-1dc3-4984-9618-dba5bf9072e1.tabs.0.elements.1.uid','\"e7f50fae-c8f1-4a55-9231-3186509b9f19\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fieldLayouts.b96ba22c-1dc3-4984-9618-dba5bf9072e1.tabs.0.elements.1.userCondition','null'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fieldLayouts.b96ba22c-1dc3-4984-9618-dba5bf9072e1.tabs.0.elements.1.warning','null'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fieldLayouts.b96ba22c-1dc3-4984-9618-dba5bf9072e1.tabs.0.elements.1.width','100'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fieldLayouts.b96ba22c-1dc3-4984-9618-dba5bf9072e1.tabs.0.name','\"Content\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fieldLayouts.b96ba22c-1dc3-4984-9618-dba5bf9072e1.tabs.0.uid','\"76e79da0-ac5e-42ef-b095-ff42e4ff2b28\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fieldLayouts.b96ba22c-1dc3-4984-9618-dba5bf9072e1.tabs.0.userCondition','null'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.4b9eed77-fa62-4ecc-9486-744a64f075d4.columnSuffix','\"xngnntxq\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.4b9eed77-fa62-4ecc-9486-744a64f075d4.contentColumnType','\"string(250)\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.4b9eed77-fa62-4ecc-9486-744a64f075d4.fieldGroup','null'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.4b9eed77-fa62-4ecc-9486-744a64f075d4.handle','\"caption\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.4b9eed77-fa62-4ecc-9486-744a64f075d4.instructions','null'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.4b9eed77-fa62-4ecc-9486-744a64f075d4.name','\"Caption\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.4b9eed77-fa62-4ecc-9486-744a64f075d4.searchable','true'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.4b9eed77-fa62-4ecc-9486-744a64f075d4.settings.byteLimit','250'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.4b9eed77-fa62-4ecc-9486-744a64f075d4.settings.charLimit','null'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.4b9eed77-fa62-4ecc-9486-744a64f075d4.settings.code','false'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.4b9eed77-fa62-4ecc-9486-744a64f075d4.settings.columnType','null'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.4b9eed77-fa62-4ecc-9486-744a64f075d4.settings.initialRows','4'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.4b9eed77-fa62-4ecc-9486-744a64f075d4.settings.multiline','false'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.4b9eed77-fa62-4ecc-9486-744a64f075d4.settings.placeholder','null'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.4b9eed77-fa62-4ecc-9486-744a64f075d4.settings.uiMode','\"normal\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.4b9eed77-fa62-4ecc-9486-744a64f075d4.translationKeyFormat','null'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.4b9eed77-fa62-4ecc-9486-744a64f075d4.translationMethod','\"language\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.4b9eed77-fa62-4ecc-9486-744a64f075d4.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.columnSuffix','null'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.contentColumnType','\"string\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.fieldGroup','null'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.handle','\"image\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.instructions','\"At least 768px wide\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.name','\"Image\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.searchable','true'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.allowedKinds.0','\"image\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.allowSelfRelations','false'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.allowSubfolders','false'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.allowUploads','true'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.branchLimit','null'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.defaultUploadLocationSource','\"volume:c9a4fbad-6ca0-4e20-ba72-da2c14a38190\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.defaultUploadLocationSubpath','null'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.localizeRelations','false'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.maintainHierarchy','false'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.maxRelations','1'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.minRelations','null'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.previewMode','\"thumbs\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.restrictedDefaultUploadSubpath','null'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.restrictedLocationSource','\"volume:c9a4fbad-6ca0-4e20-ba72-da2c14a38190\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.restrictedLocationSubpath','null'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.restrictFiles','true'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.restrictLocation','false'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.selectionCondition.__assoc__.0.0','\"elementType\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.selectionCondition.__assoc__.0.1','\"craft\\\\elements\\\\Asset\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.selectionCondition.__assoc__.1.0','\"fieldContext\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.selectionCondition.__assoc__.1.1','\"global\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.selectionCondition.__assoc__.2.0','\"class\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.selectionCondition.__assoc__.2.1','\"craft\\\\elements\\\\conditions\\\\assets\\\\AssetCondition\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.selectionCondition.__assoc__.3.0','\"conditionRules\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.selectionCondition.__assoc__.3.1.0.__assoc__.0.0','\"class\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.selectionCondition.__assoc__.3.1.0.__assoc__.0.1','\"craft\\\\elements\\\\conditions\\\\assets\\\\WidthConditionRule\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.selectionCondition.__assoc__.3.1.0.__assoc__.1.0','\"uid\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.selectionCondition.__assoc__.3.1.0.__assoc__.1.1','\"73c6baec-2203-47fa-bee7-633be75c6120\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.selectionCondition.__assoc__.3.1.0.__assoc__.2.0','\"operator\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.selectionCondition.__assoc__.3.1.0.__assoc__.2.1','\">=\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.selectionCondition.__assoc__.3.1.0.__assoc__.3.0','\"value\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.selectionCondition.__assoc__.3.1.0.__assoc__.3.1','\"768\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.selectionCondition.__assoc__.3.1.0.__assoc__.4.0','\"maxValue\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.selectionCondition.__assoc__.3.1.0.__assoc__.4.1','\"\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.selectionLabel','\"Select an image\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.showSiteMenu','false'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.showUnpermittedFiles','false'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.showUnpermittedVolumes','false'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.sources.0','\"volume:c9a4fbad-6ca0-4e20-ba72-da2c14a38190\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.targetSiteId','null'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.validateRelatedElements','false'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.settings.viewMode','\"large\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.translationKeyFormat','null'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.translationMethod','\"site\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.fields.abb455ba-032b-461d-9c8d-dca9ed3fc7bd.type','\"craft\\\\fields\\\\Assets\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.handle','\"image\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.name','\"Image\"'),('matrixBlockTypes.a33610ee-ece8-47a1-949e-94477da5fd4d.sortOrder','3'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.field','\"95f98672-9562-44a0-8639-92d2b55ceeb6\"'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fieldLayouts.41e5d65a-c578-41e0-8470-21b000104054.tabs.0.elementCondition','null'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fieldLayouts.41e5d65a-c578-41e0-8470-21b000104054.tabs.0.elements.0.elementCondition','null'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fieldLayouts.41e5d65a-c578-41e0-8470-21b000104054.tabs.0.elements.0.fieldUid','\"a4a0dfdc-289d-4d50-baae-6a3215a85701\"'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fieldLayouts.41e5d65a-c578-41e0-8470-21b000104054.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fieldLayouts.41e5d65a-c578-41e0-8470-21b000104054.tabs.0.elements.0.label','null'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fieldLayouts.41e5d65a-c578-41e0-8470-21b000104054.tabs.0.elements.0.required','true'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fieldLayouts.41e5d65a-c578-41e0-8470-21b000104054.tabs.0.elements.0.tip','null'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fieldLayouts.41e5d65a-c578-41e0-8470-21b000104054.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fieldLayouts.41e5d65a-c578-41e0-8470-21b000104054.tabs.0.elements.0.uid','\"f4e83568-6458-4bf3-9b47-b1359fa7dd54\"'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fieldLayouts.41e5d65a-c578-41e0-8470-21b000104054.tabs.0.elements.0.userCondition','null'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fieldLayouts.41e5d65a-c578-41e0-8470-21b000104054.tabs.0.elements.0.warning','null'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fieldLayouts.41e5d65a-c578-41e0-8470-21b000104054.tabs.0.elements.0.width','75'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fieldLayouts.41e5d65a-c578-41e0-8470-21b000104054.tabs.0.elements.1.elementCondition','null'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fieldLayouts.41e5d65a-c578-41e0-8470-21b000104054.tabs.0.elements.1.fieldUid','\"5c400efe-2716-4221-a54a-4ebaf6a3c6cb\"'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fieldLayouts.41e5d65a-c578-41e0-8470-21b000104054.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fieldLayouts.41e5d65a-c578-41e0-8470-21b000104054.tabs.0.elements.1.label','null'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fieldLayouts.41e5d65a-c578-41e0-8470-21b000104054.tabs.0.elements.1.required','true'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fieldLayouts.41e5d65a-c578-41e0-8470-21b000104054.tabs.0.elements.1.tip','null'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fieldLayouts.41e5d65a-c578-41e0-8470-21b000104054.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fieldLayouts.41e5d65a-c578-41e0-8470-21b000104054.tabs.0.elements.1.uid','\"fdcd6c78-b61f-4ad7-80cc-58b9e85b6e96\"'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fieldLayouts.41e5d65a-c578-41e0-8470-21b000104054.tabs.0.elements.1.userCondition','null'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fieldLayouts.41e5d65a-c578-41e0-8470-21b000104054.tabs.0.elements.1.warning','null'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fieldLayouts.41e5d65a-c578-41e0-8470-21b000104054.tabs.0.elements.1.width','25'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fieldLayouts.41e5d65a-c578-41e0-8470-21b000104054.tabs.0.name','\"Content\"'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fieldLayouts.41e5d65a-c578-41e0-8470-21b000104054.tabs.0.uid','\"7d31a66e-6de9-46b8-8336-1205bfe7bb56\"'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fieldLayouts.41e5d65a-c578-41e0-8470-21b000104054.tabs.0.userCondition','null'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.5c400efe-2716-4221-a54a-4ebaf6a3c6cb.columnSuffix','\"xiqfbbjz\"'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.5c400efe-2716-4221-a54a-4ebaf6a3c6cb.contentColumnType','\"string\"'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.5c400efe-2716-4221-a54a-4ebaf6a3c6cb.fieldGroup','null'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.5c400efe-2716-4221-a54a-4ebaf6a3c6cb.handle','\"headingLevel\"'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.5c400efe-2716-4221-a54a-4ebaf6a3c6cb.instructions','null'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.5c400efe-2716-4221-a54a-4ebaf6a3c6cb.name','\"Heading Level\"'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.5c400efe-2716-4221-a54a-4ebaf6a3c6cb.searchable','false'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.5c400efe-2716-4221-a54a-4ebaf6a3c6cb.settings.options.0.__assoc__.0.0','\"label\"'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.5c400efe-2716-4221-a54a-4ebaf6a3c6cb.settings.options.0.__assoc__.0.1','\"H2\"'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.5c400efe-2716-4221-a54a-4ebaf6a3c6cb.settings.options.0.__assoc__.1.0','\"value\"'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.5c400efe-2716-4221-a54a-4ebaf6a3c6cb.settings.options.0.__assoc__.1.1','\"h2\"'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.5c400efe-2716-4221-a54a-4ebaf6a3c6cb.settings.options.0.__assoc__.2.0','\"default\"'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.5c400efe-2716-4221-a54a-4ebaf6a3c6cb.settings.options.0.__assoc__.2.1','\"1\"'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.5c400efe-2716-4221-a54a-4ebaf6a3c6cb.settings.options.1.__assoc__.0.0','\"label\"'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.5c400efe-2716-4221-a54a-4ebaf6a3c6cb.settings.options.1.__assoc__.0.1','\"H3\"'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.5c400efe-2716-4221-a54a-4ebaf6a3c6cb.settings.options.1.__assoc__.1.0','\"value\"'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.5c400efe-2716-4221-a54a-4ebaf6a3c6cb.settings.options.1.__assoc__.1.1','\"h3\"'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.5c400efe-2716-4221-a54a-4ebaf6a3c6cb.settings.options.1.__assoc__.2.0','\"default\"'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.5c400efe-2716-4221-a54a-4ebaf6a3c6cb.settings.options.1.__assoc__.2.1','\"\"'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.5c400efe-2716-4221-a54a-4ebaf6a3c6cb.translationKeyFormat','null'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.5c400efe-2716-4221-a54a-4ebaf6a3c6cb.translationMethod','\"none\"'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.5c400efe-2716-4221-a54a-4ebaf6a3c6cb.type','\"craft\\\\fields\\\\Dropdown\"'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.a4a0dfdc-289d-4d50-baae-6a3215a85701.columnSuffix','\"ehszctzg\"'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.a4a0dfdc-289d-4d50-baae-6a3215a85701.contentColumnType','\"string(240)\"'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.a4a0dfdc-289d-4d50-baae-6a3215a85701.fieldGroup','null'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.a4a0dfdc-289d-4d50-baae-6a3215a85701.handle','\"text\"'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.a4a0dfdc-289d-4d50-baae-6a3215a85701.instructions','null'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.a4a0dfdc-289d-4d50-baae-6a3215a85701.name','\"Text\"'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.a4a0dfdc-289d-4d50-baae-6a3215a85701.searchable','true'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.a4a0dfdc-289d-4d50-baae-6a3215a85701.settings.byteLimit','null'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.a4a0dfdc-289d-4d50-baae-6a3215a85701.settings.charLimit','60'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.a4a0dfdc-289d-4d50-baae-6a3215a85701.settings.code','false'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.a4a0dfdc-289d-4d50-baae-6a3215a85701.settings.columnType','null'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.a4a0dfdc-289d-4d50-baae-6a3215a85701.settings.initialRows','4'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.a4a0dfdc-289d-4d50-baae-6a3215a85701.settings.multiline','false'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.a4a0dfdc-289d-4d50-baae-6a3215a85701.settings.placeholder','null'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.a4a0dfdc-289d-4d50-baae-6a3215a85701.settings.uiMode','\"normal\"'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.a4a0dfdc-289d-4d50-baae-6a3215a85701.translationKeyFormat','null'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.a4a0dfdc-289d-4d50-baae-6a3215a85701.translationMethod','\"language\"'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.fields.a4a0dfdc-289d-4d50-baae-6a3215a85701.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.handle','\"heading\"'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.name','\"Heading\"'),('matrixBlockTypes.a3605555-7165-4ea9-a338-870db2eba7ca.sortOrder','1'),('meta.__names__.0837f34c-eb77-4cca-bded-4b9c2d688a90','\"Site Name\"'),('meta.__names__.0e989e8d-658a-4a1e-acf5-edb2387959ab','\"Post Index\"'),('meta.__names__.18e8e721-36cd-4c7a-a02a-44c513fb3cb8','\"Default\"'),('meta.__names__.19a49103-3b3e-48c0-955b-996599d8c651','\"Default\"'),('meta.__names__.19d8011f-2129-4d06-b597-49d7125063c7','\"Quote\"'),('meta.__names__.1d65442c-c0b9-46f4-8518-9a6c53e21bc1','\"Featured Image\"'),('meta.__names__.1eac01fa-9e12-426e-a043-60ae35acf391','\"Cite\"'),('meta.__names__.21e8b35e-5b6d-4f11-bc0e-26fcaa107ce8','\"Home\"'),('meta.__names__.2393c71c-94e8-4e90-bb19-949696b8be0b','\"English\"'),('meta.__names__.2be01897-dbaf-4c19-a6d9-db80ada8fc8f','\"Public Schema\"'),('meta.__names__.32d347b0-ea6e-469f-92f8-d59f3fd496c7','\"Public Schema\"'),('meta.__names__.4b9eed77-fa62-4ecc-9486-744a64f075d4','\"Caption\"'),('meta.__names__.560e7c36-f763-440f-b9b5-1d87228bc6df','\"Copyright\"'),('meta.__names__.585f70b2-f84a-47ff-ad71-3faff9698ba9','\"Post\"'),('meta.__names__.5c400efe-2716-4221-a54a-4ebaf6a3c6cb','\"Heading Level\"'),('meta.__names__.5f021491-7c29-4320-be70-454d594268af','\"Page\"'),('meta.__names__.63e734ee-d709-488a-bd8d-3a90ab070825','\"Text\"'),('meta.__names__.761cddc2-d969-4560-b5de-4bf2a393cb8a','\"Common\"'),('meta.__names__.78ba6fca-0979-4552-a36e-f6f7a001b0f5','\"Text\"'),('meta.__names__.78f9590c-8302-4bbc-8e62-39e3f6a2bd57','\"Text\"'),('meta.__names__.817d3d1a-d840-41a0-85a2-898d07aef769','\"Default\"'),('meta.__names__.8937bb02-c9d0-460b-81ef-1f1bda00e1f7','\"Site Info - Global Settings\"'),('meta.__names__.9013e485-c018-45be-825d-d7223ee50703','\"Public Schema\"'),('meta.__names__.95f98672-9562-44a0-8639-92d2b55ceeb6','\"Body Content\"'),('meta.__names__.a33610ee-ece8-47a1-949e-94477da5fd4d','\"Image\"'),('meta.__names__.a3605555-7165-4ea9-a338-870db2eba7ca','\"Heading\"'),('meta.__names__.a4a0dfdc-289d-4d50-baae-6a3215a85701','\"Text\"'),('meta.__names__.a73e7c96-e9d2-4751-bf01-8a6baf5f3c46','\"Alt Text\"'),('meta.__names__.a7f4b9fd-a554-4545-af32-3b57544c9432','\"Site Info - Global Settings\"'),('meta.__names__.ab2052c5-b53a-4cbd-b95d-96ea7489c375','\"Home\"'),('meta.__names__.abb455ba-032b-461d-9c8d-dca9ed3fc7bd','\"Image\"'),('meta.__names__.b7acd2cf-9449-4637-a40c-2e266a19cc19','\"Deutsch\"'),('meta.__names__.bbbea387-f8a6-43f7-ab94-dc572bd0cc77','\"Site\"'),('meta.__names__.c9a4fbad-6ca0-4e20-ba72-da2c14a38190','\"Images\"'),('meta.__names__.eb230d0c-f88a-40de-a743-994de14eb8f8','\"Style\"'),('meta.__names__.efd6d899-7b71-4318-8402-669e92416168','\"System Files\"'),('sections.21e8b35e-5b6d-4f11-bc0e-26fcaa107ce8.defaultPlacement','\"end\"'),('sections.21e8b35e-5b6d-4f11-bc0e-26fcaa107ce8.enableVersioning','true'),('sections.21e8b35e-5b6d-4f11-bc0e-26fcaa107ce8.handle','\"home\"'),('sections.21e8b35e-5b6d-4f11-bc0e-26fcaa107ce8.name','\"Home\"'),('sections.21e8b35e-5b6d-4f11-bc0e-26fcaa107ce8.propagationMethod','\"all\"'),('sections.21e8b35e-5b6d-4f11-bc0e-26fcaa107ce8.siteSettings.2393c71c-94e8-4e90-bb19-949696b8be0b.enabledByDefault','true'),('sections.21e8b35e-5b6d-4f11-bc0e-26fcaa107ce8.siteSettings.2393c71c-94e8-4e90-bb19-949696b8be0b.hasUrls','true'),('sections.21e8b35e-5b6d-4f11-bc0e-26fcaa107ce8.siteSettings.2393c71c-94e8-4e90-bb19-949696b8be0b.template','\"_sections/home\"'),('sections.21e8b35e-5b6d-4f11-bc0e-26fcaa107ce8.siteSettings.2393c71c-94e8-4e90-bb19-949696b8be0b.uriFormat','\"__home__\"'),('sections.21e8b35e-5b6d-4f11-bc0e-26fcaa107ce8.siteSettings.b7acd2cf-9449-4637-a40c-2e266a19cc19.enabledByDefault','true'),('sections.21e8b35e-5b6d-4f11-bc0e-26fcaa107ce8.siteSettings.b7acd2cf-9449-4637-a40c-2e266a19cc19.hasUrls','true'),('sections.21e8b35e-5b6d-4f11-bc0e-26fcaa107ce8.siteSettings.b7acd2cf-9449-4637-a40c-2e266a19cc19.template','\"_sections/home\"'),('sections.21e8b35e-5b6d-4f11-bc0e-26fcaa107ce8.siteSettings.b7acd2cf-9449-4637-a40c-2e266a19cc19.uriFormat','\"__home__\"'),('sections.21e8b35e-5b6d-4f11-bc0e-26fcaa107ce8.type','\"single\"'),('sections.585f70b2-f84a-47ff-ad71-3faff9698ba9.defaultPlacement','\"end\"'),('sections.585f70b2-f84a-47ff-ad71-3faff9698ba9.enableVersioning','true'),('sections.585f70b2-f84a-47ff-ad71-3faff9698ba9.handle','\"post\"'),('sections.585f70b2-f84a-47ff-ad71-3faff9698ba9.name','\"Post\"'),('sections.585f70b2-f84a-47ff-ad71-3faff9698ba9.propagationMethod','\"all\"'),('sections.585f70b2-f84a-47ff-ad71-3faff9698ba9.siteSettings.2393c71c-94e8-4e90-bb19-949696b8be0b.enabledByDefault','true'),('sections.585f70b2-f84a-47ff-ad71-3faff9698ba9.siteSettings.2393c71c-94e8-4e90-bb19-949696b8be0b.hasUrls','true'),('sections.585f70b2-f84a-47ff-ad71-3faff9698ba9.siteSettings.2393c71c-94e8-4e90-bb19-949696b8be0b.template','\"_sections/post\"'),('sections.585f70b2-f84a-47ff-ad71-3faff9698ba9.siteSettings.2393c71c-94e8-4e90-bb19-949696b8be0b.uriFormat','\"posts/{slug}\"'),('sections.585f70b2-f84a-47ff-ad71-3faff9698ba9.siteSettings.b7acd2cf-9449-4637-a40c-2e266a19cc19.enabledByDefault','true'),('sections.585f70b2-f84a-47ff-ad71-3faff9698ba9.siteSettings.b7acd2cf-9449-4637-a40c-2e266a19cc19.hasUrls','true'),('sections.585f70b2-f84a-47ff-ad71-3faff9698ba9.siteSettings.b7acd2cf-9449-4637-a40c-2e266a19cc19.template','\"_sections/post\"'),('sections.585f70b2-f84a-47ff-ad71-3faff9698ba9.siteSettings.b7acd2cf-9449-4637-a40c-2e266a19cc19.uriFormat','\"beitraege/{slug}\"'),('sections.585f70b2-f84a-47ff-ad71-3faff9698ba9.type','\"channel\"'),('sections.5f021491-7c29-4320-be70-454d594268af.defaultPlacement','\"end\"'),('sections.5f021491-7c29-4320-be70-454d594268af.enableVersioning','true'),('sections.5f021491-7c29-4320-be70-454d594268af.handle','\"page\"'),('sections.5f021491-7c29-4320-be70-454d594268af.name','\"Page\"'),('sections.5f021491-7c29-4320-be70-454d594268af.propagationMethod','\"all\"'),('sections.5f021491-7c29-4320-be70-454d594268af.siteSettings.2393c71c-94e8-4e90-bb19-949696b8be0b.enabledByDefault','true'),('sections.5f021491-7c29-4320-be70-454d594268af.siteSettings.2393c71c-94e8-4e90-bb19-949696b8be0b.hasUrls','true'),('sections.5f021491-7c29-4320-be70-454d594268af.siteSettings.2393c71c-94e8-4e90-bb19-949696b8be0b.template','\"_sections/page\"'),('sections.5f021491-7c29-4320-be70-454d594268af.siteSettings.2393c71c-94e8-4e90-bb19-949696b8be0b.uriFormat','\"{parent.uri}/{slug}\"'),('sections.5f021491-7c29-4320-be70-454d594268af.siteSettings.b7acd2cf-9449-4637-a40c-2e266a19cc19.enabledByDefault','true'),('sections.5f021491-7c29-4320-be70-454d594268af.siteSettings.b7acd2cf-9449-4637-a40c-2e266a19cc19.hasUrls','true'),('sections.5f021491-7c29-4320-be70-454d594268af.siteSettings.b7acd2cf-9449-4637-a40c-2e266a19cc19.template','\"_sections/page\"'),('sections.5f021491-7c29-4320-be70-454d594268af.siteSettings.b7acd2cf-9449-4637-a40c-2e266a19cc19.uriFormat','\"{parent.uri}/{slug}\"'),('sections.5f021491-7c29-4320-be70-454d594268af.structure.maxLevels','null'),('sections.5f021491-7c29-4320-be70-454d594268af.structure.uid','\"a60ce745-c40e-446a-bf07-59109de5651d\"'),('sections.5f021491-7c29-4320-be70-454d594268af.type','\"structure\"'),('sections.a7f4b9fd-a554-4545-af32-3b57544c9432.defaultPlacement','\"end\"'),('sections.a7f4b9fd-a554-4545-af32-3b57544c9432.enableVersioning','true'),('sections.a7f4b9fd-a554-4545-af32-3b57544c9432.handle','\"siteInfo\"'),('sections.a7f4b9fd-a554-4545-af32-3b57544c9432.name','\"Site Info - Global Settings\"'),('sections.a7f4b9fd-a554-4545-af32-3b57544c9432.propagationMethod','\"all\"'),('sections.a7f4b9fd-a554-4545-af32-3b57544c9432.siteSettings.2393c71c-94e8-4e90-bb19-949696b8be0b.enabledByDefault','true'),('sections.a7f4b9fd-a554-4545-af32-3b57544c9432.siteSettings.2393c71c-94e8-4e90-bb19-949696b8be0b.hasUrls','false'),('sections.a7f4b9fd-a554-4545-af32-3b57544c9432.siteSettings.2393c71c-94e8-4e90-bb19-949696b8be0b.template','null'),('sections.a7f4b9fd-a554-4545-af32-3b57544c9432.siteSettings.2393c71c-94e8-4e90-bb19-949696b8be0b.uriFormat','null'),('sections.a7f4b9fd-a554-4545-af32-3b57544c9432.siteSettings.b7acd2cf-9449-4637-a40c-2e266a19cc19.enabledByDefault','true'),('sections.a7f4b9fd-a554-4545-af32-3b57544c9432.siteSettings.b7acd2cf-9449-4637-a40c-2e266a19cc19.hasUrls','false'),('sections.a7f4b9fd-a554-4545-af32-3b57544c9432.siteSettings.b7acd2cf-9449-4637-a40c-2e266a19cc19.template','null'),('sections.a7f4b9fd-a554-4545-af32-3b57544c9432.siteSettings.b7acd2cf-9449-4637-a40c-2e266a19cc19.uriFormat','null'),('sections.a7f4b9fd-a554-4545-af32-3b57544c9432.type','\"single\"'),('siteGroups.18e8e721-36cd-4c7a-a02a-44c513fb3cb8.name','\"Default\"'),('sites.2393c71c-94e8-4e90-bb19-949696b8be0b.baseUrl','\"@web/en\"'),('sites.2393c71c-94e8-4e90-bb19-949696b8be0b.enabled','true'),('sites.2393c71c-94e8-4e90-bb19-949696b8be0b.handle','\"en\"'),('sites.2393c71c-94e8-4e90-bb19-949696b8be0b.hasUrls','true'),('sites.2393c71c-94e8-4e90-bb19-949696b8be0b.language','\"en-US\"'),('sites.2393c71c-94e8-4e90-bb19-949696b8be0b.name','\"English\"'),('sites.2393c71c-94e8-4e90-bb19-949696b8be0b.primary','true'),('sites.2393c71c-94e8-4e90-bb19-949696b8be0b.siteGroup','\"18e8e721-36cd-4c7a-a02a-44c513fb3cb8\"'),('sites.2393c71c-94e8-4e90-bb19-949696b8be0b.sortOrder','1'),('sites.b7acd2cf-9449-4637-a40c-2e266a19cc19.baseUrl','\"@web/de\"'),('sites.b7acd2cf-9449-4637-a40c-2e266a19cc19.enabled','\"1\"'),('sites.b7acd2cf-9449-4637-a40c-2e266a19cc19.handle','\"de\"'),('sites.b7acd2cf-9449-4637-a40c-2e266a19cc19.hasUrls','true'),('sites.b7acd2cf-9449-4637-a40c-2e266a19cc19.language','\"de-DE\"'),('sites.b7acd2cf-9449-4637-a40c-2e266a19cc19.name','\"Deutsch\"'),('sites.b7acd2cf-9449-4637-a40c-2e266a19cc19.primary','false'),('sites.b7acd2cf-9449-4637-a40c-2e266a19cc19.siteGroup','\"18e8e721-36cd-4c7a-a02a-44c513fb3cb8\"'),('sites.b7acd2cf-9449-4637-a40c-2e266a19cc19.sortOrder','2'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"$SYSTEM_NAME\"'),('system.retryDuration','null'),('system.schemaVersion','\"4.4.0.4\"'),('system.timeZone','\"Europe/Berlin\"'),('users.allowPublicRegistration','false'),('users.deactivateByDefault','false'),('users.defaultGroup','null'),('users.photoSubpath','\"userphotos\"'),('users.photoVolumeUid','\"efd6d899-7b71-4318-8402-669e92416168\"'),('users.requireEmailVerification','true'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.elementCondition','null'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.elements.0.autocapitalize','true'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.elements.0.autocomplete','false'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.elements.0.autocorrect','true'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.elements.0.class','null'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.elements.0.disabled','false'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.elements.0.elementCondition','null'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.elements.0.id','null'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.elements.0.instructions','null'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.elements.0.label','null'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.elements.0.max','null'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.elements.0.min','null'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.elements.0.name','null'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.elements.0.orientation','null'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.elements.0.placeholder','null'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.elements.0.readonly','false'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.elements.0.requirable','false'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.elements.0.size','null'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.elements.0.step','null'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.elements.0.tip','null'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.elements.0.title','null'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.elements.0.uid','\"be381213-38ff-4fec-a714-0d5578979925\"'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.elements.0.userCondition','null'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.elements.0.warning','null'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.elements.0.width','100'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.elements.1.elementCondition','null'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.elements.1.fieldUid','\"a73e7c96-e9d2-4751-bf01-8a6baf5f3c46\"'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.elements.1.instructions','null'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.elements.1.label','null'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.elements.1.required','true'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.elements.1.tip','null'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.elements.1.uid','\"64372242-c3cf-4a77-b3b3-90704f40d841\"'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.elements.1.userCondition','null'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.elements.1.warning','null'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.elements.1.width','100'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.name','\"Content\"'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.uid','\"c1e3a4d5-1e1c-4d1a-990f-39e3b823150c\"'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fieldLayouts.a9d58556-baca-4c30-916a-bef0d1ee1f14.tabs.0.userCondition','null'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.fs','\"imagesFs\"'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.handle','\"images\"'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.name','\"Images\"'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.sortOrder','1'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.titleTranslationKeyFormat','null'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.titleTranslationMethod','\"language\"'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.transformFs','\"internalFs\"'),('volumes.c9a4fbad-6ca0-4e20-ba72-da2c14a38190.transformSubpath','\"images\"'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.elementCondition','null'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.elements.0.autocapitalize','true'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.elements.0.autocomplete','false'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.elements.0.autocorrect','true'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.elements.0.class','null'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.elements.0.disabled','false'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.elements.0.elementCondition','null'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.elements.0.id','null'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.elements.0.instructions','null'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.elements.0.label','null'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.elements.0.max','null'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.elements.0.min','null'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.elements.0.name','null'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.elements.0.orientation','null'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.elements.0.placeholder','null'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.elements.0.readonly','false'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.elements.0.requirable','false'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.elements.0.size','null'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.elements.0.step','null'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.elements.0.tip','null'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.elements.0.title','null'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\assets\\\\AssetTitleField\"'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.elements.0.uid','\"698de72a-7adc-45a6-a415-945a483e46fa\"'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.elements.0.userCondition','null'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.elements.0.warning','null'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.elements.0.width','100'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.elements.1.elementCondition','null'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.elements.1.fieldUid','\"a73e7c96-e9d2-4751-bf01-8a6baf5f3c46\"'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.elements.1.instructions','null'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.elements.1.label','null'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.elements.1.required','false'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.elements.1.tip','null'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.elements.1.uid','\"4b73ae21-1a9b-4f0a-bd0f-d5ad49071a82\"'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.elements.1.userCondition','null'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.elements.1.warning','null'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.elements.1.width','100'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.name','\"Content\"'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.uid','\"ad2ff98e-1e14-4839-9d89-9c33546f1ae6\"'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fieldLayouts.1ee5afe0-0146-443b-abef-4a7ccb1d2137.tabs.0.userCondition','null'),('volumes.efd6d899-7b71-4318-8402-669e92416168.fs','\"internalFs\"'),('volumes.efd6d899-7b71-4318-8402-669e92416168.handle','\"internal\"'),('volumes.efd6d899-7b71-4318-8402-669e92416168.name','\"System Files\"'),('volumes.efd6d899-7b71-4318-8402-669e92416168.sortOrder','2'),('volumes.efd6d899-7b71-4318-8402-669e92416168.titleTranslationKeyFormat','null'),('volumes.efd6d899-7b71-4318-8402-669e92416168.titleTranslationMethod','\"language\"'),('volumes.efd6d899-7b71-4318-8402-669e92416168.transformFs','\"internalFs\"'),('volumes.efd6d899-7b71-4318-8402-669e92416168.transformSubpath','\"transforms/internal\"');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `relations` VALUES (2,1,12,NULL,31,1,'2023-06-11 14:36:25','2023-06-11 14:36:25','8cd13195-4f0c-4c49-ba5a-ae76db07585b'),(3,1,33,NULL,31,1,'2023-06-11 14:36:25','2023-06-11 14:36:25','a1a7ea1e-8c08-4759-8ad6-2cca1848583e'),(6,12,37,NULL,31,1,'2023-06-11 14:49:07','2023-06-11 14:49:07','8fbab151-070f-4867-98c3-62c671fe7809'),(7,1,40,NULL,31,1,'2023-06-11 14:55:50','2023-06-11 14:55:50','db67d82f-893d-4a81-b17b-b9744bdfe0fa'),(8,12,41,NULL,31,1,'2023-06-11 14:55:50','2023-06-11 14:55:50','df73ceef-69c7-4a6b-bee1-283830db828e'),(10,1,1,NULL,31,1,'2023-06-12 08:29:08','2023-06-12 08:29:08','9c11d2eb-7b6f-41f7-8553-07951c773b1e'),(11,1,44,NULL,31,1,'2023-06-12 08:29:08','2023-06-12 08:29:08','d09d44fc-5ac3-44bd-8f60-4034767345e2'),(14,1,48,NULL,31,1,'2023-06-12 08:51:42','2023-06-12 08:51:42','8b0f1c7d-9da9-4136-8c0c-4b83e3c73cd2'),(17,1,4,NULL,50,1,'2023-06-12 08:53:25','2023-06-12 08:53:25','1a9c263c-de76-4b2d-a1e4-231fcf242b30'),(18,1,51,NULL,50,1,'2023-06-12 08:53:25','2023-06-12 08:53:25','5cfe2d6c-8e6a-4ce7-a4e7-7d3d53a9998a'),(21,1,35,NULL,53,1,'2023-06-12 09:02:49','2023-06-12 09:02:49','11d043cf-ce85-409c-ac7f-d0f9aacc4cf9'),(22,1,54,NULL,53,1,'2023-06-12 09:02:49','2023-06-12 09:02:49','9a157bfa-e596-4c45-999c-811cca0975d4'),(23,12,55,NULL,31,1,'2023-06-12 09:02:49','2023-06-12 09:02:49','9d5edf49-6d44-45fa-8958-c77c24fda621');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,1,NULL,1,NULL),(2,1,NULL,2,NULL),(3,4,NULL,1,NULL),(4,4,NULL,2,NULL),(5,1,NULL,3,NULL),(6,1,NULL,4,NULL),(7,4,NULL,3,NULL),(8,4,NULL,4,NULL),(9,12,NULL,1,NULL),(10,13,NULL,1,NULL),(11,16,NULL,1,NULL),(12,17,NULL,1,NULL),(13,20,NULL,1,NULL),(14,21,NULL,1,NULL),(15,22,NULL,1,NULL),(16,26,NULL,1,NULL),(17,26,NULL,2,NULL),(18,4,NULL,5,NULL),(19,12,11,2,'Applied “Draft 1”'),(20,13,11,2,NULL),(21,35,11,1,''),(22,37,11,1,NULL),(23,39,11,1,NULL),(24,1,11,5,'Applied “Draft 1”'),(25,4,11,6,NULL),(26,4,11,7,'Applied “Draft 1”'),(27,4,11,8,'Applied “Draft 1”'),(28,35,11,2,'Applied “Draft 1”'),(29,37,11,2,NULL),(30,39,11,2,NULL);
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'field',3,1,''),(1,'field',3,2,''),(1,'slug',0,1,' home '),(1,'slug',0,2,' home '),(1,'title',0,1,' home '),(1,'title',0,2,' home '),(4,'slug',0,1,' site info global settings '),(4,'slug',0,2,' site info global settings '),(4,'title',0,1,' site info global settings '),(4,'title',0,2,' site info global settings '),(11,'email',0,1,' admin example com '),(11,'firstname',0,1,' sabine '),(11,'fullname',0,1,' sabine mustermann '),(11,'lastname',0,1,' mustermann '),(11,'slug',0,1,''),(11,'username',0,1,' admin '),(12,'field',3,1,' do not scream suddenly hold anything youre in the middle of eating until youve stepped off the elevator again if you brought any live animals with you do your best to keep them on your person avoid vigorous jumping or bouncing face the same direction as everybody else '),(12,'field',3,2,' do not scream suddenly hold anything youre in the middle of eating until youve stepped off the elevator again if you brought any live animals with you do your best to keep them on your person avoid vigorous jumping or bouncing face the same direction as everybody else '),(12,'slug',0,1,' five things elevator '),(12,'slug',0,2,' five things elevator '),(12,'title',0,1,' do these five things in an elevator '),(12,'title',0,2,' do these five things in an elevator '),(13,'field',13,1,' do not scream suddenly hold anything youre in the middle of eating until youve stepped off the elevator again if you brought any live animals with you do your best to keep them on your person avoid vigorous jumping or bouncing face the same direction as everybody else '),(13,'field',13,2,' do not scream suddenly hold anything youre in the middle of eating until youve stepped off the elevator again if you brought any live animals with you do your best to keep them on your person avoid vigorous jumping or bouncing face the same direction as everybody else '),(13,'slug',0,1,''),(13,'slug',0,2,''),(15,'field',13,1,' do not scream suddenly hold anything youre in the middle of eating until youve stepped off the elevator again if you brought any live animals with you do your best to keep them on your person avoid vigorous jumping or bouncing face the same direction as everybody else '),(15,'field',13,2,' do not scream suddenly hold anything youre in the middle of eating until youve stepped off the elevator again if you brought any live animals with you do your best to keep them on your person avoid vigorous jumping or bouncing face the same direction as everybody else '),(15,'slug',0,1,''),(15,'slug',0,2,''),(16,'field',3,1,' find a recipe for the thing you want and make it at home '),(16,'field',3,2,' find a recipe for the thing you want and make it at home '),(16,'slug',0,1,' trick save money dining out '),(16,'slug',0,2,' trick save money dining out '),(16,'title',0,1,' use this trick to save money dining out '),(16,'title',0,2,' use this trick to save money dining out '),(17,'field',13,1,' find a recipe for the thing you want and make it at home '),(17,'field',13,2,' find a recipe for the thing you want and make it at home '),(17,'slug',0,1,''),(17,'slug',0,2,''),(19,'field',13,1,' find a recipe for the thing you want and make it at home '),(19,'field',13,2,' find a recipe for the thing you want and make it at home '),(19,'slug',0,1,''),(19,'slug',0,2,''),(20,'field',3,1,' philosopher jack handy was known to unpack some of the great complexities of the universe jack handy the face of a child can say it all especially the mouth part of the face '),(20,'field',3,2,' philosopher jack handy was known to unpack some of the great complexities of the universe jack handy the face of a child can say it all especially the mouth part of the face '),(20,'slug',0,1,' dont leave home without quote '),(20,'slug',0,2,' dont leave home without quote '),(20,'title',0,1,' dot leave home without this quote '),(20,'title',0,2,' dot leave home without this quote '),(21,'field',13,1,' philosopher jack handy was known to unpack some of the great complexities of the universe '),(21,'field',13,2,' philosopher jack handy was known to unpack some of the great complexities of the universe '),(21,'slug',0,1,''),(21,'slug',0,2,''),(22,'field',6,1,' jack handy '),(22,'field',6,2,' jack handy '),(22,'field',7,1,' the face of a child can say it all especially the mouth part of the face '),(22,'field',7,2,' the face of a child can say it all especially the mouth part of the face '),(22,'slug',0,1,''),(22,'slug',0,2,''),(24,'field',13,1,' philosopher jack handy was known to unpack some of the great complexities of the universe '),(24,'field',13,2,' philosopher jack handy was known to unpack some of the great complexities of the universe '),(24,'slug',0,1,''),(24,'slug',0,2,''),(25,'field',6,1,' jack handy '),(25,'field',6,2,' jack handy '),(25,'field',7,1,' the face of a child can say it all especially the mouth part of the face '),(25,'field',7,2,' the face of a child can say it all especially the mouth part of the face '),(25,'slug',0,1,''),(25,'slug',0,2,''),(26,'field',3,1,''),(26,'field',3,2,''),(26,'slug',0,1,' posts '),(26,'slug',0,2,' beitraege '),(26,'title',0,1,' posts '),(26,'title',0,2,' beitraege '),(30,'alt',0,1,''),(30,'alt',0,2,''),(30,'extension',0,1,' jpg '),(30,'extension',0,2,' jpg '),(30,'filename',0,1,' 315662 org jpg '),(30,'filename',0,2,' 315662 org jpg '),(30,'kind',0,1,' image '),(30,'kind',0,2,' image '),(30,'slug',0,1,''),(30,'slug',0,2,''),(30,'title',0,1,' 315662 org '),(30,'title',0,2,' 315662 org '),(31,'alt',0,1,''),(31,'alt',0,2,''),(31,'extension',0,1,' jpg '),(31,'extension',0,2,' jpg '),(31,'filename',0,1,' flower field 250016 1920 jpg '),(31,'filename',0,2,' flower field 250016 1920 jpg '),(31,'kind',0,1,' image '),(31,'kind',0,2,' image '),(31,'slug',0,1,''),(31,'slug',0,2,''),(31,'title',0,1,' flower field 250016 1920 '),(31,'title',0,2,' flower field 250016 1920 '),(35,'field',3,1,' flower field 250016 1920 vestibulum facilisis purus nec pulvinar iaculis ligula mi congue nunc vitae euismod ligula urna in dolor cras sagittis vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae sed aliquam nisi quis porttitor congue elit erat euismod orci ac placerat dolor lectus quis orci pellentesque auctor neque nec urna morbi nec metus fusce convallis metus id felis luctus adipiscing lorem ipsum dolor sit amet consectetuer adipiscing elit in consectetuer turpis ut velit fusce neque suspendisse nisl elit rhoncus eget elementum ac condimentum eget diam '),(35,'field',3,2,' flower field 250016 1920 vestibulum facilisis purus nec pulvinar iaculis ligula mi congue nunc vitae euismod ligula urna in dolor cras sagittis vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae sed aliquam nisi quis porttitor congue elit erat euismod orci ac placerat dolor lectus quis orci pellentesque auctor neque nec urna morbi nec metus fusce convallis metus id felis luctus adipiscing lorem ipsum dolor sit amet consectetuer adipiscing elit in consectetuer turpis ut velit fusce neque suspendisse nisl elit rhoncus eget elementum ac condimentum eget diam '),(35,'slug',0,1,' mein erster beitrag '),(35,'slug',0,2,' mein erster beitrag '),(35,'title',0,1,' mein erster beitrag '),(35,'title',0,2,' mein erster beitrag '),(37,'field',11,1,''),(37,'field',11,2,''),(37,'field',12,1,' flower field 250016 1920 '),(37,'field',12,2,' flower field 250016 1920 '),(37,'slug',0,1,''),(37,'slug',0,2,''),(39,'field',13,1,' vestibulum facilisis purus nec pulvinar iaculis ligula mi congue nunc vitae euismod ligula urna in dolor cras sagittis vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae sed aliquam nisi quis porttitor congue elit erat euismod orci ac placerat dolor lectus quis orci pellentesque auctor neque nec urna morbi nec metus fusce convallis metus id felis luctus adipiscing lorem ipsum dolor sit amet consectetuer adipiscing elit in consectetuer turpis ut velit fusce neque suspendisse nisl elit rhoncus eget elementum ac condimentum eget diam '),(39,'field',13,2,' vestibulum facilisis purus nec pulvinar iaculis ligula mi congue nunc vitae euismod ligula urna in dolor cras sagittis vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae sed aliquam nisi quis porttitor congue elit erat euismod orci ac placerat dolor lectus quis orci pellentesque auctor neque nec urna morbi nec metus fusce convallis metus id felis luctus adipiscing lorem ipsum dolor sit amet consectetuer adipiscing elit in consectetuer turpis ut velit fusce neque suspendisse nisl elit rhoncus eget elementum ac condimentum eget diam '),(39,'slug',0,1,''),(39,'slug',0,2,''),(45,'alt',0,1,''),(45,'alt',0,2,''),(45,'extension',0,1,' jpg '),(45,'extension',0,2,' jpg '),(45,'filename',0,1,' penguin 1719608 1920 jpg '),(45,'filename',0,2,' penguin 1719608 1920 jpg '),(45,'kind',0,1,' image '),(45,'kind',0,2,' image '),(45,'slug',0,1,''),(45,'slug',0,2,''),(45,'title',0,1,' penguin 1719608 1920 '),(45,'title',0,2,' penguin 1719608 1920 '),(50,'alt',0,1,''),(50,'alt',0,2,''),(50,'extension',0,1,' jpg '),(50,'extension',0,2,' jpg '),(50,'filename',0,1,' munich 1220908 jpg '),(50,'filename',0,2,' munich 1220908 jpg '),(50,'kind',0,1,' image '),(50,'kind',0,2,' image '),(50,'slug',0,1,''),(50,'slug',0,2,''),(50,'title',0,1,' munich 1220908 '),(50,'title',0,2,' munich 1220908 '),(53,'alt',0,1,''),(53,'alt',0,2,''),(53,'extension',0,1,' jpg '),(53,'extension',0,2,' jpg '),(53,'filename',0,1,' germany 4055578 1920 jpg '),(53,'filename',0,2,' germany 4055578 1920 jpg '),(53,'kind',0,1,' image '),(53,'kind',0,2,' image '),(53,'slug',0,1,''),(53,'slug',0,2,''),(53,'title',0,1,' germany 4055578 1920 '),(53,'title',0,2,' germany 4055578 1920 ');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,NULL,'Post','post','channel',1,'all','end',NULL,'2023-06-11 14:31:23','2023-06-11 14:31:23',NULL,'585f70b2-f84a-47ff-ad71-3faff9698ba9'),(2,NULL,'Site Info - Global Settings','siteInfo','single',1,'all','end',NULL,'2023-06-11 14:31:23','2023-06-11 14:31:23',NULL,'a7f4b9fd-a554-4545-af32-3b57544c9432'),(3,NULL,'Home','home','single',1,'all','end',NULL,'2023-06-11 14:31:23','2023-06-11 14:31:23',NULL,'21e8b35e-5b6d-4f11-bc0e-26fcaa107ce8'),(4,1,'Page','page','structure',1,'all','end',NULL,'2023-06-11 14:31:23','2023-06-11 14:31:23',NULL,'5f021491-7c29-4320-be70-454d594268af');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'posts/{slug}','_sections/post',1,'2023-06-11 14:31:23','2023-06-11 14:31:23','5d549a5f-62d8-4ec8-bf2f-700397114297'),(2,1,2,1,'beitraege/{slug}','_sections/post',1,'2023-06-11 14:31:23','2023-06-11 14:31:23','85c4ae1f-f06b-4537-b029-522859ecd0ec'),(3,2,1,0,NULL,NULL,1,'2023-06-11 14:31:23','2023-06-11 14:31:23','319f2452-4d81-4079-8f53-7b7fda4b9e1f'),(4,2,2,0,NULL,NULL,1,'2023-06-11 14:31:23','2023-06-11 14:31:23','dc6cdd24-d1f4-4fca-b611-91c0f9eab676'),(5,3,1,1,'__home__','_sections/home',1,'2023-06-11 14:31:23','2023-06-11 14:31:23','074d113a-55c9-40a0-8b02-fad695ce6444'),(6,3,2,1,'__home__','_sections/home',1,'2023-06-11 14:31:23','2023-06-11 14:31:23','5983bcc1-5b2e-4731-9811-8bd8acaf1d59'),(7,4,1,1,'{parent.uri}/{slug}','_sections/page',1,'2023-06-11 14:31:23','2023-06-11 14:31:23','1390e23a-aeca-46a1-9430-3a7364d7076e'),(8,4,2,1,'{parent.uri}/{slug}','_sections/page',1,'2023-06-11 14:31:23','2023-06-11 14:31:23','80887c23-1712-41f3-89a6-47556049c759');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'Default','2023-06-11 14:31:22','2023-06-11 14:31:22',NULL,'18e8e721-36cd-4c7a-a02a-44c513fb3cb8');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,'1','English','en','en-US',1,'@web/en',1,'2023-06-11 14:31:22','2023-06-11 14:31:24',NULL,'2393c71c-94e8-4e90-bb19-949696b8be0b'),(2,1,0,'1','Deutsch','de','de-DE',1,'@web/de',2,'2023-06-11 14:31:22','2023-06-11 14:31:22',NULL,'b7acd2cf-9449-4637-a40c-2e266a19cc19');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structureelements` VALUES (1,1,NULL,1,1,4,0,'2023-06-11 14:31:41','2023-06-11 14:31:41','68b5d421-0381-46d1-a13b-9cb99a5aa0e5'),(2,1,26,1,2,3,1,'2023-06-11 14:31:41','2023-06-11 14:31:41','07391ea6-8991-4043-a5a8-9fa116a7dfb5');
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structures` VALUES (1,NULL,'2023-06-11 14:31:23','2023-06-11 14:31:23',NULL,'a60ce745-c40e-446a-bf07-59109de5651d');
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `tokens` VALUES (1,'8I6GYjCVrhJzMZwjns_2xhf0lOmW-P68','[\"preview\\/preview\",{\"elementType\":\"craft\\\\elements\\\\Entry\",\"canonicalId\":35,\"siteId\":2,\"draftId\":2,\"revisionId\":null,\"userId\":11}]',NULL,NULL,'2023-06-12 14:49:11','2023-06-11 14:49:11','2023-06-11 14:49:11','2106caef-b53d-4e9a-a6a9-30fbb73affb7'),(2,'o6YpdVkXfHkcIYbyfFLJQfsgD0Q8Xb2b','[\"preview\\/preview\",{\"elementType\":\"craft\\\\elements\\\\Entry\",\"canonicalId\":35,\"siteId\":2,\"draftId\":null,\"revisionId\":null,\"userId\":11}]',NULL,NULL,'2023-06-13 09:02:07','2023-06-12 09:02:07','2023-06-12 09:02:07','e31fa0da-8523-4274-887e-eb968cd1c3dc');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (11,'{\"language\":\"en-US\",\"locale\":null,\"weekStartDay\":\"1\",\"alwaysShowFocusRings\":false,\"useShapes\":false,\"underlineLinks\":false,\"notificationDuration\":\"5000\",\"showFieldHandles\":false,\"enableDebugToolbarForSite\":false,\"enableDebugToolbarForCp\":false,\"showExceptionView\":false,\"profileTemplates\":false}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (11,30,1,0,0,0,1,'admin','Sabine Mustermann','Sabine','Mustermann','admin@example.com','$2y$13$HTqOW3.YrB31yLfzfDjGbONZjptigsJTat8ThNwI8m92U1Zi/A2dS','2023-06-13 07:00:37',NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,'2023-06-11 14:31:25','2023-06-11 14:31:25','2023-06-13 07:00:37');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumefolders` VALUES (1,NULL,1,'System Files',NULL,'2023-06-11 14:31:23','2023-06-11 14:33:13','d37b94af-bd8b-4a4e-afe4-50f33e6af3c7'),(2,NULL,2,'Images',NULL,'2023-06-11 14:31:23','2023-06-11 14:31:23','1449aee3-2384-4ca7-aae1-a12dedb0826c'),(3,1,1,'userphotos','userphotos/','2023-06-11 14:35:02','2023-06-11 14:35:02','1628e57e-da08-4a77-b527-648fc5c61ed8'),(4,1,1,'temporary-uploads','temporary-uploads/','2023-06-11 14:35:31','2023-06-11 14:35:31','05ad277b-221a-4b19-acc0-0476c07eacf0'),(5,4,1,'user_11','temporary-uploads/user_11/','2023-06-11 14:35:31','2023-06-11 14:35:31','f18e9151-1118-4437-9e66-a48d436ca419'),(6,2,2,'featured','featured/','2023-06-11 14:35:41','2023-06-11 14:35:41','0f05ffd4-162b-411d-859a-e7c89f9d10ed');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumes` VALUES (1,1,'System Files','internal','internalFs','internalFs','transforms/internal','language',NULL,2,'2023-06-11 14:31:23','2023-06-11 14:33:13',NULL,'efd6d899-7b71-4318-8402-669e92416168'),(2,2,'Images','images','imagesFs','internalFs','images','language',NULL,1,'2023-06-11 14:31:23','2023-06-11 14:33:45',NULL,'c9a4fbad-6ca0-4e20-ba72-da2c14a38190');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,11,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2023-06-11 14:32:04','2023-06-11 14:32:04','53d1c1a0-7dfa-49d8-a59d-269f813ef52f'),(2,11,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2023-06-11 14:32:04','2023-06-11 14:32:04','1e286710-aeb2-49ec-95e6-aa633ce85649'),(3,11,'craft\\widgets\\Updates',3,NULL,'[]',1,'2023-06-11 14:32:04','2023-06-11 14:32:04','d15d12f3-4f79-4bda-8b18-c2f7ce266d5a'),(4,11,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https:\\/\\/craftcms.com\\/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2023-06-11 14:32:04','2023-06-11 14:32:04','5db8a87e-15b8-40bc-941e-329cd0e1c245');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-13  7:03:03
