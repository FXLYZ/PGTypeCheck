/****************************************************************************
*                     U N R E G I S T E R E D   C O P Y
* 
* You are on day 56 of your 30 day trial period.
* 
* This file was produced by an UNREGISTERED COPY of Parser Generator. It is
* for evaluation purposes only. If you continue to use Parser Generator 30
* days after installation then you are required to purchase a license. For
* more information see the online help or go to the Bumble-Bee Software
* homepage at:
* 
* http://www.bumblebeesoftware.com
* 
* This notice must remain present in the file. It cannot be removed.
****************************************************************************/

/****************************************************************************
* mylexer.cpp
* C++ source file generated from mylexer.l.
* 
* Date: 12/05/19
* Time: 18:15:41
* 
* ALex Version: 2.07
****************************************************************************/

#include <yyclex.h>

// namespaces
#ifdef YYSTDCPPLIB
using namespace std;
#endif
#ifdef YYNAMESPACE
using namespace yl;
#endif

#line 1 ".\\mylexer.l"
	#pragma warning(disable:4996)
	#include <stdio.h>
	#include <stdlib.h>
	#include <ctype.h>
	#include <fstream> 
	#include <map>
	#include <malloc.h>
	#include <string>
	#include <iostream>

	#include"myparser.h"

		
	extern int idcount;
	
	extern map< string , int >mymap;  
	const char* tokenStr[] = {"ADD", "EQ" 
	,"SEMI","NUMBER","LP","RP","IF","ELSE",
	"THEN","LB","RB","WHILE","DO","FOR",
	"COMMA","BREAK","CONTINUE","RETURN",
	"ID","CONST","DOUBLE","FLOAT","CHAR","INT","BOOL"
	,"SUB","MUL","DIV","DELIVERY","DEQ","NEQ","GT","LT","GE","LE","SADD","SSUB","LAND","LOR","AND","OR","NOT","LSHIFT","RSHIFT","SIZEOF","INPUT","OUTPUT"};
	enum {StmtK,ExpK,DeclK};
	enum {IfK,WhileK,AssignK,ForK,CompK,InputK,PrintK};
	enum {OpK,ConstK,IdK,TypeK,CK};
	enum {VarK};
	enum {Void,Integer,Char};

	#define MAXCHILDREN 4
	char *Id=new char[10];
	struct TreeNode
	  { 
	struct TreeNode * child[MAXCHILDREN];
     struct TreeNode * sibling;
     int lineno;
     int nodekind;
     int kind;
     union{ int op;
             int val;
           char *name; }attr;
     int value;
     int type;/* for type checking of exps */ 
   } ;

char hash1[1000][10];
int getid(char *text,int len);
int compute(char* str,int len);
int getNUM(char *text,int len);
extern YYSTYPE yylval;
extern int line;




 
#line 94 "mylexer.cpp"
// repeated because of possible precompiled header
#include <yyclex.h>

// namespaces
#ifdef YYSTDCPPLIB
using namespace std;
#endif
#ifdef YYNAMESPACE
using namespace yl;
#endif

#include ".\mylexer.h"

/////////////////////////////////////////////////////////////////////////////
// constructor

YYLEXERNAME::YYLEXERNAME()
{
	yytables();
}

/////////////////////////////////////////////////////////////////////////////
// destructor

YYLEXERNAME::~YYLEXERNAME()
{
}

#ifndef YYTEXT_SIZE
#define YYTEXT_SIZE 100
#endif
#ifndef YYUNPUT_SIZE
#define YYUNPUT_SIZE YYTEXT_SIZE
#endif
#ifndef YYTEXT_MAX
#define YYTEXT_MAX 0
#endif
#ifndef YYUNPUT_MAX
#define YYUNPUT_MAX YYTEXT_MAX
#endif

/****************************************************************************
* N O T E
* 
* If the compiler generates a YYLEXERNAME error then you have not declared
* the name of the lexical analyser. The easiest way to do this is to use a
* name declaration. This is placed in the declarations section of your Lex
* source file and is introduced with the %name keyword. For instance, the
* following name declaration declares the lexer mylexer:
* 
* %name mylexer
* 
* For more information see help.
****************************************************************************/

