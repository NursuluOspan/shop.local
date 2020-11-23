<?php /* Smarty version Smarty-3.1.6, created on 2020-11-22 10:02:10
         compiled from "../views/default\header.tpl" */ ?>
<?php /*%%SmartyHeaderCode:95724f68d95829a6e4-54800566%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '9797888b337e03f99b06385b60a372bbb52d5e02' => 
    array (
      0 => '../views/default\\header.tpl',
      1 => 1606035717,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '95724f68d95829a6e4-54800566',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.6',
  'unifunc' => 'content_4f68d95849501',
  'variables' => 
  array (
    'pageTitle' => 0,
    'teplateWebPath' => 0,
  ),
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_4f68d95849501')) {function content_4f68d95849501($_smarty_tpl) {?><html>
    <head>
        <title><?php echo $_smarty_tpl->tpl_vars['pageTitle']->value;?>
</title>
		
        <link rel="stylesheet" href="<?php echo $_smarty_tpl->tpl_vars['teplateWebPath']->value;?>
css/main.css" type="text/css" />

          <!-- Свои файлы -->
    <script type="text/javascript" src="/js/jquery-1.7.1.min.js"></script>
    <script type="text/javascript" src="/js/main.js"></script>
    </head>    
<body>
	<div id="header">
		</br>
            <a href="http://myshop.local:8079/"> <img class="logo img-repponsive" src="https://enio.kz/img/magazin-ukrashenij-logo-1539940539.jpg" alt="ENIO.KZ"></a>
           </br>
	</div>
	
	
 <?php echo $_smarty_tpl->getSubTemplate ('leftcolumn.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, null, null, array(), 0);?>
   	

	
<div id="centerColumn">

	
<?php }} ?>