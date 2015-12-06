<?php
/**
 * Step 1: Require the Slim Framework
 *
 * If you are not using Composer, you need to require the
 * Slim Framework and register its PSR-0 autoloader.
 *
 * If you are using Composer, you can skip this step.
 */
require 'js/Slim/Slim.php';

\Slim\Slim::registerAutoloader();

/**
 * Step 2: Instantiate a Slim application
 *
 * This example instantiates a Slim application using
 * its default settings. However, you will usually configure
 * your Slim application now by passing an associative array
 * of setting names and values into the application constructor.
 */
$app = new \Slim\Slim();

/**
 * Step 3: Define the Slim application routes
 *
 * Here we define several Slim application routes that respond
 * to appropriate HTTP request methods. In this example, the second
 * argument for `Slim::get`, `Slim::post`, `Slim::put`, `Slim::patch`, and `Slim::delete`
 * is an anonymous function.
 */

class User {
  public $firstName = "";
  public $lastName = "";
}

function getUsers() {
  $u1 = new User();
  $u1->firstName = 'Carl';
  $u1->lastName = 'Cherry';
  $u2 = new User();
  $u2->firstName = "Andrew";
  $u2->lastName = "R.V. Cherry";
  header("Content-Type: application/json");
  $users = array($u1, $u2);
  echo json_encode($users);
}

function getUser($id) {
  $u1 = new User();
  $u1->firstName = 'UserId=1';
  $u1->lastName = 'Cherry';
  header("Content-Type: application/json");
  echo json_encode($u1);
}

// GET route
$app->get('/users', 'getUsers');
$app->get('/user/:id', function($id) {
   getUser($id);
});

// POST route
$app->post('/post', function () {
        echo 'This is a POST route';
    }
);

// PUT route
$app->put('/put', function () {
        echo 'This is a PUT route';
    }
);

// PATCH route
$app->patch('/patch', function () {
    echo 'This is a PATCH route';
});

// DELETE route
$app->delete('/delete', function () {
        echo 'This is a DELETE route';
    }
);

// Step 4: Run the Slim application
$app->run();
