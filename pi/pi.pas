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

program eval_pi;
uses wincrt;

{	
	May need to activate 8087/80287 Numeric Progressing 
	in Compiler Settings
}

var inC,outC,nGen:integer;
    randX,randY:double;

begin
	Randomize;
	write('How many generations ? ');
	readln(nGen);
	inC:=0;
	outC:=0;
	repeat
		randX:=random(100)/100;
		randY:=random(100)/100;
		nGen:=nGen-1;
			if ((randX-0.5)*(randX-0.5)+(randY-0.5)*(randY-0.5)<0.5*0.5) Then
				inC:= inC+1
			else outC:=outC+1;
		writeln('Generations fell the circle: ',inC,' Total : ',(inC+outC));
		writeln('Current Pi Evaluation : ',(inC/(outC+inC))*4);
		writeln;
	until (nGen<=0);
end.