// backwards compatability with lex
#ifdef input
int YYLEXERNAME::yyinput()
{
	return input();
}
#else
#define input yyinput
#endif

#ifdef output
void YYLEXERNAME::yyoutput(int ch)
{
	output(ch);
}
#else
#define output yyoutput
#endif

#ifdef unput
void YYLEXERNAME::yyunput(int ch)
{
	unput(ch);
}
#else
#define unput yyunput
#endif

#ifndef YYNBORLANDWARN
#ifdef __BORLANDC__
#pragma warn -rch		// <warning: unreachable code> off
#endif
#endif

int YYLEXERNAME::yyaction(int action)
{
#line 134 ".\\mylexer.l"

YYSTYPE YYFAR& yylval = *(YYSTYPE YYFAR*)yyparserptr->yylvalptr;

#line 190 "mylexer.cpp"
	yyreturnflg = yytrue;
	switch (action) {
	case 1:
		{
#line 141 ".\\mylexer.l"
printf("NOTE\t%s",yytext);
#line 197 "mylexer.cpp"
		}
		break;
	case 2:
		{
#line 143 ".\\mylexer.l"
BEGIN COMMENT;printf("NOTE\n");
#line 204 "mylexer.cpp"
		}
		break;
	case 3:
		{
#line 144 ".\\mylexer.l"
BEGIN INITIAL;printf("\n");
#line 211 "mylexer.cpp"
		}
		break;
	case 4:
		{
#line 145 ".\\mylexer.l"
printf("%s",yytext);
#line 218 "mylexer.cpp"
		}
		break;
	case 5:
		{
#line 147 ".\\mylexer.l"
return ADD;
#line 225 "mylexer.cpp"
		}
		break;
	case 6:
		{
#line 148 ".\\mylexer.l"
return SUB;
#line 232 "mylexer.cpp"
		}
		break;
	case 7:
		{
#line 149 ".\\mylexer.l"
return DIV;
#line 239 "mylexer.cpp"
		}
		break;
	case 8:
		{
#line 150 ".\\mylexer.l"
return MUL;
#line 246 "mylexer.cpp"
		}
		break;
	case 9:
		{
#line 151 ".\\mylexer.l"
return DELIVERY;
#line 253 "mylexer.cpp"
		}
		break;
	case 10:
		{
#line 152 ".\\mylexer.l"
return EQ;
#line 260 "mylexer.cpp"
		}
		break;
	case 11:
		{
#line 153 ".\\mylexer.l"
return NEQ;
#line 267 "mylexer.cpp"
		}
		break;
	case 12:
		{
#line 154 ".\\mylexer.l"
return DEQ;
#line 274 "mylexer.cpp"
		}
		break;
	case 13:
		{
#line 155 ".\\mylexer.l"
return GT;
#line 281 "mylexer.cpp"
		}
		break;
	case 14:
		{
#line 156 ".\\mylexer.l"
return LT;
#line 288 "mylexer.cpp"
		}
		break;
	case 15:
		{
#line 157 ".\\mylexer.l"
return GE;
#line 295 "mylexer.cpp"
		}
		break;
	case 16:
		{
#line 158 ".\\mylexer.l"
return LE;
#line 302 "mylexer.cpp"
		}
		break;
	case 17:
		{
#line 159 ".\\mylexer.l"
return SADD;
#line 309 "mylexer.cpp"
		}
		break;
	case 18:
		{
#line 160 ".\\mylexer.l"
return SSUB;
#line 316 "mylexer.cpp"
		}
		break;
	case 19:
		{
#line 161 ".\\mylexer.l"
return LAND;
#line 323 "mylexer.cpp"
		}
		break;
	case 20:
		{
#line 162 ".\\mylexer.l"
return LOR;
#line 330 "mylexer.cpp"
		}
		break;
	case 21:
		{
#line 163 ".\\mylexer.l"
return LN;
#line 337 "mylexer.cpp"
		}
		break;
	case 22:
		{
#line 164 ".\\mylexer.l"
return AND;
#line 344 "mylexer.cpp"
		}
		break;
	case 23:
		{
#line 165 ".\\mylexer.l"
return OR;
#line 351 "mylexer.cpp"
		}
		break;
	case 24:
		{
#line 166 ".\\mylexer.l"
;return NOT;
#line 358 "mylexer.cpp"
		}
		break;
	case 25:
		{
#line 167 ".\\mylexer.l"
;return LSHIFT;
#line 365 "mylexer.cpp"
		}
		break;
	case 26:
		{
#line 168 ".\\mylexer.l"
return RSHIFT;
#line 372 "mylexer.cpp"
		}
		break;
	case 27:
		{
#line 169 ".\\mylexer.l"
return SIZEOF;
#line 379 "mylexer.cpp"
		}
		break;
	case 28:
		{
#line 172 ".\\mylexer.l"
;return LB;
#line 386 "mylexer.cpp"
		}
		break;
	case 29:
		{
#line 173 ".\\mylexer.l"
;return RB;
#line 393 "mylexer.cpp"
		}
		break;
	case 30:
		{
#line 174 ".\\mylexer.l"
return LP;
#line 400 "mylexer.cpp"
		}
		break;
	case 31:
		{
#line 175 ".\\mylexer.l"
;return RP;
#line 407 "mylexer.cpp"
		}
		break;
	case 32:
		{
#line 176 ".\\mylexer.l"
return SEMI;
#line 414 "mylexer.cpp"
		}
		break;
	case 33:
		{
#line 177 ".\\mylexer.l"
return COMMA;
#line 421 "mylexer.cpp"
		}
		break;
	case 34:
		{
#line 178 ".\\mylexer.l"

#line 428 "mylexer.cpp"
		}
		break;
	case 35:
		{
#line 180 ".\\mylexer.l"
;return IF;
#line 435 "mylexer.cpp"
		}
		break;
	case 36:
		{
#line 181 ".\\mylexer.l"
return WHILE;
#line 442 "mylexer.cpp"
		}
		break;
	case 37:
		{
#line 182 ".\\mylexer.l"

#line 449 "mylexer.cpp"
		}
		break;
	case 38:
		{
#line 183 ".\\mylexer.l"

#line 456 "mylexer.cpp"
		}
		break;
	case 39:
		{
#line 184 ".\\mylexer.l"

#line 463 "mylexer.cpp"
		}
		break;
	case 40:
		{
#line 185 ".\\mylexer.l"
;
#line 470 "mylexer.cpp"
		}
		break;
	case 41:
		{
#line 186 ".\\mylexer.l"
;return FOR;
#line 477 "mylexer.cpp"
		}
		break;
	case 42:
		{
#line 187 ".\\mylexer.l"
;return THEN;
#line 484 "mylexer.cpp"
		}
		break;
	case 43:
		{
#line 188 ".\\mylexer.l"
return ELSE;
#line 491 "mylexer.cpp"
		}
		break;
	case 44:
		{
#line 189 ".\\mylexer.l"
return DO;
#line 498 "mylexer.cpp"
		}
		break;
	case 45:
		{
#line 190 ".\\mylexer.l"
return BREAK;
#line 505 "mylexer.cpp"
		}
		break;
	case 46:
		{
#line 191 ".\\mylexer.l"
return CONTINUE;
#line 512 "mylexer.cpp"
		}
		break;
	case 47:
		{
#line 192 ".\\mylexer.l"
;return RETURN;
#line 519 "mylexer.cpp"
		}
		break;
	case 48:
		{
#line 193 ".\\mylexer.l"

#line 526 "mylexer.cpp"
		}
		break;
	case 49:
		{
#line 194 ".\\mylexer.l"
return INPUT;
#line 533 "mylexer.cpp"
		}
		break;
	case 50:
		{
#line 195 ".\\mylexer.l"
return OUTPUT;
#line 540 "mylexer.cpp"
		}
		break;
	case 51:
		{
#line 197 ".\\mylexer.l"
;return INT;
#line 547 "mylexer.cpp"
		}
		break;
	case 52:
		{
#line 198 ".\\mylexer.l"
;return CHAR;
#line 554 "mylexer.cpp"
		}
		break;
	case 53:
		{
#line 199 ".\\mylexer.l"
;return FLOAT;
#line 561 "mylexer.cpp"
		}
		break;
	case 54:
		{
#line 200 ".\\mylexer.l"
;return DOUBLE;
#line 568 "mylexer.cpp"
		}
		break;
	case 55:
		{
#line 201 ".\\mylexer.l"
return BOOL;
#line 575 "mylexer.cpp"
		}
		break;
	case 56:
		{
#line 202 ".\\mylexer.l"

#line 582 "mylexer.cpp"
		}
		break;
	case 57:
		{
#line 203 ".\\mylexer.l"

#line 589 "mylexer.cpp"
		}
		break;
	case 58:
		{
#line 206 ".\\mylexer.l"
printf("%s      \t%s\t%s\t \n","constant",yytext,yytext);
TreeNode * t = (TreeNode *) malloc(sizeof(TreeNode));//number节点
                    for (int i=0;i<MAXCHILDREN;i++) t->child[i] = NULL;
                    t->sibling = NULL;
                    t->nodekind = ExpK;
                    t->kind = ConstK;
                    t->lineno = line++;
                    t->type = Integer;
			        t->attr.val=getNUM(yytext,yyleng);		        
			        yylval =t;	
			        return CONST;
			        
#line 607 "mylexer.cpp"
		}
		break;
	case 59:
		{
#line 221 ".\\mylexer.l"
printf("%s      \t%s\t%s\t \n","charc",yytext,yytext);
	TreeNode * t = (TreeNode *) malloc(sizeof(TreeNode));
    for (int i=0;i<MAXCHILDREN;i++) t->child[i] = NULL;//初始化孩子结点为空
    t->sibling = NULL;
    t->nodekind = ExpK;//表达式
    t->kind = CK;
    t->lineno = line++;
    t->type = Char;

    t->attr.name=hash1[getid(yytext,yyleng)];
	yylval = t;
			        return CONST;
#line 625 "mylexer.cpp"
		}
		break;
	case 60:
		{
#line 235 ".\\mylexer.l"

	if (mymap.count(yytext) == 0){
	 	TreeNode * t = (TreeNode *) malloc(sizeof(TreeNode));//ID节点
    for (int i=0;i<MAXCHILDREN;i++) t->child[i] = NULL;//初始化孩子结点为空
    t->sibling = NULL;
    t->nodekind = ExpK;//表达式
    t->kind = IdK;
    t->lineno = line++;
    t->type = Void ;
    t->attr.name=hash1[getid(yytext,yyleng)];
	yylval = t;
	}
	else{
	TreeNode * t = (TreeNode *) malloc(sizeof(TreeNode));//ID节点
    for (int i=0;i<MAXCHILDREN;i++) t->child[i] = NULL;//初始化孩子结点为空
    t->sibling = NULL;
    t->nodekind = ExpK;//表达式
    t->kind = IdK;
    t->lineno = line++;
    t->type = mymap[yytext];;

    t->attr.name=hash1[getid(yytext,yyleng)];
	yylval = t;
	}
	
	return ID;
	
#line 658 "mylexer.cpp"
		}
		break;
	case 61:
		{
#line 262 ".\\mylexer.l"
 /* do    nothing*/ 
#line 665 "mylexer.cpp"
		}
		break;
#line 263 ".\\mylexer.l"
 
#line 670 "mylexer.cpp"
	default:
		yyassert(0);
		break;
	}
	yyreturnflg = yyfalse;
	return 0;
}

