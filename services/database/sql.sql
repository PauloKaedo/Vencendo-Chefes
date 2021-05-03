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
(1,'Nemesis','Nemesis, também chamado de Pursuer ou Chaser, é um personagem fictício da série Resident Evil. Criado pela Capcom, apareceu pela primeira vez em Resident Evil 3.','Hard','nemesis1.jpg','nemesis2.jpg','nemesis3.jpg'),
(2,'Sephiroth','Sephiroth é um personagem fictício e o principal antagonista de Final Fantasy VII desenvolvido pela Square.','Super Hard','sephiroth1.jpg','sephiroth2.jpg','sephiroth3.jpg'),
(3,'Doctor Neo Cortex','Doctor Neo Cortex é um personagem fictício e o principal antagonista da série de videogames Crash Bandicoot.','Easy','neocortex1.jpg','neocortex2.jpg','neocortex3.jpg'),
(4,'Sigma','Sigma é o principal antagonista da série de videogames Mega Man X. Criado pelo Dr. Cain, Sigma foi considerado o melhor dos Reploids e foi o primeiro líder dos Maverick Hunters.','Hard','sigma1.jpg','sigma2.jpg','sigma3jpg'),
(5,'Ganon','Ganon também conhecido como Ganondorf em sua forma Gerudo, é o principal antagonista da série de jogos The Legend of Zelda','Medium','ganon2.jpg','ganon1.jpg','ganon3.jpg'),
(6,'Alduin','Alduin, ou o Devorador de Mundos, como é conhecido pelos habitantes de Skyrim, é um dragão imensamente poderoso.','Hard','alduin1.jpg','alduin2.jpg','alduin3.jpg'),
(7,'M. Bison','M. Bison, também conhecido como Ditador, é um personagem de videogame criado pela Capcom. Apresentado pela primeira vez em Street Fighter II: The World Warrior.','Medium','bison2.jpg','bison1.jpg','bison3.jpg'),
(8,'Montaro','Motaro é um personagem da franquia de jogos Mortal Kombat.Ele foi introduzido em Mortal Kombat 3 como sub-chefe principal do jogo.','Super Hard','motaro2.jpg','motaro1.jpg','motaro3.jpg');

INSERT INTO `detonated` VALUES 
(1, 'Quando estiver controlando a Jill, sempre que encontrar uma granada (a normal, não a de atordoamento), guarde-a e não hesite em joga-las em Nemesis quando ele a perseguir na cidade.\nO dano das granadas é alto e vai permitir que você ganhe tempo para se afastar mais dele.\nSempre que Nemesis estiver perseguindo a heroína do game, preste atenção nos geradores elétricos portáteis espalhados pelo cenário.\nAtire neles quando o monstrengo passar perto, pois Nemesis será eletrocutado e você ganha mais tempo para correr e despistá-lo!', 1),
(2, 'Nesta batalha, passaremos por várias fases, nas quais teremos que enfraquecer nosso inimigo final, levando em consideração que é o mais poderoso que enfrentaremos ao longo do jogo, é ideal que sigamos alguns conselhos que nos permitam ter as melhores estratégias Nesta batalha, para isso, veremos Como vencer Sephiroth em cada uma das fases até chegar ao fim, continuando a leitura será necessário para alcançar as respostas, então vamos fazê-lo.', 2),
(3, 'Primeiro, desvie dos foguetes e do serrote de Mecha Bandicoot. Depois, fique de frente para Mecha Bandicoot e espere que ele atire bolas verdes como Neo Cortex fez. Quando ela chegar em você, use o giro para jogar a bola de volta para Mecha Bandicoot. Faça duas vezes para destruir um braço dele. Depois, ele usará apenas o serrote e lançará a bola verde. Jogue-a de volta para Mecha Bandicoot mais duas vezes. Depois, ele apenas atirará a bola verde. Jogue-a para Mecha Bandicoot por 3 vezes.', 3),
(4, 'No momento que a luta começar use um Hadoken para dar cabo dele, ou as coisas podem complicar muito, ele lança uma onda de energia fácil de desviar e tem um ataque onde fica se movendo em zigue-zague pelo cenário, esse não é tão fácil de desviar, por isso é bom acabar com a luta logo no início, pois o que vem depois vai exigir todos os sub-tanks cheios, de qualquer forma a arma mais eficiente contra ele é o Spark Shot.', 4),
(5, 'Já no chão, ele pode usar a sua espada de um lado para o outro, criando uma série de bolas de fogo (e um fluxo de ar que podes montar com o teu Paraglider e que te permite disparar setas de cima) ou de cima para baixo que, se aterrar em ti, pode praticamente matar-te de uma única assentada.', 5),
(6, 'Os NPCs vão atirar no dragão enquanto voa, mas não há como infligir dano até que ele seja forçado a aterrissar com o “Dragonrend”. Um toque no botão para gritar já dispara a habilidade, o que pode atordoar o dragão depois que ele estiver no chão.', 6),
(7, 'Assim, o amigo do Ryu ou deve pular horizontalmente e chutar ele no ar ou no solo, ou mandar Shoryukens (aprenda a executar todos os golpes de Street Fighter 2) quando ele estiver no ar.', 7),
(8, 'O salto com soco (jumping punch) é similar ao chute, mas com uma grande diferença: em vez de pular na direção de Motaro, dê um salto vertical e, então, dê um soco quando atingir o ponto mais alto do salto. Assim que o soco atingir Motaro e você aterrissar, salte para trás, fora do alcance dele, ou você será agarrado. A chave para usar esta tática é a precisão: você deve calcular seu salto de modo que atinja o topo no momento em que Motaro ficar ao seu alcance. Pule antes e você vai errar, socando o ar; pule tarde demais e ele vai bloqueá-lo antes que você possa atingi-lo.', 8);

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
(2, 'Tente não lutar parado, ou vai se dar mal!', 1, 'Cloud'),
(3, 'Ele é fraco contra Magnum.', 1, 'Sam'),

(4, 'Phoenix Down não fará efeito!', 2, 'Sam'),
(5, 'Use poção de veneno nas armas.', 2, 'Frodo'),
(6, 'Tente duelar com nivel 99', 2, 'Aragorn'),

(7, 'Cuidado com os raios do robo gigante!', 3, 'Mark'),
(8, 'Colete as maçãs antes de batalhar.', 3, 'Cloud'),
(9, 'Gire quando ele atirar caixas.', 3, 'Zelda'),

(10, 'Pegue o hadouken antes de ir no Sigma.', 4, 'Zelda'),
(11, 'Junte a armadura completa, assim fica fácil.', 4, 'Sam'),
(12, 'Desvie dos morcegos, eles são terríveis!', 4, 'Mark'),

(13, 'Use a epona para ter mais velocidade.', 5, 'Cloud'),
(14, 'Toque a ocarina ao contrário.', 5, 'Aragorn'),
(15, 'Fique abaixado contra o fogo que ele solta.', 5, 'Frodo'),

(16, 'Use o Fus ho dah e fim de papo.', 6, 'Zelda'),
(17, 'Tente lutar usando Daedrick.', 6, 'Mark'),
(18, 'Toda poção de vida é pouco!', 6, 'Frodo'),

(19, 'Não deixe ele combar!', 7, 'Frodo'),
(20, 'Se ele combar, já era!', 7, 'Mark'),
(21, 'É sério, não deixa ele combar!', 7, 'Sam'),

(22, 'O famoso bate e corre.', 8, 'Zelda'),
(23, 'Não fique exposto por muito tempo!', 8, 'Cloud'),
(24, 'O coice dele tira metade da vida, cuidado!', 9, 'Aragorn');


