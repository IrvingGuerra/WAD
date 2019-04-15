
CREATE TABLE `intercambio` (
  `id_intercambio` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `tipo` varchar(255) NOT NULL,
  `costo` varchar(255) NOT NULL,
  `date_a` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `comentarios` varchar(255) NOT NULL,
  `clave` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


CREATE TABLE `intercambio_mix` (
  `id` int(11) NOT NULL,
  `id_intercambio` int(11) NOT NULL,
  `random` varchar(25000) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


CREATE TABLE `invitados` (
  `id` int(11) NOT NULL,
  `id_intercambio` int(11) NOT NULL,
  `email_user` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'noaceptado'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;


ALTER TABLE `intercambio`
  ADD PRIMARY KEY (`id_intercambio`);

ALTER TABLE `intercambio_mix`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `invitados`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `intercambio`
  MODIFY `id_intercambio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `intercambio_mix`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `invitados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;

ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
COMMIT;
