
use wjr;

insert into employees
values
	(100, 'Rasmussen', 'Wayne', '', 'wjr@wjr.com', 'xyz', 99, 'software developer');

	
update employees
set jobTitle = 'Senior Software Developer'
where employeeNumber = 100;