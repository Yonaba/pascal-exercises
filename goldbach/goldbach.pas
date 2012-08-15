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

program goldbach;
uses wincrt;

{Prime test}
function isPrime(n:integer):boolean;
var i:integer;
    isDiv:boolean;
begin
	if (n=1) then isPrime:=false
	else  
		begin
		isDiv:=false;
			for i:=2 to trunc(sqrt(n)) do
			   if ((n mod i)=0) then isDiv:=true;
			if (isDiv) then isPrime:=false
			else isPrime:=true;
		end;
end;

{Main}
var n,a,b,i:integer;
begin
	writeln('Enter n'); 
	read(n);
	if ((n mod 2)<>0) then writeln(n, 'is not a prime number!')
	else
		for i:=1 to (n div 2) do  begin
		a:=i;  b:=n-i;
		  if isPrime(a) and isPrime(b) then writeln(n,' = ',a,' + ',b);
		end;
end.