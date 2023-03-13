{*<!--
/*********************************************************************************
** The contents of this file are subject to the vtiger CRM Public License Version 1.0
* ("License"); You may not use this file except in compliance with the License
* The Original Code is:  vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
*
********************************************************************************/
-->*}
{strip}
    <!DOCTYPE html>
    <html>
    <head>
        <title>Complete Crewing</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        {*<link rel="SHORTCUT ICON" href="../favicon.ico">*}
        <link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700' rel='stylesheet' type='text/css'>

        <link rel="stylesheet" href="libraries/css/reset.css"> <!-- CSS reset -->
        <link rel="stylesheet" href="libraries/css/style.css"> <!-- Gem style -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <link rel="stylesheet" href="libraries/css/custom.css"> <!-- Gem style -->
        <script src="libraries/jquery/main.js"></script>
        <script src="libraries/jquery/jquery.min.js"></script>
        {*<link href="libraries/bootstrap/css/bootstrap.min.css" rel="stylesheet">*}
        {*<link href="libraries/bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">*}
        {*<script src="libraries/jquery/jquery.min.js"></script>*}
        {*<script src="libraries/jquery/boxslider/respond.min.js"></script>*}
        <link rel="stylesheet" href="login/css/reset.css"> <!-- Gem style -->
        <link rel="stylesheet" href="login/css/style.css"> <!-- Gem style -->
        <link rel="stylesheet" href="login/css/custom.css"> <!-- Gem style -->
    </head>
    <style>
        .login-box {
            background-color: #fff;
            box-shadow: 0 1px 10px rgba(0, 0, 0, 0.3), 0 0 40px rgba(0, 0, 0, 0.1) inset;
            border-radius: 4px;
            text-align: left;
            padding: 20px;
            width: 450px;
            height: 284px;
            border: 1px solid #ddd;
        }
    </style>
    <body>
    <div class="cd-user-modal is-visible"> <!-- this is the entire modal form, including the background -->
        <div class="cd-user-modal-container"> <!-- this is the container wrapper -->
            <ul class="cd-switcher boxTitle">
                <li><a class="selected page-title" href="#0" style="font-size: 28px; font-weight: bold; letter-spacing: 0.4px;">Sign In</a></li>
                <li><div class="arrow-up" style="margin-left:45%"></div></li>
            </ul>


            <div id="cd-login-header" class="is-selected"> <!-- log in form -->
                <div style="padding: 2em;">
                        <span class="headbar headerlogo">
                            <a>
                                <img src="login/img/logo.png" alt="lvenergysystems" width="250" >
                            </a>
                        </span>
                </div>
            </div>
            <div id="cd-login" class="is-selected"> <!-- log in form -->
                <form class="cd-form" action="index.php?module=Users&action=Login" method="post">
                    <p class="fieldset">
                        <label class="image-replace cd-username" for="signin-email1">Enter Username</label>
                        <input class="full-width has-padding has-border" id="signin-email1" type="text" placeholder="Enter Username" name="username" value="">
                        <!--                            <span class="cd-error-message">Error message here!</span>-->
                    </p>

                    <p class="fieldset">
                        <label class="image-replace cd-password" for="signin-password1">Enter Password</label>
                        <input class="full-width has-padding has-border" id="signin-password1" type="password"  placeholder="Enter Password" name="password" value="">
                        <span class="cd-error-message">Error message here!</span>
                    </p>

                    <p class="fieldset">
                        <input class="full-width" type="submit" value="Sign In   >">
                    </p>

                    <p class="cd-form-bottom-message right" id="forgotPassword">
                        <a href="javascript:void(0);">Forgot Password?</a>
                        <!-- <a href="signup.php" style>Create new account</a> -->
                    </p>
                    <!-- <a href="#0" class="cd-close-form">Close</a> -->
                </form>
            </div> <!-- cd-login -->

            <div id="cd-reset-password"> <!-- reset password form -->
                <p class="cd-form-message">Lost your password? Please enter your email address. You will receive a link to create a new password.</p>

                <form class="cd-form" id="forgotPassword" method="post" action="forgotPassword.php" >
                    <p class="fieldset">
                        <label class="image-replace cd-username" for="signin-email2">Enter Username</label>
                        <input class="full-width has-padding has-border" id="signin-email2" type="text" placeholder="Enter Username" name="username" value="">
                        <!--                            <span class="cd-error-message">Error message here!</span>-->
                    </p>

                    <p class="fieldset">
                        <label class="image-replace cd-password" for="signin-password2">Enter Password</label>
                        <input class="full-width has-padding has-border" id="signin-password2" type="email"  placeholder="Email" name="emailId" value="">
                        <span class="cd-error-message">Error message here!</span>
                    </p>

                    <p class="fieldset">
                        <input class="full-width" type="submit" value="Sign In   >">
                    </p>

                    <p class="cd-form-bottom-message right" id="forgotPassword">
                        <a href="javascript:void(0);">Forgot Password?</a>
                        <!-- <a href="signup.php" style>Create new account</a> -->
                    </p>
                    <div  class="modal-center">
                        <a class="modal-center-text" href="index.php" >Back to log-in</a>
                    </div>
                </form>

                <!--                    <p class="cd-form-bottom-message"><a href="#0">Back to log-in</a></p> -->
            </div> <!-- cd-reset-password -->
            <a href="#0" class="cd-close-form">Close</a>
        </div> <!-- cd-user-modal-container -->
    </div> <!-- cd-user-modal -->
    </body>
    <script>
        jQuery(document).ready(function () {
            jQuery("#forgotPassword a").click(function () {
                jQuery("#cd-login").removeClass("is-selected");
                jQuery("#cd-reset-password").addClass("is-selected");
            });

            jQuery("#backButton a").click(function () {
                jQuery("#cd-reset-password").removeClass("is-selected");
                jQuery("#cd-login").addClass("is-selected");
            });

            jQuery("input[name='retrievePassword']").click(function () {
                var username = jQuery('#user_name').val();
                var email = jQuery('#emailId').val();

                var email1 = email.replace(/^\s+/, '').replace(/\s+$/, '');
                var emailFilter = /^[^@]+@[^@.]+\.[^@]*\w\w$/;
                var illegalChars = /[\(\)\<\>\,\;\:\\\"\[\]]/;

                if (username == '') {
                    alert('Please enter valid username');
                    return false;
                } else if (!emailFilter.test(email1) || email == '') {
                    alert('Please enater valid email address');
                    return false;
                } else if (email.match(illegalChars)) {
                    alert("The email address contains illegal characters.");
                    return false;
                } else {
                    return true;
                }

            });
        });
    </script>
    </html>
{/strip}