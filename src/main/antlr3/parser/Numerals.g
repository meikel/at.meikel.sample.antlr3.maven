grammar Numerals;

@header {
package parser;
}

@lexer::header {
package parser;
}

/*------------------------------------------------------------------
 * PARSER RULES
 *------------------------------------------------------------------*/

start	: num;

num		: ( one_to_ninetynine | ( hundreds one_to_ninetynine ) | hundreds ) SEMICOLON;

one_to_nine : ONE
	| two_to_nine
	;
	
two_to_nine : TWO
		| THREE
		| FOUR
		| FIVE
		| SIX
		| SEVEN
		| EIGHT
		| NINE
		;

one_to_ninetynine : ONE
		| two_to_ninetynine
		;
		
two_to_ninetynine : two_to_nine
		| TEN
		| ELEVEN
		| TWELVE
		| (ONESHORT | two_to_nine) AND (TWENTY | THIRTY | FORTY | FIFTY | SIXTY | SEVENTY | EIGHTY | NINETY)
		;

hundreds : (ONESHORT | two_to_nine) HUNDRED;


/*------------------------------------------------------------------
 * LEXER RULES
 *------------------------------------------------------------------*/

WHITESPACE : ( '\t' | ' ' | '\r' | '\n'| '\u000C' )+ 	{ $channel = HIDDEN; } ;

SEMICOLON : ';';

AND		: 'und';

ONE		: 'eins';
ONESHORT : 'ein';
TWO		: 'zwei';
THREE	: 'drei';
FOUR	: 'vier';
FIVE	: 'fuenf';
SIX		: 'sechs';
SEVEN	: 'sieben';
EIGHT	: 'acht';
NINE	: ('n' | 'N') ('e' | 'E') ('u' | 'U') ('n' | 'N');
TEN		: 'zehn';
ELEVEN	: 'elf';
TWELVE	: 'zwoelf';
TWENTY	: 'zwanzig';
THIRTY	: 'dreissig';
FORTY	: 'vierzig';
FIFTY	: 'fuenfzig';
SIXTY	: 'sechzig';
SEVENTY	: 'siebzig';
EIGHTY	: 'achtzig';
NINETY	: 'neunzig';

HUNDRED	: 'hundert';
