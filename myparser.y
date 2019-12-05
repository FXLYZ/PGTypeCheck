%{

#include <stdlib.h>
#include <map>
#include<string>
#include "mylexer.h"
#include <stdio.h>
#include <windows.h>

map<string, int >mymap;  

int idcount = 0;
enum {StmtK,ExpK,DeclK};

enum {IfK,WhileK,AssignK,ForK,CompK,InputK,PrintK,JumpK,SemiK};


enum {OpK,ConstK,IdK,TypeK,CK};

enum {VarK};//变量声明

enum {Void,Integer,Char,Boolean};

#define MAXCHILDREN 4//最多孩子数
int line=0;
int Num=0;//给ShowNode行数计数
int err=0;
struct TreeNode
   { 
	struct TreeNode * child[MAXCHILDREN];
     struct TreeNode * sibling;//兄弟
     int lineno;
     int nodekind;//三个节点类型 stmt exp decl
     int kind;// op const id type var
     union{ int op;//存储token中的符号
             int val;//数字常量的值
           char *name; }attr;//if语句,while语句,变量声明,id声明等
     int value;//数字常量的值
     int type; /* for type checking of exps */
   } ;
   
   
TreeNode * newStmtNode(int kind)
{ 
  TreeNode * t = (TreeNode *) malloc(sizeof(TreeNode));
  int i;
  if (t==NULL)
   printf("Out of memory error at line %d\n",line);
  else {
    for (i=0;i<MAXCHILDREN;i++) t->child[i] = NULL;
    t->sibling = NULL;
    t->nodekind = StmtK;
    t->kind = kind;
    t->lineno = line++;
    t->type=Void;
  }
  return t;  
}

TreeNode * newExpNode(int kind)
{
  TreeNode * t = (TreeNode *) malloc(sizeof(TreeNode));
  int i;
  if (t==NULL)
    printf("Out of memory error at line %d\n",line);
  else {
    for (i=0;i<MAXCHILDREN;i++) t->child[i] = NULL;
    t->sibling = NULL;
    t->nodekind = ExpK;
    t->kind = kind;
    t->lineno = line++;
    t->type = Void;
  }
  return t;
}


TreeNode * newDeclNode(int kind)
{
  TreeNode * t = (TreeNode *) malloc(sizeof(TreeNode));
  int i;
  if (t==NULL)
    printf("Out of memory error at line %d\n",line);
  else {
    for (i=0;i<MAXCHILDREN;i++) t->child[i] = NULL;
    t->sibling = NULL;
    t->nodekind = DeclK;
    t->kind = kind;
    t->lineno = line++;
    t->type=Void;
  }
  return t;
}

TreeNode* root;
void Display(struct TreeNode *p);		//显示语法树
void ShowNode(struct TreeNode *p);		//显示某个节点
void CheckNode(struct TreeNode *p);	//检查节点

/****************************************************************************
myparser.y
ParserWizard generated YACC file.

Date: 2019年10月18日
****************************************************************************/
%}

/////////////////////////////////////////////////////////////////////////////
// declarations section

// parser name
%name myparser

// class definition
{
	// place any extra class members here

}

// constructor
{
	// place any extra initialisation code here
}

// destructor
{
	// place any extra cleanup code here
}

// place any declarations here
%include {
#ifndef YYSTYPE
#define YYSTYPE TreeNode*
#endif

extern int lineno;

}



//符号
%token CONST
%token ID

//操作符
%token ADD SUB MUL DIV DELIVERY
%token SADD SSUB GT LT GE LE
%token EQ DEQ NEQ
%token LAND LOR LN AND OR NOT LSHIFT RSHIFT SIZEOF
//标点符号
%token SEMI
%token LP RP 
%token LB RB
%token COMMA
//条件表达式
//if
%token IF
%token ELSE
%token THEN
%token WHILE
%token DO
%token FOR
%token BREAK
%token CONTINUE
%token RETURN
%token INPUT
%token OUTPUT
//定义
%token INT CHAR BOOL DOUBLE FLOAT

