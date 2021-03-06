-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2018-08-04 12:36:02
-- 服务器版本： 10.1.32-MariaDB
-- PHP Version: 7.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newsdb`
--
CREATE DATABASE IF NOT EXISTS `newsdb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `newsdb`;

-- --------------------------------------------------------

--
-- 表的结构 `authority`
--

DROP TABLE IF EXISTS `authority`;
CREATE TABLE IF NOT EXISTS `authority` (
  `role_id` int(1) NOT NULL COMMENT '角色id',
  `route_id` int(2) NOT NULL COMMENT '节点id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `authority`
--

INSERT INTO `authority` (`role_id`, `route_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8);

-- --------------------------------------------------------

--
-- 表的结构 `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论id  唯一标识评论',
  `news_id` int(11) NOT NULL COMMENT '所评论的资讯id',
  `user_id` int(11) NOT NULL COMMENT '评论人id',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
  `comment` varchar(300) NOT NULL COMMENT '评论内容',
  `thumbup` int(3) DEFAULT NULL COMMENT '点赞数',
  `thumbdown` int(3) DEFAULT NULL COMMENT '踩数',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `comment`
--

INSERT INTO `comment` (`comment_id`, `news_id`, `user_id`, `time`, `comment`, `thumbup`, `thumbdown`) VALUES
(1, 1, 2, '2018-08-03 14:25:27', '1312', 10, 1),
(2, 1, 3, '2018-08-03 14:25:27', '4564', 1, 10),
(3, 1, 4, '2018-08-03 17:28:25', '123', 0, 0),
(4, 1, 3, '2018-08-03 17:28:25', '123', 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `news_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '资讯id 自增长',
  `title` varchar(20) NOT NULL COMMENT '资讯题目 字符串 最多20字',
  `type_id` int(4) NOT NULL COMMENT '资讯类型 与newstype表相连',
  `editor_id` int(4) DEFAULT NULL COMMENT '编辑id  与newseditor相连',
  `pic` varchar(50) DEFAULT NULL COMMENT '图片路径',
  `abstract` varchar(1000) NOT NULL COMMENT '资讯摘要',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '资讯发布时间',
  `country` varchar(10) NOT NULL COMMENT '国家',
  `language` varchar(10) NOT NULL COMMENT '语种',
  `score` float NOT NULL COMMENT '评分 最大99',
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `news`
--

INSERT INTO `news` (`news_id`, `title`, `type_id`, `editor_id`, `pic`, `abstract`, `time`, `country`, `language`, `score`) VALUES
(1, '归去来', 1, 2, '../news/uploads/电视剧/3.jpg', '该剧讲述了萧清、书澈、缪莹、宁鸣、成然和绿卡等人因为家庭、理想、爱情等种种原因相聚美国，成为藤校精英后，从象牙塔走向社会，一步步完成蜕变的故事。', '2018-07-18 15:24:50', '中国', '华语', 8.4),
(2, '忽而今夏', 1, 2, '../news/uploads/电视剧/huerjinxia.jpg', '少女何洛机灵俏皮但功课欠佳，却不小心夸下海口要考入名校。意气飞扬的学霸章远看似自大高傲，但被何洛的锲而不舍打动，辅导她不断进步。两个人心意渐明，约定报考同一所大学。\"', '2018-07-20 15:07:48', '中国', '华语', 8.5),
(3, '泡沫之夏', 1, 3, '../news/uploads/电视剧/paomozhix.jpg', ' 夏沫和洛熙都是孤儿，少年的他们在养父母家相识，因为童年留在内心的阴影，他们彼此充满戒备和防范。洛熙在夏沫和弟弟参加电视歌唱大赛遇到尴尬状况下为他们解围，两人终于开始不戒备对方，可是洛熙却也爱上夏沫...', '2018-07-18 16:52:50', '中国', '华语', 7.9),
(4, '温暖的弦', 1, 2, '../news/uploads/电视剧/1.jpg', '《温暖的弦》根据安宁同名小说改编，由张翰、张钧甯、经超、张嘉倪等联袂主演。该剧融合情感和商战等元素，以及当下年轻人的成长历程，讲述了占南弦与温暖从懵懂青春纯恋。', '2018-07-18 15:29:03', '中国', '华语', 8.8),
(9, '寂静之地', 2, 8, '../news/uploads/电影/2.jpg', '一个大规模的入侵行动发生，让地球几乎全灭，幸存的这一家人过着安静无声的生活，一发出声音就会被怪物抓走。《寂静之地》中的家庭必须时时保持安静，这一家人必须搞清楚哪些声音可以发出，哪些不行。父亲铺了沙子路来消音，全家人必须使用手语，还有用来沟通的照明系统…等，才能避免可怕的事情发生，因为猎杀他们的怪物无所不在，这是真正的挑战，他们必须克服生死难关，想尽办法活下去。 保持安静是生存唯一法则，它们无法听到你，就无法追捕你\"\"', '2018-07-18 06:29:34', '欧美', '英语', 8.5),
(10, '幕后玩家', 2, 2, '../news/uploads/电影/1.jpg', '坐拥数亿财产的钟小年(徐峥 饰)意外遭人绑架，不得不在一位神秘人的操控下完 成一道道令人两难的选择题。在选择的过程中，钟小年落入陷阱，不仅巨额财产被盗取、 濒临身败名裂的边缘，还将妻子魏思蒙(王丽坤 饰)牵扯进一个个险境。为了洗脱罪名， 救回爱人，钟小年在重重危机中与神秘人展开了一场关乎生死和救赎的金钱游戏…\"\"\"\"\"\"\"\"\"', '2018-07-26 08:15:25', '中国', '华语', 8.1),
(12, '侏罗纪世界2', 2, 7, '../news/uploads/电影/3.jpg', '侏罗纪世界主题公园及豪华度假村被失控的恐龙们摧毁已有三年。如今，纳布拉尔岛已经被人类遗弃，岛上幸存的恐龙们在丛林中自给自足。 当岛上的休眠火山开始活跃以后，欧文（克里斯•帕拉特 饰）与克莱尔（布莱丝•达拉斯•霍华德 饰）发起了一场运动，想要保护岛上幸存的恐龙们免于灭绝。 欧文一心想要找到自己依然失踪在野外的迅猛龙首领布鲁，克莱尔如今也尊重起这些生物，以保护它们为己任。两人在熔岩开始喷发时来到了危险的小岛，他们的冒险也揭开了一个可能让地球回到史前时代般混乱秩序的阴谋。\"', '2018-07-26 08:16:58', '欧美', '英语', 7.4),
(13, '环太平洋2：雷霆再起', 2, 2, '../news/uploads/电影/4.jpg', '新片中的怪兽将拥有空前的破坏力。为了对抗更强大的怪兽，由人类操控的机甲军团也进行了全方位升级。前作的主演伊德瑞斯•艾尔巴与查理•汉纳姆已确认不会回归续集，第二部的主人公为艾尔巴饰演的潘特科斯特将军的儿子，即约翰•波耶加的角色。斯科特•伊斯特伍德也将在续集里扮演一位机甲驾驶员。\"', '2018-07-26 08:16:58', '欧美', '英语', 7.3),
(14, '复仇者联盟3：无限战争', 2, 3, '../news/uploads/电影/5.jpg', '《复仇者联盟3：无限战争》是漫威电影宇宙10周年的历史性集结，将为影迷们带来史诗版的终极对决。面对灭霸突然发起的闪电袭击，复仇者联盟及其所有超级英雄盟友必须全力以赴，才能阻止他对全宇宙造成毁灭性的打击。\"', '2018-07-26 08:18:42', '欧美', '英语', 9.7),
(15, '神秘巨星', 2, 2, '../news/uploads/电影/6.jpg', '14岁的印度少女尹希娅(塞伊拉•沃西 饰)热爱唱歌，因父亲阻挠，她只能蒙面拍摄并上传自弹自唱原创歌曲的视频，孰料凭借天籁歌喉在网上一炮而红，备受争议的音乐人夏克提•库马尔(阿米尔•汗 饰)也向她抛出橄榄枝，尹希娅的生活发生了翻天覆地的变化......', '2018-07-26 08:18:42', '印度', '英语', 8.2),
(16, '红海行动', 2, 8, '../news/uploads/电影/7.jpg', '该片讲述了中国海军“蛟龙突击队”8人小组奉命执行撤侨任务，突击队兵分两路进行救援，但不幸遭到伏击，人员伤亡。同时，掌握核战原材料的恐怖分子首领还在密谋不法行动，突击队必须尽快行动的故事 。', '2018-07-26 08:20:07', '中国', '华语', 9.4),
(17, '青年马克思', 2, 7, '../news/uploads/电影/8.jpg', '该片讲述了年轻的马克思1844年在巴黎与恩格斯相识相知，因共同的理想信念，致力于彻底改变世界。后来，两人合作撰写《共产党宣言》的伟大历程。', '2018-07-26 08:20:07', '欧美', '英语', 7.5),
(18, '战犬瑞克斯', 2, 2, '../news/uploads/电影/9.jpg', '改编自真人真事，以伊拉克战争为背景，讲诉海军陆战队下士梅根•利维和她的军犬瑞克斯一起拯救了多人生命的故事。在经历生死与相互救赎后，一人一犬建立深厚情感的故事。 它在真实的背景下以一种特殊的方式升华了人与狗的情感。狗不再是宠物，而是以战友身份与人相处；它们不再生活在人类的庇护下，而是反过来，用自己的身躯保护人类。 该片以“军犬”这个新奇的角度还原伊拉克战争，首次全面展现军犬在战区排爆、救人的惊心动魄的画面，真实刻画了女兵梅根•利维与军犬瑞克斯在战场上紧张、勇猛的状态。', '2018-07-26 08:20:48', '欧美', '英语', 8.7),
(19, '头号玩家', 2, 3, '../news/uploads/电影/10.jpg', '影片故事发生在2045年，遭遇能源危机的世界处于崩溃边缘，人类选择在名为“绿洲”的VR游戏中寻找慰藉。但游戏创始人的遗嘱打破了世外桃源的宁静：只要玩家寻获他设置的彩蛋，就能接手\"绿洲\"成为新的世界首富。吸引全世界参与的大冒险就此展开，男主角韦德•沃兹(Wade Watts)也投身其中，但等待他的夺宝之旅不仅神秘凶险，还裹挟巨大阴谋。', '2018-07-26 08:20:48', '欧美', '英语', 9.1),
(20, '唐人街探案2', 2, 3, '../news/uploads/电影/11.jpg', '秦风（刘昊然饰）接到唐仁（王宝强饰）的邀请来纽约参加其与阿香的婚礼。豪气逼人的唐仁迎接秦风，极尽招摇，岂料婚礼其实是唐仁为巨额奖金而参加的“世界名侦探大赛”，比赛的内容是寻找“唐人街教父”七叔的孙子。受骗的秦风怒极欲走，却被FBI探员陈英送来的讯息所吸引……', '2018-07-26 08:21:48', '中国', '英语', 7.8),
(21, '勇敢者游戏:决战丛林', 2, 8, '../news/uploads/电影/12.jpg', '影片主要讲述四名性格迥异的高中生意外穿越到险象环生的勇敢者游戏中，变身成为与自身性格外貌截然不同的游戏角色：瘦小“弱鸡”斯宾塞变成了硬汉冒险家(道恩•强森饰)，高大威猛的运动员弗里奇，变成了身材迷你的龟速行李手 (凯文•哈特 饰)，万人迷校花贝珊妮变成一个中年发福教授(杰克•布莱克饰)，害羞内向的学霸玛莎变成了魅力十足的热辣女战士(凯伦•吉兰饰)。面对丛林猛兽的袭击和邪恶势力的追捕，四人必须共同合作，战胜重重危机，赢得游戏，才能获得重返现实的机会。', '2018-07-26 08:21:48', '欧美', '英语', 7.3),
(22, '黑豹', 2, 2, '../news/uploads/电影/13.jpg', '在经历了《美国队长3：内战》的事件之后，黑豹回到家乡，那个与世隔绝、技术先进的非洲国家瓦坎达。多年前因为一块巨大的陨石坠落到瓦坎达，从而为这个国家带来了稀有的吸音金属，这种有军事作用的金属矿藏吸引了众多外国匪徒前来掠夺，特查拉在危急时刻就会化身超级英雄黑豹保护自己的国家，正邪之战永远不会停息，他将顶替去世的父亲成为国王，但是，无论作为黑豹还是国王，特查拉的勇气都遭遇了考验，他也被卷入了一场将瓦坎达和整个世界置于险境的冲突之中 。', '2018-07-26 08:22:38', '欧美', '英语', 9.3),
(23, '水形物语', 2, 7, '../news/uploads/电影/14.jpg', '1963年，美国冷战时期，伊莉莎是一位聋哑人士，透过手语与外界沟通，她在一个政府机构担任清洁工，意外和同事泽尔达一起发现一个最高机密的实验，一个长得像披着鳞皮、生活在水中的爬虫类奇异生物The AssetSt，可在空气中存活一阵子，在南美洲荒野区被抓到以后，被关在一个巨大的水缸里面。由于无法忍受实验室对怪兽的折磨，伊莉莎开始偷偷拜访这位怪兽，既然两人发展出感情，伊莉莎教他手语，两个寂寞灵魂找到彼此，伊莉莎决定帮他逃出实验室。', '2018-07-26 08:22:38', '欧美', '英语', 8.6),
(24, '无问西东', 2, 3, '../news/uploads/电影/15.jpg', '影片讲述了四个年轻人，满怀诸多渴念，在四个非同凡响的时空中一路前行。这四个年轻人，在最好的年纪迎来了最残酷的考验，那些成长留下的伤疤，成就了永不褪色的青春传奇。', '2018-07-26 08:23:12', '中国', '华语', 6.6),
(25, '火影忍者', 3, 2, '../news/uploads/动漫/1.jpg', '十多年前一只拥有巨大威力的妖兽“九尾妖狐”袭击了木叶忍者村，当时的第四代火影拼尽全力，以自己的生命为代价将“九尾妖狐”封印在了刚出生的鸣人身上。木叶村终于恢复了平静，但村民们却把鸣人当成像“九尾妖狐”那样的怪物看待，所有人都疏远他。鸣人自小就孤苦无依，一晃十多年过去了，少年鸣人考入了木叶村的忍者学校，结识了好朋友佐助和小樱。佐助是宇智波家族的传人之一，当他还是小孩的时候他的哥哥——一个已经拥有高超忍术的忍者将他们家族的人都杀死了，然后投靠了一直想将木叶村毁灭的大蛇丸，佐助自小就发誓要超越哥哥，为家族报仇。鸣人他们在忍者学校得到了教官卡卡西的精心指点，在他的帮助下去迎接成长中的一次又一次挑战！', '2018-07-26 08:25:44', '日韩', '日语', 9.3),
(26, '熊出没之探险日记', 3, 7, '../news/uploads/动漫/2.jpg', '该动画片主要讲述了休林季里光头强与熊大、熊二一起帮助少女赵琳穿密林、钻矿洞、爬雪山，千辛万苦寻找儿时玩伴小虎妞的探险故事。该动画片秉承了《熊出没》一贯的\"自然、环保、健康、快乐\"的核心主题，沿袭着《熊出没》的幽默风格，并加入大量户外知识，增强表现了团队合作精神。', '2018-07-26 08:25:44', '中国', '华语', 6.2),
(27, '银魂', 3, 3, '../news/uploads/动漫/3.jpg', '江户时代末期，被称为\"天人\"的谜之异星人来袭。于是地球人与天人之间的战争瞬即爆发，为数众多的武士和攘夷派志士都参与与天人的战斗。幕府见识到天人强大的实力后，最终向天人低头，放弃武士不管，擅自与天人签订不平等条约，准许他们入国。其后更颁布了\"废刀令\"，夺走了武士的刀，使他们无力反抗。自此，天人横行霸道，幕府为天人所影响，甚至被控制，成为了\"傀儡政权\"。在这样的时代，有一个武士与同伴愉快地过着异想天开的生活。', '2018-07-26 08:26:30', '日韩', '日语', 9.4),
(28, '假面骑士Build', 3, 8, '../news/uploads/动漫/4.jpg', '在火星发现的神秘箱子――\"潘多拉魔盒\"打开的瞬间，巨大的墙壁突然出现!故事由此开始。被称为\"天空之壁\"的墙壁把日本列岛分割为三部分，并由此诞生了各自的首都「东都」「西都」「北都」。 其中在\"东都\"有被称为Smash的未确认生命体出现并暗中把人类逼入绝境。挡在Smash面前而出现的，是一位青年，其腰上戴着腰带、 手上握着不可思议的瓶子 。「变身!」―― 青年天才物理学者变身为假面骑士Build，阻挡在Smash的面前', '2018-07-26 08:26:30', '日韩', '日语', 7.2),
(29, '名侦探柯南', 3, 2, '../news/uploads/动漫/5.jpg', '被称为“日本警察的救世主”、“平成年代的福尔摩斯”的高中生侦探工藤新一在一次与青梅竹马毛利兰去游乐园游玩时发现两个行动诡异的黑衣男子，于是新一独自跟踪了他们，却不料被其中一名黑衣男子偷袭并灌下一种名为“APTX4869”的神秘毒药，虽然因体质特殊免遭死亡，但是因为药物副作用，新一的身体回到了孩童状态。\r\n如果黑衣组织知道新一还活着的话必定会使周围的人受到牵连，所以他化名为“江户川柯南”，寄住在父亲为侦探的毛利兰家中企图寻找黑衣组织的线索。他用阿笠博士发明的手表型麻醉枪让毛利兰的父亲同时也是个冒失的糊涂侦探毛利小五郎睡着，接着用蝴蝶结变声器模仿他的声音来进行推理，解决了许多案件并一直在追查黑衣组织，期待把黑衣组织绳之以法并变回原来的样子，同时也结交了许多伙伴。', '2018-07-26 08:27:32', '日韩', '日语', 8.9),
(30, '海贼王', 3, 3, '../news/uploads/动漫/6.jpg', '影片主要讲述了主人公路飞立志成为海贼王，为了寻找传说中的秘宝ONE PIECE而展开的凶险无比同时也波澜壮阔的冒险故事。动画于1999年10月20日在日本富士电视台开始播放，至今仍在连载中', '2018-07-26 08:27:32', '日韩', '日语', 9.7),
(31, '龙珠超', 3, 7, '../news/uploads/动漫/7.jpg', '结束了与魔人布欧的惨烈之战后，多灾多难的地球重归和平，而作为救世主存在的孙君（野泽雅子 配音）还生人间，和家人们过着无忧无虑的快乐生活。这边厢Z战士们安享太平，遥远的宇宙最深处，一个可怕的神明悠然苏醒。他是破坏神比鲁斯（山寺宏一 配音），嗜好美食又无比任性，稍有不满意的地方便面不改色地摧毁一颗星球以及上面的生命，堪称是界王神都不敢轻易招惹的可怕神明。受一个神秘之梦的侵扰，比鲁斯决定寻找强大的对手比试一番。他和随从维斯（森田成一 配音）来到了地球。孙悟空和伙伴们面临前所未有的挑战，而他将朝着神的境界全力冲刺…… 本片是由鸟山明担任原案所开启的全新的龙珠故事。自己也被卷入其中的桐人，在游戏的舞台-巨大浮游城堡\"艾恩葛朗特\"里，以不与人组队的独行剑士身份，逐渐崭露头角，并获得\"黑色剑士\"的称号。桐人以完全攻略的条件--到达城堡最上层为目标，持续进行严酷且漫长的冒险，在这期间他邂逅了女性细剑使--\"闪光\"亚丝娜，以及公会\"血盟骑士团团长\"希兹克利夫，他的命运也一步步产生了巨大的变化。桐人能否从游戏里全身而退……', '2018-07-26 08:28:45', '日韩', '日语', 8.7),
(32, '蜡笔小新', 3, 3, '../news/uploads/动漫/8.jpg', '小新是一个年仅5岁，正在幼稚园上学的小男孩。他内心早熟，喜欢欣赏并向美女搭讪。最初小新与父亲广志和母亲美伢组成一个三人家族。随后又添加了流浪狗小白，日子频繁琐碎却不乏温馨感动。随着故事展开，又加入了新的成员妹妹野原葵 ，生活中他也有许多的朋友，每个人物都有自己鲜明的特点，为大家带来了一个又一个的搞笑故事。', '2018-07-26 08:28:45', '日韩', '日语', 8.1),
(33, '灌篮高手', 3, 2, '../news/uploads/动漫/9.jpg', '在初中时期被50名女学生甩过的红发不良少年樱木花道升入湘北高中之后，对偶然间认识的同年级女生赤木晴子一见钟情。在晴子的期待下，对篮球规则一窍不通的花道加入到篮球队。在晴子的哥哥--篮球队队长赤木刚宪的严格训练以及对\"超级新人\"流川枫燃起的对抗意识的驱使下，花道身体中潜藏的才能终于得以显现，同时，他也被篮球这项运动的魅力所征服。\r\n在和强劲的对手陵南高中的练习比赛之后，身材矮小却有着灵活运动能力的宫城良太以及曾经在初中时期获得县MVP称号的三井寿也回归球队。实力大幅提升的湘北高中篮球队开始为全国高中联赛神奈川县预选赛进行准备。就这样，以樱木花道为首的湘北高中篮球队迎来了他们人生中最为炽热的一个夏天。', '2018-07-26 08:30:53', '日韩', '日语', 9.2),
(34, '游戏王', 3, 8, '../news/uploads/动漫/10.jpg', '武藤游戏是童实野高中的一名普通学生，除了喜欢玩各种游戏外没有任何优点，运动神经也不好，除了青梅竹马的真崎杏子外没有任何朋友。经常自己一个人玩的游戏其实心里很想要有朋友。\r\n游戏认为只要拼好爷爷武藤双六给自己的古埃及宝物千年积木并对它许愿，愿望就会成真，在这八年中游戏总是无法拼好了这个神秘的宝物。\r\n以为某件事为契机，游戏和班里的城之内克也结下了深厚的友谊，也在这件事中游戏成功地完成了千年积木。在千年积木的力量下，游戏得到了另一个黑暗的人格(魔王样)，继承了三千年来所有游戏知识，成为使用\"黑暗游戏\"来制裁各种行恶之人的正义使者。\r\n', '2018-07-26 08:30:53', '日韩', '日语', 8.8),
(35, '聪明的一休', 3, 3, '../news/uploads/动漫/11.jpg', '动画以斗智为主题。以历史人物一休宗纯禅师的童年为背景(和真正的一休禅师的生平事迹有很大出入)，故事发生在室町幕府时期。曾经是皇子的一休不得不与母亲分开，到安国寺当小和尚，并且用他的聪明机智解决无数的问题。一休不光聪明过人，还富有正义感，他用自己的机智和勇气帮助那些贫困的人、教训那些仗势欺人的人，平时他勤奋好学，热心助人，最喜爱动脑筋，解决日常生活中的问题，无论是将军，桔梗店老板还是新右卫门先生，都难不倒他，不仅让坏人们得到应有的惩治，他的才智还常常令大人们佩服不已，更能教会小朋友们许多日常生活的常识。', '2018-07-26 08:31:41', '日韩', '日语', 7.9),
(36, '中华小当家', 3, 7, '../news/uploads/动漫/12.jpg', '中国的美食文化历来举世无双，为世界称颂。中华一番的故事是从西南四川省驰名的菊下楼的继承权争夺开始的。\r\n主人公刘昴星年仅13岁，却极具厨艺天分，拥有的超人的味觉和想象力，谨记母亲的指导以及一颗永不言败的心，在各种烹饪比赛和各方的挑战中不断成长，成为最年轻的\"特级厨师\"，并与邪恶的\"黑暗料理界\"开始了对抗', '2018-07-26 08:31:41', '日韩', '日语', 8.3),
(37, '起风了', 3, 8, '../news/uploads/动漫/13.jpg', '那是一个动荡的年代，战争、饥饿、疾病、天灾，死神的阴影笼罩全球，却无法遮挡心头闪现的梦想和希望的光芒。平凡的日本少年堀越二郎（庵野秀明 配音）迷恋游弋长空的飞机，梦中他与意大利飞机设计师卡普罗尼（野村万斋 配音）成为朋友，享受着飞行带来的乐趣。恐怖的关东大地震，二郎邂逅一生的挂念——里见菜穗子（泷本美织 配音），短暂的相逢，无序的混乱中又失之交臂。在命运的指引下，被称为天才的二郎如愿成为飞机设计师，他和前辈同侪共同努力，绞尽脑汁提升飞机的性能。欧洲的先进设计让他们痛心疾首，另一方面又充满矛盾的打造着融合了梦想和杀人属性的机器。他追逐梦想，并与菜穗子重逢。动荡的昭和时代，风雪飘摇之中步伐从未停止', '2018-07-26 08:32:42', '日韩', '日语', 9.5),
(38, '犬夜叉', 3, 3, '../news/uploads/动漫/14.jpg', '战国时代，大妖怪斗牙王与人类公主十六夜的儿子——半妖犬夜叉，因为自己半妖的身份受到人类与妖怪的排斥，为了成为真正的妖怪而想得到四魂之玉；而巫女桔梗为了保护和净化四魂之玉，运用灵力不断与前来抢夺四魂之玉的妖怪战斗。命运的红线牵引的两人虽然在开始互为敌对，但两人却也因四魂之玉结缘，桔梗发现了犬夜叉粗鲁外表下的善良，以及与自己同样的孤独；而犬夜叉也看到了桔梗在孤高的外表下其实也有颗孤单的、渴望被爱的心。 在不断的相互了解中，两人最终相爱了，并约定利用四魂之玉的力量，让犬夜叉成为人类，而守护使命结束的桔梗也可以回归到平凡生活，与爱人相守终生。但是，悲剧就此拉开序幕——在约定的日子里，发生了难以预料的变故。 桔梗当时救了一个全身烧伤的盗贼鬼蜘蛛，鬼蜘蛛逐渐对桔梗产生了邪念，想得到桔梗和四魂之玉，于是把自己出卖给众多妖怪，诞生出了邪恶的半妖——奈落。奈落暗中设计，让犬夜叉和桔梗误以为遭到对方的背叛。桔梗用最后一口气将犬夜叉封印在御神木上，令犬夜叉进入了永远长眠，值得注意的是，犬夜叉被封印时的表情十分安详。而桔梗选择与四魂之玉一同火化，追随“背叛”她的犬夜叉。  五百年后，桔梗的灵魂转世为现代少女日暮戈薇，一个活泼坚强，却又普通的初三学生。她在15岁生日那天，被家里食骨之井中的的妖怪百足妖妇强行带到了战国时代，穿越时空，见到了被封印在御神木上五十年的犬夜叉。妖怪前来抢夺戈薇体内隐藏的四魂之玉，慌忙之下，戈薇解开了犬夜叉的封印，唤醒沉睡的犬夜叉。随后在夺回被尸舞鸟抢走的四魂之玉时，戈薇无意间射碎四魂之玉，使其破碎成残片，散落于各地。为了搜集齐所有的四魂之玉碎片，犬夜叉和戈薇在弥勒、珊瑚、七宝还有云母等一众伙伴的陪同下开始了旅途。', '2018-07-26 08:32:42', '日韩', '日语', 9.1),
(39, '干物妹！小埋', 3, 2, '../news/uploads/动漫/15.jpg', '容姿端丽、成绩优秀、运动万能，任谁都非常憧憬的完美女高中生土间埋，却在回到家后就变成如同干物一般的妹妹\"干物妹\"。漫画、动画、游戏、网络、可乐、薯片……被喜欢的东西包围着，度过着最棒的无所事事的时光。知道她这副样子的，只有和她住在一起的哥哥•大平一个人而已。', '2018-07-26 08:36:42', '日韩', '日语', 9.6),
(40, '中国新说唱', 5, 3, '../news/uploads/综艺/1.jpg', '《中国新说唱》是2018年爱奇艺举全平台之力打造的S+级自制超级网综。它是中国第一个以“剧集式”叙事 理念制作的真人秀节目，也是第一档华语青年说唱音乐真人秀。在兼具“燃、酷、潮“三大基因的同时，中国元素与说唱音乐的华丽碰撞，以及新时代新青年的自信表达，无疑将推动《中国新说唱》更好地回归音乐本身，打造一场华语青年说唱音乐盛会。', '2018-07-26 08:37:45', '中国', '华语', 8.2),
(41, '中国好声音2018', 5, 7, '../news/uploads/综艺/2.jpg', '由浙江卫视和灿星制作联手打造的音乐励志评论类节目。旨在为中国乐坛的发展提供一批怀揣梦想、具有天赋才华的音乐人。四位导师通过盲选选择自己心仪的学员组成战队，并带领自己的战队进行战队内和战队间关于音乐的对抗。该节目由周杰伦、谢霆锋、李健、庾澄庆担任导师。 将于2018年7月13日每周五晚播出。', '2018-07-26 08:37:45', '中国', '华语', 9.3),
(42, '极限挑战第四季', 5, 3, '../news/uploads/综艺/3.jpg', '《极限挑战第四季》是一档由东方卫视制作的大型励志体验真人秀节目，节目共12期，第四季节目固定嘉宾是黄渤、孙红雷、黄磊、罗志祥、王迅、张艺兴。', '2018-07-26 08:39:28', '中国', '华语', 8.6),
(43, '快乐大本营', 5, 8, '../news/uploads/综艺/4.jpg', '《快乐大本营》由湖南电视台推出的一档综艺性娱乐节目，于1997年7月11日首播，是湖南卫视上星以来一直保持的品牌王牌娱乐节目之一。2007年开始，该节目由何炅、谢娜、李维嘉、杜海涛、吴昕担任主持。节目是嘉宾访谈游戏型的综艺节目，邀请大陆、香港、台湾的知名艺人来访谈、游戏等。节目以游戏为主，辅以歌舞及各种形式。', '2018-07-26 08:39:28', '中国', '华语', 9.1),
(44, '向往的生活第二季', 5, 8, '../news/uploads/综艺/5.jpg', '《向往的生活第二季》是由湖南卫视、浙江合心传媒联合推出的生活服务纪实节目，由黄磊、何炅、刘宪华、彭昱畅主持。 节目依旧坚持自力更生、自给自足的生活模式，从北方搬迁江南，四位主人公在美丽江南开始新生活。', '2018-07-26 08:40:22', '中国', '华语', 8.3),
(45, '创造101', 5, 3, '../news/uploads/综艺/6.jpg', '《创造101》是腾讯视频引进韩国Mnet电视台音乐选秀节目《produce 101》推出的中国首档女团竞演生存秀节目。 该节目由黄子韬担任女团发起人，由张杰、陈嘉桦担任声乐导师，由胡彦斌担任唱作导师，舞蹈导师则由罗志祥、王一博担任。该节目召集了101位偶像女团练习生，通过任务、训练、考核，让选手在明星导师训练下成长，循环人气投票、暂时淘汰的流程，最终通过人气投票选出11位女练习生，组成全新的偶像团体出道 。', '2018-07-26 08:40:22', '中国', '华语', 9.4),
(46, '我是大侦探', 5, 7, '../news/uploads/综艺/7.jpg', '《我是大侦探》是湖南卫视、芒果TV共同打造的大型情境类益智互动推理秀，每期集结6位超强阵容高能玩家，解锁层层悬念，找出关键人物K。由何炅、吴磊、马思纯、邓伦、张若昀、韩雪、大张伟组成的全新“侦探天团”，将开展一段全新冒险探案之旅。节目于2018年3月24日起每周六晚22:00在湖南卫视首播。', '2018-07-26 08:41:16', '中国', '华语', 8.4),
(47, '妈妈是超人第三季', 5, 2, '../news/uploads/综艺/8.jpg', '《妈妈是超人第三季》是芒果TV推出的明星育儿观察类真人秀节目。 \r\n《妈妈是超人第三季》四位固定嘉宾是黄圣依、霍思燕、贾静雯、邓莎4位明星妈妈。', '2018-07-26 08:41:16', '中国', '华语', 7.8),
(48, '爱情保卫战', 5, 7, '../news/uploads/综艺/9.jpg', '《爱情保卫战》是天津卫视2010年推出的情感心理节目，由赵川主持。节目于每周二、三、四、五晚22:00在天津卫视播出。\r\n节目把现实中青年男女在恋爱过程中遇到的各种困惑与矛盾搬上舞台，双方通过交流、沟通与争辩把内心的痛苦与困惑全盘托出。节目现场邀请情感导师为情侣提供理性分析、科学考量、恋爱指导和情感忠告，倡导正确的恋爱观、婚姻观、幸福观。同时也邀请明星夫妻等社会人士指导。', '2018-07-26 08:42:06', '中国', '华语', 7.6),
(49, '偶像练习生', 5, 2, '../news/uploads/综艺/10.jpg', '偶像练习生》是爱奇艺重点打造的中国首档偶像男团竞演养成类真人秀，“全民制作人代表”张艺兴，音乐导师李荣浩，Rap导师王嘉尔、欧阳靖，舞蹈导师程潇、周洁琼加盟担任导师团队。节目已于2018年1月19日首播上线\r\n《偶像练习生》由总监制姜滨、总导演陈刚、视觉总监唐焱等业界大咖组成金牌制作团队共同打造，从国内外87家经纪公司、练习生公司的1908位练习生中推荐选拔100位练习生，在四个月中进行封闭式训练及录制，最终由全民票选出优胜9人，组成全新偶像男团出道。', '2018-07-26 08:42:06', '中国', '华语', 8.4),
(50, '奔跑吧兄弟第二季', 5, 8, '../news/uploads/综艺/11.jpg', '《奔跑吧兄弟第二季》是浙江卫视引进韩版《Running Man》推出的大型户外竞技真人秀节目，由浙江卫视和韩版《Running Man》制作团队韩国SBS电视台联合制作。节目共12期，第二季节目七位固定主持是邓超、Angelababy（杨颖）、李晨、陈赫、郑恺、王祖蓝、包贝尔。第一季固定主持王宝强因档期原因退出，包贝尔加入。\r\n《奔跑吧兄弟》每期节目有不同的主题，分为不同的队伍进行比赛，明星们需要根据各种线索来破解最终的谜题，最后获胜一方将获得称号或奖品。', '2018-07-26 08:42:54', '中国', '华语', 9.3),
(51, '热血街舞团', 5, 3, '../news/uploads/综艺/12.jpg', '《热血街舞团》是由《中国有嘻哈》原班人马倾力打造一档自制综艺节目。总监制爱奇艺高级副总裁陈伟，总导演车澈，音乐总监刘洲。\r\n节目旨在打造“super idol X super dance crew”概念，用最顶尖的编舞，为广大观众呈现最巅峰的街舞技术。', '2018-07-26 08:42:54', '中国', '华语', 8.3),
(52, '高能少年团第二季', 5, 8, '../news/uploads/综艺/13.jpg', '《高能少年团第二季》是浙江卫视推出的偶像对抗挑战真人秀，由浙江卫视战略发展中心核心主创人员与厚海文化、北文传媒等联合制作，战略发展中心监制，由王俊凯、董子健、杨紫、张一山、王大陆担任MC。\r\n节目以“一首歌，一座城”为核心线索，开展少年冒险挑战之旅。', '2018-07-26 08:43:53', '中国', '华语', 8.9),
(53, '王牌对王牌第三季', 5, 2, '../news/uploads/综艺/14.jpg', '《王牌对王牌第三季》是浙江卫视推出的大型原创室内竞技真人秀节目，由浙江卫视节目中心制作。节目共12期。王源、沈腾分任两队王牌队长，贾玲、欧阳娜娜分任两队王牌特工，沈涛担任主持人。\r\n节目每期围绕一个主题，邀请两支王牌团队，由两队固定队长各带领多名热门IP嘉宾进行PK对战，同时加入王牌特工角色，通过才艺比拼、游戏竞技，决出王牌中的王牌。', '2018-07-26 08:43:53', '中国', '华语', 8.5),
(54, '欢乐喜剧人', 5, 2, '../news/uploads/综艺/15.jpg', '《欢乐喜剧人》是一档由东方卫视以及欢乐传媒联合打造的全国首档明星喜剧竞赛真人秀节目。该节目从2015年4月25日起每周日21点05分在东方卫视播出。', '2018-07-26 08:44:23', '中国', '华语', 7.6),
(56, '铁核桃之无间风云', 1, 7, '../news/uploads/电视剧/2.jpg', '1946年底，国民党军在豫南地区包围了我解放军某独立团。为延缓敌人的进攻，确保人民群众安全转移，我情工人员决定用假情报迷惑敌人，邓远达和叶淑婷被派往郑州执行这项特殊任务，邓远达成功打入敌人内部，在叶淑婷的配合和帮助下，与情报处处长费思清为首的特务斗智斗勇，出色地完成了一个又一个任务。通过不断的战斗历练，邓远达日趋成熟，最终成长为一名出色的情报工作者。而他和叶淑婷之间，也由最初的难以沟通逐渐转变为相互了解、信任、相知、相爱。就在他们完成任务准备撤离的最后关头，叶淑婷英勇牺牲，邓远达在完成任务后，带着二人共同的理想，继续走向新的战场。', '2018-07-26 08:45:31', '中国', '华语', 7.3),
(58, '幸福照相馆', 1, 2, '../news/uploads/电视剧/4.jpg', '由王义明执导，高博编剧、林永健、左小青、王婉娟、徐佳领衔主演的年代情感剧。该剧讲述了一个叫幸福镇的小城里，一户普通家庭在生活中，喜怒哀乐的故事。', '2018-07-26 08:49:51', '中国', '华语', 8.1),
(59, '莽荒纪', 1, 8, '../news/uploads/电视剧/5.jpg', '盘古开天辟地直至三皇五帝之后，华夏大地诞生夏朝，在夏的疆域内，有一个叫做纪氏的古老家族，领主之子纪宁天赋秉然功夫超群。纪氏因发现矿脉而遭到一个叫雪龙山组织的觊觎，为了守护家族纪宁的父亲在战争中死去，纪氏几乎遭受灭顶之灾。从此纪宁开始逐步磨砺心性，为了守护家族和身边的人，他必须变得强大。他进入黑白学宫进行学习，在这里结识了志同道合的朋友，但他的强大也招来了发小纪农的嫉恨和暗算，纪宁后来了解到家族之仇背后是更大的阴谋：一个叫做无间门的神秘势力，意图挑起战争侵吞夏朝！纪宁历经种种艰险和磨难，终于成长为一个真正的强者，并且联和各方力量一起来守护夏朝安宁。', '2018-07-26 08:50:34', '中国', '华语', 6.7),
(60, '天意', 1, 7, '../news/uploads/电视剧/6.jpg', '秦末汉初，群雄逐鹿。空怀经天纬地之才却埋没民间的淮阴少年韩信，因缘际会遇到一名神秘黑衣人，称可借助神力帮韩信崛起，条件是只要韩信答应与他做一场交易。历史的车轮不断转动，秦始皇、刘邦、项羽、张良纷纷卷进权力纷争的核心，身处其中的韩信发现，王朝更替与权利交织的背后，竟有一股神秘的未知力量在操纵。', '2018-07-26 08:50:34', '中国', '华语', 7.2),
(61, '楼外楼', 1, 8, '../news/uploads/电视剧/7.jpg', '清道光二十八年，洪瑞堂在西湖桥畔创办了楼外楼。民国早年，洪家家道中落，楼外楼也被昔日好友肖翰干勾结军阀巧取豪夺。楼外楼第三代少东家洪顺森丢了祖业，轻生不成，远走他乡。迫于生计洪顺森进了丰裕楼做了伙计，深得老板高林贵的赏识，同时赢得了歌女春天的爱慕。天有不测风云，肖翰干不肯罢休，追杀洪顺森，高老板舍身相救，临终将女儿梅姑托付洪顺森。几经浩劫之后，妻子梅姑去世，洪顺森痛定思痛，与春天联手夺回楼外楼，并将其发扬光大。楼外楼虽名声远播，然生逢乱世，一波又一波的巨变让洪顺森的梦想遭受着考验。在经历了民国建立以及抗日战争的洗礼之后，楼外楼几经生死存活下来，而洪顺森的儿子也加入了中国共产党，投入到中国的解放事业中去。新中国成立之后，楼外楼更成为民族餐厅的骄傲。', '2018-07-26 08:52:03', '中国', '华语', 7.5),
(62, '誓言', 1, 3, '../news/uploads/电视剧/8.jpg', '抗日战争期间，背负家仇，痛恨日寇的数学天才言少白在机缘巧合中结识军官萧斯宇和小混混雷虎，结成异姓兄弟。一次战役中，萧斯宇头部进入弹片，影响了他作为“兵棋推演”专家的推演能力，于是找到言少白做自己的继任者。言少白利用自身的数学天分和萧斯宇的帮助，成为兵棋高手，经过小野一连串的审查，终于混入日军，和专家加藤博文合作完成“黑龙”计划的兵器系统研制，并且成功识破了日本人阴险的作战计划，扰乱了日军的精心部署。期间，言少白与韩依旋互生情愫，但因误会没能在一起，萧斯宇也因常年的伤病和积劳而身亡。三弟雷虎与日本人的合作越来越多，道路越走越偏，最后在两位哥哥的规劝之下回归正途，在营救韩依璇时牺牲。言少白与韩依旋化解了误会，成为终身的伴侣。', '2018-07-26 08:52:03', '中国', '华语', 8.6),
(63, '大牧歌', 1, 8, '../news/uploads/电视剧/9.jpg', '二十世纪五十年代末，阔家学子林凡清为了继承老师的遗业——畜种改良工作，不惜与恋人上海姑娘许静芝分别。许静芝为了爱情，历尽波折来到新疆，找到心上人时，已是在他的婚礼上。静芝明志不再婚嫁，收养了草原上的孩子茂草，不想竟是恋人林凡清与妻子红柳丢失的儿子。农村姑娘杨月亮赶来兵团与营长齐怀正完婚，齐怀正有苦难言，导致了杨月亮在他和心上人郑君之间的情感波折。为了事业，三个男人紧握双手。历经动荡和改革开放，种羊场两次面临解散的命运，为了保护良种羊的纯正，红柳、郑君和杨月亮先后献出了宝贵的生命。面对表白心意的许静芝，林凡清却不敢接纳，怕玷污了她纯洁的情感。下一代的几个孩子长大成人，分别收获了自己的事业和爱情，许静芝和林凡清也有情人终成眷属。', '2018-07-26 08:52:48', '中国', '华语', 8.4),
(64, '爱情的边疆', 1, 2, '../news/uploads/电视剧/10.jpg', '上个世纪50年代末，北京广播学院女大学生文艺秋爱上苏联功勋播音员维卡，并与之在北京结婚。苏联撤走专家后，维卡离开了中国。而文艺秋自愿来到边境城市黑河工作，担任电台播音员，就是为了离维卡近一些。后来，维卡也来到黑河对岸的布拉戈维申斯克担任播音员，他俩竟然通过倾听对方广播的声音抚慰痛楚，倾诉思念。经过20年的漫长等待，文艺秋无奈与同事宋邵山结婚。中苏关系好转以后，收音机里又传来了中苏友谊的歌曲，宋邵山也被他们的爱情故事打动，帮助文艺秋渡过窄窄的界江，与维卡见面。当暮年的文艺秋与维卡再次在北京见面的时候，彼此用播音语调再次倾诉思念，感动了在场的所有人。', '2018-07-26 08:52:48', '中国', '华语', 8.1),
(65, '上海女子图鉴', 1, 3, '../news/uploads/电视剧/11.jpg', '《上海女子图鉴》以罗海燕从家乡到上海打拼为引，讲述她怀揣坚定目标，在诱惑和困境中逆流向上，成长为独立自由人的选择故事。剧中，无处不在的光影艺术和镜头美学打下别致的“魔都”烙印，精致紧凑的影像浓缩了罗海燕从外来妹到职场精英的成长变迁：从弄堂到公寓，从自行车到轿车，从球鞋到高跟鞋，从集体格子间到个人办公室，达成所有“沪上异乡人”的理想蜕变。', '2018-07-26 08:53:39', '中国', '华语', 7.7),
(66, '我的青春遇见你', 1, 8, '../news/uploads/电视剧/12.jpg', '陈也和陈昆是兄弟，性格却大不相同一个是乐观开朗爱耍小聪明的“学渣”，一个是斯文怯懦一心向学的“学霸”。陈也从小生活在“你学学”的阴影中，练就了“金刚不坏”的厚脸皮，但骨子里却透着不服气。特别是连自己最喜欢的女神苏娜也成了弟弟陈昆的女友后，陈也暗下决心，一定要找一个更漂亮的媳妇，扬眉吐气。于是美丽任性还有点小迷糊的皮鞋售后员李招娣成了他的首选，陈也展开了猛烈攻势。几经波折，两人终于走进婚姻殿堂，却发现这“过日子”简直是天底下最难的事，两人内心都还是个没长大的孩子，于是两个人的婚姻变成了两家子的婚姻，再加上陈也得姐姐陈娟、弟弟陈昆、发小小陶、招娣的妹妹来娣各自感情生活的交织，一群不断努力的年轻人的多彩生活，正式拉开了序幕。铅华落尽，几经成长，最好的不一定是最对的；适合别人的不一定就适合自己。', '2018-07-26 08:53:39', '中国', '华语', 9.1),
(67, '飞虎之潜行极战', 1, 2, '../news/uploads/电视剧/13.jpg', '《飞虎之潜行极战》是由优酷与邵氏兄弟国际影业联手打造的警匪片，以香港飞虎队为主题，讲述了面对多宗香港以及跨国严重罪案，飞虎队员们将与匪徒斗智斗勇的故事。爆破、枪击、警匪间斗智斗力、荷枪实弹的场面惊险刺激，酷帅的打斗激动人心。高家朗是英勇的飞虎队员，而高家俊则是一个高级督察，同时也是高家朗同父异母的弟弟，两人不仅在工作中，情感上也是矛盾重重。性格迥异的两人一开始互相看不顺眼，在查案的过程中逐渐冰释前嫌。', '2018-07-26 08:54:25', '中国', '华语', 8.7),
(68, '凤囚凰', 1, 7, '../news/uploads/电视剧/14.jpg', '公元464年，刘子业即位，凶残暴戾，同母姐山阴公主刘楚玉，淫乐无度，门第无数。江湖第一帮派天机楼，欲推翻刘子业暴政，派长相酷似公主的女弟子楚玉，执行天机楼的命令，扶持刘彧新政。楚玉来到公主府，一边假装暴戾淫乱，一边培养心腹。并与门客容止相识，面对容止的帮助，楚玉暗生情愫。最后天机楼帮助刘彧夺位成功，刘子业被杀，真正的山阴也在叛乱中死去。虽然暴政被除，但楚玉厌倦权谋，不想回天机楼。容止出手相救，带着楚玉来到邻国。在邻国楚玉知道容止竟然是北魏皇太后的亲信，为了夺取南朝政权，潜伏在公主府忍辱负重。楚玉向容止表达爱意，容止选择了江山，楚玉伤心离开。容止其实也对楚玉用情至深，面对楚玉的毅然离开，最终还是选择楚玉，假扮观沧海，两人邻里而居。', '2018-07-26 08:54:25', '中国', '华语', 7.3),
(69, '远大前程', 1, 3, '../news/uploads/电视剧/15.jpg', '主人公洪三携母亲和好友齐林到上海投奔严华，卷入两大公司权利斗争。严华此时是一名码头工人，他不畏强权被推举为工人领袖。洪三则凭借机智多次在凶险的上海滩化险为夷。洪三与忠义之士沈达义结金兰，与来上海报父仇的林依依在斗智斗勇中成为莫逆，女扮男装的林依依爱上洪三。洪三接近富家女于梦竹，于梦竹爱上洪三。严华遇险，为共产党人李新力所救，加入共产党。林依依为报仇铤而走险，洪三与其奔走天涯。林依依遇难，洪三重回上海滩。在严华和李新力进步思想的感召下，洪三放弃来之不易的“美好生活”，为护送李新力离开上海倾其所有甚至生命。洪三逐渐懂得，共产党带领的这条道路，才是他所想追求的远大前程。', '2018-07-26 08:54:46', '中国', '华语', 8.5),
(70, '神级大魔头', 4, 7, '../news/uploads/小说/1.jpg', '“无耻夏平，抢我秘籍，夺我丹药，夺我未婚妻，我和你不共戴天。”\r\n　　“他是武道之耻，人类蛀虫，是人渣败类。”\r\n　　“无恶不作，连三岁小儿的棒棒糖也抢，老人过马路都不扶。”\r\n　　“四处惹是生非，各大家族的天才都被他殴打过，人神共愤啊。”\r\n　　炎黄星无数武道强者对夏平咬牙切齿，简直恨不得将其挫骨扬灰。\r\n　　而夏平面对这么多人的仇恨，淡定的拉出“超级仇恨系统”界面，看着上面各种好东西，摸了摸下巴：“都积攒到这么多仇恨值了，不知道是兑换圣品丹药混沌丹，还是绝世武学如来掌，或者是神器乾坤鼎，真是烦恼啊。”', '2018-07-26 08:56:03', '中国', '华语', 6.5),
(71, '宿主请留步', 4, 8, '../news/uploads/小说/2.jpg', '宿主请留步！系统还有三十秒抵达战场。\r\n故事，从苏洛玩炸了系统后，翻身兼职干系统开始。', '2018-07-26 08:56:03', '中国', '华语', 7.3),
(72, '无敌剑域', 4, 7, '../news/uploads/小说/3.jpg', '一人一剑一世界，杀，就要杀个尸横遍野，战，就要战一个巅峰不败！天是用来做什么的？杨叶：自然是用来逆的。', '2018-07-26 08:56:47', '中国', '华语', 7.1),
(73, '雪中悍刀行', 4, 2, '../news/uploads/小说/4.jpg', '江湖是一张珠帘.\r\n大人物小人物,是珠子,大故事小故事,是串线.\r\n情义二字,则是那些珠子的精气神', '2018-07-26 08:56:47', '中国', '华语', 8.6),
(74, '彪悍的人生', 4, 3, '../news/uploads/小说/5.jpg', '我叫林凡，我有一个百科全书，我啥都会一点点。 书名都这么彪悍了，简介还写个啥子哦。', '2018-07-26 08:57:49', '中国', '华语', 7.2),
(75, '天骄战纪', 4, 2, '../news/uploads/小说/6.jpg', '大千世界中，一个名叫林寻的少年，独自从矿山牢狱中走出，掌御灵纹，心通万古，踏上了一条古今未有的传奇之路。', '2018-07-26 08:57:49', '中国', '华语', 8.2),
(76, '老衲要还俗', 4, 8, '../news/uploads/小说/7.jpg', '人间百态，万千神通，不过一山，一寺，一和尚而已。', '2018-07-26 08:58:33', '中国', '华语', 8.7),
(77, '轮回乐园', 4, 7, '../news/uploads/小说/8.jpg', '苏晓与轮回乐园签订契约，穿梭在各个动漫世界内执行任务。喰种世界，苏晓手持利刃追杀独眼枭•高槻泉十几条街区。顶上战场，苏晓站在海军的尸堆上，遥望处刑台上脸色难看的战国，以及目瞪口呆的艾斯。众契约者：“你特么是不是开了挂，你根本不是契约者吧，你绝对是原著里的隐藏人物！”苏晓当然不是普通契约者，他是猎杀者……', '2018-07-26 08:58:33', '中国', '华语', 9.2),
(78, '逍遥小书生', 4, 3, '../news/uploads/小说/9.jpg', '21世纪工科男，穿越古代成为一名穷书生。\r\n大脑里面居然装着一个图书馆，各种知识应有尽有！这辈子不说封侯拜相，怎么也得当个大官玩玩吧？\r\n迎着初升的朝阳，李易发下宏愿，勇敢的迈出了在这个世界的第一步。\r\n“站住！”\r\n高头大马之上，一绝色女子身着劲装，细细打量一番，素手轻挥：“绑了！”\r\n身后的凶恶山贼一涌而上……\r\n洞房花烛夜，看着推门进来的绝色女子……李易的宏愿发生了小小的改变。\r\n官居一品，算什么？\r\n封侯拜相，没意思！\r\n我可是要成为山贼王------的男人！', '2018-07-26 08:59:26', '中国', '华语', 8.3),
(79, '异世界的美食家', 4, 3, '../news/uploads/小说/10.jpg', '在武者举手可裂山川，甩腿可断长河的玄幻世界中，存在着这样一家小餐馆。 　　小餐馆不大，但却是无数顶尖强者趋之若鹜之地。 　　在那儿你可以品尝到用凤凰蛋和龙血米炒成的蛋炒饭。 　　在那儿你可以喝到生命之泉配朱果酿制的烈酒。 　　在那儿你可以吃到九阶圣兽肉配上黑胡椒的烤肉。 　　什么你想把厨师掳回家？不可能，因为餐馆门口趴着一只看门的十阶神兽，地狱犬。 　　哦，那个厨师还有一个可以单手捏死九品至尊的铁疙瘩助手和一群被征服了胃的疯狂女人。', '2018-07-26 08:59:26', '中国', '华语', 7.7);

-- --------------------------------------------------------

--
-- 表的结构 `newstype`
--

DROP TABLE IF EXISTS `newstype`;
CREATE TABLE IF NOT EXISTS `newstype` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类型id',
  `type` varchar(10) NOT NULL COMMENT '类型名称  最多十位',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `newstype`
--

INSERT INTO `newstype` (`type_id`, `type`) VALUES
(1, '电视剧'),
(2, '电影'),
(3, '动漫'),
(4, '小说'),
(5, '综艺');

-- --------------------------------------------------------

--
-- 表的结构 `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `role_id` int(1) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role` varchar(4) NOT NULL COMMENT '角色名称',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `role`
--

INSERT INTO `role` (`role_id`, `role`) VALUES
(1, '管理员'),
(2, '编辑'),
(3, '用户');

-- --------------------------------------------------------

--
-- 表的结构 `route`
--

DROP TABLE IF EXISTS `route`;
CREATE TABLE IF NOT EXISTS `route` (
  `route_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '节点id',
  `route_addr` varchar(50) NOT NULL COMMENT '节点地址',
  `route_name` varchar(10) NOT NULL COMMENT '节点名称',
  PRIMARY KEY (`route_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `route`
--

INSERT INTO `route` (`route_id`, `route_addr`, `route_name`) VALUES
(1, '/page/login.php', '登录'),
(2, '/page/registe.php', '注册'),
(3, '/page/homePage.php', '主页'),
(4, '/page/portition.php', '分区'),
(5, '/page/detaile.php', '详情'),
(6, '/page/usrInfo.php', '用户信息'),
(7, '/page/infoUpdate.php', '信息修改'),
(8, '/page/logout.php', '登出');

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id  唯一标识用户',
  `role_id` int(1) NOT NULL COMMENT '角色id',
  `nickname` varchar(20) NOT NULL COMMENT '用户昵称  最多20位',
  `account` varchar(11) NOT NULL COMMENT '用户账号',
  `password` varchar(15) NOT NULL COMMENT '用户密码  最多15位',
  `age` int(3) DEFAULT NULL COMMENT '用户年龄 最大三位',
  `sex` int(2) DEFAULT NULL COMMENT '用户性别',
  `head_pic` varchar(50) DEFAULT NULL COMMENT '用户头像地址',
  `signature` varchar(20) DEFAULT NULL COMMENT '用户个性签名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `role_id`, `nickname`, `account`, `password`, `age`, `sex`, `head_pic`, `signature`) VALUES
(1, 1, '管理员', 'admin', '123', NULL, NULL, NULL, NULL),
(2, 2, '张三', '张三', '123', 28, 1, '../user/uploads/t01cf98ecec5393f9d6.jpg', '1234'),
(3, 2, '李四', '李四', '123', 23, 2, '../user/uploads/t016fba19a080d968f5.jpg', 'lalala\r\nlalala'),
(4, 3, '花田错_', '3016', '123', 22, 1, '../user/uploads/t017e8c6e5887752ef3.jpg', 'PHP赛高！！！'),
(5, 3, '一条乐_', '3018', '123', 23, 1, '../user/uploads/b4.jpg', '霓虹国在哪？？？？'),
(6, 3, '雷姆我老婆', '3019', '123', 20, 1, '../user/uploads/t013658e41e8c191970.jpg', '艾米莉亚小碧池~~~'),
(7, 2, '王五', '王五', '123', 24, 2, '../user/uploads/Koala.jpg', '666666'),
(8, 2, '赵六', '赵六', '123', 26, 1, '../user/uploads/01.jpg', '');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
