
//two find largest of 3 number
Declare
    a number;
    b number;
    c number;
Begin
    dbms_output.put_line('Enter a:');
        a:=&a;
    dbms_output.put_line('Enter b:');
        b:=&b;
    dbms_output.put_line('Enter c:');
        c:=&C;
if (a>b) and (a>c)
    then
    dbms_output.put_line('A is GREATEST'||A);
elsif (b>a) and (b>c)
    then
    dbms_output.put_line('B is GREATEST'||B);
else
    dbms_output.put_line('C is GREATEST'||C);
end if;
End;
