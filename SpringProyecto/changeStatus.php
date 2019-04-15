<?php
require("local.php");
$id  = isset($_GET["id"]) ? $_GET["id"] : NULL;
$response = new stdClass();
if(!empty($id)){
    if($result = $link->query("UPDATE invitados SET status='aceptado' WHERE id='$id'")){
      $response->info="updated";
      echo "<script languaje='javascript' type='text/javascript'>window.close();</script>";
      echo json_encode($response);
    }else{
   	  echo "<script languaje='javascript' type='text/javascript'>window.close();</script>";
      $response->info="errorSQL";
      echo json_encode($response);
    }
}else{
	$response->info="missData";
	echo json_encode($response);
}
?>