%left ADD SUB
%left MUL DIV
%right UMINUS
%right EQ
%%

/////////////////////////////////////////////////////////////////////////////
// rules section

// place your YACC rules here (there must be at least one)

block:ID LP RP LB stmts RB{$$=newStmtNode(CompK);$$->child[0]=$5;Display($$);};

stmts:stmt stmts{

	$$->sibling=$2;	
	$$=$1;	

	
}| stmt{$$=$1;} | stmts mblock stmts{$$->sibling=$2;$2->sibling=$3;$$=$1;};


mblock:LB stmts RB{$$=newStmtNode(CompK);$$->child[0]=$2;};



stmt:expr_stmt{
	$$=$1;
	}
	|if_stmt{
	$$=$1;
	}
	|for_stmt{
	$$=$1;
	}
	|jump_stmt{
	$$=$1;
	}
	|decl_stmt{
	
	$$=$1;
	
	}
	|in_stmt{$$=$1;}	
	|out_stmt{$$=$1;}
	|sem_stmt{$$=NULL;}
	;
sem_stmt:SEMI;

in_stmt:INPUT LP stmt RP SEMI{$$=newStmtNode(InputK);$$->child[0]=$3;};


out_stmt:OUTPUT LP expr RP SEMI{$$=newStmtNode(PrintK);$$->child[0]=$3;};


if_stmt:IF LP expr RP stmt {$$=newStmtNode(IfK);$$->child[0]=$3;$$->child[1]=$5;}
		| IF LP expr RP lbock ELSE lbock {
		$$=newStmtNode(IfK);$$->child[0]=$3;$$->child[1]=$5;$$->child[2]=$7;}
		;



for_stmt:FOR LP expr SEMI expr SEMI expr RP lbock
			{
				$$ = newStmtNode(ForK);
				$$->child[0] = $3;
                $$->child[1] = $5;
                $$->child[2] = $7;
                $$->child[3] = $9;
			}
		|FOR LP SEMI expr SEMI expr RP lbock{
				$$ = newStmtNode(ForK);
				$$->child[0] = NULL;
                $$->child[1] = $4;
                $$->child[2] = $6;
                $$->child[3] = $8;
			}
		|FOR LP expr SEMI  SEMI expr RP lbock{
				$$ = newStmtNode(ForK);
				$$->child[0] = $3;
                $$->child[1] = NULL;
                $$->child[2] = $6;
                $$->child[3] = $8;
			}
		|FOR LP expr SEMI expr SEMI  RP lbock{
				$$ = newStmtNode(ForK);
				$$->child[0] = $3;
                $$->child[1] = $5;
                $$->child[2] = NULL;
                $$->child[3] = $8;
			}
		|FOR LP  SEMI  SEMI expr RP lbock{
				$$ = newStmtNode(ForK);
				$$->child[0] = NULL;
                $$->child[1] = NULL;
                $$->child[2] = $5;
                $$->child[3] = $7;
			}
		|FOR LP  SEMI expr SEMI  RP lbock{
				$$ = newStmtNode(ForK);
				$$->child[0] = NULL;
                $$->child[1] = $4;
                $$->child[2] = NULL;
                $$->child[3] = $7;
			}
		|FOR LP expr SEMI  SEMI  RP lbock{
				$$ = newStmtNode(ForK);
				$$->child[0] = $3;
                $$->child[1] = NULL;
                $$->child[2] = NULL;
                $$->child[3] = $7;
			}	
		|FOR LP  SEMI  SEMI  RP lbock{
				$$ = newStmtNode(ForK);
				$$->child[0] = NULL;
                $$->child[1] = NULL;
                $$->child[2] = NULL;
                $$->child[3] = $6;
			}	
		| WHILE LP expr RP lbock	{				
		        $$ = newStmtNode(WhileK);
				$$->child[0] = $3;
                $$->child[1] = $5;}
		;


expr_stmt:expr SEMIS	{$$=$1;}		
		;
		
SEMIS:SEMI;

