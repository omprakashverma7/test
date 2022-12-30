
create or replace procedure exchange_data
is
    cursor exchange_c is 
    select * from employee;
    cur_var exchange_c%rowtype;
begin
    open exchange_c;
    loop 
    fetch exchange_c into cur_var; 
    exit when exchange_c%notfound;
    insert into employee_c
    values(cur_var.empid , cur_var.firstname, cur_var.lastname, cur_var.Email,cur_var.phoneno,cur_var.salary); 
    end loop; 
    commit;
end;

-----
execute exchange_data;

---

select * from employee;

select * from employee_c;

--truncate table employee_c;