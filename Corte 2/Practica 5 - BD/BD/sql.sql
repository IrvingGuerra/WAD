DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `place` varchar(255) NOT NULL,
  `times` varchar(255) NOT NULL,
  `age` varchar(255) NOT NULL,
  `semestre` varchar(255) NOT NULL,
  `curp` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

