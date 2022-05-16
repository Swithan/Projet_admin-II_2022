INSERT INTO `maildb`.`virtual_domains`
(`id` ,`name`)
VALUES
('1', 'l2-6.ephec-ti.be');

INSERT INTO `maildb`.`virtual_users`
(`id`, `domain_id`, `password` , `email`, `maildir`)
VALUES
('2', '1', ENCRYPT('contact', CONCAT('$6$', SUBSTRING(SHA(RAND()), -16))), 'contact@wt2-5.ephec-ti.be', 'l2-6.ephec-ti.be/contact/');

INSERT INTO `maildb`.`virtual_users`
(`id`, `domain_id`, `password` , `email`, `maildir`)
VALUES
('3', '1', ENCRYPT('b2b', CONCAT('$6$', SUBSTRING(SHA(RAND()), -16))), 'b2b@wl2-6.ephec-ti.be', 'l2-6.ephec-ti.be/b2b/');

INSERT INTO `maildb`.`virtual_users`
(`id`, `domain_id`, `password` , `email`, `maildir`)
VALUES
('4', '1', ENCRYPT('arnaud', CONCAT('$6$', SUBSTRING(SHA(RAND()), -16))), 'leveau.arnaud@wl2-6.ephec-ti.be', 'l2-6.ephec-ti.be/arnaud/');