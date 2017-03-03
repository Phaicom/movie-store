-- phpMyAdmin SQL Dump
-- version 4.4.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 23, 2015 at 09:04 AM
-- Server version: 5.6.25
-- PHP Version: 5.5.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `moviestore_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `category_id` int(6) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`) VALUES
(1, 'Action'),
(2, 'Animation'),
(3, 'Comedy'),
(4, 'Horror'),
(5, 'Romance'),
(6, 'Sport'),
(7, 'Thriller'),
(8, 'War'),
(9, 'Science'),
(10, 'drama'),
(11, 'history'),
(12, 'adventure');

-- --------------------------------------------------------

--
-- Table structure for table `confirm_order`
--

CREATE TABLE IF NOT EXISTS `confirm_order` (
  `confirm_id` int(6) NOT NULL,
  `order_id` int(6) NOT NULL,
  `amount` double NOT NULL,
  `bank` varchar(50) NOT NULL,
  `datetransfer` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `confirm_order`
--

INSERT INTO `confirm_order` (`confirm_id`, `order_id`, `amount`, `bank`, `datetransfer`) VALUES
(75, 20, 460, 'Krungthai', '2016-01-20 10:10:00');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `contact_id` int(6) NOT NULL,
  `message` varchar(500) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `datecreate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(6) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`contact_id`, `message`, `name`, `email`, `phone`, `datecreate`, `user_id`) VALUES
(1, 'Noob', 'Reawpai', 'you-noob@hotmail.co.th', '0897890539', '2015-11-11 18:11:23', 1),
(2, 'ad', 'ad', 'ad', 'ad', '2015-11-11 18:13:59', 1),
(3, 'test', 'test', 'you-noob@hotmail.co.th', '0846715445', '2015-11-11 18:14:56', 1),
(4, 'test', 'Reawphai', 'you-noob@hotmail.co.th', '0846715445', '2015-11-11 18:16:55', 1),
(5, '', '', '', '', '2015-11-11 18:16:57', 1),
(6, 'It''s mean a long day ...', 'Reawphai', 'you-noob@hotmail.co.th', '0846715445', '2015-11-16 14:36:16', 1),
(7, 'asdasd', 'asd', 'you-noob@hotmail.co.th', '0846715445', '2015-11-21 00:42:10', 2);

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE IF NOT EXISTS `history` (
  `history_id` int(6) NOT NULL,
  `movie_id` int(6) NOT NULL,
  `user_id` int(6) NOT NULL,
  `dateview` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`history_id`, `movie_id`, `user_id`, `dateview`) VALUES
(39, 90, 0, '2015-11-23 07:44:27'),
(42, 94, 1, '2015-11-23 07:45:06'),
(43, 88, 1, '2015-11-23 07:45:21'),
(44, 89, 1, '2015-11-23 07:45:34'),
(47, 90, 2, '2015-11-23 08:02:12'),
(48, 94, 2, '2015-11-23 08:02:14'),
(49, 89, 2, '2015-11-23 08:02:18');

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE IF NOT EXISTS `language` (
  `language_id` int(6) NOT NULL,
  `language` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`language_id`, `language`) VALUES
(1, 'Thai'),
(2, 'English');

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

CREATE TABLE IF NOT EXISTS `movie` (
  `movie_id` int(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `poster` varchar(100) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `regdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `releasedyear` date NOT NULL,
  `totaltime` varchar(10) NOT NULL,
  `totalrating` int(1) NOT NULL DEFAULT '0',
  `trailer` varchar(50) DEFAULT NULL,
  `category_id` int(6) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`movie_id`, `name`, `poster`, `price`, `description`, `regdate`, `releasedyear`, `totaltime`, `totalrating`, `trailer`, `category_id`) VALUES
