# EasyAdvesting
Snippet &amp; Module for Evolution CMS (1.4.0  and older adapted)

### Install sql


```
CREATE TABLE IF NOT EXISTS `modx_site_easyadvt` (
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
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
```