#ifndef YYNBORLANDWARN
#ifdef __BORLANDC__
#pragma warn .rch		// <warning: unreachable code> to the old state
#endif
#endif

void YYLEXERNAME::yytables()
{
	yystext_size = YYTEXT_SIZE;
	yysunput_size = YYUNPUT_SIZE;
	yytext_max = YYTEXT_MAX;
	yyunput_max = YYUNPUT_MAX;

	static const yymatch_t YYNEARFAR YYBASED_CODE match[] = {
		0
	};
	yymatch = match;

	yytransitionmax = 324;
	static const yytransition_t YYNEARFAR YYBASED_CODE transition[] = {
		{ 0, 0 },
		{ 5, 1 },
		{ 5, 1 },
		{ 73, 35 },
		{ 74, 35 },
		{ 5, 1 },
		{ 82, 82 },
		{ 82, 82 },
		{ 82, 82 },
		{ 82, 82 },
		{ 82, 82 },
		{ 82, 82 },
		{ 82, 82 },
		{ 82, 82 },
		{ 82, 82 },
		{ 82, 82 },
		{ 48, 17 },
		{ 76, 36 },
		{ 75, 35 },
		{ 96, 69 },
		{ 68, 31 },
		{ 49, 17 },
		{ 70, 32 },
		{ 97, 69 },
		{ 5, 1 },
		{ 6, 1 },
		{ 5, 1 },
		{ 77, 36 },
		{ 69, 31 },
		{ 7, 1 },
		{ 8, 1 },
		{ 9, 1 },
		{ 10, 1 },
		{ 11, 1 },
		{ 12, 1 },
		{ 13, 1 },
		{ 14, 1 },
		{ 15, 1 },
		{ 16, 1 },
		{ 17, 1 },
		{ 18, 1 },
		{ 18, 1 },
		{ 18, 1 },
		{ 18, 1 },
		{ 18, 1 },
		{ 18, 1 },
		{ 18, 1 },
		{ 18, 1 },
		{ 18, 1 },
		{ 18, 1 },
		{ 71, 33 },
		{ 19, 1 },
		{ 20, 1 },
		{ 21, 1 },
		{ 22, 1 },
		{ 65, 29 },
		{ 148, 3 },
		{ 148, 3 },
		{ 66, 29 },
		{ 51, 82 },
		{ 148, 3 },
		{ 5, 148 },
		{ 5, 148 },
		{ 60, 26 },
		{ 58, 25 },
		{ 5, 148 },
		{ 83, 51 },
		{ 59, 25 },
		{ 83, 51 },
		{ 72, 34 },
		{ 61, 26 },
		{ 55, 22 },
		{ 56, 22 },
		{ 52, 20 },
		{ 53, 20 },
		{ 47, 15 },
		{ 24, 1 },
		{ 62, 26 },
		{ 57, 24 },
		{ 148, 3 },
		{ 78, 37 },
		{ 148, 3 },
		{ 79, 38 },
		{ 80, 40 },
		{ 5, 148 },
		{ 81, 49 },
		{ 5, 148 },
		{ 0, 50 },
		{ 44, 8 },
		{ 149, 3 },
		{ 25, 1 },
		{ 26, 1 },
		{ 27, 1 },
		{ 28, 1 },
		{ 29, 1 },
		{ 30, 1 },
		{ 85, 57 },
		{ 31, 1 },
		{ 86, 58 },
		{ 87, 59 },
		{ 32, 1 },
		{ 88, 60 },
		{ 89, 61 },
		{ 33, 1 },
		{ 90, 62 },
		{ 91, 63 },
		{ 34, 1 },
		{ 35, 1 },
		{ 36, 1 },
		{ 92, 64 },
		{ 37, 1 },
		{ 38, 1 },
		{ 45, 9 },
		{ 93, 65 },
		{ 95, 67 },
		{ 39, 1 },
		{ 40, 1 },
		{ 41, 1 },
		{ 42, 1 },
		{ 94, 66 },
		{ 43, 6 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 98, 70 },
		{ 99, 71 },
		{ 100, 72 },
		{ 101, 73 },
		{ 102, 74 },
		{ 103, 75 },
		{ 104, 76 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 105, 77 },
		{ 106, 78 },
		{ 107, 79 },
		{ 63, 27 },
		{ 9, 9 },
		{ 64, 28 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 9, 9 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 108, 85 },
		{ 109, 86 },
		{ 110, 87 },
		{ 111, 88 },
		{ 112, 89 },
		{ 113, 90 },
		{ 114, 91 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 115, 92 },
		{ 116, 93 },
		{ 117, 95 },
		{ 118, 96 },
		{ 23, 146 },
		{ 119, 98 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 23, 146 },
		{ 50, 18 },
		{ 120, 99 },
		{ 18, 18 },
		{ 18, 18 },
		{ 18, 18 },
		{ 18, 18 },
		{ 18, 18 },
		{ 18, 18 },
		{ 18, 18 },
		{ 18, 18 },
		{ 18, 18 },
		{ 18, 18 },
		{ 84, 84 },
		{ 84, 84 },
		{ 84, 84 },
		{ 84, 84 },
		{ 84, 84 },
		{ 84, 84 },
		{ 84, 84 },
		{ 84, 84 },
		{ 84, 84 },
		{ 84, 84 },
		{ 121, 100 },
		{ 122, 101 },
		{ 123, 102 },
		{ 124, 103 },
		{ 125, 104 },
		{ 108, 105 },
		{ 126, 106 },
		{ 127, 107 },
		{ 128, 110 },
		{ 129, 113 },
		{ 130, 114 },
		{ 131, 116 },
		{ 132, 118 },
		{ 133, 120 },
		{ 134, 121 },
		{ 135, 122 },
		{ 136, 123 },
		{ 137, 124 },
		{ 138, 127 },
		{ 139, 129 },
		{ 140, 130 },
		{ 141, 133 },
		{ 142, 134 },
		{ 143, 136 },
		{ 144, 137 },
		{ 145, 139 },
		{ 146, 145 },
		{ 46, 13 },
		{ 67, 30 },
		{ 54, 21 },
		{ 150, 149 }
	};
	yytransition = transition;

	static const yystate_t YYNEARFAR YYBASED_CODE state[] = {
		{ 0, 0, 0 },
		{ 146, -8, 0 },
		{ 1, 0, 0 },
		{ -147, 47, 0 },
		{ 3, 0, 0 },
		{ 148, 0, 61 },
		{ 0, 59, 21 },
		{ 0, 0, 9 },
		{ 0, 50, 22 },
		{ 0, 73, 0 },
		{ 0, 0, 30 },
		{ 0, 0, 31 },
		{ 0, 0, 8 },
		{ 0, 277, 5 },
		{ 0, 0, 33 },
		{ 0, 30, 6 },
		{ 0, 0, 34 },
		{ 0, -26, 7 },
		{ 82, 225, 58 },
		{ 0, 0, 32 },
		{ 0, 13, 14 },
		{ 0, 261, 10 },
		{ 0, 10, 13 },
		{ 146, 0, 60 },
		{ 146, -4, 60 },
		{ 146, -47, 60 },
		{ 146, -34, 60 },
		{ 146, 56, 60 },
		{ 146, 61, 60 },
		{ 146, -53, 60 },
		{ 146, 210, 60 },
		{ 146, -82, 60 },
		{ 146, -89, 60 },
		{ 146, -67, 60 },
		{ 146, -32, 60 },
		{ 146, -101, 60 },
		{ 146, -87, 60 },
		{ 146, -31, 60 },
		{ 146, -22, 60 },
		{ 0, 0, 28 },
		{ 0, -41, 23 },
		{ 0, 0, 29 },
		{ 0, 0, 24 },
		{ 0, 0, 11 },
		{ 0, 0, 19 },
		{ 0, 0, 59 },
		{ 0, 0, 17 },
		{ 0, 0, 18 },
		{ 0, 0, 2 },
		{ -49, 75, 0 },
		{ 82, -14, 0 },
		{ 84, 23, 0 },
		{ 0, 0, 25 },
		{ 0, 0, 16 },
		{ 0, 0, 12 },
		{ 0, 0, 15 },
		{ 0, 0, 26 },
		{ 146, 11, 60 },
		{ 146, -13, 60 },
		{ 146, -2, 60 },
		{ 146, -14, 60 },
		{ 146, 5, 60 },
		{ 146, -6, 60 },
		{ 146, -12, 44 },
		{ 146, -6, 60 },
		{ 146, 2, 60 },
		{ 146, 5, 60 },
		{ 146, -2, 60 },
		{ 146, 0, 35 },
		{ 146, -93, 60 },
		{ 146, 21, 60 },
		{ 146, 16, 60 },
		{ 146, 17, 60 },
		{ 146, 23, 60 },
		{ 146, 13, 60 },
		{ 146, 31, 60 },
		{ 146, 36, 60 },
		{ 146, 47, 60 },
		{ 146, 60, 60 },
		{ 146, 61, 60 },
		{ 0, 0, 20 },
		{ 0, 0, 1 },
		{ 0, -42, 58 },
		{ 84, 0, 0 },
		{ 0, 235, 58 },
		{ 146, 137, 60 },
		{ 146, 99, 60 },
		{ 146, 111, 60 },
		{ 146, 108, 60 },
		{ 146, 96, 60 },
		{ 146, 95, 60 },
		{ 146, 114, 60 },
		{ 146, 138, 60 },
		{ 146, 143, 60 },
		{ 146, 0, 41 },
		{ 146, 130, 60 },
		{ 146, 125, 60 },
		{ 146, 0, 51 },
		{ 146, 141, 60 },
		{ 146, 160, 60 },
		{ 146, 176, 60 },
		{ 146, 180, 60 },
		{ 146, 194, 60 },
		{ 146, 180, 60 },
		{ 146, 187, 60 },
		{ 146, 197, 60 },
		{ 146, 199, 60 },
		{ 146, 192, 60 },
		{ 146, 0, 38 },
		{ 146, 0, 55 },
		{ 146, 194, 60 },
		{ 146, 0, 40 },
		{ 146, 0, 52 },
		{ 146, 197, 60 },
		{ 146, 195, 60 },
		{ 146, 0, 43 },
		{ 146, 188, 60 },
		{ 146, 0, 48 },
		{ 146, 189, 60 },
		{ 146, 0, 56 },
		{ 146, 189, 60 },
		{ 146, 193, 60 },
		{ 146, 192, 60 },
		{ 146, 198, 60 },
		{ 146, 211, 60 },
		{ 146, 0, 42 },
		{ 146, 0, 37 },
		{ 146, 210, 60 },
		{ 146, 0, 45 },
		{ 146, 202, 60 },
		{ 146, 212, 60 },
		{ 146, 0, 53 },
		{ 146, 0, 49 },
		{ 146, 198, 60 },
		{ 146, 205, 60 },
		{ 146, 0, 57 },
		{ 146, 214, 60 },
		{ 146, 213, 60 },
		{ 146, 0, 36 },
		{ 146, 201, 60 },
		{ 146, 0, 54 },
		{ 146, 0, 50 },
		{ 146, 0, 47 },
		{ 146, 0, 27 },
		{ 146, 0, 39 },
		{ 146, 218, 60 },
		{ 0, 148, 46 },
		{ 0, 0, 4 },
		{ 0, 52, 4 },
		{ 0, 276, 4 },
		{ 0, 0, 3 }
	};
	yystate = state;

	static const yybackup_t YYNEARFAR YYBASED_CODE backup[] = {
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0,
		0
	};
	yybackup = backup;
}
#line 264 ".\\mylexer.l"
 

