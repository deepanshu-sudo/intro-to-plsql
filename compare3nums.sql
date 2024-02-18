set serveroutput on;
set verify off;

accept mynum1 prompt "Enter Number 1: "
accept mynum2 prompt "Enter Number 2: "
accept mynum3 prompt "Enter Number 3: "

declare
	num1 number(10);
	num2 number(10);
	num3 number(10);

	smallest number(10);
	middle number(10);
	largest number(10);

begin
	num1 := to_number('&mynum1');
	num2 := to_number('&mynum2');
	num3 := to_number('&mynum3');
	
	--Compare the numbers and sort then
	IF num1 <= num2 AND num1 <= num3 THEN
		smallest := num1;
		if num2 <= num3 THEN
			middle := num2;
			largest := num3;
		else
			middle := num3;
			largest := num2;
		end if;
	elsif num2 <= num1 and num2 <= num3 then
		smallest := num2;
		if num1 <= num3 then
			middle := num1;
			largest := num3;
		else 
			middle := num3;
			largest := num1;
		end if;
	else
		smallest := num3;
		if num1 <= num2 then
			middle := num1;
			largest := num2;
		else
			middle := num2;
			largest := num1;
		end if;
	end if;

	dbms_output.put_line('numbers in ascending order: '||smallest || ', ' || middle || ', ' || largest);
end;
/