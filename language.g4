

grammar language;

//definition de Programme
prog : (declaration)+(definitionF)* instruction;


//definition de fonction/Proc

definitionF:Variable( ('(' Variable ':' type')')* ) ':' type

            (declaration)+ instruction;
//instruction

instruction :(condition|boucle|affectation|phi|'skip') (';'instruction)*;

//affectation

affectation : Variable ':=' expression;


//partie Expression
expression : UOP expression | expression (Arith|Compar|Logical) expression

            |expression'[' expression ']'|affectation|phi|'new array of' type '['expression']'|Variable |Number; //pas encore fait le tableau

//partie condition + boucle
condition: 'if' expression 'then' (instruction)+'else' (instruction)+;

boucle :'while' expression 'do' (instruction)+ ;

//partie declaration de variable et de constante
declaration :decVar|decConst;
decVar :'var' Variable ':' type;
decConst:'const' Variable ':' (Number|'true'|'false');

type : 'integer'|'boolean'|'array of' type;
//la partie array n'ai tjrs pas faites

phi:('read'|'write'|Variable)'('    ( expression|expression'('expression')'   )*   ')';

UOP :'-'|'not';
Arith: '+'|'-'|'*'|'/';
Logical:'and'|'or';
Compar :'<'|'≤'|'='|'!='|'>'|'≥';
Variable : [a-zA-Z]+[0-9]*;
Number:[0-9]+;
NEWLINE:('\r'?'\n'|'\r')+ ->skip;
WS : [ \t\r\n]+ -> skip;
