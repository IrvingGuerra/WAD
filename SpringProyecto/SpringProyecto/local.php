<?php
date_default_timezone_set('America/Mexico_City');

//VALORES PARA LA CONEXION DE HOST
define("HOSTING","idev4u.com");
define("USER","idevucom");
define("PASS","190997Tsukune");
define("DB","idevucom_web_aplication_dev");

//SQL tables
$link = mysqli_connect(HOSTING,USER,PASS,DB);

if (!$link){
    echo "{\"Server_error_SQL\":\"".mysqli_connect_error()."\"}";
    exit;
}

$link->query("SET NAMES 'utf8'");
$link->query("SET CHARACTER SET 'utf8'");

?>
