-- Enable server output to show DBMS_OUTPUT content
set serveroutput on;
-- Disable the verification message that shows the old and the new values when a substitution variable is replaced
set verify off;

-- Prompt the user to enter a number to find its factorial and store it in a substitution variable 'p_n'
ACCEPT p_n PROMPT 'Enter number to find its factorial: '

-- PL/SQL block starts here
DECLARE
    -- Declare a variable to hold the input number
    n NUMBER;
    -- Declare a variable to hold the calculated factorial initialized to 1
    factorial NUMBER := 1;
BEGIN
    -- Convert the user input (substitution variable) to a number and assign it to 'n'
    n := TO_NUMBER('&&p_n');

    -- Check if the input number is negative
    IF n < 0 THEN
        DBMS_OUTPUT.PUT_LINE('Invalid Input. Please enter a positive number or zero.');
    -- Check if the input number is zero or positive
    ELSE
        -- Loop from 1 to the input number to calculate factorial
        FOR i IN 1..n LOOP
            factorial  := factorial * i;
        END LOOP;
        -- Output the factorial to the user
        DBMS_OUTPUT.PUT_LINE('The factorial of ' || n || ' is ' || factorial);
    END IF;
EXCEPTION
    -- Exception handler for non-numeric inputs that cause conversion errors
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Non-numeric input detected. Please ensure you enter a valid integer.');
    -- Generic exception handler to catch all other exceptions
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error was encountered - '||SQLCODE||' -ERROR- '||SQLERRM); 
END;
/