-- Enable server output to show DBMS_OUTPUT content
set serveroutput on;
-- Disable the verification message that shows the old and the new values when a substitution variable is replaced
set verify off;

-- Prompt the user to enter the radius of the circle and store it in a substitution variable 'p_radius'
ACCEPT p_radius PROMPT 'Enter Radius of the Circle: '

-- PL/SQL block starts here
DECLARE
    -- Declare a variable to hold the radius as a number
    radius NUMBER(10);
    -- Declare a variable to hold the calculated area with precision up to 2 decimal places
    area   NUMBER(20, 2);
BEGIN
    -- Convert the user input (substitution variable) to a number and assign it to 'radius'
    radius := TO_NUMBER('&&p_radius');
    -- Calculate the area using the PI function for a more accurate value of π
    area := 3.14 * radius * radius;
    -- Output the result to the user
    DBMS_OUTPUT.PUT_LINE('The area of the circle with radius ' || radius || ' is ' || area);
EXCEPTION
    -- Exception handler for non-numeric inputs that cause conversion errors
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Non-numeric input detected. Please ensure you enter valid numbers.');
    -- Generic exception handler to catch all other exceptions
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;
/