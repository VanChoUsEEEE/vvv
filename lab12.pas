uses crt;
var k,x:byte;
n:char;
function test(var num:char):byte;
        var numbers:set of char;
        begin
        numbers:=['1','2'];
        if num in numbers then
                test:=0
                else
                begin
                   test:=1;
                   ClrScr;
                   writeln('incorrect query');
                   readln;
                   ClrScr;
                end;
        end;
procedure menu;
        begin
        writeln('1-CALCULATE');
        writeln('2-EXIT');
        readln(n);
        if test(n)=1 then menu;
        end;
procedure enter;
        var c:array[1..100] of char;
        numbers: array [1..100] of real;
        d,buf:array[1..100] of char;
        symbol:array[1..4] of char=('+','-','*','/');
        i,p,l,h,f,v:integer;
        a,b,m:boolean;
        begin
        clrscr;
        readln(d);
        b:=false;
        for i:=1 to length(d)-1 do
        if (d[i]='/') and (d[i+1]='0') then
        b:=true;
        a:=false;
        buf:='';
        if b=false then
                begin
                for i:=1 to length(d) do
                begin
                for p:=1 to 4 do if d[i]=symbol[p] then
                begin
                inc(h);
                c[h]:=d[i];
                a:=true;
                end;
                if a=false then buf:=buf+d[i];
                if i=length(d) then a:=true;
                if a=true then
                begin
                Inc(f);
                val(buf,numbers[f],x); if x=1 then
                begin
                writeln('error');
                d:=buf;
                readln;
                ClrScr;
                menu;
                        while n<>'2' do
                        begin
                        if n='1' then Enter;
                        ClrScr;
                        menu;
                        end;
                        end;
                        buf:='';
                        end;
                a:=false;
                end;
        l:=h;
        repeat
        for v:=1 to l do begin
        for i:=1 to h do
                begin
                if c[i]=symbol[3] then
                        begin
                        numbers[i]:=numbers[i]*numbers[i+1];
                                 for p:=i+1 to f-1 do numbers[p]:=numbers[p+1];
                                 dec(f);
                        if i<>h then
                                begin
                                for p:=i to h-1 do
                                c[p]:=c[p+1];
                                dec(h);
                                end
                                else
                                dec(h);
                        break;
                        end;
                if c[i]=symbol[4] then
                        begin
                        numbers[i]:=numbers[i]/numbers[i+1];
                                 for p:=i+1 to f-1 do
                                 numbers[p]:=numbers[p+1];
                                 dec(f);
                        if i<>h then
                                for p:=i to h-1 do
                                begin
                                c[p]:=c[p+1];
                                dec(h);
                                end
                                else
                                dec(h);
                        break;
                        end;
                end;
        for i:=1 to h do
                begin
                if c[i]=symbol[1] then
                        begin
                        numbers[i]:=numbers[i]+numbers[i+1];
                                 for p:=i+1 to f-1 do
                                 numbers[p]:=numbers[p+1];
                                 dec(f);
                        if i<>h then
                                begin
                                for p:=i to f-1 do
                                c[p]:=c[p+1];
                                dec(h);
                                end
                                else
                                dec(h);
                        break;
                        end;
                if c[i]=symbol[2] then
                        begin
                        numbers[i]:=numbers[i]-numbers[i+1];
                                 for p:=i+1 to f-1 do
                                 numbers[p]:=numbers[p+1];
                                 dec(f);
                        if i<>h then
                                for p:=i to h-1 do
                                begin
                                c[p]:=c[p+1];
                                dec(h);
                                end
                                else
                                dec(h);
                        break;
                        end;
                end;
                end;
        until f=1;
if x<>1 then
write(numbers[f]:0:1);
for p:=1 to f do
        begin
        numbers[p]:=0;
        if p<=h then
                c[p]:=' ';
        end;
        h:=0;
        f:=0;
        end
        else
        write('error /0');
        readln;
end;
begin
ClrScr;
menu;
repeat
if n='1' then
enter;
ClrScr;
menu;
until n='2';
end.