jump_stmt:BREAK SEMIS{$$=newStmtNode(JumpK);}|
		CONTINUE SEMIS{$$=newStmtNode(JumpK);}|
		RETURN SEMIS{$$=newStmtNode(JumpK);}|
		RETURN expr SEMIS{$$=newStmtNode(JumpK);};


decl_stmt:type id_list SEMI{

	            $$ = newDeclNode (VarK);//建立一个新的变量声明的节点
				$$->child[0]=$1;
				$$->child[1]=$2;
				while($2!=NULL){
				printf("%s   %d\n",$2->attr.name,mymap[$2->attr.name]);
				mymap[$2->attr.name]=$1->type;
				printf("%s   %d\n",$2->attr.name,mymap[$2->attr.name]);
				$2->type=$1->type;
				$2=$2->sibling;
				
				}
				


};
type:INT{	$$ = newExpNode(TypeK);//int
                $$->type=Integer;
         }
         |CHAR	{
				$$ = newExpNode(TypeK);//char
                $$->type=Char;
			}
			|BOOL	{
				$$ = newExpNode(TypeK);//char
                $$->type=Boolean;
			};
			
			
			
id_list:ID{$$=$1;}
		|ID COMMA id_list{$1->sibling=$3;$$=$1;};



		
lbock:LB stmts RB{$$=$2;}
		|stmt{$$=$1;}
		;


//以下为expr部分，可能会特别长
		
expr:if_expr{$$=$1;}
	//赋值，这个东西有点特殊
	 |if_expr EQ expr{
	 
	 $$=newStmtNode(AssignK);
	 $$->child[0]=$1;
	 $$->child[1]=$3;
	 
	 }
	 | expr DIV EQ if_expr{
	   $$ = newExpNode(OpK);
        $$ -> attr.op = DIV;
         $$ -> child[0] = $1;
      $$ -> child[1] = $4;
	 
	 }
	 | expr	 MUL EQ if_expr{
	   $$ = newExpNode(OpK);
        $$ -> attr.op = MUL;
         $$ -> child[0] = $1;
      $$ -> child[1] = $4;
	 
	 }
	 | expr DELIVERY EQ if_expr{
	   $$ = newExpNode(OpK);
        $$ -> attr.op = DELIVERY;
         $$ -> child[0] = $1;
      $$ -> child[1] = $4;
	 
	 }
	 | expr ADD EQ if_expr{
	   $$ = newExpNode(OpK);
        $$ -> attr.op = ADD;
         $$ -> child[0] = $1;
      $$ -> child[1] = $4;
	 
	 }
	 | expr SUB EQ if_expr{
	   $$ = newExpNode(OpK);
        $$ -> attr.op = SUB;
         $$ -> child[0] = $1;
      $$ -> child[1] = $4;
	 
	 }
	 | expr AND EQ if_expr{
	   $$ = newExpNode(OpK);
        $$ -> attr.op = AND;
         $$ -> child[0] = $1;
      $$ -> child[1] = $4;
	 
	 }
	 | expr OR EQ if_expr{
	   $$ = newExpNode(OpK);
        $$ -> attr.op = OR;
         $$ -> child[0] = $1;
      $$ -> child[1] = $4;
	 
	 };

if_expr:or_expr{$$=$1;};


or_expr:and_expr{$$=$1;}
		|or_expr LOR and_expr{		
		      $$ = newExpNode(OpK);
                $$ -> attr.op = LOR;
                $$ -> child[0] = $1;
                $$ -> child[1] = $3;
	
		}
		;
		
		
and_expr:or_bit_expr{$$=$1;}
		|and_expr LAND or_bit_expr{      
				$$ = newExpNode(OpK);
                $$ -> attr.op = LAND;
                $$ -> child[0] = $1;
                $$ -> child[1] = $3;};
		
or_bit_expr:nor_bit_expr{$$=$1;}
			|or_bit_expr OR nor_bit_expr{      
				$$ = newExpNode(OpK);
                $$ -> attr.op = OR;
                $$ -> child[0] = $1;
                $$ -> child[1] = $3;};

