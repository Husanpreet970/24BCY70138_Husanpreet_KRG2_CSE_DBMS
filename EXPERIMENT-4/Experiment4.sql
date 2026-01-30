# IF-ELSE STATEMENT
DECLARE
    num NUMBER := -5;
BEGIN
    IF num > 0 THEN
        DBMS_OUTPUT.PUT_LINE('The number is Positive');
    ELSE
        DBMS_OUTPUT.PUT_LINE('The number is Non-Positive');
    END IF;
END;
----------------------------------------------------------------
# IF-ELSIF-ELSE STATEMENT
DECLARE
    marks NUMBER := 78;
BEGIN
    IF marks >= 90 THEN
        DBMS_OUTPUT.PUT_LINE('Grade: A');
    ELSIF marks >= 75 THEN
        DBMS_OUTPUT.PUT_LINE('Grade: B');
    ELSIF marks >= 60 THEN
        DBMS_OUTPUT.PUT_LINE('Grade: C');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Grade: Fail');
    END IF;
END;
----------------------------------------------------------------
# ELSIF LADDER STATEMENT
DECLARE
    marks NUMBER := 82;
BEGIN
    IF marks >= 85 THEN
        DBMS_OUTPUT.PUT_LINE('Performance: Excellent');
    ELSIF marks >= 70 THEN
        DBMS_OUTPUT.PUT_LINE('Performance: Very Good');
    ELSIF marks >= 55 THEN
        DBMS_OUTPUT.PUT_LINE('Performance: Good');
    ELSIF marks >= 40 THEN
        DBMS_OUTPUT.PUT_LINE('Performance: Average');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Performance: Poor');
    END IF;
END;
----------------------------------------------------------------
# CASE STATEMENT
DECLARE
    day_num NUMBER := 3;
    day_name VARCHAR2(20);
BEGIN
    CASE day_num
        WHEN 1 THEN day_name := 'Sunday';
        WHEN 2 THEN day_name := 'Monday';
        WHEN 3 THEN day_name := 'Tuesday';
        WHEN 4 THEN day_name := 'Wednesday';
        WHEN 5 THEN day_name := 'Thursday';
        WHEN 6 THEN day_name := 'Friday';
        WHEN 7 THEN day_name := 'Saturday';
        ELSE day_name := 'Invalid Day Number';
    END CASE;

    DBMS_OUTPUT.PUT_LINE('Day is: ' || day_name);
END;




