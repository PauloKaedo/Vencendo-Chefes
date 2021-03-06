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
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment` varchar(510) NOT NULL,
  `boss` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_boss_idx` (`boss`),
  CONSTRAINT `fk_comment_boss` FOREIGN KEY (`boss`) REFERENCES `boss` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


DROP TABLE IF EXISTS `boss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boss` (
  `id` int NOT NULL AUTO_INCREMENT,
  `game` varchar(128) NOT NULL,
  `enemy` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_boss_enemy_idx` (`enemy`),
  CONSTRAINT `fk_boss_enemies` FOREIGN KEY (`enemy`) REFERENCES `enemies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `hard` int DEFAULT 0,
  `easy` int DEFAULT 0,
  `boss` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_likes_boss_idx` (`boss`),
  CONSTRAINT `fk_likes_boss` FOREIGN KEY (`boss`) REFERENCES `boss` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `enemies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enemies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(510) NOT NULL,
  `difficulty` varchar(60) NOT NULL,
  `image1` varchar(255) NOT NULL,
  `image2` varchar(255) DEFAULT NULL,
  `image3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

DROP TABLE IF EXISTS `detonated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detonated` (
  `id` int NOT NULL AUTO_INCREMENT,
  `detonated` varchar(510) NOT NULL,
  `enemy` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_enemies_idx` (`enemy`),
  CONSTRAINT `fk_detonated_enemy` FOREIGN KEY (`enemy`) REFERENCES `enemies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

INSERT INTO `enemies` VALUES 
(1,'Nemesis','Nemesis, tamb??m chamado de Pursuer ou Chaser, ?? um personagem fict??cio da s??rie Resident Evil. Criado pela Capcom, apareceu pela primeira vez em Resident Evil 3.','Hard','nemesis1.jpg','nemesis2.jpg','nemesis3.jpg'),
(2,'Sephiroth','Sephiroth ?? um personagem fict??cio e o principal antagonista de Final Fantasy VII desenvolvido pela Square.','Super Hard','sephiroth1.jpg','sephiroth2.jpg','sephiroth3.jpg'),
(3,'Doctor Neo Cortex','Doctor Neo Cortex ?? um personagem fict??cio e o principal antagonista da s??rie de videogames Crash Bandicoot.','Easy','neocortex1.jpg','neocortex2.jpg','neocortex3.jpg'),
(4,'Sigma','Sigma ?? o principal antagonista da s??rie de videogames Mega Man X. Criado pelo Dr. Cain, Sigma foi considerado o melhor dos Reploids e foi o primeiro l??der dos Maverick Hunters.','Hard','sigma1.jpg','sigma2.jpg','sigma3jpg'),
(5,'Ganon','Ganon tamb??m conhecido como Ganondorf em sua forma Gerudo, ?? o principal antagonista da s??rie de jogos The Legend of Zelda','Medium','ganon2.jpg','ganon1.jpg','ganon3.jpg'),
(6,'Alduin','Alduin, ou o Devorador de Mundos, como ?? conhecido pelos habitantes de Skyrim, ?? um drag??o imensamente poderoso.','Hard','alduin1.jpg','alduin2.jpg','alduin3.jpg'),
(7,'M. Bison','M. Bison, tamb??m conhecido como Ditador, ?? um personagem de videogame criado pela Capcom. Apresentado pela primeira vez em Street Fighter II: The World Warrior.','Medium','bison2.jpg','bison1.jpg','bison3.jpg'),
(8,'Montaro','Motaro ?? um personagem da franquia de jogos Mortal Kombat.Ele foi introduzido em Mortal Kombat 3 como sub-chefe principal do jogo.','Super Hard','motaro2.jpg','motaro1.jpg','motaro3.jpg');

INSERT INTO `detonated` VALUES 
(1, 'Quando estiver controlando a Jill, sempre que encontrar uma granada (a normal, n??o a de atordoamento), guarde-a e n??o hesite em joga-las em Nemesis quando ele a perseguir na cidade.\nO dano das granadas ?? alto e vai permitir que voc?? ganhe tempo para se afastar mais dele.\nSempre que Nemesis estiver perseguindo a hero??na do game, preste aten????o nos geradores el??tricos port??teis espalhados pelo cen??rio.\nAtire neles quando o monstrengo passar perto, pois Nemesis ser?? eletrocutado e voc?? ganha mais tempo para correr e despist??-lo!', 1),
(2, 'Nesta batalha, passaremos por v??rias fases, nas quais teremos que enfraquecer nosso inimigo final, levando em considera????o que ?? o mais poderoso que enfrentaremos ao longo do jogo, ?? ideal que sigamos alguns conselhos que nos permitam ter as melhores estrat??gias Nesta batalha, para isso, veremos Como vencer Sephiroth em cada uma das fases at?? chegar ao fim, continuando a leitura ser?? necess??rio para alcan??ar as respostas, ent??o vamos faz??-lo.', 2),
(3, 'Primeiro, desvie dos foguetes e do serrote de Mecha Bandicoot. Depois, fique de frente para Mecha Bandicoot e espere que ele atire bolas verdes como Neo Cortex fez. Quando ela chegar em voc??, use o giro para jogar a bola de volta para Mecha Bandicoot. Fa??a duas vezes para destruir um bra??o dele. Depois, ele usar?? apenas o serrote e lan??ar?? a bola verde. Jogue-a de volta para Mecha Bandicoot mais duas vezes. Depois, ele apenas atirar?? a bola verde. Jogue-a para Mecha Bandicoot por 3 vezes.', 3),
(4, 'No momento que a luta come??ar use um Hadoken para dar cabo dele, ou as coisas podem complicar muito, ele lan??a uma onda de energia f??cil de desviar e tem um ataque onde fica se movendo em zigue-zague pelo cen??rio, esse n??o ?? t??o f??cil de desviar, por isso ?? bom acabar com a luta logo no in??cio, pois o que vem depois vai exigir todos os sub-tanks cheios, de qualquer forma a arma mais eficiente contra ele ?? o Spark Shot.', 4),
(5, 'J?? no ch??o, ele pode usar a sua espada de um lado para o outro, criando uma s??rie de bolas de fogo (e um fluxo de ar que podes montar com o teu Paraglider e que te permite disparar setas de cima) ou de cima para baixo que, se aterrar em ti, pode praticamente matar-te de uma ??nica assentada.', 5),
(6, 'Os NPCs v??o atirar no drag??o enquanto voa, mas n??o h?? como infligir dano at?? que ele seja for??ado a aterrissar com o ???Dragonrend???. Um toque no bot??o para gritar j?? dispara a habilidade, o que pode atordoar o drag??o depois que ele estiver no ch??o.', 6),
(7, 'Assim, o amigo do Ryu ou deve pular horizontalmente e chutar ele no ar ou no solo, ou mandar Shoryukens (aprenda a executar todos os golpes de Street Fighter 2) quando ele estiver no ar.', 7),
(8, 'O salto com soco (jumping punch) ?? similar ao chute, mas com uma grande diferen??a: em vez de pular na dire????o de Motaro, d?? um salto vertical e, ent??o, d?? um soco quando atingir o ponto mais alto do salto. Assim que o soco atingir Motaro e voc?? aterrissar, salte para tr??s, fora do alcance dele, ou voc?? ser?? agarrado. A chave para usar esta t??tica ?? a precis??o: voc?? deve calcular seu salto de modo que atinja o topo no momento em que Motaro ficar ao seu alcance. Pule antes e voc?? vai errar, socando o ar; pule tarde demais e ele vai bloque??-lo antes que voc?? possa atingi-lo.', 8);

INSERT INTO `boss` VALUES 
(1, 'Resident Evil 3', 1),
(2, 'Final Fantasy VII', 2),
(3, 'Crash Bandicoot', 3),
(4, 'Mega Man X', 4),
(5, 'Legend of Zelda', 5),
(6, 'Skyrim', 6),
(7, 'Street Fight II', 7),
(8, 'Mortal Kombat 3', 8);

INSERT INTO `likes` VALUES 
(1, 5, 3, 1),
(2, 7, 1, 2),
(3, 1, 4, 3),
(4, 3, 3, 4),
(5, 3, 4, 5),
(6, 10, 3, 6),
(7, 4, 2, 7),
(8, 8, 2, 8);

INSERT INTO `comments` VALUES 
(1, 'Guarde todas balas possiveis!', 1, 'Mark'),
(2, 'Tente n??o lutar parado, ou vai se dar mal!', 1, 'Cloud'),
(3, 'Ele ?? fraco contra Magnum.', 1, 'Sam'),

(4, 'Phoenix Down n??o far?? efeito!', 2, 'Sam'),
(5, 'Use po????o de veneno nas armas.', 2, 'Frodo'),
(6, 'Tente duelar com nivel 99', 2, 'Aragorn'),

(7, 'Cuidado com os raios do robo gigante!', 3, 'Mark'),
(8, 'Colete as ma????s antes de batalhar.', 3, 'Cloud'),
(9, 'Gire quando ele atirar caixas.', 3, 'Zelda'),

(10, 'Pegue o hadouken antes de ir no Sigma.', 4, 'Zelda'),
(11, 'Junte a armadura completa, assim fica f??cil.', 4, 'Sam'),
(12, 'Desvie dos morcegos, eles s??o terr??veis!', 4, 'Mark'),

(13, 'Use a epona para ter mais velocidade.', 5, 'Cloud'),
(14, 'Toque a ocarina ao contr??rio.', 5, 'Aragorn'),
(15, 'Fique abaixado contra o fogo que ele solta.', 5, 'Frodo'),

(16, 'Use o Fus ho dah e fim de papo.', 6, 'Zelda'),
(17, 'Tente lutar usando Daedrick.', 6, 'Mark'),
(18, 'Toda po????o de vida ?? pouco!', 6, 'Frodo'),

(19, 'N??o deixe ele combar!', 7, 'Frodo'),
(20, 'Se ele combar, j?? era!', 7, 'Mark'),
(21, '?? s??rio, n??o deixa ele combar!', 7, 'Sam'),

(22, 'O famoso bate e corre.', 8, 'Zelda'),
(23, 'N??o fique exposto por muito tempo!', 8, 'Cloud'),
(24, 'O coice dele tira metade da vida, cuidado!', 9, 'Aragorn');


