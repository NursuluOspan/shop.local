<?php

session_start(); //стартуем сессию

// Если в сессии нет массива корзины, то создаем его
if (!isset($_SESSION['cart'])) {
    $_SESSION['cart'] = array();
}
include_once  '../config/config.php';//Инициализация настроек
include_once '../config/db.php'; //Инициализация базы данных
include_once  '../library/mainFunctions.php';//Основные функции

//определяем с каким контроллером будем работать
$controllerName = isset($_GET['controller'])? ucfirst($_GET['controller']) : 'Index';
//echo 'Подключаемый php  файл (Контроллер) = ' .$controllerName . '<br/>';

//Определяем с какой функцией будем работать
$actionName = isset($_GET['action']) ? $_GET['action'] : 'index';

//echo 'Функция формирующую страницу(Экшн) = ' . $actionName . '<br/>';

//подключаем контроллер
//include_once '../controllers/' . $controllerName . 'Controller.php';

//Формирурем название функции
//$function = $actionName . 'Action';
//echo 'Полное название вызываемой функции = ' . $function . '<br/>';

//Вызов функции
//$function();

//константы для обращения к контроллерам
//define('PathPrefix', '../controllers/');
//define('PathPostfix', 'Controller.php');

//загрузка страницы
//function loadPage($controllerName, $actionName = 'index') {
//    include_once PathPrefix . $controllerName . PathPostfix;
//    $function = $actionName . 'Action';
//    $function();
//}

// Если в сессии есть данные об авторизованном пользователе, то передаём
// их в шаблон
if(isset($_SESSION['user'])) {
    $smarty->assign('arUser', $_SESSION['user']);
}




// Инициализируем переменную шаблонизатора количества элементов в корзине
$smarty->assign('cartCntItems', count($_SESSION['cart']));

loadPage($smarty, $controllerName, $actionName);