(1, 'narmunga', '', '9.00', '', '2015-07-01 22:14:03', '2011-12-15', '', 0, '', 1),
(2, 'The Condemned 2: Desert Prey', 'http://image.tmdb.org/t/p/w342/2iaerqaKRw1xAUzqIJRF96hZw2u.jpg', '378.00', 'A former bounty hunter who finds himself on the run as part of a revamped Condemned tournament, in which convicts are forced to fight each other to the death as part of a game that''s broadcast to the public.', '2015-07-02 22:25:35', '2015-11-06', '90', 0, '', 1),
(3, 'Agoraphobia', 'http://image.tmdb.org/t/p/w342/mZrhekqOHlCdzR6Lf7dFnKbK5Il.jpg', '420.00', 'An agoraphobic inherits her father''s house in a remote part of the Florida Keys. When weird things start happening, she discovers that there''s something far more terrifying trapped inside the house with her.', '2015-07-03 22:25:35', '2015-10-01', '86', 0, '', 7),
(4, 'Bleeding Heart', 'http://image.tmdb.org/t/p/w342/rksEpeJWp13xpOrhfQiqw0iQwiS.jpg', '247.00', 'Reserved yoga instructor May''s peaceful, clean-living life is thrown out of balance by the arrival of her long-lost sister Shiva, a street-smart yet naive young woman trapped in an abusive relationship. May feels compelled to rescue the hapless Shiva, but she finds herself increasingly drawn out of her sedate world and deeper into Shiva''s chaotic one.', '2015-07-04 22:25:35', '2015-04-16', '80', 0, '', 10),
(5, 'The Hallow', 'http://image.tmdb.org/t/p/w342/A7A0Leo4OrAIQubsMCic0dNiwOe.jpg', '248.00', 'A family who moved into a remote mill house in Ireland finds themselves in a fight for survival with demonic creatures living in the woods.', '2015-07-05 22:25:35', '2015-11-13', '97', 0, '', 4),
(6, 'Uncanny', 'http://image.tmdb.org/t/p/w342/w7LvXCUAuNNT1PjeUqukouArKvE.jpg', '356.00', 'For ten years, inventor David Kressen has lived in seclusion with his inventions, including Adam, a robot with incredible lifelike human qualities. When reporter Joy Andrews is given access to their unconventional facility, she is alternately repelled and attracted to the scientist and his creation. But as Adam exhibits emergent behavior of anger and jealousy towards her, she finds herself increasingly entangled in a web of deception where no one?s motives are easily decipherable.', '2015-07-06 22:25:35', '2015-01-31', '91', 0, '', 7),
(7, 'I Smile Back', 'http://image.tmdb.org/t/p/w342/9Xxg4wXZHV0EUWdmc0aybyOu2Av.jpg', '154.00', 'Laney is an attractive, intelligent suburban wife and devoted mother of two adorable children. She has the perfect husband who plays basketball with the kids in the driveway, a pristine house, and a shiny SUV for carting the children to their next activity. However, just beneath the fa?ade lie depression and disillusionment that send her careening into a secret world of reckless compulsion. Only very real danger will force her to face the painful root of her destructiveness and its crumbling effect on those she loves.', '2015-07-07 22:25:35', '2015-10-23', '85', 0, '', 10),
(8, 'Ant-Man', 'http://image.tmdb.org/t/p/w342/7SGGUiTE6oc2fh9MjIk5M00dsQd.jpg', '419.00', 'Armed with the astonishing ability to shrink in scale but increase in strength, con-man Scott Lang must embrace his inner-hero and help his mentor, Dr. Hank Pym, protect the secret behind his spectacular Ant-Man suit from a new generation of towering threats. Against seemingly insurmountable obstacles, Pym and Lang must plan and pull off a heist that will save the world.', '2015-07-08 22:25:35', '2015-07-17', '115', 2, '', 1),
(9, 'Tangerine', 'http://image.tmdb.org/t/p/w342/o9GrAk4Oc4q5x7ofGjIyf7NWiFo.jpg', '163.00', 'A working girl tears through Tinseltown on Christmas Eve searching for the pimp who broke her heart.', '2015-07-09 22:25:35', '2015-07-10', '88', 0, '', 10),
(10, '400 Days', 'http://image.tmdb.org/t/p/w342/nRq4Go8AITgb2efT0B3EKyIlege.jpg', '186.00', '4 would be astronauts spend 400 days in a land locked space simulator to test the psychological effects of deep space travel but, when something goes terribly wrong and they are forced to leave the simulation, they discover that everything on earth has changed. Is this real or is the simulation on a higher level than they could have ever imagined?', '2015-07-10 22:25:35', '2015-11-12', '90', 0, '', 7),
(11, 'Demonic', 'http://image.tmdb.org/t/p/w342/9pzzhnrLuPJXX2JpqSTZHrrbIhd.jpg', '193.00', 'A police officer and a psychologist investigate the deaths of five people who were killed while trying to summon ghosts.', '2015-07-11 22:25:35', '2015-03-28', '83', 0, '', 7),
(12, '', '', '99.00', '', '2015-07-12 22:25:35', '2014-05-30', '', 0, '', 12),
(13, 'Bare', 'http://image.tmdb.org/t/p/w342/zF5B84Jjdc9WiCfNkdKCz7CtS6z.jpg', '438.00', 'A young woman''s friendship with a drug-dealing drifter evolves into a lesbian romance.', '2015-07-13 22:25:35', '2015-10-30', '91', 0, '', 10),
(14, 'No Escape', 'http://image.tmdb.org/t/p/w342/kvUytllaK3CRQJ52JzXvxvcWsA1.jpg', '146.00', 'In their new overseas home, an American family soon finds themselves caught in the middle of a coup, and they frantically look for a safe escape in an environment where foreigners are being immediately executed.', '2015-07-14 22:25:35', '2015-08-26', '103', 0, '', 1),
(15, 'Nasty Baby', 'http://image.tmdb.org/t/p/w342/h2heXcglf43w0oLaJYorJvfsiVU.jpg', '476.00', 'A gay couple try to have a baby with the help of their best friend, Polly. The trio navigates the idea of creating life while confronted by unexpected harassment from a neighborhood man called The Bishop. As their clashes grow increasingly aggressive, odds are someone is getting hurt.', '2015-07-15 22:25:35', '2015-10-23', '100', 0, '', 10),
(16, 'Tu dors Nicole', 'http://image.tmdb.org/t/p/w342/3TPOQUNP0aBAvY4gm9D3N3uB7sS.jpg', '500.00', 'Making the most of the family home while her parents are away, 22-year-old Nicole is enjoying a peaceful summer with her best friend V?ronique. But when Nicole?s older brother shows up with his band to record an album, the girls? friendship is put to the test.', '2015-07-16 22:25:35', '2014-08-22', '93', 0, '', 3),
(17, 'Cowboys vs. Dinosaurs', 'http://image.tmdb.org/t/p/w342/s0bFAVkEgRxM3hxUPqnc916W1FF.jpg', '344.00', 'After an accidental explosion at a local mine, dinosaurs emerge from the rubble to terrorize a small western town. Now, a group of gunslingers must defend their home if anyone is going to survive in a battle of cowboys versus dinosaurs.', '2015-07-17 22:25:35', '2015-05-19', '90', 0, '', 1),
(18, 'We Are Your Friends', 'http://image.tmdb.org/t/p/w342/bBsSccKKpEUFrf6yK2D23uHZT7F.jpg', '418.00', 'Cole, a 23-year-old DJ who struggles in the Hollywood''s electronic dance music scene, has dreams of becoming a major record producer. Eventually, older DJ James, begins to mentor him, but Cole makes a connection with James'' girlfriend, Sophie. When Cole''s relationship with Sophie blossoms and his friendship with James begins to break down as a result, he is forced into difficult decisions over his future.', '2015-07-18 22:25:35', '2015-08-28', '96', 0, '', 10),
(19, 'The Man from U.N.C.L.E.', 'http://image.tmdb.org/t/p/w342/xvLa7lXdmqj4XTu82dlUxOlvcXk.jpg', '361.00', 'In the early 1960s, CIA agent Napoleon Solo and KGB operative Illya Kuryakin participate in a joint mission against a mysterious criminal organization, which is working to proliferate nuclear weapons.', '2015-07-19 22:25:35', '2015-08-14', '116', 0, '', 3),
(20, 'Now Add Honey (480p)', 'http://image.tmdb.org/t/p/w342/7TEoUD8eM54behZyU731CKu9ox4.jpg', '392.00', 'When a pop-star cousin comes to stay, a family''s once normal life changes drastically.', '2015-07-20 22:25:35', '2014-01-01', '100', 0, '', 3),
(21, 'Extraordinary Tales (480p)', 'http://image.tmdb.org/t/p/w342/kLryCPpLr0hK9F2nAXRXSNSYTR2.jpg', '107.00', 'An animated anthology of 5 stories adapted from Edgar Allan Poe.', '2015-07-21 22:25:35', '2015-10-23', '70', 0, '', 4),
(22, 'Death Clique (TV Movie)', 'http://image.tmdb.org/t/p/w342/A1A8UuxvMmfZsOyZ3A6VrYgiqrl.jpg', '421.00', 'Inspired by true events, a friendship rivalry between three high school girls escalates into a shocking act of violence, and soon one of them is dead. Now the dead girl''s mom is determined to find her missing child... and get justice for her daughter.', '2015-07-22 22:25:35', '2014-04-12', '83', 0, '', 7),
(23, 'My Little Pony: Equestria Girls - Friendship Games', 'http://image.tmdb.org/t/p/w342/cVpZRoxsuaJDPXsRv4H5LoD8c26.jpg', '274.00', 'Canterlot High meets its rival school, Crystal Prep Academy, in a competition that?s a long-standing tradition ? The Friendship Games. Sunset Shimmer is tasked with keeping magic out of the games to avoid the appearance of impropriety while she and her friends compete against Crystal Prep?s top students led by someone with an equal amount of interest in Equestrian magic ? this world?s TWILIGHT SPARKLE.', '2015-07-23 22:25:35', '2015-09-26', '72', 0, '', 2),
(24, 'Ricki and the Flash', 'http://image.tmdb.org/t/p/w342/fuQyBMYVkaQh1AWTz7wZhnC8JIw.jpg', '213.00', 'A rock n'' roll loving woman who chased her dream is getting a chance to make things right.', '2015-07-24 22:25:35', '2015-08-07', '101', 0, '', 3),
(25, 'Fantastic Four', 'http://image.tmdb.org/t/p/w342/g23cs30dCMiG4ldaoVNP1ucjs6.jpg', '283.00', 'Four young outsiders teleport to a dangerous universe, which alters their physical form in shocking ways. Their lives irrevocably upended, the team must learn to harness their daunting new abilities and work together to save Earth from a former friend turned enemy.', '2015-11-12 00:32:07', '2015-08-07', '100', 0, '', 1),
(26, 'Old 37', 'http://image.tmdb.org/t/p/w342/gKO1tulv0zyud9COQoAYMzBVfF6.jpg', '444.00', 'Two brothers intercept 911 calls in their Father''s beat up old Ambulance to exact revenge on a group of careless teen drivers.', '2015-07-26 22:25:35', '2015-03-21', '85', 0, '', 10),
(27, 'Hitman: Agent 47', 'http://image.tmdb.org/t/p/w342/4VmZeT8YkuMI6BrA623mHZDISlN.jpg', '280.00', 'An assassin teams up with a woman to help her find her father and uncover the mysteries of her ancestry. Centers on an elite assassin known only by the last two digits on the barcode tattooed on the back of his neck.', '2015-07-27 22:25:35', '2015-08-21', '96', 0, '', 1),
(28, 'Youth', 'http://image.tmdb.org/t/p/w342/dlza4KhN9mXjlbLbgeJCtHfRAsB.jpg', '472.00', 'Fred and Mick, two old friends, are on vacation in an elegant hotel at the foot of the Alps. Fred, a composer and conductor, is now retired. Mick, a film director, is still working. They look with curiosity and tenderness on their children''s confused lives, Mick''s enthusiastic young writers, and the other hotel guests. While Mick scrambles to finish the screenplay for what he imagines will be his last important film, Fred has no intention of resuming his musical career. But someone wants at all costs to hear him conduct again.', '2015-07-28 22:25:35', '2015-05-21', '118', 0, '', 10),
(29, 'Unnatural (480p)', 'http://image.tmdb.org/t/p/w342/s2LestYqHcOo0OjXJMMWLsRBizg.jpg', '283.00', 'Global climate change prompts a scientific corporation to genetically modify Alaskan polar bears with horrific and deadly results.', '2015-07-29 22:25:35', '2015-10-16', '89', 0, '', 7),
(30, 'Asthma', 'http://image.tmdb.org/t/p/w342/xYFF4e38yFgKvRCZoEBlw1DhIM1.jpg', '364.00', 'Suffocating as a symptom of disease and as an all-pervasive feeling. Life for Gus is a task difficult to accomplish. The drug-addicted outsider suffers a very bad trip in his efforts to escape from himself. Jake Hoffman''s feature debut is an authentic look at today''s New York indie generation of artists, whose adherents live by the slogan "live fast and die young."', '2015-07-30 22:25:35', '2014-07-08', '90', 0, '', 5),
(31, 'Bone Tomahawk', 'http://image.tmdb.org/t/p/w342/3DDUneU8wCF3Y8SPUnZTXHoFzJh.jpg', '228.00', 'Four men set out in the Wild West to rescue a group of captives from cannibalistic cave dwellers.', '2015-07-31 22:25:35', '2015-10-23', '132', 0, '', 4),
(32, 'Meadowland', 'http://image.tmdb.org/t/p/w342/nzHRGXAxS9cBai3K186v5fcQNSx.jpg', '112.00', 'After their son disappears, Sarah and Phil search for meaning, trashing around in a wayward haze. Phil starts to lose sight of his morals. Sarah takes off on a potentially disastrous journey, falling deeper into her own fever dream.', '2015-08-01 22:25:35', '2015-10-16', '105', 0, '', 10),
(33, 'Lumberjack Man', 'http://image.tmdb.org/t/p/w342/tT2p3wMT6dXMWJx1xz0hrheBx2U.jpg', '183.00', 'As the staff of Good Friends Church Camp prepares for a spring break filled with "Fun Under the Son", a demon logger rises from his sap boiler to wreak his vengeance and feast on flapjacks soaked in the blood of his victims.', '2015-08-02 22:25:35', '2015-10-16', '105', 0, '', 4),
(34, 'Night of the Living Dead: Darkest Dawn (480p)', 'http://image.tmdb.org/t/p/w342/qI5CfdUs4vqyPefWXT4cGRPN1TD.jpg', '290.00', 'A group of survivors trapped in a New York apartment fight to stay alive against legions of zombies.', '2015-08-03 22:25:35', '2015-10-05', '0', 0, '', 10),
(35, 'Visions', 'http://image.tmdb.org/t/p/w342/dLoXR8D5IZpPS4bq6UdlYVWipeQ.jpg', '331.00', 'After moving to her vineyard to be with her husband, a pregnant woman begins to experience terrifying visions.', '2015-08-04 22:25:35', '2015-08-28', '80', 0, '', 7),
(36, 'The End of the Tour', 'http://image.tmdb.org/t/p/w342/lmCpurBMIPZvhpUdE4zQgOh65xx.jpg', '447.00', 'The story of the five-day interview between Rolling Stone reporter David Lipsky and acclaimed novelist David Foster Wallace, which took place right after the 1996 publication of Wallace''s groundbreaking epic novel, ''Infinite Jest.''', '2015-08-05 22:25:35', '2015-07-31', '106', 0, '', 10),
(37, 'Howl', 'http://image.tmdb.org/t/p/w342/irGEiVivfBSD0lUSNoQxqxdfAti.jpg', '146.00', 'When passengers on a train are attacked by a creature, they must band together in order to survive until morning.', '2015-08-06 22:25:35', '2015-10-01', '0', 0, '', 4),
(38, 'Cloud 9 (TV Movie)', 'http://image.tmdb.org/t/p/w342/A43Czuw4cGwL2XuJw6oZbSK0ErT.jpg', '483.00', 'Set high atop snow-capped mountains in the adrenaline-fueled world of competitive snowboarding, the Disney Channel Original Movie ?Cloud 9? tells the inspiring story of two snowboarders who must overcome self-doubt to learn that achieving their dreams is possible.', '2015-08-07 22:25:35', '2014-01-17', '90', 0, '', 1),
(39, 'Back In Time', 'http://image.tmdb.org/t/p/w342/7fBO8L9AotyjrhKH5idYBbzAYm1.jpg', '289.00', 'Cast, crew, and fans explore the classic Back to the Future time-travel trilogy''s resonance throughout our culture 30 years after Marty went back in time.', '2015-08-08 22:25:35', '2015-10-20', '95', 0, '', 11),
(40, 'Re-Kill', 'http://image.tmdb.org/t/p/w342/y4FN6LVPzUbNRQIxOhPe9oCCKFW.jpg', '120.00', 'Five years after a zombie outbreak, the men and women of R-Division hunt down and destroy the undead. When they see signs of a second outbreak, they fear humanity may not survive.', '2015-08-09 22:25:35', '2015-10-16', '87', 0, '', 9),
(41, 'Tales of Halloween', 'http://image.tmdb.org/t/p/w342/hISRq3TJdALQj1RGCS6bQxbTnAf.jpg', '459.00', 'Ten stories are woven together by their shared theme of Halloween night in an American suburb, where ghouls, imps, aliens and axe murderers appear for one night only to terrorize unsuspecting residents.', '2015-08-10 22:25:35', '2015-10-30', '92', 0, '', 4),
(42, 'Earthrise', 'http://image.tmdb.org/t/p/w342/oZdD5gNjGamg8tMuZnI4kFQLWCH.jpg', '189.00', '99% of the human race has colonized on Mars. The remaining few work to rehabilitate our dying planet. Each year a small number are selected to return home to aid in the process. For those few, it will be their first glimpse of Earth. We follow them on their journey in this sci-fi psychological thriller. Go home. For the first time.', '2015-08-11 22:25:35', '2015-10-09', '90', 0, '', 7),
(43, 'The Diabolical', 'http://image.tmdb.org/t/p/w342/4aYyhgbGrawSlQNAghflAUf43cr.jpg', '152.00', 'Madison, a single mother who with her children is awoken nightly by an increasingly strange and intense presence. She seeks help from her scientist boyfriend Nikolai, who begins a hunt to destroy the violent spirit that paranormal experts are too frightened to take on.', '2015-08-12 22:25:35', '2015-03-16', '0', 0, '', 7),
(44, 'Momentum', 'http://image.tmdb.org/t/p/w342/zFo4fir7PrS0oGiiwOQeOIUyRN.jpg', '258.00', 'Alex, a mysterious thief, is pulled in by her former partner for one last heist. She quickly finds it was never just about the diamonds. A brutal murder sparks a cat and mouse chase between Alex and a master assassin. Now she must uncover the lies behind the heist and discover the secrets behind the men who have made her a target.', '2015-08-13 22:25:35', '2015-08-01', '95', 0, '', 7),
(45, 'Circle', 'http://image.tmdb.org/t/p/w342/b90K9KbdrcIRbVhSG1V638lwDbJ.jpg', '164.00', 'Held captive and faced with their imminent executions, fifty strangers are forced to choose the one person among them who deserves to live.', '2015-08-14 22:25:35', '2015-10-02', '87', 0, '', 10),
(46, 'The Green Inferno', 'http://image.tmdb.org/t/p/w342/prG32jWEgiZ2N8BpBPu1G0jMiv2.jpg', '148.00', 'Student activists from New York City travel to the remote jungles of Peru in order to stage a protest but instead encounter a tribe of cannibals.', '2015-08-15 22:25:35', '2013-11-02', '100', 0, '', 4),
(47, 'Beasts of No Nation', 'http://image.tmdb.org/t/p/w342/mhqavU5fQGQyiNyqFWFR0I0r2e4.jpg', '391.00', 'A drama based on the experiences of Agu, a child soldier fighting in the civil war of an unnamed African country.', '2015-08-16 22:25:35', '2015-10-16', '137', 0, '', 8),
(48, 'Vacation', 'http://image.tmdb.org/t/p/w342/q9kL9WW0Uu4AcfTi5iCLcYzBgnm.jpg', '386.00', 'Hoping to bring his family closer together and to recreate his childhood vacation for his own kids, a grown up Rusty Griswold takes his wife and their two sons on a cross-country road trip to the coolest theme park in America, Walley World. Needless to say, things don''t go quite as planned.', '2015-08-17 22:25:35', '2015-07-29', '99', 0, '', 12),
(49, 'Mr. Holmes', 'http://image.tmdb.org/t/p/w342/e6r9pJDfv4UXwfLKqcYVonFZIMH.jpg', '457.00', 'The story is set in 1947, following a long-retired Holmes living in a Sussex village with his housekeeper and rising detective son. But then he finds himself haunted by an unsolved 50-year old case. Holmes'' memory isn''t what it used to be, so he only remembers fragments of the case: a confrontation with an angry husband, a secret bond with his beautiful but unstable wife.', '2015-08-18 22:25:35', '2015-07-17', '103', 0, '', 10),
(50, 'Monster Hunt', 'http://image.tmdb.org/t/p/w342/b9r3fK9znL9L0KAptkq4JWRmkqa.jpg', '161.00', 'Young monster kids try to make peace between the world of humans and the world of the monsters.', '2015-08-19 22:25:35', '2015-07-16', '111', 0, '', 1),
(51, 'Zero Tolerance', 'http://image.tmdb.org/t/p/w342/s2hPDpLM7C3r9RVYIrbAgLqZDy3.jpg', '473.00', 'Two former para-military operatives, Johnny and his police detective friend Peter, search Bangkok to find the killers of Johnny''s beautiful daughter Angel - Leaving carnage and retribution throughout city.', '2015-08-20 22:25:35', '2015-09-01', '0', 0, '', 7),
(52, 'London Road', 'http://image.tmdb.org/t/p/w342/tq0AsGUTcpw43qdGMvsQSUC5Krm.jpg', '205.00', 'London Road documents the events of 2006, when the quiet rural town of Ipswich was shattered by the discovery of the bodies of five women. The residents of London Road had struggled for years with frequent soliciting and kerb-crawling on their street. When a local resident was charged and then convicted of the murders, the community grappled with what it meant to be at the epicentre of this tragedy.', '2015-08-21 22:25:35', '2015-06-12', '91', 0, '', 7),
(53, 'Manson Family Vacation', 'http://image.tmdb.org/t/p/w342/vSeule8U5fx0GtU1EicdvnQoVFq.jpg', '463.00', 'The story of two brothers: one who?s devoted to his family, the other who?s obsessed with the Manson Family.', '2015-08-22 22:25:35', '2015-03-16', '85', 0, '', 7),
(54, 'Yakuza Apocalypse', 'http://image.tmdb.org/t/p/w342/Aa8gYxU8j4zFUZfZmot83sTyBG.jpg', '316.00', 'Akira (Hayato Ichihara) admires Genyo Kamiura who is the most powerful yakuza. Genyo Kamiura has been targeted numerous times, but has never died. He is called the invincible person. Because of Genyo Kamiura, Akira enters the world of the yakuza. His yakuza colleagues treats him like an idiot, Akira can''t even get tattoos because of his sensitive skin. Akira becomes disappointed in the yakuza world, because it''s not like what he say in the movies. Especially, in terms of loyalty and charity depicted of the yakuza. An assassin is then sent to take out Genyo Kamiura. The killers know that Genyo Kamiura is a vampire.', '2015-08-23 22:25:35', '2015-05-21', '115', 0, '', 4),
(55, 'Knock Knock', 'http://image.tmdb.org/t/p/w342/843NrqareaUeDuy4EMlXtqCGA4r.jpg', '254.00', 'Two young women show up at the home of a married man and begin to systematically destroy his idyllic life.', '2015-08-24 22:25:35', '2015-10-09', '96', 0, '', 4),
(56, 'The Final Girls', 'http://image.tmdb.org/t/p/w342/hUZmkj8jUAyhuAux2ihSJDHrwgD.jpg', '126.00', 'A young woman grieving the loss of her mother, a famous scream queen from the 1980s, finds herself pulled into the world of her mom''s most famous movie. Reunited, the women must fight off the film''s maniacal killer.', '2015-08-25 22:25:35', '2015-10-09', '88', 0, '', 4),
(57, 'Max', 'http://image.tmdb.org/t/p/w342/2ZCJkLN1njuSJvkUwoZZwI5DulN.jpg', '388.00', 'A dog that helped soldiers in Afghanistan returns to the U.S. and is adopted by his handler''s family after suffering a traumatic experience.', '2015-08-26 22:25:35', '2015-06-26', '111', 0, '', 10),
(58, 'Deathgasm', 'http://image.tmdb.org/t/p/w342/oS8MVUPaTPv9ScTxIqJM5T7fqNv.jpg', '165.00', 'Two teenage boys unwittingly summon an ancient evil entity known as The Blind One by delving into black magic while trying to escape their mundane lives.', '2015-08-27 22:25:35', '2015-08-28', '86', 0, '', 3),
(59, 'Boiling Pot', 'http://image.tmdb.org/t/p/w342/tOH7OHo3t9oSoKi4kzFYerpET3u.jpg', '175.00', 'On a college campus in modern America, ideas that have long been neglected as "issues of the past" emerge as racial tensions and frictions grow between different student groups.', '2015-08-28 22:25:35', '2015-09-29', '95', 0, '', 11),
(60, 'Partisan', 'http://image.tmdb.org/t/p/w342/bNnM7n3cjwmG6HJisQhiaH7eRy4.jpg', '487.00', 'Alexander is like any other kid: playful, curious and naive. He is also a trained assassin. Raised in a hidden paradise on the outskirts of town, Alexander has grown up seeing the world through the eyes of his father, Gregori. As Alexander begins to think for himself, creeping fears take shape and Gregori?s idyllic world unravels.', '2015-08-29 22:25:35', '2015-01-25', '98', 0, '', 7),
(61, 'A Christmas Horror Story', 'http://image.tmdb.org/t/p/w342/6v4YrgsiYiSEse3cS3j1NPAN48q.jpg', '352.00', 'Christmas is supposed to be a time of joy, peace and goodwill. But for some folks in the small town of Bailey Downs, it turns into something much less festive.', '2015-08-30 22:25:35', '2015-10-02', '99', 0, '', 4),
(62, 'Shark Lake', 'http://image.tmdb.org/t/p/w342/gfm2LgfBjUXB7tcPSEsbwdxUFP0.jpg', '239.00', 'Meredith Hendricks happens to be the best cop in her quiet town on Lake Tahoe. When a black-market exotic species dealer named Clint is paroled from prison, something he let loose begins to make its presence known. Swimmers and land-lovers alike begin to become part of the food chain at an unbelievable rate. Meredith and her team discover that they''re not just hunting one eating machine, but a whole family of them. Not everyone will make it out alive, but those who do will never forget this summer at Shark Lake.', '2015-08-31 22:25:35', '2015-10-02', '92', 0, '', 7),
(63, 'Cartel Land', 'http://image.tmdb.org/t/p/w342/UfHKDDb0ltJB7HseSfgnj6q4U5.jpg', '446.00', 'In the Mexican state of Michoac?n, Dr. Jose Mireles, a small-town physician known as "El Doctor," shepherds a citizen uprising against the Knights Templar, the violent drug cartel that has wreaked havoc on the region for years. Meanwhile, in Arizona''s Altar Valley?a narrow, 52-mile-long desert corridor known as Cocaine Alley?Tim "Nailer" Foley, an American veteran, heads a small paramilitary group called Arizona Border Recon, whose goal is to halt Mexico?s drug wars from seeping across our border.', '2015-09-01 22:25:35', '2015-07-03', '98', 0, '', 10),
(64, 'Into the Grizzly Maze', 'http://image.tmdb.org/t/p/w342/ihsIRnibd8z1glCwdY82OlUI6hR.jpg', '135.00', 'Two estranged brothers reunite at their childhood home in the Alaskan wild. They set out on a two-day hike and are stalked by an unrelenting grizzly bear.', '2015-09-02 22:25:35', '2015-02-27', '94', 0, '', 7),
(65, 'Mississippi Grind', 'http://image.tmdb.org/t/p/w342/6b95JivLvHSWt5DAnEEoPR7MWjJ.jpg', '413.00', 'Gerry is a talented poker player whose habit is getting the best of him. He convinces younger player Curtis to join him on a road trip, and they begin gambling their way towards a high-stakes game in New Orleans. During their journey, true motivations are revealed, and the two bond.', '2015-09-03 22:25:35', '2015-08-13', '108', 0, '', 10),
(66, 'The Hive', 'http://image.tmdb.org/t/p/w342/kjdhDYi4PjkU6IgEzGgYnWnJNh4.jpg', '386.00', 'A young man suffering from amnesia must dig deep into the far reaches of his mind to remember who he is and save the love of his life before a virus that has infected him takes over.', '2015-09-04 22:25:35', '2015-09-14', '89', 0, '', 9),
(67, 'Dope', 'http://image.tmdb.org/t/p/w342/m53mVR0q0iCh0rKotfzmIm7h7iA.jpg', '309.00', 'Malcolm is carefully surviving life in a tough neighborhood in Los Angeles while juggling college applications, academic interviews, and the SAT. A chance invitation to an underground party leads him into an adventure that could allow him to go from being a geek, to being dope, to ultimately being himself.', '2015-09-05 22:25:35', '2015-06-19', '103', 0, '', 10),
(68, 'Inside Out', 'http://image.tmdb.org/t/p/w342/aTnNTNm4jvndbTHNVXTnPeKAY3h.jpg', '432.00', 'Growing up can be a bumpy road, and it''s no exception for Riley, who is uprooted from her Midwest life when her father starts a new job in San Francisco. Like all of us, Riley is guided by her emotions - Joy, Fear, Anger, Disgust and Sadness. The emotions live in Headquarters, the control center inside Riley''s mind, where they help advise her through everyday life. As Riley and her emotions struggle to adjust to a new life in San Francisco, turmoil ensues in Headquarters. Although Joy, Riley''s main and most important emotion, tries to keep things positive, the emotions conflict on how best to navigate a new city, house and school.', '2015-09-06 22:25:35', '2015-06-19', '94', 0, '', 3),
(69, 'Wildlike', 'http://image.tmdb.org/t/p/w342/4nejhU7Ia2ac8AzAkM3mRS713i6.jpg', '287.00', 'Fourteen-year-old Mackenzie is sent to live with her uncle in Juneau when her mother can?t care for her anymore. The living situation quickly takes a turn for the worse, and she runs away to rejoin her mother in Seattle. While on her dangerous journey of sleeping in cars and breaking into hotel rooms, she?s drawn to Rene, a lonesome backpacker looking for tranquility in the wilderness.', '2015-09-07 22:25:35', '2015-09-25', '104', 0, '', 7),
(70, 'Paper Towns', 'http://image.tmdb.org/t/p/w342/8mGXARxsywXqrKocXiQaGaFgnu5.jpg', '291.00', 'Quentin Jacobsen has spent a lifetime loving the magnificently adventurous Margo Roth Spiegelman from afar. So when she cracks open a window and climbs back into his life-dressed like a ninja and summoning him for an ingenious campaign of revenge-he follows. After their all-nighter ends and a new day breaks, Q arrives at school to discover that Margo, always an enigma, has now become a mystery. But Q soon learns that there are clues-and they''re for him. Urged down a disconnected path, the closer he gets, the less Q sees of the girl he thought he knew.', '2015-09-08 22:25:35', '2015-07-24', '109', 0, '', 5),
(71, 'Ashby', 'http://image.tmdb.org/t/p/w342/o4gaHLrCIC2rHNxdsfYX427ZVYI.jpg', '133.00', 'High-school student Ed Wallis enters into a friendship with his neighbor, Ashby, a retired CIA assassin who only has a few months left to live.', '2015-09-09 22:25:35', '2015-09-25', '100', 0, '', 5),
(72, 'Terminator Genisys', 'http://image.tmdb.org/t/p/w342/5JU9ytZJyR3zmClGmVm9q4Geqbd.jpg', '185.00', 'The year is 2029. John Connor, leader of the resistance continues the war against the machines. At the Los Angeles offensive, John''s fears of the unknown future begin to emerge when TECOM spies reveal a new plot by SkyNet that will attack him from both fronts; past and future, and will ultimately change warfare forever.', '2015-09-10 22:25:35', '2015-07-01', '125', 0, '', 9),
(73, 'Mission: Impossible ? Rogue Nation', 'http://image.tmdb.org/t/p/w342/z2sJd1OvAGZLxgjBdSnQoLCfn3M.jpg', '287.00', 'Ethan and team take on their most impossible mission yet, eradicating the Syndicate - an International rogue organization as highly skilled as they are, committed to destroying the IMF.', '2015-09-11 22:25:35', '2015-07-31', '131', 0, '', 1),
(74, 'Ted 2', 'http://image.tmdb.org/t/p/w342/A7HtCxFe7Ms8H7e7o2zawppbuDT.jpg', '324.00', 'Newlywed couple Ted and Tami-Lynn want to have a baby, but in order to qualify to be a parent, Ted will have to prove he''s a person in a court of law.', '2015-09-12 22:25:35', '2015-06-26', '115', 0, '', 3),
(75, 'Pixels', 'http://image.tmdb.org/t/p/w342/zAsKw3uNuvzhGUVAdVqjgNR5QEb.jpg', '218.00', 'When aliens misinterpret video feeds of classic arcade games as a declaration of war, they attack the Earth in the form of the video games.', '2015-09-13 22:25:35', '2015-07-24', '105', 0, '', 1),
(76, 'Summer Forever', 'http://image.tmdb.org/t/p/w342/7mRwFo4xTrcicHNEGsRL4oVEYlA.jpg', '426.00', 'Three best friends make the most of their last summer weekend together before going their separate ways to college.', '2015-09-14 22:25:35', '2015-09-04', '95', 0, '', 3),
(77, 'Man Up', 'http://image.tmdb.org/t/p/w342/y7C1EQ9zxJ3mlaQeRztw3NVw41P.jpg', '417.00', 'A 34 year old single woman, Nancy, hung-over again, exhausted by the endless fruitless set ups by her friends, traveling across London to toast another 10 years of her parent''s successful happy magical marriage runs in with a 40 year old divorcee, Jack, who mistakes her for his 24 year old blind date. Nancy, deciding to go with it, happens to hop on the most chaotic yet hilarious journey of her life which neither of them will ever forget.', '2015-09-15 22:25:35', '2015-05-29', '88', 0, '', 5),
(78, 'Pay the Ghost', 'http://image.tmdb.org/t/p/w342/fWV9DcIjEQJATfr2AQvKnbpAgeM.jpg', '270.00', 'One year after his young son disappeared during a Halloween carnival, Mike Cole is haunted by eerie images and terrifying messages he can?t explain. Together with his estranged wife, he will stop at nothing to unravel the mystery and find their son?and, in doing so, he unearths a legend that refuses to remain buried in the past.', '2015-09-16 22:25:35', '2015-09-16', '94', 0, '', 4),
(79, 'Hellions', 'http://image.tmdb.org/t/p/w342/3Ad6DBymaIKZ8ojmSId7OLFV4l.jpg', '164.00', 'A teen faces a night of terror when three malevolent trick-or-treaters come knocking at her door.', '2015-09-17 22:25:35', '2015-09-16', '80', 0, '', 4),
(80, 'Last Shift', 'http://image.tmdb.org/t/p/w342/9oInKOdvqBH4IZB7eMZjK4WcgPV.jpg', '191.00', 'A rookie cop''s world is turned upside down when she comes face to face with Paymon - King Of Hell. Officer Jessica Loren has the last shift at a transitioning police station, assigned to wait for a crew picking up bio-hazard waste from the armoury. But unbeknownst to her, cult leader John Michael Paymon has haunted the department ever since he committed suicide in custody. Jessica is about to find out just how dangerous he still is, all alone on the graveyard shift.............', '2015-09-18 22:25:35', '2014-10-26', '90', 0, '', 7),
(81, 'Me and Earl and the Dying Girl', 'http://image.tmdb.org/t/p/w342/4Zrvc5rddDSHD3JmfkzvAx82wuT.jpg', '106.00', 'Greg is coasting through senior year of high school as anonymously as possible, avoiding social interactions like the plague while secretly making spirited, bizarre films with Earl, his only friend. But both his anonymity and friendship threaten to unravel when his mother forces him to befriend a classmate with leukemia.', '2015-09-19 22:25:35', '2015-06-12', '104', 0, '', 3),
(82, 'Cooties', 'http://image.tmdb.org/t/p/w342/8K7dLGy0SguonTIcAObx2YgExKf.jpg', '278.00', 'A mysterious virus hits an isolated elementary school, transforming the kids into a feral swarm of mass savages. An unlikely hero must lead a motley band of teachers in the fight of their lives.', '2015-11-11 19:04:04', '2014-10-10', '88', 0, 'https://www.youtube.com/embed/UvD-LZghP3o', 9),
(83, 'Monster High: Boo York, Boo York', 'http://image.tmdb.org/t/p/w342/sTFl7TjLYY8IfsF2Xi28flBKf5B.jpg', '313.00', 'The ghouls are taking a bite out of Boo York! The De Niles are hoping to meet their dynastic destiny and carve out a new empire, while Catty Noir is trying to find her music. Together the ghouls are taking Boo York by storm.', '2015-09-21 22:25:35', '2015-10-19', '72', 0, '', 2),
(84, 'Tomorrowland', 'http://image.tmdb.org/t/p/w342/b0f5Thd0IVYVUcteQAtcnwdta0c.jpg', '349.00', 'Bound by a shared destiny, a bright, optimistic teen bursting with scientific curiosity and a former boy-genius inventor jaded by disillusionment embark on a danger-filled mission to unearth the secrets of an enigmatic place somewhere in time and space that exists in their collective memory as "Tomorrowland."', '2015-09-22 22:25:35', '2015-05-22', '130', 0, '', 1),
(85, 'Ardor', 'http://image.tmdb.org/t/p/w342/2EhWnRunP8dt6F0KyeIQPDykZcV.jpg', '115.00', 'Described by writer-director Pablo Fendrik as a ?Mesopotamian Western,? El Ardor stars Gael Garc?a Bernal as Ka?, a mysterious shaman who emerges from the R?o Paran? to defend a clan of tobacco farmers against a band of cold-blooded land-grabbers. But this is no ordinary Western. Filmed on the edge of the Amazon rainforest, near the border of Brazil and Argentina, the lush, claustrophobic jungle with its birds, insects and prowling animals becomes as much a part of the story as the misfortunes of its characters. With minimal dialogue and yet plenty of drama, including a few good old-fashioned gun battles, El Ardor is absolutely spellbinding.', '2015-09-23 22:25:35', '2014-05-14', '101', 0, '', 10),
(86, 'Arthur & Merlin', 'http://image.tmdb.org/t/p/w342/tn6ruueNinsoQDqPnLDCBoNqkck.jpg', '376.00', 'In dark ages Britain, a time of magic and legend, a powerful druid is bent on destroying the Celtic people. Arthur, a banished warrior, and Merlin, a hermit wizard, embark on a heroic quest to stop the druid and save their people, before the Celts are lost forever and become a myth themselves.', '2015-09-24 22:25:35', '2015-04-17', '103', 0, '', 12),
(87, 'Nightingale', 'http://image.tmdb.org/t/p/w342/9wQMUOCU253RzJ90ruZOFBlLkS3.jpg', '440.00', 'A lonely war veteran psychologically unravels ahead of an old friend''s impending visit.', '2015-09-25 22:25:35', '2015-05-29', '83', 0, '', 10),
(88, 'Insidious: Chapter 3', 'http://image.tmdb.org/t/p/w342/ixANIbPRTNMAstlqJa2FlfBesyQ.jpg', '114.00', 'A twisted new tale of terror begins for a teenage girl and her family, predating the haunting of the Lambert family in the earlier movies and revealing more mysteries of the otherworldly realm The Further.', '2015-09-26 22:25:35', '2015-06-05', '97', 0, '', 10),
(89, 'Brotherly Love (480p)', 'http://image.tmdb.org/t/p/w342/1aVlWQJtIRKaf6lYzNDyjxF5oad.jpg', '460.00', 'West Philadelphia basketball star Sergio Taylor deals with the pressures of fame while his brother and sister have their own issues with ambition.', '2015-11-11 19:08:50', '2015-04-24', '89', 0, 'https://www.youtube.com/embed/mOACSS97KQM', 10),
(90, 'Blood Moon', 'http://image.tmdb.org/t/p/w342/3GvCNrvQlgz4k4HekfzjhGOmkAf.jpg', '186.00', 'A stagecoach full of passengers and an enigmatic gunslinger are held hostage by two outlaws on the run from the law but events take an unexpected turn when the travelers are stalked by a mythical beast that only appears on the night of a blood red moon.', '2015-09-28 22:25:35', '2014-08-25', '90', 0, '', 4),
(94, 'Maleficent', 'https://image.tmdb.org/t/p/w396/4FYu1AAu14tuBU0lns0hbKiHUcH.jpg', '99.00', 'The untold story of Disney''s most iconic villain from the 1959 classic ''Sleeping Beauty''. A beautiful, pure-hearted young woman, Maleficent has an idyllic life growing up in a peaceable forest kingdom, until one day when an invading army threatens the harmony of the land. Maleficent rises to be the land''s fiercest protector, but she ultimately suffers a ruthless betrayal Ã¢ÂÂ an act that begins to turn her heart into stone. Bent on revenge, Maleficent faces an epic battle with the invading King''s successor and, as a result, places a curse upon his newborn infant Aurora. As the child grows, Maleficent realizes that Aurora holds the key to peace in the kingdom - and to Maleficent''s true happiness as well well.', '2015-11-13 16:26:43', '2014-05-30', '97', 0, 'https://www.youtube.com/embed/w-XO4XiRop0', 12);

