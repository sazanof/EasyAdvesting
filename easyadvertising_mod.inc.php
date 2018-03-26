<?php
if(IN_MANAGER_MODE!='true' && !$modx->hasPermission('exec_module')) die('ERROR');
define('FOLDER','assets/modules/easyadvertising/');
require_once MODX_BASE_PATH.FOLDER.'classes/Adversting.php';
$adv = new Adversting($modx);
$content = '';
$records = $adv->getAllRecords();
$edit = $_GET['edit'];
$add = $_GET['add'];
$vars = array(
    'pagetitle'=>'Список рекламных кампаний',
    'url'=>MODX_MANAGER_URL,
    'message'=>'',
    'mod_url'=>MODX_MANAGER_URL.'index.php?a='.$_GET['a'].'&id='.$_GET['id']
);
if($add == true){
    $content .= $adv->getTemplate('formAdvAdd.tpl',false);
    //print_r($modx->placeholders);
    $vars['pagetitle']='Создание записи';
    if ($_POST['save']==1){
        if ($_POST['description']=='' or $_POST['link']=='' or $_POST['content']==''){
            $vars['message'] = '<div class="alert alert-danger">Необходимо заполнить описание, ссылку и баннер</div>';
        }
        else {
            $data = array(
                'description'=>$modx->db->escape($_POST['description']),
                'link'=>$modx->db->escape($_POST['link']),
                'published'=>$modx->db->escape($_POST['published']),
                'counted'=>$modx->db->escape($_POST['counted']),
                'jump_counted'=>$modx->db->escape($_POST['jump_counted']),
                'content'=>$modx->db->escape($_POST['content']),
                'total_view'=>$modx->db->escape($_POST['total_view']),
                'total_jump'=>$modx->db->escape($_POST['total_jump']),
                'pub_date'=>strtotime($_POST['pub_date']),
                'unpub_date'=>strtotime($_POST['unpub_date']),
                'area'=>$modx->db->escape($_POST['area'])
            );
            if($adv->insertData($data)){
                $vars['message'] = '<div class="alert alert-success">Сохранение прошло успешно</div>';
                $modx->sendRedirect($vars['mod_url']);
            }
        }
    }
}
else if(intval($edit)){
    $rec = $adv->getRecord($edit);

    $content .= $adv->getTemplate('formAdv.tpl',$rec,'form.');
    //print_r($modx->placeholders);
    $vars['pagetitle']='Редактирование записи';
    if ($_POST['save']==1){
        if ($_POST['description']=='' or $_POST['link']=='' or $_POST['content']==''){
            $vars['message'] = '<div class="alert alert-danger">Необходимо заполнить описание, ссылку и баннер</div>';
        }
        else {
            $data = array(
                'description'=>$modx->db->escape($_POST['description']),
                'link'=>$modx->db->escape($_POST['link']),
                'published'=>$modx->db->escape($_POST['published']),
                'counted'=>$modx->db->escape($_POST['counted']),
                'jump_counted'=>$modx->db->escape($_POST['jump_counted']),
                'content'=>$modx->db->escape($_POST['content']),
                'total_view'=>$modx->db->escape($_POST['total_view']),
                'total_jump'=>$modx->db->escape($_POST['total_jump']),
                'pub_date'=>strtotime($_POST['pub_date']),
                'unpub_date'=>strtotime($_POST['unpub_date']),
                'area'=>$modx->db->escape($_POST['area'])
            );
            if($adv->updateData($data,$rec['id'])){
                $vars['message'] = '<div class="alert alert-success">Сохранение прошло успешно</div>';
                $modx->sendRedirect($vars['mod_url'].'&edit='.$edit);
            }
        }

    }
}
else if (intval($_GET['delete'])){
    if ($adv->deleteRecord(intval($_GET['delete']))){
        $modx->sendRedirect($vars['mod_url']);
    }
}
else {
    $records_ar = $adv->getAllRecords();
    $records = '<div class="table-responsive">
                                <table class="table data">
                                <thead>
                                <tr>
                                <td></td>
                                <td>Название</td>
                                <td>Зона</td>
                                <td>Действия</td>
                                </tr>
                                </thead>
                                <tbody>
                                ';
    foreach ($records_ar as $record){
        $records .= '<tr>
                            <td class="tableItem"><img src="/'.$record['content'].'" style="height: 70px;width: auto"></td>
                            <td class="tableItem">'.$record['description'].'
                            <br>
                            <small>Ссылка: '.$record['link'].'</small><br>
                            <small>Всего показов: '.$record['count_view'].'</small><br>
                            <small>Всего переходов: '.$record['jump_count'].'</small><br>
                            </td>
                            <td class="tableItem">'.$record['area'].'</td>
                            <td class="tableItem">
                            <a class="btn btn-warning" href="index.php?a='.$_GET['a'].'&id='.$_GET['id'].'&edit='.$record['id'].'">Редактировать</a>
                            <a class="btn btn-danger" href="index.php?a='.$_GET['a'].'&id='.$_GET['id'].'&delete='.$record['id'].'" onclick="return confirm(\'Точно удалить запись?\')">Удалить</a>
                            </td>
                            </tr>';
    }
    $records .= '</tbody></table></div>';
    $content .= $records;
}
$vars['content'] = $content;
$vars['url'] = MODX_MANAGER_URL;
$main = $adv->getTemplate('main.tpl',$vars);

$out .= $main;
echo $out;