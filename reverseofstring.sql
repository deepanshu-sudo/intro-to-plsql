-- Enable server output to show DBMS_OUTPUT content
set serveroutput on;
-- Disable the verification message that shows the old and the new values when a substitution variable is replaced
set verify off;

-- Prompt the user to enter a string
ACCEPT input_string PROMPT 'Enter a string: '

-- PL/SQL block starts here
DECLARE
    -- Declare a variable to hold the original string
    original_string VARCHAR2(1000);
    -- Declare a variable to hold the reversed string
    reversed_string VARCHAR2(1000);
BEGIN
    -- Use the substitution variable here
    original_string := '&&input_string';

    -- Verify the length of the string.
    IF LENGTH(original_string) < 1 THEN
        DBMS_OUTPUT.PUT_LINE('String is too short. Please provide a longer one.');
    ELSE
        -- Reverse the string using a loop
        FOR i IN REVERSE 1..LENGTH(original_string) LOOP
            reversed_string := reversed_string || SUBSTR(original_string, i, 1);
        END LOOP;

        -- Output the result to the user
        DBMS_OUTPUT.PUT_LINE('Original string: ' || original_string); 
        DBMS_OUTPUT.PUT_LINE('Reversed string: ' || reversed_string); 
    END IF;
EXCEPTION
    -- Generic exception handler to catch all other exceptions
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error was encountered - ' || SQLCODE || ' -ERROR- ' || SQLERRM); 
END;
/