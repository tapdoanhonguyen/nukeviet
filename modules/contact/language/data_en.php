<?php

/**
 * @Project NUKEVIET 4.x
 * @Author VINADES.,JSC (contact@vinades.vn)
 * @Copyright (C) 2014 VINADES.,JSC. All rights reserved
 * @License GNU/GPL version 2 or any later version
 * @Createdate 2-10-2010 20:59
 */

if( ! defined( 'NV_ADMIN' ) ) die( 'Stop!!!' );

/**
 * Note:
 * 	- Module var is: $lang, $module_file, $module_data, $module_upload, $module_theme, $module_name
 * 	- Accept global var: $db, $db_config, $global_config
 */

$sth = $db->prepare( "INSERT INTO " . $db_config['prefix'] . "_" . $lang . "_" . $module_data . "_department (full_name, alias, phone, fax, email, note, others, cats, admins, act, weight, is_default) VALUES (:full_name, :alias, :phone, :fax, :email, :note, :others, :cats, '1/1/1/0;', 1, :weight, :is_default)" );

$full_name = 'Consumer Care Division';
$alias = 'Consumer-Care';
$phone = '(08) 38.000.000[+84838000000]';
$fax = '08 38.000.001';
$email = 'customer@mysite.com';
$note = 'Receive requests, suggestions, comments relating to the operations of company';
$others = json_encode( array( 'viber' => 'myViber', 'skype' => 'mySkype', 'yahoo' => 'myYahoo') );
$cats = 'Consulting|Complaints|Cooperation';
$weight = 1;
$is_default = 1;
$sth->bindParam( ':full_name', $full_name, PDO::PARAM_STR, strlen( $full_name ) );
$sth->bindParam( ':alias', $alias, PDO::PARAM_STR, strlen( $alias ) );
$sth->bindParam( ':phone', $phone, PDO::PARAM_STR, strlen( $phone ) );
$sth->bindParam( ':fax', $fax, PDO::PARAM_STR, strlen( $fax ) );
$sth->bindParam( ':email', $email, PDO::PARAM_STR, strlen( $email ) );
$sth->bindParam( ':note', $note, PDO::PARAM_STR, strlen( $note ) );
$sth->bindParam( ':others', $others, PDO::PARAM_STR, strlen( $others ) );
$sth->bindParam( ':cats', $cats, PDO::PARAM_STR, strlen( $cats ) );
$sth->bindValue( ':weight', $weight, PDO::PARAM_INT );
$sth->bindValue( ':is_default', $is_default, PDO::PARAM_INT );
$sth->execute();

$full_name = 'Technical Department';
$alias = 'Technical';
$phone = '(08) 38.000.002[+84838000002]';
$fax = '08 38.000.003';
$email = 'technical@mysite.com';
$note = 'Resolve technical issues';
$others = json_encode( array( 'viber' => 'myViber2', 'skype' => 'mySkype2', 'yahoo' => 'myYahoo2') );
$cats = 'Bug Reports|Recommendations to improve';
$weight = 2;
$is_default = 0;
$sth->bindParam( ':full_name', $full_name, PDO::PARAM_STR, strlen( $full_name ) );
$sth->bindParam( ':alias', $alias, PDO::PARAM_STR, strlen( $alias ) );
$sth->bindParam( ':phone', $phone, PDO::PARAM_STR, strlen( $phone ) );
$sth->bindParam( ':fax', $fax, PDO::PARAM_STR, strlen( $fax ) );
$sth->bindParam( ':email', $email, PDO::PARAM_STR, strlen( $email ) );
$sth->bindParam( ':note', $note, PDO::PARAM_STR, strlen( $note ) );
$sth->bindParam( ':others', $others, PDO::PARAM_STR, strlen( $others ) );
$sth->bindParam( ':cats', $cats, PDO::PARAM_STR, strlen( $cats ) );
$sth->bindValue( ':weight', $weight, PDO::PARAM_INT );
$sth->bindValue( ':is_default', $is_default, PDO::PARAM_INT );
$sth->execute();

$bodytext = 'If you have any questions or comments, please contact us below and we will get back to you as soon as possible.';
$sth = $db->prepare( "INSERT INTO " . NV_CONFIG_GLOBALTABLE . " (lang, module, config_name, config_value) VALUES ('vi', 'contact', 'bodytext', :bodytext)" );
$sth->bindParam( ':bodytext', $bodytext, PDO::PARAM_STR, strlen( $bodytext ) );
$sth->execute();