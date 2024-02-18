SET SERVEROUTPUT ON;
SET VERIFY OFF;

ACCEPT p_rollno PROMPT 'Please enter the student roll number you wish to update: ';
ACCEPT p_new_name PROMPT 'Please enter the new name for the student (or press ENTER to skip): ';
ACCEPT p_new_marks PROMPT 'Please enter the new marks for the student (or press ENTER to skip): ';
ACCEPT p_new_city PROMPT 'Please enter the new city for the student (or press ENTER to skip): ';

DECLARE
    v_rollno unistudent.rollno%TYPE := &p_rollno;
    v_new_name unistudent.name%TYPE := '&p_new_name';
    v_new_marks unistudent.marks%TYPE := NVL('&p_new_marks', NULL);
    v_new_city unistudent.city%TYPE := '&p_new_city';
BEGIN
    UPDATE unistudent
    SET name = COALESCE(NULLIF(v_new_name, ''), name),
        marks = COALESCE(TO_NUMBER(NULLIF(v_new_marks, NULL)), marks),
        city = COALESCE(NULLIF(v_new_city, ''), city)
    WHERE rollno = v_rollno;

    IF SQL%ROWCOUNT > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Student update successful. ' || SQL%ROWCOUNT || ' row(s) updated.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('No rows updated. Please check if the roll number is correct.');
    END IF;

    COMMIT;
EXCEPTION
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Input value error. Please enter valid data.');
        ROLLBACK;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
        ROLLBACK;
END;
/