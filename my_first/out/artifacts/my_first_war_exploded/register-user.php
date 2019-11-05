<?php
require_once('msqConnet.php');
$userId=$_POST['userId'];
$userPwd=md5($_POST['userPwd']);
$userEmail=$_POST['userEmail'];

echo ($userId.$userEmail.$userPwd);
$randId = rand(100000000000,9999999999999);
$timeparts = explode(" ",microtime());
$currenttime = bcadd(($timeparts[0]*1000),bcmul($timeparts[1],1000));
$realId = $randId + $currenttime;
echo $realId;
$userLogName=md5($userId);

$sql="INSERT INTO `appUser` ( userId,userPwd,userEmail,rgTime,userName ) VALUES ( '$realId','$userPwd','$userEmail','$userId','$userId' );";
$sql2="INSERT INTO `appLog` ( userPwd,userName ) VALUES ( '$userPwd','$userLogName' );";
$mysqli->query($sql2);
$sql3="INSERT INTO `userValue` ( username,userid) VALUES ('$userId','$realId')";
$mysqli->query($sql3);
if ($mysqli->query($sql) === TRUE) {
    echo "<script>alert('Register successfully!');location.href='index.php';</script>";
} else {
    echo "Error: " . $sql . "<br>" . $mysqli->error;
}


?>