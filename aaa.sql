/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 10.4.14-MariaDB : Database - brainaly
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;


/*Table structure for table `collections` */

DROP TABLE IF EXISTS `collections`;

CREATE TABLE `collections` (
  `col_id` int(11) NOT NULL AUTO_INCREMENT,
  `col_name` varchar(255) DEFAULT NULL,
  `col_description` text DEFAULT NULL,
  `col_image` varchar(255) DEFAULT NULL,
  `col_quiz` text DEFAULT NULL,
  `col_uid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`col_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `collections` */

insert  into `collections`(`col_id`,`col_name`,`col_description`,`col_image`,`col_quiz`,`col_uid`) values 
(1,'asdfa sdf asdf asadfasdfa sdfsadf ','This is first test collectionadf asdf asfd asfd','1616138182546-394c447d-4722-48c9-8500-ae58db265b72.jpg','[{\"id\":\"0ead6b7b-f571-0af3-c53b-cf6e92e1ad63\"},{\"id\":\"cceab031-0dee-1efe-27b4-09f3e6a40423\"},{\"id\":\"6a4f1808-0c0a-0d8d-89f5-29e742e19024\"},{\"id\":\"1b76da1b-c90d-0ddd-cf54-912d52d29552\"}]','4b9e8703-075f-b021-5e3c-f0efff7d3bb9'),
(3,'hello everyone','This is my life','1616066866957-552a98a7-11c0-459d-bd68-123c65dfc933.jfif','[]','13ae8079-5fad-fdcc-600a-3d8991cc0c3b');

/*Table structure for table `questions` */

DROP TABLE IF EXISTS `questions`;

CREATE TABLE `questions` (
  `q_id` int(11) NOT NULL AUTO_INCREMENT,
  `q_name` varchar(30) DEFAULT NULL,
  `q_description` varchar(200) DEFAULT NULL,
  `q_cover` varchar(30) DEFAULT NULL,
  `q_share` tinyint(1) DEFAULT 0,
  `q_music_id` int(11) DEFAULT NULL,
  `q_play_num` int(11) DEFAULT NULL,
  `q_user_id` int(11) DEFAULT NULL,
  `q_created_at` date DEFAULT NULL,
  `q_updated_at` date DEFAULT NULL,
  `q_uid` varchar(100) DEFAULT NULL,
  `q_content` text DEFAULT NULL,
  PRIMARY KEY (`q_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `questions` */

insert  into `questions`(`q_id`,`q_name`,`q_description`,`q_cover`,`q_share`,`q_music_id`,`q_play_num`,`q_user_id`,`q_created_at`,`q_updated_at`,`q_uid`,`q_content`) values 
(3,'First test','aaaaaaaaad fasdf a',NULL,0,NULL,NULL,NULL,NULL,NULL,'0ead6b7b-f571-0af3-c53b-cf6e92e1ad63','[{\"href\":\"\",\"title\":\"asdfasdf asdfas\",\"quizType\":2,\"quizAnswer\":1,\"quizTime\":240,\"point\":3,\"image\":\"1615899302398-81PFYtwZPrL._AC_SL1500_.jpg\"},{\"href\":\"\",\"title\":\"adsfasdfasdf\",\"quizType\":1,\"quizAnswer\":[{\"sel\":1,\"answer\":\"ffffffffasdfasdf asdfa dsf a\"},{\"sel\":1,\"answer\":\"dfdf\"},{\"sel\":1,\"answer\":\"aaaaaaaa\"},{\"sel\":0,\"answer\":\"fffdfadf\"}],\"quizTime\":120,\"point\":3,\"image\":\"1615899212917-717YxVnk2JL._AC_SL1500_.jpg\"},{\"href\":\"\",\"title\":\"This is true and false question.\",\"quizType\":2,\"quizAnswer\":1,\"quizTime\":90,\"point\":3,\"image\":\"1615900194336-713jstje6uL._AC_SL1500_.jpg\"},{\"href\":\"\",\"title\":\"adsfasdf\",\"quizType\":1,\"quizAnswer\":[{\"sel\":0,\"answer\":\"egsdfadsf\"},{\"sel\":0,\"answer\":\"ffffff\"},{\"sel\":0,\"answer\":\"adfasdfasdf\"},{\"sel\":1,\"answer\":\"asdfadf\"}],\"quizTime\":20,\"point\":2,\"image\":\"1615900462247-51f6rtSTR8L._AC_SL1001_.jpg\"},{\"href\":\"\",\"title\":\"\",\"quizType\":1,\"quizAnswer\":[{\"sel\":0,\"answer\":\"adfasdfasdf\"},{\"sel\":1,\"answer\":\"aaaaa\"},{\"sel\":0,\"answer\":\"\"},{\"sel\":0,\"answer\":\"fffff\"}],\"quizTime\":20,\"point\":2,\"image\":\"1615900475656-81PFYtwZPrL._AC_SL1500_.jpg\"},{\"href\":\"\",\"title\":\"\",\"quizType\":1,\"quizAnswer\":[{\"sel\":0,\"answer\":\"adsfa\"},{\"sel\":1,\"answer\":\"fff\"},{\"sel\":0,\"answer\":\"aaaa\"},{\"sel\":0,\"answer\":\"fff\"}],\"quizTime\":120,\"point\":3,\"image\":\"1615907736370-90545733-6f4d-44db-bd68-667443553611.jfif\"}]'),
(4,'test quiz','this is the test quiz',NULL,0,NULL,NULL,NULL,NULL,NULL,'cceab031-0dee-1efe-27b4-09f3e6a40423','[{\"href\":\"\",\"title\":\"dasdfasdfasdf\",\"quizType\":1,\"quizAnswer\":[{\"sel\":1,\"answer\":\"aaaaaaaaaaaaaaaaaaaaa\"},{\"sel\":1,\"answer\":\"bbbbbbbbbbbbbbbbbbbb\"},{\"sel\":1,\"answer\":\"cccccccccc\"},{\"sel\":0,\"answer\":\"dddddddd\"}],\"quizTime\":90,\"point\":3,\"image\":\"1615939476532-35827197_720x405.jpeg\"},{\"href\":\"\",\"title\":\"aaaaaaaa\",\"quizType\":2,\"quizAnswer\":1,\"quizTime\":20,\"point\":2,\"image\":\"1615939487947-a99444b5-a37f-4b57-a1eb-33efd2139a07.jfif\"},{\"href\":\"\",\"title\":\"ffffffff\",\"quizType\":1,\"quizAnswer\":[{\"sel\":1,\"answer\":\"yyyyy\"},{\"sel\":0,\"answer\":\"jjjj\"},{\"sel\":0,\"answer\":\"eeee\"},{\"sel\":1,\"answer\":\"aaaaa\"}],\"quizTime\":90,\"point\":2,\"image\":\"1615939499364-552a98a7-11c0-459d-bd68-123c65dfc933.jfif\"}]'),
(5,'fgfgfgfgh','sfgwfasdf sdf sd fs fsf sf ',NULL,0,NULL,NULL,NULL,NULL,NULL,'6a4f1808-0c0a-0d8d-89f5-29e742e19024','[{\"href\":\"\",\"title\":\"adfa dsf adsf asdf asdf\",\"quizType\":1,\"quizAnswer\":[{\"sel\":1,\"answer\":\"\"},{\"sel\":0,\"answer\":\"\"},{\"sel\":1,\"answer\":\"\"},{\"sel\":0,\"answer\":\"\"}],\"quizTime\":20,\"point\":1,\"image\":\"1616034360368-Image-6-16-19-at-11.43-PM.jpg\"},{\"href\":\"\",\"title\":\"fffadsfa d fasdf a\",\"quizType\":2,\"quizAnswer\":1,\"quizTime\":60,\"point\":3,\"image\":\"1616034412821-avatar.jpg\"},{\"href\":\"\",\"title\":\"kljlkhlkh\",\"quizType\":1,\"quizAnswer\":[{\"sel\":1,\"answer\":\"\"},{\"sel\":0,\"answer\":\"\"},{\"sel\":0,\"answer\":\"\"},{\"sel\":1,\"answer\":\"\"}],\"quizTime\":90,\"point\":3,\"image\":\"1616034464275-img_20210311.png\"}]'),
(6,'ASDFASDF','dfasdf asdf',NULL,0,NULL,NULL,NULL,NULL,NULL,'1b76da1b-c90d-0ddd-cf54-912d52d29552','[{\"href\":\"\",\"title\":\"\",\"quizType\":1,\"quizAnswer\":[{\"sel\":1,\"answer\":\"sfdSDFADF\"},{\"sel\":0,\"answer\":\"\"},{\"sel\":0,\"answer\":\"\"},{\"sel\":1,\"answer\":\"ADFASDFASDF\"}],\"quizTime\":20,\"point\":2,\"image\":\"1616057855503-cd8b6a15-fc33-438c-aaa7-a2dca7c2a566.jfif\"}]');

/*Table structure for table `sub_questions` */

DROP TABLE IF EXISTS `sub_questions`;

CREATE TABLE `sub_questions` (
  `sub_id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_title` varchar(30) DEFAULT NULL,
  `sub_description` varchar(100) DEFAULT NULL,
  `sub_image` varchar(50) DEFAULT NULL,
  `sub_type` varchar(10) DEFAULT NULL,
  `sub_time_limit` int(11) DEFAULT NULL,
  `sub_point` int(11) DEFAULT NULL,
  `sub_ans_type` varchar(10) DEFAULT NULL,
  `sub_sequence` int(11) DEFAULT NULL,
  `sub_created_at` date DEFAULT NULL,
  `sub_updated_at` date DEFAULT NULL,
  `sub_quiz_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`sub_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sub_questions` */

insert  into `sub_questions`(`sub_id`,`sub_title`,`sub_description`,`sub_image`,`sub_type`,`sub_time_limit`,`sub_point`,`sub_ans_type`,`sub_sequence`,`sub_created_at`,`sub_updated_at`,`sub_quiz_id`) values 
(1,'test_sub','test_description',NULL,'quiz',20,1,'multi',1,'2021-03-03','2021-03-03',NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(30) DEFAULT NULL,
  `u_first_name` varchar(30) DEFAULT NULL,
  `u_last_name` varchar(30) DEFAULT NULL,
  `u_birthday` date DEFAULT NULL,
  `u_email` varchar(30) DEFAULT NULL,
  `u_pwd` varchar(100) DEFAULT NULL,
  `u_payment_info` varchar(30) DEFAULT NULL,
  `u_type` varchar(20) DEFAULT NULL,
  `u_school` varchar(80) DEFAULT NULL,
  `u_avatar` varchar(40) DEFAULT NULL,
  `u_email_verified` tinyint(1) DEFAULT 0,
  `u_email_verify_code` int(11) DEFAULT NULL,
  `u_membership_type` int(11) DEFAULT NULL,
  `u_expire_date` date DEFAULT NULL,
  `u_free_remain_time` int(11) DEFAULT 7,
  `u_created_at` timestamp NULL DEFAULT NULL,
  `u_updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `users` */

insert  into `users`(`u_id`,`u_name`,`u_first_name`,`u_last_name`,`u_birthday`,`u_email`,`u_pwd`,`u_payment_info`,`u_type`,`u_school`,`u_avatar`,`u_email_verified`,`u_email_verify_code`,`u_membership_type`,`u_expire_date`,`u_free_remain_time`,`u_created_at`,`u_updated_at`) values 
(1,'longman',NULL,NULL,NULL,'azzipcirolac@gmail.com','$2a$10$89WtnwehSVFEdtzdh00Doulpu6JidJ4JAnCIxVP8VKlrYz9amWGH2',NULL,'teacher',NULL,NULL,0,NULL,NULL,NULL,7,NULL,NULL),
(2,'xiaorizhang',NULL,NULL,NULL,'xiaorizhang15@gmail.com','$2a$10$CuNROuHcPtdyJuq32ikUfuzRxj7uvj/5RIeaK.GFe3hTXy7MGU7am',NULL,'teacher',NULL,NULL,0,NULL,NULL,NULL,7,NULL,NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
