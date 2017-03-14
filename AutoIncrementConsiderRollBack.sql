CREATE TABLE `auto_inc_test` (
  `id` bigint(20) NOT NULL,
  `title` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8; 


CREATE TABLE `auto_inc_num1` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `t_name` varchar(256) NOT NULL DEFAULT '',
  `num` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `t_name` (`t_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8​; 

CREATE DEFINER=`root`@`localhost` trigger ins_auto_inc before insert on auto_inc_test  
  for each row 
  begin   
    set @new_id=( select num from auto_inc_num1 where t_name = 'auto_inc_test' for update);
    set NEW.id = @new_id;
    update auto_inc_num1 set num = num + 1 where t_name = 'auto_inc_test';
  end