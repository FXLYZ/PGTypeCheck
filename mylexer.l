%{	#pragma warning(disable:4996)
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



%} 
 
%name mylexer 

delim [" "\n\t\r]
allch [.\n\t] 
whitespace {delim}+ 
//注释
NOTE  \/\/(.)*\n

//运算符
ADD	\+
SUB \-
MUL \*
DIV \/
DELIVERY  \%
EQ        =
DEQ       ==
NEQ       !=
GT		\>
LT		\<
GE	\>=
LE	\<=
SADD	\+\+
SSUB	\-\-
LAND	&&
LOR		\|\|
LN		!
AND  &
OR   \|
NOT  ~
LSHIFT \<\<
RSHIFT \>\>
SIZEOF sizeof
//标点
LBRACE	\{
RBRACE  \}
LPAREN	\(
RPAREN	\)
SEMICOLON	\;
COMMA \,
DOT \.
//关键字
IF        if
WHILE     while
VOID	void
TRUE	true|TRUE
FALSE	false|FALSE
SWITCH	switch
CASE	case
FOR		for
ELSE	else
DO		do
BREAK	break
CONTINUE	continue
RETURN	return
GOTO	goto
THEN then
INPUT input
OUTPUT output
//声明
INT int
CHAR char
FLOAT float
DOUBLE double
BOOL bool
LONG long
SHORT	short

//数字，字母,标识符
num			[0-9]
letter      [_a-zA-Z]
alnum       [_a-zA-Z0-9]
constant	({num}+(\.{num}+)?(e([\+\-])?{num}+)?)
charc       '{alnum}*'
ID  {letter}{alnum}*
%s COMMENT

%%

%{
YYSTYPE YYFAR& yylval = *(YYSTYPE YYFAR*)yyparserptr->yylvalptr;
%}



//注释
<INITIAL>{NOTE}		{printf("NOTE\t%s",yytext);}

<INITIAL>"/*"						{BEGIN COMMENT;printf("NOTE\n");}
<COMMENT>"*/"						{BEGIN INITIAL;printf("\n");}
<COMMENT>.|\n						{printf("%s",yytext);}
//运算符
<INITIAL>{ADD}		{return ADD;}
<INITIAL>{SUB}		{return SUB;}
<INITIAL>{DIV}		{return DIV;}
<INITIAL>{MUL}		{return MUL;}
<INITIAL>{DELIVERY}		{return DELIVERY;}
<INITIAL>{EQ}		{return EQ;}
<INITIAL>{NEQ}		{return NEQ;}
<INITIAL>{DEQ}		{return DEQ;}
<INITIAL>{GT}		{return GT;}
<INITIAL>{LT}		{return LT;}
<INITIAL>{GE}		{return GE;}
<INITIAL>{LE}		{return LE;}
<INITIAL>{SADD}		{return SADD;}
<INITIAL>{SSUB}		{return SSUB;}
<INITIAL>{LAND}		{return LAND;}
<INITIAL>{LOR}		{return LOR;}
<INITIAL>{LN}		{return LN;}
<INITIAL>{AND}		{return AND;}
<INITIAL>{OR}		{return OR;}
<INITIAL>{NOT}		{;return NOT;}
<INITIAL>{LSHIFT}		{;return LSHIFT;}
<INITIAL>{RSHIFT}		{return RSHIFT;}
<INITIAL>{SIZEOF}		{return SIZEOF;}

//标点
<INITIAL>{LBRACE}		{;return LB;}
<INITIAL>{RBRACE}		{;return RB;}
<INITIAL>{LPAREN}		{return LP;}
<INITIAL>{RPAREN}		{;return RP;}
<INITIAL>{SEMICOLON}		{return SEMI;}
<INITIAL>{COMMA}		{return COMMA;}
<INITIAL>{DOT}		{}
//关键字
<INITIAL>{IF}		{;return IF;}
<INITIAL>{WHILE}		{return WHILE;}
<INITIAL>{VOID}		{}
<INITIAL>{TRUE}		{}
<INITIAL>{SWITCH}		{}
<INITIAL>{CASE}		{;}
<INITIAL>{FOR}		{;return FOR;}
<INITIAL>{THEN}		{;return THEN;}
<INITIAL>{ELSE}		{return ELSE;}
<INITIAL>{DO}		{return DO;}
<INITIAL>{BREAK}		{return BREAK;}
<INITIAL>{CONTINUE}		{return CONTINUE;}
<INITIAL>{RETURN}		{;return RETURN;}
<INITIAL>{GOTO}		{}
<INITIAL>{INPUT}		{return INPUT;}
<INITIAL>{OUTPUT}		{return OUTPUT;}
//声明
<INITIAL>{INT}		{;return INT;}
<INITIAL>{CHAR}		{;return CHAR;}
<INITIAL>{FLOAT}		{;return FLOAT;}
<INITIAL>{DOUBLE}		{;return DOUBLE;}
<INITIAL>{BOOL}		{return BOOL;}
<INITIAL>{LONG}		{}
<INITIAL>{SHORT}		{}


<INITIAL>{constant} {printf("%s      \t%s\t%s\t \n","constant",yytext,yytext);
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
			        }


//char型常量
<INITIAL>{charc} {printf("%s      \t%s\t%s\t \n","charc",yytext,yytext);
	TreeNode * t = (TreeNode *) malloc(sizeof(TreeNode));
    for (int i=0;i<MAXCHILDREN;i++) t->child[i] = NULL;//初始化孩子结点为空
    t->sibling = NULL;
    t->nodekind = ExpK;//表达式
    t->kind = CK;
    t->lineno = line++;
    t->type = Char;

    t->attr.name=hash1[getid(yytext,yyleng)];
	yylval = t;
			        return CONST;}


<INITIAL>{ID} {
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
	} 
{whitespace} { /* do    nothing*/ } 
 
%% 

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