int getNUM(char *text,int len){
    int value=0;
    for(int i=0;i<len;i++)
    {
        value=value*10+*text-'0';//把字节变成数
        text++;
    }
    return value;
}

int getid(char *text,int len)
{
    int i=0;
    for(i;i<len;i++)//读入一个单词
    {
        Id[i]=*text;
        text++;//读入下一个单词
    }
    Id[i]='\0';//读完所有单词以后加上\0结束符
    int index =compute(Id,len)%1000;//index:id在符号表中的位置	
    if(hash1[index][0]=='\0')	//如果不存在该变量
    {
        strcpy(hash1[index],Id);//创建该变量
    }
    else{
        while(hash1[index][0]!='\0'&&strcmp(Id,hash1[index])!=0)//index不为空且id数组和index下标不相等
//找没有用过的index，防止溢出 
          {
            index++;
          }
        }
    return index;
}
int compute(char* str,int len)
{
    int hash = 0;  
    for (int i=0;str[i]!='\0';i++)//依次读入id直到遇到结束符
    {
        hash=hash+str[i];//ASC码减去a得到返回位置
    }
    return hash;  
}




/*

TypeWord [void|int|char|float|double|bool|long|short|singed|unsigned]
BoolWord [true|false|TRUE|FALSE]
SwitchWord [switch|case]
BranchWord [for|while|if|else|do]
JumpWord [break|continue|return|goto] 
*/
