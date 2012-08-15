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

program gauss_tb;
uses wincrt;

{Returns a trapeze area}
function tarea(b1,b2,h:real):real;
begin
	tarea:=(b1+b2)*(h/2);
end;

{Gauss Function, to be integrated}
function gauss(x:real):real;
begin
	gauss:=(exp(-(x*x)/2))/sqrt(2*pi);
end;


var t,p0,epsilon,IP,IA:real;
    isNeg:boolean;
    i:integer;
    n_data:longint;

begin
	writeln('Tabulate Gauss Function');
	writeln('Enter t to compute P(|X <= t|) ');

	{ setting boolean to track (t<0) }
	read(t);
	if t < 0 then
	   begin
		   t:=-t;
		   isNeg:=true;
	   end
	else isNeg:=false;

	writeln('Enter integration step');
	read(p0);

	writeln('Enter accuracy');
	read(epsilon);


	p0:=p0*2;
	IA:=0;

	repeat
		IP:=IA;
		p0:=p0/2;
		writeln('Current integration step ',p0);
		n_data:=trunc((t/p0))+1;
			if ((0+n_data*p0))> t then n_data:=n_data-1;
		IA:=0;
			for i:=0 to n_data-1 do 
				IA:=IA+tarea(gauss((0+i*p0)),gauss(0+(i+1)*p0),p0);
		IA:=IA+0.5;
			if isNeg then IA:=1-IA;
	until (abs(IP-IA) < epsilon) ;

	writeln('Result: ',IA:0:5);
end.
