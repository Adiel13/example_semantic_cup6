package udv.compi;

import java.io.*;
import java.util.ArrayList;
import java_cup.runtime.*;

%%
%public
%class Scanner
%cup
%function next_token 

digit = [0-9]
letter = [a-zA-Z]
Whitespace = [ \t\f] | {LineTerminator}
LineTerminator = \r|\n|\r\n

%{

StringBuffer string = new StringBuffer();

private Symbol symbol(int type){
	return new Symbol(type, yyline, yycolumn);
}

private Symbol symbol(int type, Object value){
	return new Symbol(type, yyline, yycolumn, value);
}

%}

%eofval{
	return symbol(ParserSym.EOF);
%eofval}

%%
<YYINITIAL>"int"|"double"|"String" { return symbol(ParserSym.TIPO, yytext()); }

<YYINITIAL>{letter}({letter}|{digit})* { return symbol(ParserSym.ID, yytext()); }
<YYINITIAL>"{" { return symbol(ParserSym.LLA, yytext()); }
<YYINITIAL>"}" { return symbol(ParserSym.LLC, yytext()); }
<YYINITIAL>"(" { return symbol(ParserSym.CA, yytext()); }
<YYINITIAL>")" { return symbol(ParserSym.CC, yytext()); }
<YYINITIAL>":" { return symbol(ParserSym.DP, yytext()); }
<YYINITIAL>"," { return symbol(ParserSym.COMMA, yytext()); }
<YYINITIAL>"\"" { return symbol(ParserSym.COMILLA, yytext()); }
<YYINITIAL>"=" { return symbol(ParserSym.IGUAL, yytext()); }
<YYINITIAL>";" { return symbol(ParserSym.PYC, yytext()); }
<YYINITIAL>"+" { return symbol(ParserSym.PLUS, yytext()); }
<YYINITIAL>"*" { return symbol(ParserSym.PRO, yytext()); }
<YYINITIAL>({digit})+ { return symbol(ParserSym.NUM, yytext()); }
<YYINITIAL>({digit})+"."({digit})+ { return symbol(ParserSym.DOU, yytext()); }


<YYINITIAL>{Whitespace} {}

\n {yychar=1;}
. {System.err.println("warning: Unrecognized character '" + yytext()+"' -- ignored" + " at : "+ (yyline+1) + " " + (yycolumn+1) + " " + yychar); }