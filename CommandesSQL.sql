--SELECT

SELECT * FROM employees WHERE employees.employee_id>5 AND employees.hourly_pay>10

SELECT * FROM employees WHERE employees.position='manager' AND employees.hourly_pay>=10 

SELECT * FROM employees WHERE NOT(employees.position='manager') AND employees.hourly_pay>=10 

SELECT * FROM employees WHERE employees.position<>'manager' AND employees.hourly_pay>=10 

SELECT * FROM items WHERE items.item_id>5 AND items.item_id<10 

SELECT * FROM employees WHERE employees.employee_id>5 or employees.hourly_pay<10 

select items.item_name as 'ITEM NAME' from items where items.item_name='Cheese';

select * from employees where employees.employee_id in (2,4,6,8);

select employees.name from employees where employees.employee_id in (1,2,4);

select e.name from employees e where e.employee_id in (1,2,4);

--UPDATE

update employees set employees.hourly_pay=10.00, employees.name='John' where employees.employee_id=1;

--ORDER BY
select * from employees ORDER BY employees.hourly_pay DESC

--LIKE
select * from employees where employees.name like 'D%';
select * from employees where employees.name like '%S';
select * from employees where employees.name like 'J_ng P';
select * from items where items.item_name like '%EE%' or items.item_name like '%OO%';

--DISTINCT
select distinct employees.position from employees;

--COUNT
select count(*) from employees;
select count(*) from employees where employees.position like 'Man%';
select min(employees.hourly_pay) from employees where employees.position like 'Man%';

--AVG (moyenne)
 select AVG(employees.hourly_pay) from employees;

 --MAX, MIN
 select min(items.price), avg(items.price), max(items.price) from items;

 --NOW()
 select now();

 --LENGTH()

 --ROUND()
select min(items.price), round(avg(items.price),0), max(items.price), sum(items.price),now() from items

--IFNULL(champ, 0)
select ifnull(sal,0) from employe;

--exemple
select count(*) from sales where sales.employee_id=17 and sales.item_id=5

--JOIN
Select * from items i left join sales s on i.item_id = s.item_id; --LEFT JOIN permet de voir tous les items avec les infos de sales si il y en a
Select * from items i left join sales s on i.item_id = s.item_id; --RIGHT JOIN permet de voir toutes les sales avec les infos articles si il y en a
Select * from items i join sales s on i.item_id = s.item_id order by i.item_id; --JOIN permet de ne prendre que les articles apparaissant dans la tables des ventes
Select * from items i, sales s where i.item_id=s.item_id;--INNER JOIN permet de ne prendre que les articles apparaissant dans la tables des ventes
Select * from items i INNER JOIN sales s ON i.item_id=s.item_id;
select distinct e.name from sales s left join employees e on (s.employee_id=e.employee_id) where s.item_id=1 order by s.item_id;
select sales.item_id, count(*) as c, items.item_name from sales left join items on items.item_id=sales.item_id group by sales.item_id order by c desc

--GROUP BY
select employee_id, count(*) as c from sales group by employee_id order by c desc ;

--HAVING
select sales.item_id, count(*) as c, items.item_name from sales left join items on items.item_id=sales.item_id group by sales.item_id HAVING c=5 order by c desc

--DELETED
delete from sales where employee_id=20;
	
--TP 
create database TPBaseDD
	create table employe(mat CHAR(3) NOT NULL,
		nom VARCHAR(7) NOT NULL,
		nod CHAR(3) NOT NULL,
		dat DATE NOT NULL,
		sal INT (5.2) NOT NULL,
		com INT (5.2));
	insert into employe(mat,nom,nod,dat,sal,com) values ('010','JEANTIL','E10','1990-02-10',11000,5000); 
	insert into employe(mat,nom,nod,dat,sal,com) values ('020','GARBOT','P01','1988-01-11',15100.5,null);
	insert into employe(mat,nom,nod,dat,sal,com) values ('030','BALI','P02','1991-01-04',6000,3000);
	insert into employe(mat,nom,nod,dat,sal,com) values ('040','BELLE','C04','1985-12-03',21000.5,1000);
	insert into employe(mat,nom,nod,dat,sal,com) values ('040','IONOS','P02','1986-06-20',8500,3500.5);
	insert into employe(mat,nom,nod,dat,sal,com) values ('050','SALIA','P01','1988-04-22',9000,3500);
	insert into employe(mat,nom,nod,dat,sal,com) values ('060','VANYL','P02','1987-05-18',10500,900.5);
	update employe set employe.mat='050' where employe.nom='IONOS';
	update employe set employe.mat='060' where employe.nom='SALIA';
	update employe set employe.mat='070' where employe.nom='VANYL';

	insert departement(nod,nde,lie,che) values ('C04','COMPTA','BAT1','040');
	insert departement(nod,nde,lie,che) values ('E10','VENTE','BAT2','010');
	insert departement(nod,nde,lie,che) values ('P01','INFO','BAT3','020');
	insert departement(nod,nde,lie,che) values ('P02','MARKET','BAT2','070');	

	select count(*) from employe;

	Alter table employe add primary key (mat);

	select * from employe where DATE_SUB(CURDATE(),interval 30 year) > dat 
	select * from employe where (sal<10000 and com>3000) or (com<3000 and sal>10000);
	select * from employe where ((com+sal)>10000 and (com+sal)<20000);
	select * from employe where nom like '_A_I_';
	select * from employe where YEAR(dat) = 1988 or YEAR(dat) = 1990;
	select * from employe where (sal<120000) and (com<(sal/3)) ;
	select (com/sal)*100 as Pourcentage from employe order by Pourcentage desc;
	select count(*) from employe where not(isnull(com));