nor_bit_expr:and_bit_expr{$$=$1;}
		|nor_bit_expr NOT and_bit_expr{      
				$$ = newExpNode(OpK);
                $$ -> attr.op = NOT;
                $$ -> child[0] = $1;
                $$ -> child[1] = $3;};
		
and_bit_expr:ife_expr{$$=$1;}
		|and_bit_expr AND ife_expr{      
				$$ = newExpNode(OpK);
                $$ -> attr.op = AND;
                $$ -> child[0] = $1;
                $$ -> child[1] = $3;};

ife_expr:jug_expr{$$=$1;}|ife_expr DEQ jug_expr{      
				$$ = newExpNode(OpK);
                $$ -> attr.op = DEQ;
                $$ -> child[0] = $1;
                $$ -> child[1] = $3;}

			|ife_expr NEQ jug_expr{      
				$$ = newExpNode(OpK);
                $$ -> attr.op = NEQ;
                $$ -> child[0] = $1;
                $$ -> child[1] = $3;};

jug_expr:shift_expr{$$=$1;}
|jug_expr GT shift_expr{      
				$$ = newExpNode(OpK);
                $$ -> attr.op = GT;
                $$ -> child[0] = $1;
                $$ -> child[1] = $3;}
|jug_expr LT shift_expr{      
				$$ = newExpNode(OpK);
                $$ -> attr.op = LT;
                $$ -> child[0] = $1;
                $$ -> child[1] = $3;}
|jug_expr GE shift_expr{      
				$$ = newExpNode(OpK);
                $$ -> attr.op = GE;
                $$ -> child[0] = $1;
                $$ -> child[1] = $3;}
|jug_expr LE shift_expr{      
				$$ = newExpNode(OpK);
                $$ -> attr.op = LE;
                $$ -> child[0] = $1;
                $$ -> child[1] = $3;};
			

shift_expr:addsub_expr{$$=$1;}
|shift_expr LSHIFT addsub_expr{      
				$$ = newExpNode(OpK);
                $$ -> attr.op = LSHIFT;
                $$ -> child[0] = $1;
                $$ -> child[1] = $3;}
|shift_expr RSHIFT addsub_expr{      
				$$ = newExpNode(OpK);
                $$ -> attr.op = RSHIFT;
                $$ -> child[0] = $1;
                $$ -> child[1] = $3;};

addsub_expr:muldiv_expr{$$=$1;}
|addsub_expr ADD muldiv_expr{      
				$$ = newExpNode(OpK);
                $$ -> attr.op = ADD;
                $$ -> child[0] = $1;
                $$ -> child[1] = $3;}
|addsub_expr SUB muldiv_expr{      
				$$ = newExpNode(OpK);
                $$ -> attr.op = SUB;
                $$ -> child[0] = $1;
                $$ -> child[1] = $3;};

muldiv_expr:uo_expr{$$=$1;}
|muldiv_expr MUL uo_expr{      
				$$ = newExpNode(OpK);
                $$ -> attr.op = MUL;
                $$ -> child[0] = $1;
                $$ -> child[1] = $3;}
|muldiv_expr DIV uo_expr{      
				$$ = newExpNode(OpK);
                $$ -> attr.op = DIV;
                $$ -> child[0] = $1;
                $$ -> child[1] = $3;}
|muldiv_expr DELIVERY uo_expr{      
				$$ = newExpNode(OpK);
                $$ -> attr.op = DELIVERY;
                $$ -> child[0] = $1;
                $$ -> child[1] = $3;};

