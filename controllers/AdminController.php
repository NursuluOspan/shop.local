<?php
/**
 * AdminController.php
 *
 * Контроллер бэкенда сайта(/admin/)
 */

//подключаем модели
include_once '../models/CategoriesModel.php';
include_once '../models/ProductsModel.php';
include_once '../models/OrdersModel.php';
include_once '../models/PurchaseModel.php';
include_once '../models/UsersModel.php';


$smarty->setTemplateDir(TemplateAdminPrefix);
$smarty->assign('teplateWebPath', TemplateAdminWebPath);

function indexAction($smarty) {

    //получить все главные категории
//    $rsCategories = getAllMainCategories();

  //  $smarty->assign('rsCategories', $rsCategories);
    $smarty->assign('pageTitle', 'Управление сайтом');
    loadTemplate($smarty, 'adminHeader');
    loadTemplate($smarty, 'admin');
    loadTemplate($smarty, 'adminFooter');

}