-- --------------------------------------------------------

--
-- Table structure for table `movie_feature`
--

CREATE TABLE IF NOT EXISTS `movie_feature` (
  `movie_id` int(6) NOT NULL,
  `pic` varchar(200) NOT NULL,
  `datepost` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movie_feature`
--

INSERT INTO `movie_feature` (`movie_id`, `pic`, `datepost`) VALUES
(5, 'https://image.tmdb.org/t/p/w780/fZdJsuQumu0YMyv687bpxrxIVJU.jpg', '2015-11-17 00:35:26'),
(84, 'https://image.tmdb.org/t/p/w780/fQbc5XuB4vWA9gnY1CmyxFaOufF.jpg', '2015-11-12 19:42:03'),
(94, 'https://image.tmdb.org/t/p/w780/gaTdylvA9gQ0jg9DYs0dflMPcXF.jpg', '2015-11-23 02:45:19');

-- --------------------------------------------------------

--
-- Table structure for table `movie_has_language`
--

CREATE TABLE IF NOT EXISTS `movie_has_language` (
  `movie_id` int(6) NOT NULL,
  `language_id` int(6) NOT NULL,
  `path` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movie_has_language`
--

INSERT INTO `movie_has_language` (`movie_id`, `language_id`, `path`) VALUES
(1, 1, ''),
(94, 1, 'Disney''s Maleficent Trailer.MKV'),
(94, 2, 'Disney''s Maleficent - Official Trailer 3.mp4');

-- --------------------------------------------------------

--
-- Table structure for table `movie_pic`
--

CREATE TABLE IF NOT EXISTS `movie_pic` (
  `pic_id` int(11) NOT NULL,
  `pic` varchar(100) NOT NULL,
  `movie_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `order_movie`
--

CREATE TABLE IF NOT EXISTS `order_movie` (
  `order_id` int(6) NOT NULL,
  `movie_id` int(6) NOT NULL,
  `qty` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_movie`
--

INSERT INTO `order_movie` (`order_id`, `movie_id`, `qty`) VALUES
(10, 94, 1),
(11, 82, 1),
(11, 79, 1),
(11, 84, 1),
(12, 87, 1),
(14, 78, 1),
(14, 77, 1),
(16, 94, 1),
(16, 87, 1),
(16, 82, 1),
(16, 77, 1),
(18, 88, 1),
(18, 94, 1),
(19, 59, 1),
(19, 76, 1),
(19, 48, 1),
(19, 23, 1),
(20, 89, 1),
(21, 90, 1),
(22, 90, 1),
(22, 81, 1);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE IF NOT EXISTS `review` (
  `review_id` int(6) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` varchar(5000) NOT NULL,
  `rating` int(1) NOT NULL DEFAULT '0',
  `postdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` int(6) NOT NULL,
  `movie_id` int(6) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`review_id`, `name`, `description`, `rating`, `postdate`, `user_id`, `movie_id`) VALUES
(1, 'Itâs teachers versus zombie students in the horror comedy Cooties By Nathan Rabin ', 'Particularly for childless adults, children can seem like monsters, depraved little creatures of bottomless need and want unregulated by civility and concern for social niceties. The glib new horror comedy Cooties cleverly transforms kids from symbolic monsters into literal ones after a weird poultry-derived malady causes innocent school children to devolve into mindless zombies desperate to consume human flesh. It might seem like every possible permutation of zombie movie has been made already (as if to underline just how zombie-crazed pop-culture has become, there was recently a film called Zombeavers), but Cooties adds a new element of inter-generational combat to this appropriately deathless and increasingly massive subsection of the horror-movie world.\r\n\r\nBut before Cooties is a zombie movie, it is an earnest-young-teacher movie that diligently subscribes to every clichÃ© of the form. Elijah Wood, who many years ago visited this terrain from an opposite angle in The Faculty, now plays Clint Hadson, a struggling aspiring writer who pays the bills working as a teacher and enduring the never-ending gauntlet of low-level humiliation the job entails. At his new school, Clint reunites with Lucy (Alison Pill), a formative crush and new co-worker unfortunately in a relationship with gym teacher Wade Johnson (Rainn Wilson), an alpha-male whose hairy-chested, mustachioed conception of rugged masculinity can be traced back to vintage 1970s-era Burt Reynolds.', 4, '2015-11-23 01:34:39', 1, 82),
(2, '''Nightingale'' Review: David Oyelowo Goes ''Psycho'' in Uneven HBO Character Study', 'Fathers and sons, mothers and daughters â these are the relationships given preferential treatment in the film world. But when those pairings are switched, danger lurks around the corner. Be it horror films like "Sleepwalkers" and "Psycho" or lighter fare like "The Graduate" and "Throw Momma From the Train," strong bonds between mothers and sons or fathers and daughters can lead to complications later on for both parties. "Nightingale" â the new film acquired by HBO from director Elliott Lester ("Blitz") and first-time screenwriter Frederick Mensch â fits snugly into this latter grouping, as half a film filled with volatile relieved repression and half without any new ground to cover.', 3, '2015-11-23 01:34:37', 1, 87),
(3, 'Insidious: Chapter 3', 'This time around, screenwriter/actor Whannell assumes the helm of the horror series he helped create; fortunately, he takes several cues from directing predecessor James Wan, focusing on character interactions, well-defined space, and intriguing use of rhythm and timing, as well as a spooky musical score.\r\n\r\nOn the downside, like the second movie, Insidious: Chapter 3 doesn''t have much new to offer, and virtually all of the scares are of the jump-shock variety, with monsters appearing suddenly -- and frequently shrieking as well. But Whannell at least tries to mix up the timing of the shocks, delaying and subverting the expected. He also creates a very Lynchian version of the Further, with nightmarish imagery that can cause just as many tingles. And his characters are sympathetic and easy to like, with Shaye especially powerful and touching in her role.', 3, '2015-11-23 01:34:34', 1, 88),
(4, 'This âBrotherly Loveâ feels phony', 'Set in and around a Philadelphia high school and cast with actors who are uniformly in their 20s, this movie feels artificial from the start. Itâs narrated by Jackie (Keke Palmer) who lets out a stream of information about a dozen characters at once. And she keeps chattering as she falls in tedious love with the much wealthier Chris (Quincy Brown).\r\n\r\nThe nighttime scenes have a dreamy street-lit look; the banter of the characters can be funny; Macy Gray has a raspy realness as Jackieâs and her brother Juneâs alcoholic mother.\r\n\r\nBut typical of the punches pulled is June (Cory Hardrict), who is âprovidingâ for the family in an illegal way that âBrotherly Loveâ coyly refuses to specify. Despite the blazing guns, this script is not so tough.', 3, '2015-11-23 01:34:29', 1, 89),
(5, 'Film Review: Blood Moon (2014)', 'A werewolf western. Just hearing those words aloud fills one with hope that is inevitably going to be followed by crushing despair. Such a fabulous, âweird westâ, concept that could never be brought to the screen in a decent fashionâ¦\r\n\r\nEnter Blood Moon.\r\n\r\nRight off the bat, this relatively low budget film kicks off with grit as we see a cowboy, forced to shoot his horse before setting off on his own. The cinematography is on par with any major film; the locations are breathtaking and certainly are enough to make a viewer forget that this was filmed in the south of England. One shouldnât look at this as a British Western, instead one should think of it as another British werewolf film. Dog Soldiers proved that they can do them well, and this film does not disappoint.', 1, '2015-11-23 01:34:26', 1, 90),
(6, 'Microbudget movie magic of Arthur and Merlin', 'Before the film was shown, filmmaker and author Chris Jones (best known for his award-winning short film, Gone Fishing) gave a speech on filmmaking and the power of commitment and having the courage to follow your passions and your dreams. He described the team behind Arthur and Merlin as âwizards and warriors of the 21st centuryâ, explaining how difficult the entire process of filmmaking from an initial idea to a final cut actually is. There was lots of (deserved) applause for the entire cast and crew, and Jones also urged everyone to âengage in spontaneous clapping and whooping should they feel the needâ during the filmâemphasising how important it was that the cast and crew felt that their hard work was appreciated.\r\n', 3, '2015-11-23 01:34:23', 1, 86),
(7, 'Inside Out, movie review: Pixarâs latest and boldest feature is going to be an instant classic', 'Generally, when Hollywood deals with the unconscious, the spectre of Dr Freud (âan elderly gentleman from Vienna inflicting his dreams on meâ as novelist Vladimir Nabokov called him) looms over proceedings. One of the delights of Pixarâs wholly wonderful new animated feature Inside Out is that Freud is banished to the sidelines. Director Pete Docter is able to take us inside a little girlâs mind without enlisting a white-bearded psycho-analyst as our chaperone.\r\n\r\nThere are two parallel worlds in the movie: everyday, external ârealityâ as experienced by 11-year-old Riley (voiced by Kaitlyn Dias) and what is going on in her head. Against her will, Riley has just moved from her home in Minnesota to San Francisco, where her fatherâs work has taken him.', 2, '2015-11-23 01:34:21', 1, 68),
(10, 'This Disney reimagining of Sleeping Beauty lacks true enchantment, but Angelina Jolie saves the day, writes Robbie Collin', 'For a reminder of how wonderful Frozen is, watch Maleficent. This summer blockbuster season, Disney has turned out a live-action reimagining of their own animated version of Sleeping Beauty, from 1959.\r\nAs recently as six months ago, this might have felt subversive, even significant, although after seeing Elsa and Anna letting it go on icing-sugar mountains and finding endings happier than any standard-issue handsome prince could provide, the fun on offer here feels relatively thawed.\r\nIt is still fun, though, which counts for something ÃÂ¢ÃÂÃÂ largely because, as with Frozen, the game involves returning to a well-thumbed fairy tale and muddling the distinction between evil and good. Maleficent, played by Angelina Jolie, is the wicked fairy, down to the sleek black-and-purple gown and the hat like two raised scorpion-stings.\r\nHere, though, her wickedness is limited to that famous fit of rage at Princess AuroraÃÂ¢ÃÂÃÂs christening ÃÂ¢ÃÂÃÂ the flash of green fire, the spinning-wheel curse, reproduced here from the 1959 cartoon version almost word-for-word ÃÂ¢ÃÂÃÂ for which she spends much of this film trying to make amends.', 5, '2015-11-23 03:44:41', 1, 94),
(11, 'WWEâs Randy Orton to Star in âThe Condemned 2â (EXCLUSIVE)', 'WWE Studios is adding âThe Condemnedâ to its roster of film franchises, with the company tapping Randy Orton to star in âThe Condemned 2: Desert Prey,â that Lionsgate will co-produce and distribute.\r\n\r\nRoel Reine (âDeath Race: Inferno,â âThe Scorpion 3â) will direct the actioner from a script by Alan McElroy (âThe Marine 4â).\r\n\r\nFilm follows a former bounty hunter who finds himself on the run as part of a revamped Condemned tournament, in which convicts are forced to fight each other to the death as part of a game thatâs broadcast to the public.\r\n\r\nOrton, one of WWEâs top stars, reunites with Reine on âThe Condemnedâ sequel after having previously worked together on â12 Rounds 2: Reloaded.â\r\n\r\nSEE MORE:How John Cena is Going Hollywood to Attract New Fans to WWE\r\n\r\nâThe Condemned 2â will start production in New Mexico later this year.\r\n\r\nâStone Coldâ Steve Austin starred in the original, which Lionsgate released in 2007. The film generated $8 million at the box office but went on to perform well on homevideo platforms. âThe Condemned 2â will likely get its primary release on VOD and other home entertainment platforms.', 2, '2015-11-23 01:30:12', 2, 2),
(12, 'Marvel''s inventive and zingy new film', 'ven with a round dozen films under their collective belt, Marvel Studios are still finding new ways to play within the confines of the comic-book genre. And in the case of Ant-Man, theyâve created something you really havenât seen for a long time: a superhero who sweats the small stuff.\r\n\r\nScott Lang (Paul Rudd) doesnât deal in ruined cities or plummeting spacecraft. He trains in his mentorâs back garden and fights his arch-nemesis in his seven-year-old daughterâs bedroom. Of course, when Scott shrinks to near-microscopic size, these ordinary locations turn into hyperreal landscapes alive with threat.\r\n\r\nA lawn becomes a forest teeming with monstrous insects, while a room full of computer servers transforms into a neon-bright skyscraper district. And itâs fair to say that Thomas the Tank Engineâs saucer-eyed grin loses some of its bonhomie when heâs 3,000 times your weight and thundering headlong towards you.', 4, '2015-11-23 01:18:34', 2, 8);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(6) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `phone` varchar(25) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `addressline1` varchar(100) NOT NULL,
  `addressline2` varchar(100) NOT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `zip` varchar(45) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `regdate` date NOT NULL,
  `role` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `fname`, `lname`, `gender`, `DOB`, `phone`, `email`, `addressline1`, `addressline2`, `city`, `state`, `zip`, `username`, `password`, `regdate`, `role`) VALUES
(0, '-', '-', NULL, NULL, '-', NULL, '-', '-', '-', '-', '-', 'Guest', 'AntBN4PitasVrW9zrwyLRw==', '2015-10-13', 0),
(1, 'Reawpai', 'Chunsoi', 'M', '2015-11-13', '0846715445', 'you-noob@hotmail.co.th', '79/1', 'Banpho', 'Chachoengsao', 'Bankok', '24140', 'admin', 'AntBN4PitasVrW9zrwyLRw==', '2015-09-11', 1),
(2, 'Mark', 'Doe', 'M', '2015-11-11', '0846715445', 'k_reawpai@hotmail.com', '2/25', 'Prachauthit 45', 'Tunklu', 'Bankok', '10120', 'test', 'AntBN4PitasVrW9zrwyLRw==', '2015-10-11', 0),
(3, 'Jenny', 'Garrick', 'F', '2015-11-14', '0846715445', 'you-noob@hotmail.co.th', '79/1', 'Prachauthit 45', 'Rayong', 'Thailand', '1991', 'root', 'AntBN4PitasVrW9zrwyLRw==', '2015-11-14', 0),
(4, 'Mark', 'Hussen', 'M', '1985-11-16', '0812345678', 'you-noob@hotmail.co.th', '2/25', '-', 'Buenos Aires', 'Argentina', '1000 ', 'man', 'AntBN4PitasVrW9zrwyLRw==', '2015-11-16', 0),
(5, 'Aristodemos', 'AodhÃ¡n', 'M', '1990-11-26', '0862153969', 'olio@hotmail.com', '2/25', 'York island', 'Budapest ', 'Hungary', '1051', 'zen', 'ZYnATMcL0Pd6SAYyVfKhZw==', '2015-11-16', 0),
(6, 'tlek', 'metrai', 'M', '2015-11-17', '0846715445', 'kreawpai@hotmail.co.th', '79/1', 'Prachauthit 45', 'Rayong', 'Hungary', '24140', 'tlek095', 'AntBN4PitasVrW9zrwyLRw==', '2015-11-17', 0),
(7, 'Somsri', 'aaa', 'F', '2015-11-07', '0812345678', 'k_reawpai@hotmail.com', '2/25', 'Banpho', 'Tunklu', 'Hungary', '10120', 'oloza2538', 'AntBN4PitasVrW9zrwyLRw==', '2015-11-17', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_order`
--

CREATE TABLE IF NOT EXISTS `user_order` (
  `order_id` int(6) NOT NULL,
  `amount` double(6,2) NOT NULL,
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `confirm_no` int(1) NOT NULL DEFAULT '0',
  `user_id` int(6) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_order`
--

INSERT INTO `user_order` (`order_id`, `amount`, `date_create`, `confirm_no`, `user_id`) VALUES
(9, 129.59, '2015-11-13 20:38:11', 1, 2),
(10, 129.59, '2015-11-13 20:38:11', 1, 2),
(11, 791.00, '2015-11-16 23:56:24', 1, 2),
(12, 440.00, '2015-11-13 23:47:57', 1, 2),
(13, 299.00, '2015-11-14 01:11:26', 1, 2),
(14, 687.00, '2015-11-17 00:40:30', 1, 2),
(15, 131.00, '2015-11-16 20:07:21', 1, 2),
(16, 1234.00, '2015-11-17 00:38:18', 1, 3),
(18, 213.00, '2015-11-17 00:50:53', 1, 4),
(19, 1261.00, '2015-11-17 01:23:43', 1, 2),
(20, 460.00, '2015-11-23 06:06:26', -1, 2),
(21, 186.00, '2015-11-23 06:07:35', 0, 2),
(22, 292.00, '2015-11-23 07:59:52', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE IF NOT EXISTS `wishlist` (
  `user_id` int(6) NOT NULL,
  `movie_id` int(6) NOT NULL,
  `datepost` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`user_id`, `movie_id`, `datepost`) VALUES
(1, 88, '2015-11-12 04:59:29'),
(1, 68, '2015-11-12 05:07:08'),
(2, 94, '2015-11-13 17:07:33'),
(2, 78, '2015-11-13 17:51:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `confirm_order`
--
ALTER TABLE `confirm_order`
  ADD PRIMARY KEY (`confirm_id`),
  ADD KEY `confirm_user` (`order_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contact_id`),
  ADD KEY `fk_contact_user1_idx` (`user_id`) USING BTREE;

--
-- Indexes for table `history`
--
ALTER TABLE `history`
  ADD PRIMARY KEY (`history_id`),
  ADD KEY `fk_movie_has_user_user1_idx` (`user_id`),
  ADD KEY `fk_movie_has_user_movie1_idx` (`movie_id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`language_id`);

--
-- Indexes for table `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`movie_id`),
  ADD KEY `fk_movie_categories1_idx` (`category_id`);

--
-- Indexes for table `movie_feature`
--
ALTER TABLE `movie_feature`
  ADD PRIMARY KEY (`movie_id`);

--
-- Indexes for table `movie_has_language`
--
ALTER TABLE `movie_has_language`
  ADD PRIMARY KEY (`movie_id`,`language_id`),
  ADD KEY `fk_movie_has_language_language1_idx` (`language_id`),
  ADD KEY `fk_movie_has_language_movie1_idx` (`movie_id`);

--
-- Indexes for table `movie_pic`
--
ALTER TABLE `movie_pic`
  ADD PRIMARY KEY (`pic_id`),
  ADD KEY `fk_movie_pic_movie1_idx` (`movie_id`);

--
-- Indexes for table `order_movie`
--
ALTER TABLE `order_movie`
  ADD KEY `fk_user_order_has_movie_movie1_idx` (`movie_id`),
  ADD KEY `fk_user_order_has_movie_user_order1_idx` (`order_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`,`movie_id`),
  ADD KEY `fk_review_user1_idx` (`user_id`),
  ADD KEY `fk_review_movie1_idx` (`movie_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_order`
--
ALTER TABLE `user_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD KEY `fk_user_has_movie_movie1_idx` (`movie_id`),
  ADD KEY `fk_user_has_movie_user1_idx` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `confirm_order`
--
ALTER TABLE `confirm_order`
  MODIFY `confirm_id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `contact_id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `history`
--
ALTER TABLE `history`
  MODIFY `history_id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `language_id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `movie`
--
ALTER TABLE `movie`
  MODIFY `movie_id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=95;
--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `review_id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `user_order`
--
ALTER TABLE `user_order`
  MODIFY `order_id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `confirm_order`
--
ALTER TABLE `confirm_order`
  ADD CONSTRAINT `confirm_user_order` FOREIGN KEY (`order_id`) REFERENCES `user_order` (`order_id`);

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `fk_contact_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `fk_movie_has_user_movie1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_movie_has_user_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `movie`
--
ALTER TABLE `movie`
  ADD CONSTRAINT `fk_movie_categories1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `movie_feature`
--
ALTER TABLE `movie_feature`
  ADD CONSTRAINT `movie_feature_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `movie_has_language`
--
ALTER TABLE `movie_has_language`
  ADD CONSTRAINT `fk_movie_has_language_language1` FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_movie_has_language_movie1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `movie_pic`
--
ALTER TABLE `movie_pic`
  ADD CONSTRAINT `fk_movie_pic_movie1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_movie`
--
ALTER TABLE `order_movie`
  ADD CONSTRAINT `fk_user_order_has_movie_movie1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_order_has_movie_movie2` FOREIGN KEY (`order_id`) REFERENCES `user_order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `fk_review_movie1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_review_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `fk_user_has_movie_movie1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_has_movie_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