//由于本次作业中没有函数这一调用，为方便调试，我先不加入有关函数的调用这一级
uo_expr:post_expr{$$=$1;}|ADD uo_expr{      
				$$ = newExpNode(OpK);
                $$ -> attr.op = ADD;
                $$ -> child[0] = $2;}
                |SUB uo_expr{      
				$$ = newExpNode(OpK);
                $$ -> attr.op = SUB;
                $$ -> child[0] = $2;}
                |SADD uo_expr{      
				$$ = newExpNode(OpK);
                $$ -> attr.op = SADD;
                $$ -> child[0] = $2;}
                |uo_expr SADD{      
				$$ = newExpNode(OpK);
                $$ -> attr.op = SADD;
                $$ -> child[0] = $1;}
                |SSUB uo_expr{      
				$$ = newExpNode(OpK);
                $$ -> attr.op = SSUB;
                $$ -> child[0] = $2;}
                |uo_expr SSUB{      
				$$ = newExpNode(OpK);
                $$ -> attr.op = SSUB;
                $$ -> child[0] = $1;}
                |MUL uo_expr{      
				$$ = newExpNode(OpK);
                $$ -> attr.op = MUL;
                $$ -> child[0] = $2;}
                |LN uo_expr{      
				$$ = newExpNode(OpK);
                $$ -> attr.op = LN;
                $$ -> child[0] = $2;}
                |AND uo_expr{      
				$$ = newExpNode(OpK);
                $$ -> attr.op = AND;
                $$ -> child[0] = $2;}
                |SIZEOF LP uo_expr RP{      
				$$ = newExpNode(OpK);
                $$ -> attr.op = SIZEOF;
                $$ -> child[0] = $3;};

post_expr:basic_expr{$$=$1;};

basic_expr:ID{$$=$1;}|CONST{$$=$1;}| LP expr RP{$$=$2;};


%%

/////////////////////////////////////////////////////////////////////////////
// programs section
void Display(struct TreeNode *p)//显示语法树
{
	root=p;
	struct TreeNode *temp ;
    for(int i=0;i<MAXCHILDREN;i++){
	   if(p->child[i] != NULL)
	   {
		Display(p->child[i]);//递归打印孩子结点，直到没有孩子结点
	   }
	}
	if(err){
	return;
	}
	CheckNode(p);
	ShowNode(p);//打印自己
	temp=p->sibling;
	if(temp!=NULL){
    	Display(temp);//打印兄弟节点
	}	
	return;		
}


