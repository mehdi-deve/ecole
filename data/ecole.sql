-- MySQL dump 10.13  Distrib 5.7.30, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: ecole
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.18.04.1

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
-- Table structure for table `classe`
--

DROP TABLE IF EXISTS `classe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classe` (
  `id` varchar(255) NOT NULL,
  `nom` varchar(56) DEFAULT NULL,
  `etablissement_id` varchar(55) DEFAULT NULL,
  `user_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `etablissementId` (`etablissement_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `etablissement_id` FOREIGN KEY (`id`) REFERENCES `etablissement` (`id`),
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classe`
--

LOCK TABLES `classe` WRITE;
/*!40000 ALTER TABLE `classe` DISABLE KEYS */;
INSERT INTO `classe` VALUES ('1','Math','1',NULL);
/*!40000 ALTER TABLE `classe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cours`
--

DROP TABLE IF EXISTS `cours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cours` (
  `id` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `professeur_id` varchar(255) NOT NULL,
  `matiere_id` varchar(255) NOT NULL,
  `classe_id` varchar(255) NOT NULL,
  `date_creation` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cours_professeur_id_idx` (`professeur_id`),
  KEY `fk_cours_matiere_id_idx` (`matiere_id`),
  KEY `fk_cours_classe_id_idx` (`classe_id`),
  CONSTRAINT `fk_cours_classe_id` FOREIGN KEY (`classe_id`) REFERENCES `classe` (`id`),
  CONSTRAINT `fk_cours_matiere_id` FOREIGN KEY (`matiere_id`) REFERENCES `ref_matiere` (`id`),
  CONSTRAINT `fk_cours_professeur_id` FOREIGN KEY (`professeur_id`) REFERENCES `professeur` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cours`
--

LOCK TABLES `cours` WRITE;
/*!40000 ALTER TABLE `cours` DISABLE KEYS */;
INSERT INTO `cours` VALUES ('1','Math','1','1','1','2020-05-16'),('2','Math2','1','1','1','2020-05-17'),('3','Math3','1','1','1','2020-05-17'),('4','Math4','1','1','1','2020-05-18');
/*!40000 ALTER TABLE `cours` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cours_contenu`
--

DROP TABLE IF EXISTS `cours_contenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cours_contenu` (
  `id` varchar(255) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  `contenu` varchar(45) DEFAULT NULL,
  `date_creation` date DEFAULT NULL,
  `cours_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cours_contenu_type_id_idx` (`type`),
  KEY `fk_cours_contenu_cours1_idx` (`cours_id`),
  CONSTRAINT `fk_cours_contenu_cours_id` FOREIGN KEY (`cours_id`) REFERENCES `cours` (`id`),
  CONSTRAINT `fk_cours_contenu_type_id` FOREIGN KEY (`type`) REFERENCES `ref_contenu_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cours_contenu`
--

LOCK TABLES `cours_contenu` WRITE;
/*!40000 ALTER TABLE `cours_contenu` DISABLE KEYS */;
/*!40000 ALTER TABLE `cours_contenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eleve`
--

DROP TABLE IF EXISTS `eleve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eleve` (
  `id` varchar(255) NOT NULL,
  `classe_id` varchar(255) NOT NULL,
  `utilisateur_id` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Eleve_Classe1_idx` (`classe_id`),
  KEY `user_id_idx` (`utilisateur_id`),
  CONSTRAINT `classe_id` FOREIGN KEY (`classe_id`) REFERENCES `classe` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eleve`
--

LOCK TABLES `eleve` WRITE;
/*!40000 ALTER TABLE `eleve` DISABLE KEYS */;
INSERT INTO `eleve` VALUES ('1','1','2');
/*!40000 ALTER TABLE `eleve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etablissement`
--

DROP TABLE IF EXISTS `etablissement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etablissement` (
  `id` varchar(255) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `adresse` varchar(45) DEFAULT NULL,
  `ville` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etablissement`
--

LOCK TABLES `etablissement` WRITE;
/*!40000 ALTER TABLE `etablissement` DISABLE KEYS */;
INSERT INTO `etablissement` VALUES ('1','ENSA','fes','fes'),('2','NECG','fes','fes');
/*!40000 ALTER TABLE `etablissement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professeur`
--

DROP TABLE IF EXISTS `professeur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professeur` (
  `id` varchar(56) NOT NULL,
  `utilisateur_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `utilisateur_id_idx` (`utilisateur_id`),
  CONSTRAINT `utilisateur_id` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professeur`
--

LOCK TABLES `professeur` WRITE;
/*!40000 ALTER TABLE `professeur` DISABLE KEYS */;
INSERT INTO `professeur` VALUES ('1','1'),('2','2'),('3','3');
/*!40000 ALTER TABLE `professeur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professeur_class`
--

DROP TABLE IF EXISTS `professeur_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professeur_class` (
  `classe_id` varchar(255) NOT NULL,
  `professeur_id` varchar(56) NOT NULL,
  PRIMARY KEY (`classe_id`,`professeur_id`),
  KEY `fk_classe_has_professeur_professeur1_idx` (`professeur_id`),
  KEY `fk_classe_has_professeur_classe1_idx` (`classe_id`),
  CONSTRAINT `fk_classe_has_professeur_classe1` FOREIGN KEY (`classe_id`) REFERENCES `classe` (`id`),
  CONSTRAINT `fk_classe_has_professeur_professeur1` FOREIGN KEY (`professeur_id`) REFERENCES `professeur` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professeur_class`
--

LOCK TABLES `professeur_class` WRITE;
/*!40000 ALTER TABLE `professeur_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `professeur_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professeur_matiere`
--

DROP TABLE IF EXISTS `professeur_matiere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `professeur_matiere` (
  `professeur_id` varchar(255) NOT NULL,
  `matiere_id` varchar(255) NOT NULL,
  PRIMARY KEY (`professeur_id`,`matiere_id`),
  KEY `fk_professeurateier_matier_id_idx` (`matiere_id`),
  CONSTRAINT `fk_professeur_matier_profeseur_id` FOREIGN KEY (`professeur_id`) REFERENCES `professeur` (`id`),
  CONSTRAINT `fk_professeurateier_matier_id` FOREIGN KEY (`matiere_id`) REFERENCES `ref_matiere` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professeur_matiere`
--

LOCK TABLES `professeur_matiere` WRITE;
/*!40000 ALTER TABLE `professeur_matiere` DISABLE KEYS */;
/*!40000 ALTER TABLE `professeur_matiere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_categorie`
--

DROP TABLE IF EXISTS `ref_categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_categorie` (
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_categorie`
--

LOCK TABLES `ref_categorie` WRITE;
/*!40000 ALTER TABLE `ref_categorie` DISABLE KEYS */;
INSERT INTO `ref_categorie` VALUES ('Eleve'),('Professeur');
/*!40000 ALTER TABLE `ref_categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_contenu_type`
--

DROP TABLE IF EXISTS `ref_contenu_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_contenu_type` (
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_contenu_type`
--

LOCK TABLES `ref_contenu_type` WRITE;
/*!40000 ALTER TABLE `ref_contenu_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `ref_contenu_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ref_matiere`
--

DROP TABLE IF EXISTS `ref_matiere`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ref_matiere` (
  `id` varchar(255) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ref_matiere`
--

LOCK TABLES `ref_matiere` WRITE;
/*!40000 ALTER TABLE `ref_matiere` DISABLE KEYS */;
INSERT INTO `ref_matiere` VALUES ('1','Maths'),('2','Physique');
/*!40000 ALTER TABLE `ref_matiere` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('Admin'),('Moderateur'),('Utilisateur');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateur` (
  `id` varchar(255) NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `categorie` varchar(45) DEFAULT NULL,
  `etablissement_id` varchar(255) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ustilisateur_categorie_id_idx` (`categorie`),
  KEY `fk_utilisateur_etablissement_id_idx` (`etablissement_id`),
  CONSTRAINT `fk_ustilisateur_categorie_id` FOREIGN KEY (`categorie`) REFERENCES `ref_categorie` (`name`),
  CONSTRAINT `fk_utilisateur_etablissement_id` FOREIGN KEY (`etablissement_id`) REFERENCES `etablissement` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur`
--

LOCK TABLES `utilisateur` WRITE;
/*!40000 ALTER TABLE `utilisateur` DISABLE KEYS */;
INSERT INTO `utilisateur` VALUES ('1','Douri','Mehdi','123','Professeur','1','1996-12-11'),('2','Hamza','Hamza','1234','Eleve','1','1996-11-17'),('3','Ahmed','Ahmed','1234','Professeur','1','1995-12-24');
/*!40000 ALTER TABLE `utilisateur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateur_role`
--

DROP TABLE IF EXISTS `utilisateur_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateur_role` (
  `role_id` varchar(45) NOT NULL,
  `utilisateur_id` varchar(255) NOT NULL,
  PRIMARY KEY (`role_id`,`utilisateur_id`),
  KEY `fk_role_has_utilisateur_utilisateur1_idx` (`utilisateur_id`),
  KEY `fk_role_has_utilisateur_role1_idx` (`role_id`),
  CONSTRAINT `fk_role_has_utilisateur_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role`),
  CONSTRAINT `fk_role_has_utilisateur_utilisateur1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateur_role`
--

LOCK TABLES `utilisateur_role` WRITE;
/*!40000 ALTER TABLE `utilisateur_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `utilisateur_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-16 23:10:53
