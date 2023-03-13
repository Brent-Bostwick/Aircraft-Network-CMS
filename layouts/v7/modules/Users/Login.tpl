{*+**********************************************************************************
* The contents of this file are subject to the vtiger CRM Public License Version 1.1
* ("License"); You may not use this file except in compliance with the License
* The Original Code is: vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
************************************************************************************}
{* modules/Users/views/Login.php *}

{assign var="_DefaultLoginTemplate" value=vtemplate_path('Login.Default.tpl', 'Users')}
{assign var="_CustomLoginTemplate" value=vtemplate_path('Login.Custom.tpl', 'Users')}
{assign var="_CustomLoginTemplateFullPath" value="layouts/vlayout/$_CustomLoginTemplate"}


{include file=$_CustomLoginTemplate}