void CheckNode(struct TreeNode *p){  //类型检查
	//enum {Void,Integer,Char,Boolean};
	char *types[4] = {"Void","Integer ","Char","Boolean"};
	struct TreeNode *temp ;
	switch(p->nodekind)
	{
		case StmtK:
		{	//enum {IfK,WhileK,AssignK,ForK,CompK,InputK,PrintK,JumpK,SemiK};
			switch(p->kind){
				case IfK:{
					if(p->child[0]->type!=Boolean){
						SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),FOREGROUND_RED);
						printf("%s \n","IF TYPE ERROR!!!");
						SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 7);
					}
					break;				
				}
				case WhileK:{
					if(p->child[0]->type!=Boolean&&p->child[0]->type!=Integer){
						SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),FOREGROUND_RED);
						printf("%s \n","WHILE TYPE ERROR!!!");
							SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 7);
					
					}
					break;				
				}
				case AssignK:{
					if(p->child[0]->type!=p->child[1]->type){
						SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),FOREGROUND_RED);
						printf("%s \n","Assign ERROR!!!");
						SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 7);
					}
					p->type=p->child[0]->type;
					break;				
				}
				case ForK:{
					if(p->child[1]->type!=Boolean&&p->child[1]!=NULL){
						SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),FOREGROUND_RED);
						printf("%s \n","For ERROR!!!");
						SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 7);
					}
					break;				
				}
				case PrintK:{
					if(p->child[0]->type!=Integer && p->child[0]->type!=Char){
						SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),FOREGROUND_RED);
						printf("%s \n","Print ERROR!!!");
						SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 7);
					}
					break;				
				}
								
				}
			
	
		}
			
		case ExpK:
		{
			char *names[5] = {"Expr," , "Const Declaration,", "ID Declaration,","Type Specifier,","CK" };
			switch( p->kind )
			{
				case OpK:
					{
					   switch(p->attr.op)
					   {
					       case ADD:
					       {
					           if(p->child[0]->type!=p->child[1]->type){
								SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),FOREGROUND_RED);
								printf("ADD,error \n");
									SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 7);
					           }
					           
					           p->type=p->child[0]->type;
					           break;
					       }
					       case SUB:
					       {
					           if(p->child[0]->type!=p->child[1]->type){
								SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),FOREGROUND_RED);
								printf("SUB,error \n");
									SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 7);
					           }
					           p->type=p->child[0]->type;
					           break;
					       }
					       case MUL:
					       {
					           if(p->child[0]->type!=p->child[1]->type){
								SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),FOREGROUND_RED);
								printf("MUL,error \n");
									SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 7);
					           }
					           p->type=p->child[0]->type;
					           break;
					       }
					       case DIV:
					       {
					           if(p->child[0]->type!=p->child[1]->type){
								SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),FOREGROUND_RED);
								printf("DIV,error \n");
					           }
					           p->type=p->child[0]->type;
					           break;
					       }
					       case DELIVERY:
					       {
					           if(p->child[0]->type!=p->child[1]->type){
								SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),FOREGROUND_RED);
								printf("DELIVERY,error \n");
									SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 7);
					           }
					           p->type=p->child[0]->type;
					           break;
					       }
					       case SADD:
					       {
								if(p->child[0]->type!=Integer){
								SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),FOREGROUND_RED);
								printf("++,error\n");
									SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 7);
								}
					           p->type=p->child[0]->type;
					           break;
					       }
					       case SSUB:
					       {
					            	if(p->child[0]->type!=Integer){
								SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),FOREGROUND_RED);
								printf("--,error\n");
									SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 7);
								}
					            p->type=p->child[0]->type;
					           break;
					       }
					       case LT:
					       {
					           if(p->child[0]->type!=p->child[1]->type||p->child[0]->type!=Integer){
								SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),FOREGROUND_RED);
								printf("LT,error \n");
									SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 7);
					           }
					           p->type=Boolean;
					           break;
					       }
					       case LE:
					       {
					           if(p->child[0]->type!=p->child[1]->type||p->child[0]->type!=Integer){
								SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),FOREGROUND_RED);
								printf("LE,error \n");
									SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 7);
					           }
					           p->type=Boolean;
					           break;
					       }
					       case GT:
					       {
					           if(p->child[0]->type!=p->child[1]->type||p->child[0]->type!=Integer){
								SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),FOREGROUND_RED);
								printf("GT,error \n");
									SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 7);
					           }
					           p->type=Boolean;
					           break;
					       }
					       case GE:
					       {
					           if(p->child[0]->type!=p->child[1]->type||p->child[0]->type!=Integer){
								SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),FOREGROUND_RED);
								printf("GE,error \n");
									SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 7);
					           }
					           p->type=Boolean;
					           break;
					       }	
					       case DEQ:
					       {
					           if(p->child[0]->type!=p->child[1]->type||p->child[0]->type!=Integer){
								SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),FOREGROUND_RED);
								printf("DEQ,error \n");
									SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 7);
					           }
					           p->type=Boolean;
					           break;
					       }
					       case NEQ:
					       {
					           if(p->child[0]->type!=p->child[1]->type||p->child[0]->type!=Integer){
								SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),FOREGROUND_RED);
								printf("NEQ,error \n");
									SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 7);
					           }
					           p->type=Boolean;
					           break;
					       }
					       case LOR:
					       {
					           if(p->child[0]->type!=p->child[1]->type||p->child[0]->type!=Boolean){
								SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),FOREGROUND_RED);
								printf("LOR,error \n");
									SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 7);
					           }
					           p->type=Boolean;
					           break;
					           					       }
					       case LAND:
					       {	
					           if(p->child[0]->type!=p->child[1]->type||p->child[0]->type!=Boolean){
								SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),FOREGROUND_RED);
								printf("LAND,error \n");
									SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 7);
					           }
					           p->type=Boolean;
					           break;
					       }
					       case LN:
					       {	if(p->child[0]->type!=Boolean){
									SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE),FOREGROUND_RED);
									printf("!,error\n");
										SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 7);
								}
					           p->type=Boolean;
					           break;
					       }
					   }
					   break;
					}
				case ConstK:
					{
						p->type=Integer;
						break;//数字常量
					}
				case CK:
					{
						p->type=Char;
						break;//常量
					}
				case IdK:
					{
						break;//字符
					}
				case TypeK:
					{
						break;
					}
			}
			break;
		}
		case DeclK:
		{

			break;
		}
		
	}


	return ;


}




