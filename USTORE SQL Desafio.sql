SELECT emp.id "ID Funcionário", emp.`name` "Nome do Funcionário", ROUND(AVG(sal.`value`),2) "Média Salario"
	FROM salary sal
    INNER JOIN employee emp ON sal.employee_id = emp.id
   WHERE  sal.payment_date >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH) 
    GROUP BY emp.id
    ORDER BY AVG(sal.`value`) DESC
   LIMIT 3;