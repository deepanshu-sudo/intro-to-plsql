-- Set the SQL*Plus environment settings
SET SERVEROUTPUT ON;
SET VERIFY OFF;

-- Prompt the user for input
ACCEPT num1 PROMPT 'Please enter the first number: '
ACCEPT num2 PROMPT 'Please enter the second number: '

-- Define the PL/SQL block
DECLARE
        num1 NUMBER(10);
        num2 NUMBER(10);
        result NUMBER(20);
BEGIN
        -- Convert the input to numbers (this is where non-numeric input would raise an exception)
        num1 := TO_NUMBER('&num1');
        num2 := TO_NUMBER('&num2');

        -- Perform the calculation
        result := num1 + num2;

        -- Output the result
        DBMS_OUTPUT.PUT_LINE('The Sum of ' || num1 || ' and ' || num2 || ' is: ' || result);

EXCEPTION
        -- Custom exception for non-numeric input
        WHEN VALUE_ERROR THEN
                DBMS_OUTPUT.PUT_LINE('Non-numeric input detected. Please ensure you enter valid numbers.');
END;
/