void ShowNode(struct TreeNode *p)//显示某个节点
{
    char *types[4] = {"Void","Integer ","Char","Boolean"};
	struct TreeNode *temp ;
	printf("%d:",p->lineno);//行号
	switch(p->nodekind)
	{
		case StmtK:
		{	//
			char *names[7] = {"If_statement,",  "While_statement," ,"Assign_statement," , "For_statement," , "Compound_statement,","Input_statement,","Print_statement," };
			printf("%s\t\t\t",names[p->kind]);//可以直接从数组里面打印，一一对应
			break;
		}
			
		case ExpK:
		{
			char *names[5] = {"Expr," , "Const Declaration,", "ID Declaration,","Type Specifier,","CK" };
			printf("%s\t", names[ p->kind ]);
			
			switch( p->kind )
			{
				case OpK:
					{
					   switch(p->attr.op)
					   {
					       case ADD:
					       {
					           printf("\t\top:+\t\t");
					           break;
					       }
					       case SUB:
					       {
					           printf("\t\top:-\t\t");
					           break;
					       }
					       case MUL:
					       {
					           printf("\t\top:*\t\t");
					           break;
					       }
					       case DIV:
					       {
					           printf("\t\top:/\t\t");
					           break;
					       }
					       case DELIVERY:
					       {
					           printf("\t\top:%s\t\t","%");
					           break;
					       }
					       case SADD:
					       {
					           printf("\t\top:++\t\t");
					           break;
					       }
					       case SSUB:
					       {
					           printf("\t\top:--\t\t");
					           break;
					       }
					       case LT:
					       {
					           printf("\t\top:<\t\t");
					           break;
					       }
					       case LE:
					       {
					           printf("\t\top:<=\t\t");
					           break;
					       }
					       case GT:
					       {
					           printf("\t\top:>\t\t");
					           break;
					       }
					       case GE:
					       {
					           printf("\t\top:>=\t\t");
					           break;
					       }	
					       case DEQ:
					       {
					           printf("\t\top:==\t\t");
					           break;
					       }
					       case NEQ:
					       {
					           printf("\t\top:!=\t\t");
					           break;
					       }
					       case LOR:
					       {
					           printf("\t\top:||\t\t");
					           break;
					           					       }
					       case LAND:
					       {
					           printf("\t\top:&&\t\t");
					           break;
					       }
					       case LN:
					       {
					           printf("\t\top:!\t\t");
					           break;
					       }
					   }
					   break;
					}
				case ConstK:
					{
						printf("values: %d\t",p->attr.val);
						break;//数字常量
					}
				case CK:
					{
						printf("values: %s\t",p->attr.name);
						break;//数字常量
					}
				case IdK:
					{
						printf("symbol: %s \t",p->attr.name);
						break;//字符
					}
				case TypeK:
					{
						printf("%s\t", types[ p->type ]);
						break;
					}
			}
			break;
		}
		case DeclK:
		{
			char names[2][20] = { "Var Declaration, ", "other"};
			printf("%s\t\t\t",names[p->kind]);
			break;
		}
		
	}
	printf("children: ");
	for(int i=0;i<MAXCHILDREN;i++){
	    if(p->child[i] != NULL)
	    {
		    printf("%d  ",p->child[i]->lineno);//输出所有孩子结点
		    temp = p->child[i]->sibling;
		
		    while(temp != NULL)//有兄弟打印兄弟节点
		    {
			    printf("%d  ",temp->lineno);
			    temp = temp->sibling;
		    }
		
	    }
	}
	printf("\t\t %s:",types[ p->type ]);
	printf("\n");
	return ;
}



int main(void)
{
	int  n = 1;
	while(1){
	mylexer lexer;
	myparser parser;
	if (parser.yycreate(&lexer)) {
		if (lexer.yycreate(&parser)) {
			n = parser.yyparse();
		}
	}
	}
	getchar();
	return n;
}

