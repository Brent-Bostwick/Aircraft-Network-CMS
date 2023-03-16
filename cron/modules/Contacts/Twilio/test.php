<?php
// Required if your environment does not handle autoloading
require 'autoload.php';

// Use the REST API Client to make requests to the Twilio REST API
use Twilio\Rest\Client;

// Your Account SID and Auth Token from twilio.com/console
$account_sid = 'AC920e7783077c547f9a25a76fa86c73c6';
$auth_token = 'dbda880387d350361613b7f4a91e5753';
$client = new Client($account_sid, $auth_token);

// Use the client to do fun stuff like send text messages!
$client->messages->create(
    // the number you'd like to send the message to
    '+16308618263',
    array(
        // A Twilio phone number you purchased at twilio.com/console
        'from' => '+16462170981',
        // the body of the text message you'd like to send
        'body' => 'fine'
    )
);
