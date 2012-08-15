{
	Copyright (c) 2012 Roland Yonaba

	Permission is hereby granted, free of charge, to any person obtaining a
	copy of this software and associated documentation files (the
	"Software"), to deal in the Software without restriction, including
	without limitation the rights to use, copy, modify, merge, publish,
	distribute, sublicense, and/or sell copies of the Software, and to
	permit persons to whom the Software is furnished to do so, subject to
	the following conditions:

	The above copyright notice and this permission notice shall be included
	in all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
	OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
	MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
	IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
	CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
	TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
	SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
}

program calc_int;
uses wincrt;

{Returns a trapeze area}
function tarea(b1,b2,h:real):real;
begin
	tarea:=(b1+b2)*(h/2);
end;

{Function to be integrated}
function sqr(x:real):real;
begin
	sqr:=sqr(x);
end;

{Main}
var a,b,p0,epsilon,temp,IP,IA:real;
    i:integer;
    n_data:longint;

begin
	writeln('Integral f(x) = x^2');
	writeln('Enter bounds of integration');

	{switching bounds if a > b}
	readln(a,b); 
	if a > b then
	   begin
		   temp:=a;
		   a:=b;
		   b:=temp;
	   end;

	{Request step of integration and adjust if (step > |b-a|)}
	writeln('Entr integration step (the lower, the best) ');
	read(p0);
	if p0 > (b-a) then
	   begin
		   p0:=(b-a);                                 
		   writeln('Step was higher than |b-a|. Step set to ',p0);
	   end;

	{Accuracy ?}
	writeln('Enter accuracy');
	read(epsilon);

	p0:=p0*2;
	IA:=0;

	if a <> b then
	   repeat
		   IP:=IA;
		   p0:=p0/2;
		   writeln('Current step ',p0);
		   n_data:=trunc(((b-a)/p0))+1;
		   if (a+(n_data*p0))> b then n_data:=n_data-1;
		   IA:=0;
		   for i:=0 to n_data-1 do IA:=IA+tarea(sqr(a+(i*p0)),sqr(a+(i+1)*p0),p0);
	   until (abs(IP-IA) < epsilon)
	else IA:=0;

	writeln('Integral: ',IA:0:4);
end.
