SET SERVEROUTPUT ON;

BEGIN
	--Print the header
	DBMS_OUTPUT.PUT_LINE('DeptID' || CHR(9) || 'DeptName');
	DBMS_OUTPUT.PUT_LINE('------' || CHR(9) || '--------');
	
	-- Cursor to select data from unidepartment table
	FOR rec IN (SELECT deptid, dname FROM unidepartment ORDER BY deptid) LOOP
		-- Print each row data
		DBMS_OUTPUT.PUT_LINE(rec.deptid || CHR(9) || rec.dname);
	END LOOP;
END;
/