<?php
require 'js/Slim/Slim.php';
\Slim\Slim::registerAutoloader();
$app = new \Slim\Slim();

class User {
  public $id = 0;
  public $firstName = "";
  public $lastName = "";
  public $email = "";
}

function getUsers() {
  //console.log('in get users');
  $users = array();
  $db = new PDO('mysql:host=127.0.0.1;dbname=Golf;charset=utf8', 'golf', 'golf');
  foreach($db->query('SELECT id, email, firstName, lastName FROM User;') as $row) {
    //console.log("Found a user");
    $user = new User();
    $user->id = $row['id'];
    $user->email = $row['email'];
    $user->firstName = $row['firstName'];
    $user->lastName = $row['lastName'];
    $users[] = $user;
  }
  header("Content-Type: application/json");
  //console.log("getUsers done");
  echo json_encode($users);
}

function getUser($id) {
  openlog("golf", LOG_PID | LOG_PERROR, LOG_LOCAL0);
  syslog(LOG_WARNING, "getUser: $id");
  // Get the User with id = $id from the database
  $db = new PDO('mysql:host=127.0.0.1;dbname=Golf;charset=utf8', 'golf', 'golf');
  $sth = $db->prepare('SELECT id, email, firstName, lastName FROM User WHERE id = :id LIMIT 1');
  $sth->bindParam(':id', $id, PDO::PARAM_INT);
  $sth->execute();
  $user = new User();
  if ($sth->rowCount() == 1) {
    $row = $sth->fetch();
    $user->id = $row['id'];
    $user->email = $row['email'];
    $user->firstName = $row['firstName'];
    $user->lastName = $row['lastName'];
  }
  header("Content-Type: application/json");
  echo json_encode($user);
}

// GET route
$app->get('/users', 'getUsers');
$app->get('/user/:id', function($id) {
   getUser($id);
});

// Step 4: Run the Slim application
$app->run();
