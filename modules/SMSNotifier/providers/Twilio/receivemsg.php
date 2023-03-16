<?php
// Get the PHP helper library from twilio.com/docs/php/install
require_once 'autoload.php'; // Loads the library
use Twilio\Rest\Client;

// Your Account Sid and Auth Token from twilio.com/user/account
$account_sid = 'AC920e7783077c547f9a25a76fa86c73c6';
$auth_token = 'dbda880387d350361613b7f4a91e5753';
$client = new Client($account_sid, $auth_token);

// Loop over the list of messages and echo a property for each one
foreach ($client->messages->read() as $message) {
	if($message->direction == 'inbound'){
		print_r($message);
    }
}
