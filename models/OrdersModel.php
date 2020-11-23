<?php
/**
 * Модель для таблицы заказов
 */

/**
 * Создание заказа (без привязки товара)
 *
 * @param string $name
 * @param string $phone
 * @param string $address
 * @return integer ID созданного заказа
 */
function makeNewOrder($name, $phone, $address) {

    //>Инициализация переменных
    $userId = $_SESSION['user']['id'];

    $comment = "id пользователя: {$userId}<br/>
                Имя: {$name}<br/>
                Тел: {$phone}<br/>
                Адрес: {$address}";

    $dateCreated = date('Y.m.d. H:i:s');
    $userIp = $_SERVER['REMOTE_ADDR'];
    //<

    // формирование запроса к БД
    $sql = "INSERT INTO orders (`user_id`, `date_created`, `date_payment`, `status`, `comment`, `user_ip`)
            VALUES ('{$userId}', '{$dateCreated}', null, '0', '{$comment}', '{$userIp}')";
    $rs = db()->query($sql);
  
    // Получить id созданного заказа
    if($rs) {
        $sql = "SELECT id FROM orders ORDER  BY id DESC LIMIT 1";
        $rs = db()->query($sql);
        //преобразование результатов запроса
        $rs = createSmartyRsArray($rs);

        //возвращаем id созданного запроса
        if(isset($rs[0])) {
            return $rs[0]['id'];
        }
    }

    return false;
}

/**
 * Получить список заказов с привязкой к продуктам для пользоватля $userId
 *
 * @param integer $userId ID пользователя
 * @return array массив заказов с привязкой к продуктам
 */
function getOrdersWithProductsByUser($userId) {

    $userId = intval($userId);
    $sql = " SELECT * FROM orders WHERE `user_id` = '{$userId}'
             ORDER BY id DESC";

    $rs = db()->query($sql);

    $smartyRs = array();
    while ($row = mysqli_fetch_assoc($rs)) {
        $rsChildren = getPurchaseForOrder($row['id']);

        if($rsChildren) {
            $row['children'] = $rsChildren;
            $smartyRs[] = $row;
        }
    }

    return $smartyRs;
}

function getPurchaseForOrder($orderId) {

    $orderId = intval($orderId);

    $sql = "SELECT `pe` .*, `ps` . `name` FROM purchase as `pe`
            JOIN products as `ps` ON `pe` .product_id = `ps` .id
            WHERE `pe` .order_id = {$orderId}";

    $rs = db()->query($sql);
    return createSmartyRsArray($rs);
}

function getOrders() {

    $sql = "SELECT o.*, u.name, u.email, u.phone, u.address FROM orders AS `o`
            LEFT JOIN users AS `u` ON o.user_id = u.id ORDER BY id DESC";

    $rs = db()->query($sql);

    $smartyRs = array();

    while ($row = mysqli_fetch_assoc($rs)) {
        $rsChildren = getProductsForOrder($row['id']);

        if ($rsChildren) {
            $row['children'] = $rsChildren;
            $smartyRs[] = $row;
        }
    }

    return $smartyRs;
}

/**
 * Получить продукты заказа
 *
 * @param  integer $orderId ID заказа
 * @return array массив данных товаров
 */
function getProductsForOrder($orderId) {

    $orderId = intval($orderId);

    $sql = "SELECT * FROM purchase AS pe LEFT JOIN products AS ps 
            ON pe.product_id = ps.id WHERE (`order_id` = '{$orderId}')";

    $rs = db()->query($sql);
    return createSmartyRsArray($rs);

}

function updateOrderStatus($itemId, $status) {

    $status = intval($status);

    $sql = "UPDATE orders SET `status` = '{$status}'
            WHERE id = '{$itemId}'";

    $rs = db()-> query($sql);

    return $rs;
}

/**
 * Обновление формы оплаты заказа
 * @param $itemId
 * @param $datePayment Дата заказа
 * @return  массив заказа
 */
function updateOrderDatePayment($itemId, $datePayment) {
    
    $sql = " UPDATE orders SET `date_payment` = '{$datePayment}'
            WHERE id = '{$itemId}'";

    $rs = db()->query($sql);

    return $rs;
}


