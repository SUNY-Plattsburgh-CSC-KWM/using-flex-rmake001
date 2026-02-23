%{
#include <stdio.h>

typedef enum {
    TOKEN_EOF = 0,
    TOKEN_ASSIGN,
    TOKEN_PLUS,
    TOKEN_MULTIPLY,
    TOKEN_LPAREN,
    TOKEN_RPAREN,
    TOKEN_IDENT,
    TOKEN_NUMBER,
    TOKEN_ERROR
} token_t;

%}

%option noyywrap

NUMBER    [0-9]+
IDENT    [a-z][a-z0-9]{0,7}

%%

"="        { return TOKEN_ASSIGN; }
"+"        { return TOKEN_PLUS; }
"*"        { return TOKEN_MULTIPLY; }
"("        { return TOKEN_LPAREN; }
")"        { return TOKEN_RPAREN; }

{NUMBER}      { return TOKEN_NUMBER; }
{IDENT}      { return TOKEN_IDENT; }

[ \t\n]+   ;   /* ignore whitespace */

.          { return TOKEN_ERROR; }

%%

int main() {
    token_t tok;
    while ((tok = yylex()) != 0) {   // 0 = TOKEN_EOF
        if (tok == TOKEN_IDENT) {
            printf("IDENT(%s)\n", yytext);
        } else if (tok == TOKEN_NUMBER) {
            printf("NUMBER(%s)\n", yytext);
        } else if (tok == TOKEN_ASSIGN) {
            printf("ASSIGN\n");
        } else if (tok == TOKEN_PLUS) {
            printf("PLUS\n");
        } else if (tok == TOKEN_MULTIPLY) {
            printf("MULTIPLY\n");
        } else if (tok == TOKEN_LPAREN) {
            printf("LPAREN\n");
        } else if (tok == TOKEN_RPAREN) {
            printf("RPAREN\n");
        } else {
            printf("ERROR(%s)\n", yytext);
        }
    }
    return 0;
}