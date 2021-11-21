DECLARE v_student school%rowtype;

 v_result oracle_result%rowtype;

 grade varchar2(10);


CURSOR c1 IS
SELECT *
FROM SCHOOL;

 BEGIN
FOR v_student IN c1 LOOP IF v_student.class='Working' THEN IF v_student.Oracle<50 THEN grade:='FAIL';

 ELSE grade:='PASS';

 END IF;

 elsif v_student.class='Student' THEN IF v_student.Oracle>=80 THEN grade:='HONOURS';

 elsif v_student.Oracle>=60 THEN grade:='A';

 elsif v_student.Oracle>=50 THEN grade:='B';

 elsif v_student.Oracle>=40 THEN grade:='C';

 ELSE grade:='B';

 END IF;

 END IF;


INSERT INTO oracle_result
VALUES(v_student.Roll_no,
       v_student.Oracle,
       v_student.Oracle,
       grade);

 END LOOP;

 END;

 /