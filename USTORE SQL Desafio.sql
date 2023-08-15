

create schema RHJOAOARAUJO;

USE RHJOAOARAUJO;

CREATE TABLE `employee` (
`id` integer NOT NULL AUTO_INCREMENT,
`name` varchar(110) NOT NULL,
`email` varchar(110) NOT NULL,
PRIMARY KEY (`id`)
) ;
CREATE TABLE `salary` (
`id` int NOT NULL,
`value` decimal(10,0) NOT NULL,
`payment_date` date NOT NULL,
`employee_id` int NOT NULL,
KEY `employee_id` (`employee_id`),
CONSTRAINT `salary_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee`
(`id`)
);

INSERT INTO employee (name, email) VALUES ('Maria Silva', 'maria@example.com');
INSERT INTO employee (name, email) VALUES ('José Santos', 'jose@example.com');
INSERT INTO employee (name, email) VALUES ('Ana Oliveira', 'ana@example.com');
INSERT INTO employee (name, email) VALUES ('Carlos Ferreira', 'carlos@example.com');
INSERT INTO employee (name, email) VALUES ('Amanda Rodrigues', 'amanda@example.com');
INSERT INTO employee (name, email) VALUES ('Rafael Costa', 'rafael@example.com');
INSERT INTO employee (name, email) VALUES ('Fernanda Almeida', 'fernanda@example.com');
INSERT INTO employee (name, email) VALUES ('Lucas Gomes', 'lucas@example.com');
INSERT INTO employee (name, email) VALUES ('Isabela Pereira', 'isabela@example.com');
INSERT INTO employee (name, email) VALUES ('Pedro Souza', 'pedro@example.com');

select * from employee;

INSERT INTO salary (id, value, payment_date, employee_id) VALUES (1, 5000, '2023-08-01', 1);
INSERT INTO salary (id, value, payment_date, employee_id) VALUES (2, 5200, '2023-08-02', 2);
INSERT INTO salary (id, value, payment_date, employee_id) VALUES (3, 4800, '2023-08-03', 3);
INSERT INTO salary (id, value, payment_date, employee_id) VALUES (4, 5300, '2023-08-04', 4);
INSERT INTO salary (id, value, payment_date, employee_id) VALUES (5, 5500, '2023-08-05', 5);
INSERT INTO salary (id, value, payment_date, employee_id) VALUES (6, 5100, '2023-08-06', 6);
INSERT INTO salary (id, value, payment_date, employee_id) VALUES (7, 5400, '2023-08-07', 7);
INSERT INTO salary (id, value, payment_date, employee_id) VALUES (8, 5600, '2023-08-08', 8);
INSERT INTO salary (id, value, payment_date, employee_id) VALUES (9, 4900, '2023-08-09', 9);
INSERT INTO salary (id, value, payment_date, employee_id) VALUES (10, 5300, '2023-08-10', 10);
INSERT INTO salary (id, value, payment_date, employee_id) VALUES (11, 5000, '2023-08-01', 1);
INSERT INTO salary (id, value, payment_date, employee_id) VALUES (12, 5200, '2023-08-02', 2);
INSERT INTO salary (id, value, payment_date, employee_id) VALUES (13, 4800, '2023-08-03', 3);
INSERT INTO salary (id, value, payment_date, employee_id) VALUES (14, 5300, '2023-08-04', 4);
INSERT INTO salary (id, value, payment_date, employee_id) VALUES (15, 5500, '2023-08-05', 5);
INSERT INTO salary (id, value, payment_date, employee_id) VALUES (16, 5100, '2023-08-06', 6);
INSERT INTO salary (id, value, payment_date, employee_id) VALUES (17, 5400, '2023-08-07', 7);
INSERT INTO salary (id, value, payment_date, employee_id) VALUES (18, 5600, '2023-08-08', 8);
INSERT INTO salary (id, value, payment_date, employee_id) VALUES (19, 4900, '2023-08-09', 9);
INSERT INTO salary (id, value, payment_date, employee_id) VALUES (20, 5300, '2023-08-10', 10);
INSERT INTO salary (id, value, payment_date, employee_id) VALUES (21, 5200, '2023-02-01', 1);
INSERT INTO salary (id, value, payment_date, employee_id) VALUES (22, 4800, '2023-02-15', 2);
INSERT INTO salary (id, value, payment_date, employee_id) VALUES (23, 5300, '2023-03-10', 3);
INSERT INTO salary (id, value, payment_date, employee_id) VALUES (24, 5500, '2023-03-20', 4);
INSERT INTO salary (id, value, payment_date, employee_id) VALUES (25, 5100, '2023-04-05', 5);
INSERT INTO salary (id, value, payment_date, employee_id) VALUES (26, 5400, '2023-04-10', 6);
INSERT INTO salary (id, value, payment_date, employee_id) VALUES (27, 5600, '2023-05-02', 7);
INSERT INTO salary (id, value, payment_date, employee_id) VALUES (28, 4900, '2023-05-15', 8);
INSERT INTO salary (id, value, payment_date, employee_id) VALUES (29, 5300, '2023-06-08', 9);
INSERT INTO salary (id, value, payment_date, employee_id) VALUES (30, 5000, '2023-06-20', 10);

--  Crie uma consulta SQL que retorne o id e nome do funcionário e sua média salarial, dos funcionários com as três maiores médias salariais dos últimos 3 meses.


SELECT emp.id "ID Funcionário", emp.`name` "Nome do Funcionário", ROUND(AVG(sal.`value`),2) "Média Salario"
	FROM salary sal
    INNER JOIN employee emp ON sal.employee_id = emp.id
   WHERE  sal.payment_date >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH) 
    GROUP BY emp.id
    ORDER BY AVG(sal.`value`) DESC
   LIMIT 3;