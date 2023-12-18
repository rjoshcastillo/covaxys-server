/*
SQLyog Community v13.2.1 (64 bit)
MySQL - 8.2.0 : Database - covaxysdb
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`covaxysdb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `covaxysdb`;

/*Table structure for table `diseases` */

DROP TABLE IF EXISTS `diseases`;

CREATE TABLE `diseases` (
  `id` int NOT NULL AUTO_INCREMENT,
  `diseaseName` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `image` varchar(600) NOT NULL,
  `description` varchar(600) NOT NULL,
  `symptoms` json DEFAULT NULL,
  `remedy` json DEFAULT NULL,
  `treatment` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `diseases` */

insert  into `diseases`(`id`,`diseaseName`,`image`,`description`,`symptoms`,`remedy`,`treatment`) values 
(13,'Eczema','https://thumbs2.imgbox.com/9a/9d/sqOeXeZs_t.jpg','It’s sometimes called \'the itch that rashes,\' because the itching usually comes first. This group of skin rashes is very common in babies and toddlers. Adults can have it too, often as scaly, leathery patches or on their hands. Atopic dermatitis is a common, often inherited form of eczema, but there are other types and many treatments.','[\"Affected areas may be red (light skin) or darker brown\", \"purple\", \"or ash gray (brown skin).\", \"Dry\", \"scaly areas\", \"Warmth\", \"possibly also with some swelling\", \"Small\", \"rough bumps\", \"Thick leathery patches\", \"Bumps that leak and crust over\"]','[\"Aloe Vera\", \"Apple Cider Vinegar\", \"Bleach in bath\"]','[\"Azathioprine (Azasan)\", \"Methotrexate\", \"Mycophenolate mofetil (CellCept)\", \"Phosphodiesterase inhibitors (Eucrisa ointment)\"]'),
(14,'Melasma','https://thumbs2.imgbox.com/5e/4e/KTcZq3DO_t.jpg','Melasma is a skin condition characterized by brown or blue-gray patches or freckle-like spots. It’s often called the “mask of pregnancy.” Melasma happens because of overproduction of the cells that make the color of your skin. It is common, harmless and some treatments may help. Melasma usually fades after a few months.','[\"The melasma appears on your shoulders and upper arms.\", \"The melasma appears on your forehead\", \"cheeks\", \"nose and upper lip.\", \"The melasma appears on both cheeks.\", \"The melasma appears on your cheeks and nose\"]','[\"Aloe Vera\", \"Apple Cider Vinegar\", \"Bleach in bath\"]','[\"Azelaic acid\", \"Cysteamine\", \"Hydrocortisone (a topical corticosteroid)\", \"Hydroquinone\"]'),
(15,'Acne','https://thumbs2.imgbox.com/fb/e7/Oskl6jCc_t.jpg','Acne is a very common skin condition that causes pimples. You’ll usually get pimples on your face. Clogged pores cause acne. Teenagers and young adults most often get acne, but it can also occur during adulthood for many people. Treatment is available to clear acne from your skin and prevent scarring.','[\"Pus-filled bumps \", \"Small, discolored bumps, often red to purple or darker than your natural skin tone.\", \"Plugged pores with a black top.\", \"Plugged pores with a white top.\"]','[\"Aloe Vera\", \"Apple Cider Vinegar\", \"Bleach in bath\"]','[\"Benzoyl peroxide\", \"Salicylic acid\", \"Retinoids\", \"Antibiotics\"]'),
(16,'Alap-ap','https://thumbs2.imgbox.com/c3/f7/5z7SwptU_t.jpg','Tinea versicolor is a common skin disorder caused by the fungus Malassezia furfur. This fungus temporarily modifies the normal pigmentation of the skin, resulting in small white patches','[\"Scaly spots or patches on the skin\", \"Patches are typically white and oval-shaped\", \"The patches often have sharp borders or edges\"]','[\"Aloe Vera\", \"Apple Cider Vinegar\", \"Bleach in bath\"]','[\"clotrimazole (Lotrimin AF, Mycelex) cream or lotion\", \"miconazole (Monistat, M-Zole) cream\", \"selenium sulfide (Selsun Blue) 1 percent shampoo\", \"terbinafine (Lamisil) gel or cream\"]'),
(17,'Warts','https://thumbs2.imgbox.com/13/36/aD9aUkoR_t.jpg','Warts are a type of skin infection caused by the human papillomavirus (HPV). The infection causes rough, skin-colored bumps to form on the skin. The virus is contagious. You can get warts from touching someone who has them. Warts most commonly appear on the hands, but they can also affect the feet, face, genitals and knees.','[\"Dome-shaped.\", \"Flat.\", \"Rough\", \"Skin-colored, brown, grey or black.\"]','[\"Aloe Vera\", \"Apple Cider Vinegar\", \"Bleach in bath\"]','[\"At-home wart removal: Over-the-counter (OTC) wart removal medications, such as Compound W®, contain salicylic acid. \", \"Freezing: During a procedure called cryotherapy, your doctor applies liquid nitrogen to freeze the wart.\", \"Immunotherapy: For stubborn warts that don’t respond to traditional treatments, immunotherapy helps your immune system fight the virus.\", \"Laser treatment: Your doctor uses laser light to heat and destroy tiny blood vessels inside the wart. The process cuts off blood supply, killing the wart.\"]');

/*Table structure for table `test` */

DROP TABLE IF EXISTS `test`;

CREATE TABLE `test` (
  `id` int NOT NULL AUTO_INCREMENT,
  `text` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `test` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `username` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `users` */

insert  into `users`(`userId`,`username`,`password`,`createdAt`,`updatedAt`) values 
(1,'admin','admin123','2023-12-17 18:22:29',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
