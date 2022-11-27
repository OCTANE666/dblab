
-- two find largest of 3 number
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


-- Reverse a number 

DECLARE
num NUMBER;
rev NUMBER;
  
BEGIN
num:=#
rev:=0;
WHILE num>0 LOOP
  
rev:=(rev*10) + mod(num,10);
num:=floor(num/10);
END LOOP;
DBMS_OUTPUT.PUT_LINE('Reverse of the number is: ' || rev);
END;


-- Reverse a number

declare
n number;
i number;
flag number;
 
begin
i:=2;
flag:=1;
n:=&n;
 
for i in 2..n/2
loop
if mod(n,i)=0
then
flag:=0;
exit;
end if;
end loop;
 
if flag=1
then
dbms_output.put_line('prime');
else
dbms_output.put_line('not prime');
end if;
end;


