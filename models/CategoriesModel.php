<?php

/**
Модель для таблицы категорий(categories)
 */

/**
 *  Получить дочернии категории для категории $catId
 *
 * @param integer $catId ID категории
 *
 * @return array массив дочерних категорий
 */
function getChildrenForCat($catId) {
    $sql ="SELECT * FROM categories WHERE  parent_id = '{$catId}'";

    $rs = db()->query($sql);

    return createSmartyRsArray($rs);
}
/**
 * Получить главные категории с привязками дочерних
 *
 * @return array иассив категорий
 */
function getAllMainCatsWithChildren() {
    
    $sql = 'SELECT * FROM categories WHERE `parent_id` = 0';

    $rs = db()->query($sql);
   
   $smartyRs = array();
    while($row = mysqli_fetch_assoc($rs)) {

        $rsChildren = getChildrenForCat($row['id']);
         if ($rsChildren) {
            $row['children'] = $rsChildren;
        }
        $smartyRs[] = $row;
   }

    return $smartyRs;
}


/**
 * Получить данные категории по id
 *
 * @param integer $catId ID категории
 * @return array массив - строка категории
 */
function getCatById($catId) {

    $catId = intval($catId);

    $sql = "SELECT * FROM `categories` WHERE `id` = '{$catId}'";

    $rs = db()->query($sql);

    return mysqli_fetch_assoc($rs);
}

/**
 * Получить все главные категории (категорий, которые не являются дочерними)
 * @return  array массив категорий
 */
function getAllMainCategories() {

    $sql = "SELECT * FROM categories WHERE parent_id = 0";

    $rs = db()->query($sql);

    return createSmartyRsArray($rs);
}


/**
 * Получить все категории
 *
 * @return array массив категорий
 */
function getAllCategories() {
    $sql = "SELECT * FROM categories ORDER BY parent_id ASC";

    $rs = db()->query($sql);

    return createSmartyRsArray($rs);
}


