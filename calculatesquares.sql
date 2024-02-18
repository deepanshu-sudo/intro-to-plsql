SET SERVEROUTPUT ON;
ACCEPT p_num1 PROMPT 'Please enter the first number: ';
ACCEPT p_num2 PROMPT 'Please enter the second number: ';
ACCEPT p_num3 PROMPT 'Please enter the third number: ';

BEGIN
    CalculateSquares(&p_num1, &p_num2, &p_num3);
END;
/