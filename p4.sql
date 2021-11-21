Declare
                                 v_student school%rowtype;
                                 v_result oracle_result%rowtype;
                                grade varchar2(10);


                                cursor c1 is
                                select *
                                from school;

Begin
             for v_student in c1 loop
             if v_student.class='Working' 
                  then 
                      if v_student.Dev_2000 <50 
                               then grade:='FAIL';
            else grade:='PASS';
           end if;
           elsif v_student.class='Student'
                   then
                        if v_student.Dev_2000 >=80 
                            then grade:='HONOURS';
          elsif v_student.Dev_2000 >=60 
                            then grade:='A';
          elsif v_student.Dev_2000 >=50 
                           then grade:='B';
          elsif v_student.Dev_2000 >=40 
                          then grade:='C';
         else grade:='B';
                    end if;
        end if;


                 insert into Dev_2000_result
                 values(v_student.Roll_no,
                 v_student.Oracle,
                 v_student.Dev_2000,
                 grade);

      end loop;

End;
 /