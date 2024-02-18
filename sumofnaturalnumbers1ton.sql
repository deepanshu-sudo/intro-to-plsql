-- Enable server output to show DBMS_OUTPUT content
set serveroutput on;
-- Disable the verification message that shows the old and the new values when a substitution variable is replaced
set verify off;

-- Prompt the user to enter a number to find its sum from 1 to n and store it in a substitution variable 'p_n'
ACCEPT p_n PROMPT 'Enter a number up until you want to find the sum of natural numbers: '

-- PL/SQL block starts here
DECLARE
    -- Declare a variable to hold the input number
    n NUMBER;
    -- Declare a variable to hold the sum, initialized to 0
    result NUMBER := 0;
BEGIN
    -- Convert the user input (substitution variable) to a number and assign it to 'n'
    n := TO_NUMBER('&&p_n');

    -- Check if the input number is negative
    IF n < 0 THEN
        DBMS_OUTPUT.PUT_LINE('Invalid Input. Please enter a positive number or zero.');
    -- Check if the input number is zero or positive
    ELSE
        -- Calculate sum of numbers from 1 to n
        result := n * (n + 1) / 2;
        -- Output the sum to the user
        DBMS_OUTPUT.PUT_LINE('The sum of numbers from 1 to ' || n || ' is ' || result);
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