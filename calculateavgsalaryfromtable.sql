set serveroutput on;

declare
	avg_sal NUMBER(5);
begin
	select avg(salary) into avg_sal from employeepayment;


	if avg_sal < 33000 then
		dbms_output.put_line('Increase the salary');
	else
		dbms_output.put_line('avg salary: '||to_char(avg_sal));
	end if;
end;
/