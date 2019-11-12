Program pass;
Uses crt,graph;
Var
t:array[1..20,1..20] of integer;
gd,gm,i,j,j1,i1:integer;
ch:string;
Procedure tabla;
Begin
For i:=0 to 600 do
If (i mod 50=0) and (i<=600)then
Line(i,0,i,450);
For j:=0 to 450 do
If (j mod 50 =0) and (j<=450) then
Begin
If (j=0) or (j=450) then
setcolor(magenta) else Setcolor(white);
Line(0,j,600,j);

End;
End;
Procedure start;//seteaza pozitia de inceput
Begin
For i:=1 to 9 do
For j:=1 to 12 do
If (i=1) and (j=6) or (i=2) and (j=6) or (i=3) and (j=6) then
t[i,j]:=4-i;
End;
Procedure afisare;
Begin
For i:=1 to 9 do
For j:=1 to 12 do
If t[i,j]<>0 then
Begin
For i1:=((i-1)*50)+1 to (i*50)-1 do
For j1:=((j-1)*50)+1 to (j*50)-1 do
If t[i,j]>3 then
Putpixel(j1,i1,red)
else
Putpixel(j1,i1,green);
End;
Delay(200);
End;
Procedure stergere;
Begin
For i:=1 to 9 do
For j:=1 to 12 do
If t[i,j]<>0 then
Begin
For i1:=((i-1)*50)+1 to (i*50)-1 do
For j1:=((j-1)*50)+1 to (j*50)-1 do
Putpixel(j1,i1,black);
End;
End;
Procedure miscare;
Begin
If (keypressed=true) then
ch:=readkey;
For i:=1 to 9 do
For j:=1 to 12 do
Begin
If (t[i,j]=1) and (t[i-1,j]=2) and (t[i-2,j]=3) and (ch='a') then
Begin
t[i,j-1]:=t[i,j];
t[i,j]:=t[i-1,j];
t[i-1,j]:=t[i-2,j];
t[i-2,j]:=0;
afisare;
stergere;
End;
If (t[i,j]=1) and (t[i+1,j]=2) and (t[i+2,j]=3) and (ch='a') then
Begin
t[i,j-1]:=t[i,j];
t[i,j]:=t[i+1,j];
t[i+1,j]:=t[i+2,j];
t[i+2,j]:=0;
afisare;
stergere;
End;
If (t[i,j]=1) and (t[i,j-1]=2) and (t[i,j-2]=3) and (ch='w') then
Begin
t[i-1,j]:=t[i,j];
t[i,j]:=t[i,j-1];
t[i,j-1]:=t[i,j-2];
t[i,j-2]:=0;
afisare;
stergere;
End;
If (t[i,j]=1) and (t[i,j+1]=2) and (t[i,j+2]=3) and (ch='w') then
Begin
t[i-1,j]:=t[i,j];
t[i,j]:=t[i,j+1];
t[i,j+1]:=t[i,j+2];
t[i,j+2]:=0;
afisare;
stergere;
End;
If (t[i,j]=1) and (t[i,j-1]=2) and (t[i,j-2]=3) and (ch='s') then
Begin
t[i+1,j]:=t[i,j];
t[i,j]:=t[i,j-1];
t[i,j-1]:=t[i,j-2];
t[i,j-2]:=0;
afisare;
stergere;
End;
If (t[i,j]=1) and (t[i,j+1]=2) and (t[i,j+2]=3) and (ch='s') then
Begin
t[i+1,j]:=t[i,j];
t[i,j]:=t[i,j+1];
t[i,j+1]:=t[i,j+2];
t[i,j+2]:=0;
afisare;
stergere;
End;
If (t[i,j]=1) and (t[i-1,j]=2) and (t[i-2,j]=3) and (ch='d') then
Begin
t[i,j+1]:=t[i,j];
t[i,j]:=t[i-1,j];
t[i-1,j]:=t[i-2,j];
t[i-2,j]:=0;
afisare;
stergere;
End;
If (t[i,j]=1) and (t[i+1,j]=2) and (t[i+2,j]=3) and (ch='d') then
Begin
t[i,j+1]:=t[i,j];
t[i,j]:=t[i+1,j];
t[i+1,j]:=t[i+2,j];
t[i+2,j]:=0;
afisare;
stergere;
End;
End;//end for
{Miscacrile automate}
For i:=9 downto 1 do
For j:=12 downto 1 do
If (t[i,j]=1) and (t[i,j-1]=2) and (t[i,j-2]=3) then
Begin//spre dreapta
t[i,j+1]:=t[i,j];
t[i,j]:=t[i,j-1];
t[i,j-1]:=t[i,j-2];
t[i,j-2]:=0;
End else
If (t[i,j]=1) and (t[i-1,j]=2) and (t[i-2,j]=3) then
Begin//in jos
t[i+1,j]:=t[i,j];
t[i,j]:=t[i-1,j];
t[i-1,j]:=t[i-2,j];
t[i-2,j]:=0;
End else
If (t[i,j]=1) and (t[i,j-1]=2) and (t[i-1,j-1]=3) then
Begin
t[i,j+1]:=t[i,j];
t[i,j]:=t[i,j-1];
t[i,j-1]:=t[i-1,j-1];
t[i-1,j-1]:=0;
End else
If (t[i,j]=1) and (t[i,j-1]=2) and (t[i+1,j-1]=3) then
Begin
t[i,j+1]:=t[i,j];
t[i,j]:=t[i,j-1];
t[i,j-1]:=t[i+1,j-1];
t[i+1,j-1]:=0;
End else
If (t[i,j]=1) and (t[i-1,j]=2) and (t[i-1,j-1]=3) then
Begin
t[i+1,j]:=t[i,j];
t[i,j]:=t[i-1,j];
t[i-1,j]:=t[i-1,j-1];
t[i-1,j-1]:=0;
End else
If (t[i,j]=1) and (t[i-1,j]=2) and (t[i-1,j+1]=3) then
Begin
t[i+1,j]:=t[i,j];
t[i,j]:=t[i-1,j];
t[i-1,j]:=t[i-1,j+1];
t[i-1,j+1]:=0;
End;
For i:=1 to 9 do
For j:=1 to 12 do
If (t[i,j]=1) and (t[i+1,j]=2) and (t[i+2,j]=3) then
Begin//in sus
t[i-1,j]:=t[i,j];
t[i,j]:=t[i+1,j];
t[i+1,j]:=t[i+2,j];
t[i+2,j]:=0;
End else
If (t[i,j]=1) and (t[i,j+1]=2) and (t[i,j+2]=3) then
Begin//in stanga
t[i,j-1]:=t[i,j];
t[i,j]:=t[i,j+1];
t[i,j+1]:=t[i,j+2];
t[i,j+2]:=0;
End else
If (t[i,j]=1) and (t[i+1,j]=2) and (t[i+1,j+1]=3) then
Begin
t[i-1,j]:=t[i,j];
t[i,j]:=t[i+1,j];
t[i+1,j]:=t[i+1,j+1];
t[i+1,j+1]:=0;
End else
If (t[i,j]=1) and (t[i+1,j]=2) and (t[i+1,j-1]=3) then
Begin
t[i-1,j]:=t[i,j];
t[i,j]:=t[i+1,j];
t[i+1,j]:=t[i+1,j-1];
t[i+1,j-1]:=0;
End else
If (t[i,j]=1) and (t[i,j+1]=2) and (t[i-1,j+1]=3) then
Begin
t[i,j-1]:=t[i,j];
t[i,j]:=t[i,j+1];
t[i,j+1]:=t[i-1,j+1];
t[i-1,j+1]:=0;
End else
If (t[i,j]=1) and (t[i,j+1]=2) and (t[i+1,j+1]=3) then
Begin
t[i,j-1]:=t[i,j];
t[i,j]:=t[i,j+1];
t[i,j+1]:=t[i+1,j+1];
t[i+1,j+1]:=0;
End;
{afisare miscarea executata}
afisare;
stergere;
End;
Function verificare:boolean;
Var aux:integer;
Begin
verificare:=false;
aux:=0;
For i:=1 to 9 do
For j:=1 to 12 do
If t[i,j]>3 then
aux:=aux+1;
If aux>0 then
verificare:=true;
End;
Procedure mesaj_final;
Begin
TextColor(Blue);
GotoXY(10,4); Write('Nivelul 1 :');
TextColor(Green);
GotoXY(22,4); Write('complet!');
End;
Begin
Initgraph(gd,gm,'');
gd:=detect;
t[5,5]:=8;
t[7,9]:=8;
t[6,3]:=8;
t[4,11]:=8;
tabla;
start;
afisare;
ReadKey;
stergere;
Repeat
miscare;
If verificare=false then break;
Until ch='q';
{Readkey;}
Closegraph;
{For i:=1 to 9 do
Begin
For j:=1 to 12 do
Write(t[i,j],' ');
End;}
mesaj_final;
End.