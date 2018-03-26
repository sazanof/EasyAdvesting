<?php
/**
 * Created by PhpStorm.
 * User: Sazanof
 * Date: 12.03.2018
 * Time: 10:44
 */

class Adversting
{
    protected $modx = null;
    protected $tbl = 'site_easyadvt';
    protected $fields = 'id,
                        pos,
                        template,
                        ex_template,
                        area,
                        description,
                        link,
                        published,
                        pub_date,
                        unpub_date,
                        counted,
                        count_view,
                        total_view,
                        jump_counted,
                        jump_count,
                        total_jump,
                        content';

    public function __construct (\documentParser $modx)
    {
        $this->modx = $modx;
        $this->table = $this->modx->getFullTableName($this->tbl);
        $this->tplDir = MODX_BASE_PATH.FOLDER.'tpl/';
        $this->install();
    }

    protected function install()
    {
        $sql = "
        CREATE TABLE IF NOT EXISTS {$this->table} (
          `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
          `pos` int(8) NOT NULL,
          `template` text NOT NULL,
          `ex_template` text NOT NULL,
          `area` varchar(255) NOT NULL,
          `description` text NOT NULL,
          `link` varchar(255) NOT NULL,
          `published` tinyint(1) unsigned NOT NULL,
          `pub_date` int(20) NOT NULL,
          `unpub_date` int(20) NOT NULL,
          `counted` int(1) unsigned NOT NULL,
          `count_view` int(20) unsigned NOT NULL,
          `total_view` int(20) unsigned NOT NULL,
          `jump_counted` tinyint(1) unsigned NOT NULL,
          `jump_count` int(20) unsigned NOT NULL,
          `total_jump` int(20) unsigned NOT NULL,
          `content` text NOT NULL,
          PRIMARY KEY (`id`)
        ) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;";
        if ($this->modx->db->query($sql)){
            return true;
        } else {
            return false;
        }

    }

    public function updateData($data,$id){
        if(is_array($data)){
            $sql = $this->modx->db->update($data,$this->table,"id={$id}");
            return $sql;
        }
    }

    public function insertData($data){
        if(is_array($data)){
            $sql = $this->modx->db->insert($data,$this->table);
            return $sql;
        }
    }

    public function getTemplate($file,$plh,$per='adv.')
    {
        $file = $this->tplDir.$file;
        $content = file_get_contents($file);
        if (file_exists($file)){
            if (is_array($plh)){
                if ($plh !== false) $this->modx->toPlaceholders($plh,$per);
            }
            return $this->modx->parseDocumentSource($content);
        }
    }

    public function getAllRecords()
    {
        $sql = "SELECT {$this->fields} FROM {$this->table}";
        $res = $this->modx->db->query($sql);
        $res = $this->modx->db->makeArray($res);
        return $res;
    }

    public function getRecord($id)
    {
        $sql = "SELECT {$this->fields},
      DATE_FORMAT(FROM_UNIXTIME(pub_date),'%d-%m-%Y %H:%i:%s') as start_date,
      DATE_FORMAT(FROM_UNIXTIME(unpub_date),'%d-%m-%Y %H:%i:%s') as end_date
      FROM {$this->table} WHERE id = {$id}";
        $res = $this->modx->db->getRow($this->modx->db->query($sql));
        return $res;
    }

    public function deleteRecord($id){
        $sql = "DELETE FROM {$this->table} WHERE id={$id}";
        return $this->modx->db->query($sql);
    }
}