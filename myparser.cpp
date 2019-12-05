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
* myparser.cpp
* C++ source file generated from myparser.y.
* 
* Date: 12/05/19
* Time: 18:15:41
* 
* AYACC Version: 2.07
****************************************************************************/

#include <yycpars.h>

// namespaces
#ifdef YYSTDCPPLIB
using namespace std;
#endif
#ifdef YYNAMESPACE
using namespace yl;
#endif

#line 1 ".\\myparser.y"


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

#line 145 "myparser.cpp"
// repeated because of possible precompiled header
#include <yycpars.h>

// namespaces
#ifdef YYSTDCPPLIB
using namespace std;
#endif
#ifdef YYNAMESPACE
using namespace yl;
#endif

#include ".\myparser.h"

/////////////////////////////////////////////////////////////////////////////
// constructor

YYPARSERNAME::YYPARSERNAME()
{
	yytables();
#line 121 ".\\myparser.y"

	// place any extra initialisation code here

#line 169 "myparser.cpp"
}

/////////////////////////////////////////////////////////////////////////////
// destructor

YYPARSERNAME::~YYPARSERNAME()
{
	// allows virtual functions to be called properly for correct cleanup
	yydestroy();
#line 126 ".\\myparser.y"

	// place any extra cleanup code here

#line 183 "myparser.cpp"
}

#ifndef YYSTYPE
#define YYSTYPE int
#endif
#ifndef YYSTACK_SIZE
#define YYSTACK_SIZE 100
#endif
#ifndef YYSTACK_MAX
#define YYSTACK_MAX 0
#endif

/****************************************************************************
* N O T E
* 
* If the compiler generates a YYPARSERNAME error then you have not declared
* the name of the parser. The easiest way to do this is to use a name
* declaration. This is placed in the declarations section of your YACC
* source file and is introduced with the %name keyword. For instance, the
* following name declaration declares the parser myparser:
* 
* %name myparser
* 
* For more information see help.
****************************************************************************/

// yyattribute
#ifdef YYDEBUG
void YYFAR* YYPARSERNAME::yyattribute1(int index) const
{
	YYSTYPE YYFAR* p = &((YYSTYPE YYFAR*)yyattributestackptr)[yytop + index];
	return p;
}
#define yyattribute(index) (*(YYSTYPE YYFAR*)yyattribute1(index))
#else
#define yyattribute(index) (((YYSTYPE YYFAR*)yyattributestackptr)[yytop + (index)])
#endif

void YYPARSERNAME::yystacktoval(int index)
{
	yyassert(index >= 0);
	*(YYSTYPE YYFAR*)yyvalptr = ((YYSTYPE YYFAR*)yyattributestackptr)[index];
}

void YYPARSERNAME::yyvaltostack(int index)
{
	yyassert(index >= 0);
	((YYSTYPE YYFAR*)yyattributestackptr)[index] = *(YYSTYPE YYFAR*)yyvalptr;
}

void YYPARSERNAME::yylvaltoval()
{
	*(YYSTYPE YYFAR*)yyvalptr = *(YYSTYPE YYFAR*)yylvalptr;
}

void YYPARSERNAME::yyvaltolval()
{
	*(YYSTYPE YYFAR*)yylvalptr = *(YYSTYPE YYFAR*)yyvalptr;
}

void YYPARSERNAME::yylvaltostack(int index)
{
	yyassert(index >= 0);
	((YYSTYPE YYFAR*)yyattributestackptr)[index] = *(YYSTYPE YYFAR*)yylvalptr;
}

void YYFAR* YYPARSERNAME::yynewattribute(int count)
{
	yyassert(count >= 0);
	return new YYFAR YYSTYPE[count];
}

void YYPARSERNAME::yydeleteattribute(void YYFAR* attribute)
{
	delete[] (YYSTYPE YYFAR*)attribute;
}

void YYPARSERNAME::yycopyattribute(void YYFAR* dest, const void YYFAR* src, int count)
{
	for (int i = 0; i < count; i++) {
		((YYSTYPE YYFAR*)dest)[i] = ((YYSTYPE YYFAR*)src)[i];
	}
}

#ifdef YYDEBUG
void YYPARSERNAME::yyinitdebug(void YYFAR** p, int count) const
{
	yyassert(p != NULL);
	yyassert(count >= 1);

	YYSTYPE YYFAR** p1 = (YYSTYPE YYFAR**)p;
	for (int i = 0; i < count; i++) {
		p1[i] = &((YYSTYPE YYFAR*)yyattributestackptr)[yytop + i - (count - 1)];
	}
}
#endif

void YYPARSERNAME::yyaction(int action)
{
	switch (action) {
	case 0:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[7];
			yyinitdebug((void YYFAR**)yya, 7);
#endif
			{
#line 183 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(CompK);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(5 - 6);Display((*(YYSTYPE YYFAR*)yyvalptr));
#line 293 "myparser.cpp"
			}
		}
		break;
	case 1:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[3];
			yyinitdebug((void YYFAR**)yya, 3);
#endif
			{
#line 185 ".\\myparser.y"


	(*(YYSTYPE YYFAR*)yyvalptr)->sibling=yyattribute(2 - 2);	
	(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 2);	

	

#line 312 "myparser.cpp"
			}
		}
		break;
	case 2:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 191 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 325 "myparser.cpp"
			}
		}
		break;
	case 3:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 191 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)->sibling=yyattribute(2 - 3);yyattribute(2 - 3)->sibling=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 3);
#line 338 "myparser.cpp"
			}
		}
		break;
	case 4:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 194 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(CompK);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(2 - 3);
#line 351 "myparser.cpp"
			}
		}
		break;
	case 5:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 198 ".\\myparser.y"

	(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
	
#line 366 "myparser.cpp"
			}
		}
		break;
	case 6:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 201 ".\\myparser.y"

	(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
	
#line 381 "myparser.cpp"
			}
		}
		break;
	case 7:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 204 ".\\myparser.y"

	(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
	
#line 396 "myparser.cpp"
			}
		}
		break;
	case 8:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 207 ".\\myparser.y"

	(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
	
#line 411 "myparser.cpp"
			}
		}
		break;
	case 9:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 210 ".\\myparser.y"

	
	(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
	
	
#line 428 "myparser.cpp"
			}
		}
		break;
	case 10:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 215 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 441 "myparser.cpp"
			}
		}
		break;
	case 11:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 216 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 454 "myparser.cpp"
			}
		}
		break;
	case 12:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 217 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=NULL;
#line 467 "myparser.cpp"
			}
		}
		break;
	case 13:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[6];
			yyinitdebug((void YYFAR**)yya, 6);
#endif
			{
#line 221 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(InputK);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(3 - 5);
#line 480 "myparser.cpp"
			}
		}
		break;
	case 14:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[6];
			yyinitdebug((void YYFAR**)yya, 6);
#endif
			{
#line 224 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(PrintK);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(3 - 5);
#line 493 "myparser.cpp"
			}
		}
		break;
	case 15:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[6];
			yyinitdebug((void YYFAR**)yya, 6);
#endif
			{
#line 227 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(IfK);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(3 - 5);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(5 - 5);
#line 506 "myparser.cpp"
			}
		}
		break;
	case 16:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[8];
			yyinitdebug((void YYFAR**)yya, 8);
#endif
			{
#line 228 ".\\myparser.y"

		(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(IfK);(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(3 - 7);(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(5 - 7);(*(YYSTYPE YYFAR*)yyvalptr)->child[2]=yyattribute(7 - 7);
#line 520 "myparser.cpp"
			}
		}
		break;
	case 17:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[10];
			yyinitdebug((void YYFAR**)yya, 10);
#endif
			{
#line 235 ".\\myparser.y"

				(*(YYSTYPE YYFAR*)yyvalptr) = newStmtNode(ForK);
				(*(YYSTYPE YYFAR*)yyvalptr)->child[0] = yyattribute(3 - 9);
                (*(YYSTYPE YYFAR*)yyvalptr)->child[1] = yyattribute(5 - 9);
                (*(YYSTYPE YYFAR*)yyvalptr)->child[2] = yyattribute(7 - 9);
                (*(YYSTYPE YYFAR*)yyvalptr)->child[3] = yyattribute(9 - 9);
			
#line 539 "myparser.cpp"
			}
		}
		break;
	case 18:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[9];
			yyinitdebug((void YYFAR**)yya, 9);
#endif
			{
#line 242 ".\\myparser.y"

				(*(YYSTYPE YYFAR*)yyvalptr) = newStmtNode(ForK);
				(*(YYSTYPE YYFAR*)yyvalptr)->child[0] = NULL;
                (*(YYSTYPE YYFAR*)yyvalptr)->child[1] = yyattribute(4 - 8);
                (*(YYSTYPE YYFAR*)yyvalptr)->child[2] = yyattribute(6 - 8);
                (*(YYSTYPE YYFAR*)yyvalptr)->child[3] = yyattribute(8 - 8);
			
#line 558 "myparser.cpp"
			}
		}
		break;
	case 19:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[9];
			yyinitdebug((void YYFAR**)yya, 9);
#endif
			{
#line 249 ".\\myparser.y"

				(*(YYSTYPE YYFAR*)yyvalptr) = newStmtNode(ForK);
				(*(YYSTYPE YYFAR*)yyvalptr)->child[0] = yyattribute(3 - 8);
                (*(YYSTYPE YYFAR*)yyvalptr)->child[1] = NULL;
                (*(YYSTYPE YYFAR*)yyvalptr)->child[2] = yyattribute(6 - 8);
                (*(YYSTYPE YYFAR*)yyvalptr)->child[3] = yyattribute(8 - 8);
			
#line 577 "myparser.cpp"
			}
		}
		break;
	case 20:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[9];
			yyinitdebug((void YYFAR**)yya, 9);
#endif
			{
#line 256 ".\\myparser.y"

				(*(YYSTYPE YYFAR*)yyvalptr) = newStmtNode(ForK);
				(*(YYSTYPE YYFAR*)yyvalptr)->child[0] = yyattribute(3 - 8);
                (*(YYSTYPE YYFAR*)yyvalptr)->child[1] = yyattribute(5 - 8);
                (*(YYSTYPE YYFAR*)yyvalptr)->child[2] = NULL;
                (*(YYSTYPE YYFAR*)yyvalptr)->child[3] = yyattribute(8 - 8);
			
#line 596 "myparser.cpp"
			}
		}
		break;
	case 21:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[8];
			yyinitdebug((void YYFAR**)yya, 8);
#endif
			{
#line 263 ".\\myparser.y"

				(*(YYSTYPE YYFAR*)yyvalptr) = newStmtNode(ForK);
				(*(YYSTYPE YYFAR*)yyvalptr)->child[0] = NULL;
                (*(YYSTYPE YYFAR*)yyvalptr)->child[1] = NULL;
                (*(YYSTYPE YYFAR*)yyvalptr)->child[2] = yyattribute(5 - 7);
                (*(YYSTYPE YYFAR*)yyvalptr)->child[3] = yyattribute(7 - 7);
			
#line 615 "myparser.cpp"
			}
		}
		break;
	case 22:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[8];
			yyinitdebug((void YYFAR**)yya, 8);
#endif
			{
#line 270 ".\\myparser.y"

				(*(YYSTYPE YYFAR*)yyvalptr) = newStmtNode(ForK);
				(*(YYSTYPE YYFAR*)yyvalptr)->child[0] = NULL;
                (*(YYSTYPE YYFAR*)yyvalptr)->child[1] = yyattribute(4 - 7);
                (*(YYSTYPE YYFAR*)yyvalptr)->child[2] = NULL;
                (*(YYSTYPE YYFAR*)yyvalptr)->child[3] = yyattribute(7 - 7);
			
#line 634 "myparser.cpp"
			}
		}
		break;
	case 23:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[8];
			yyinitdebug((void YYFAR**)yya, 8);
#endif
			{
#line 277 ".\\myparser.y"

				(*(YYSTYPE YYFAR*)yyvalptr) = newStmtNode(ForK);
				(*(YYSTYPE YYFAR*)yyvalptr)->child[0] = yyattribute(3 - 7);
                (*(YYSTYPE YYFAR*)yyvalptr)->child[1] = NULL;
                (*(YYSTYPE YYFAR*)yyvalptr)->child[2] = NULL;
                (*(YYSTYPE YYFAR*)yyvalptr)->child[3] = yyattribute(7 - 7);
			
#line 653 "myparser.cpp"
			}
		}
		break;
	case 24:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[7];
			yyinitdebug((void YYFAR**)yya, 7);
#endif
			{
#line 284 ".\\myparser.y"

				(*(YYSTYPE YYFAR*)yyvalptr) = newStmtNode(ForK);
				(*(YYSTYPE YYFAR*)yyvalptr)->child[0] = NULL;
                (*(YYSTYPE YYFAR*)yyvalptr)->child[1] = NULL;
                (*(YYSTYPE YYFAR*)yyvalptr)->child[2] = NULL;
                (*(YYSTYPE YYFAR*)yyvalptr)->child[3] = yyattribute(6 - 6);
			
#line 672 "myparser.cpp"
			}
		}
		break;
	case 25:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[6];
			yyinitdebug((void YYFAR**)yya, 6);
#endif
			{
#line 291 ".\\myparser.y"
				
		        (*(YYSTYPE YYFAR*)yyvalptr) = newStmtNode(WhileK);
				(*(YYSTYPE YYFAR*)yyvalptr)->child[0] = yyattribute(3 - 5);
                (*(YYSTYPE YYFAR*)yyvalptr)->child[1] = yyattribute(5 - 5);
#line 688 "myparser.cpp"
			}
		}
		break;
	case 26:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[3];
			yyinitdebug((void YYFAR**)yya, 3);
#endif
			{
#line 298 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 2);
#line 701 "myparser.cpp"
			}
		}
		break;
	case 27:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[3];
			yyinitdebug((void YYFAR**)yya, 3);
#endif
			{
#line 303 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(JumpK);
#line 714 "myparser.cpp"
			}
		}
		break;
	case 28:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[3];
			yyinitdebug((void YYFAR**)yya, 3);
#endif
			{
#line 304 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(JumpK);
#line 727 "myparser.cpp"
			}
		}
		break;
	case 29:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[3];
			yyinitdebug((void YYFAR**)yya, 3);
#endif
			{
#line 305 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(JumpK);
#line 740 "myparser.cpp"
			}
		}
		break;
	case 30:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 306 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(JumpK);
#line 753 "myparser.cpp"
			}
		}
		break;
	case 31:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 309 ".\\myparser.y"


	            (*(YYSTYPE YYFAR*)yyvalptr) = newDeclNode (VarK);//建立一个新的变量声明的节点
				(*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);
				(*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(2 - 3);
				while(yyattribute(2 - 3)!=NULL){
				printf("%s   %d\n",yyattribute(2 - 3)->attr.name,mymap[yyattribute(2 - 3)->attr.name]);
				mymap[yyattribute(2 - 3)->attr.name]=yyattribute(1 - 3)->type;
				printf("%s   %d\n",yyattribute(2 - 3)->attr.name,mymap[yyattribute(2 - 3)->attr.name]);
				yyattribute(2 - 3)->type=yyattribute(1 - 3)->type;
				yyattribute(2 - 3)=yyattribute(2 - 3)->sibling;
				
				}
				



#line 782 "myparser.cpp"
			}
		}
		break;
	case 32:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 326 ".\\myparser.y"
	(*(YYSTYPE YYFAR*)yyvalptr) = newExpNode(TypeK);//int
                (*(YYSTYPE YYFAR*)yyvalptr)->type=Integer;
         
#line 797 "myparser.cpp"
			}
		}
		break;
	case 33:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 329 ".\\myparser.y"

				(*(YYSTYPE YYFAR*)yyvalptr) = newExpNode(TypeK);//char
                (*(YYSTYPE YYFAR*)yyvalptr)->type=Char;
			
#line 813 "myparser.cpp"
			}
		}
		break;
	case 34:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 333 ".\\myparser.y"

				(*(YYSTYPE YYFAR*)yyvalptr) = newExpNode(TypeK);//char
                (*(YYSTYPE YYFAR*)yyvalptr)->type=Boolean;
			
#line 829 "myparser.cpp"
			}
		}
		break;
	case 35:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 340 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 842 "myparser.cpp"
			}
		}
		break;
	case 36:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 341 ".\\myparser.y"
yyattribute(1 - 3)->sibling=yyattribute(3 - 3);(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 3);
#line 855 "myparser.cpp"
			}
		}
		break;
	case 37:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 346 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(2 - 3);
#line 868 "myparser.cpp"
			}
		}
		break;
	case 38:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 347 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 881 "myparser.cpp"
			}
		}
		break;
	case 39:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 353 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 894 "myparser.cpp"
			}
		}
		break;
	case 40:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 355 ".\\myparser.y"

	 
	 (*(YYSTYPE YYFAR*)yyvalptr)=newStmtNode(AssignK);
	 (*(YYSTYPE YYFAR*)yyvalptr)->child[0]=yyattribute(1 - 3);
	 (*(YYSTYPE YYFAR*)yyvalptr)->child[1]=yyattribute(3 - 3);
	 
	 
#line 913 "myparser.cpp"
			}
		}
		break;
	case 41:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[5];
			yyinitdebug((void YYFAR**)yya, 5);
#endif
			{
#line 362 ".\\myparser.y"

	   (*(YYSTYPE YYFAR*)yyvalptr) = newExpNode(OpK);
        (*(YYSTYPE YYFAR*)yyvalptr) -> attr.op = DIV;
         (*(YYSTYPE YYFAR*)yyvalptr) -> child[0] = yyattribute(1 - 4);
      (*(YYSTYPE YYFAR*)yyvalptr) -> child[1] = yyattribute(4 - 4);
	 
	 
#line 932 "myparser.cpp"
			}
		}
		break;
	case 42:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[5];
			yyinitdebug((void YYFAR**)yya, 5);
#endif
			{
#line 369 ".\\myparser.y"

	   (*(YYSTYPE YYFAR*)yyvalptr) = newExpNode(OpK);
        (*(YYSTYPE YYFAR*)yyvalptr) -> attr.op = MUL;
         (*(YYSTYPE YYFAR*)yyvalptr) -> child[0] = yyattribute(1 - 4);
      (*(YYSTYPE YYFAR*)yyvalptr) -> child[1] = yyattribute(4 - 4);
	 
	 
#line 951 "myparser.cpp"
			}
		}
		break;
	case 43:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[5];
			yyinitdebug((void YYFAR**)yya, 5);
#endif
			{
#line 376 ".\\myparser.y"

	   (*(YYSTYPE YYFAR*)yyvalptr) = newExpNode(OpK);
        (*(YYSTYPE YYFAR*)yyvalptr) -> attr.op = DELIVERY;
         (*(YYSTYPE YYFAR*)yyvalptr) -> child[0] = yyattribute(1 - 4);
      (*(YYSTYPE YYFAR*)yyvalptr) -> child[1] = yyattribute(4 - 4);
	 
	 
#line 970 "myparser.cpp"
			}
		}
		break;
	case 44:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[5];
			yyinitdebug((void YYFAR**)yya, 5);
#endif
			{
#line 383 ".\\myparser.y"

	   (*(YYSTYPE YYFAR*)yyvalptr) = newExpNode(OpK);
        (*(YYSTYPE YYFAR*)yyvalptr) -> attr.op = ADD;
         (*(YYSTYPE YYFAR*)yyvalptr) -> child[0] = yyattribute(1 - 4);
      (*(YYSTYPE YYFAR*)yyvalptr) -> child[1] = yyattribute(4 - 4);
	 
	 
#line 989 "myparser.cpp"
			}
		}
		break;
	case 45:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[5];
			yyinitdebug((void YYFAR**)yya, 5);
#endif
			{
#line 390 ".\\myparser.y"

	   (*(YYSTYPE YYFAR*)yyvalptr) = newExpNode(OpK);
        (*(YYSTYPE YYFAR*)yyvalptr) -> attr.op = SUB;
         (*(YYSTYPE YYFAR*)yyvalptr) -> child[0] = yyattribute(1 - 4);
      (*(YYSTYPE YYFAR*)yyvalptr) -> child[1] = yyattribute(4 - 4);
	 
	 
#line 1008 "myparser.cpp"
			}
		}
		break;
	case 46:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[5];
			yyinitdebug((void YYFAR**)yya, 5);
#endif
			{
#line 397 ".\\myparser.y"

	   (*(YYSTYPE YYFAR*)yyvalptr) = newExpNode(OpK);
        (*(YYSTYPE YYFAR*)yyvalptr) -> attr.op = AND;
         (*(YYSTYPE YYFAR*)yyvalptr) -> child[0] = yyattribute(1 - 4);
      (*(YYSTYPE YYFAR*)yyvalptr) -> child[1] = yyattribute(4 - 4);
	 
	 
#line 1027 "myparser.cpp"
			}
		}
		break;
	case 47:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[5];
			yyinitdebug((void YYFAR**)yya, 5);
#endif
			{
#line 404 ".\\myparser.y"

	   (*(YYSTYPE YYFAR*)yyvalptr) = newExpNode(OpK);
        (*(YYSTYPE YYFAR*)yyvalptr) -> attr.op = OR;
         (*(YYSTYPE YYFAR*)yyvalptr) -> child[0] = yyattribute(1 - 4);
      (*(YYSTYPE YYFAR*)yyvalptr) -> child[1] = yyattribute(4 - 4);
	 
	 
#line 1046 "myparser.cpp"
			}
		}
		break;
	case 48:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 412 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 1059 "myparser.cpp"
			}
		}
		break;
	case 49:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 415 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 1072 "myparser.cpp"
			}
		}
		break;
	case 50:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 416 ".\\myparser.y"
		
		      (*(YYSTYPE YYFAR*)yyvalptr) = newExpNode(OpK);
                (*(YYSTYPE YYFAR*)yyvalptr) -> attr.op = LOR;
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[0] = yyattribute(1 - 3);
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[1] = yyattribute(3 - 3);
	
		
#line 1091 "myparser.cpp"
			}
		}
		break;
	case 51:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 426 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 1104 "myparser.cpp"
			}
		}
		break;
	case 52:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 427 ".\\myparser.y"
      
				(*(YYSTYPE YYFAR*)yyvalptr) = newExpNode(OpK);
                (*(YYSTYPE YYFAR*)yyvalptr) -> attr.op = LAND;
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[0] = yyattribute(1 - 3);
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[1] = yyattribute(3 - 3);
#line 1121 "myparser.cpp"
			}
		}
		break;
	case 53:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 433 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 1134 "myparser.cpp"
			}
		}
		break;
	case 54:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 434 ".\\myparser.y"
      
				(*(YYSTYPE YYFAR*)yyvalptr) = newExpNode(OpK);
                (*(YYSTYPE YYFAR*)yyvalptr) -> attr.op = OR;
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[0] = yyattribute(1 - 3);
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[1] = yyattribute(3 - 3);
#line 1151 "myparser.cpp"
			}
		}
		break;
	case 55:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 440 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 1164 "myparser.cpp"
			}
		}
		break;
	case 56:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 441 ".\\myparser.y"
      
				(*(YYSTYPE YYFAR*)yyvalptr) = newExpNode(OpK);
                (*(YYSTYPE YYFAR*)yyvalptr) -> attr.op = NOT;
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[0] = yyattribute(1 - 3);
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[1] = yyattribute(3 - 3);
#line 1181 "myparser.cpp"
			}
		}
		break;
	case 57:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 447 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 1194 "myparser.cpp"
			}
		}
		break;
	case 58:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 448 ".\\myparser.y"
      
				(*(YYSTYPE YYFAR*)yyvalptr) = newExpNode(OpK);
                (*(YYSTYPE YYFAR*)yyvalptr) -> attr.op = AND;
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[0] = yyattribute(1 - 3);
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[1] = yyattribute(3 - 3);
#line 1211 "myparser.cpp"
			}
		}
		break;
	case 59:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 454 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 1224 "myparser.cpp"
			}
		}
		break;
	case 60:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 454 ".\\myparser.y"
      
				(*(YYSTYPE YYFAR*)yyvalptr) = newExpNode(OpK);
                (*(YYSTYPE YYFAR*)yyvalptr) -> attr.op = DEQ;
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[0] = yyattribute(1 - 3);
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[1] = yyattribute(3 - 3);
#line 1241 "myparser.cpp"
			}
		}
		break;
	case 61:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 460 ".\\myparser.y"
      
				(*(YYSTYPE YYFAR*)yyvalptr) = newExpNode(OpK);
                (*(YYSTYPE YYFAR*)yyvalptr) -> attr.op = NEQ;
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[0] = yyattribute(1 - 3);
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[1] = yyattribute(3 - 3);
#line 1258 "myparser.cpp"
			}
		}
		break;
	case 62:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 466 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 1271 "myparser.cpp"
			}
		}
		break;
	case 63:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 467 ".\\myparser.y"
      
				(*(YYSTYPE YYFAR*)yyvalptr) = newExpNode(OpK);
                (*(YYSTYPE YYFAR*)yyvalptr) -> attr.op = GT;
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[0] = yyattribute(1 - 3);
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[1] = yyattribute(3 - 3);
#line 1288 "myparser.cpp"
			}
		}
		break;
	case 64:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 472 ".\\myparser.y"
      
				(*(YYSTYPE YYFAR*)yyvalptr) = newExpNode(OpK);
                (*(YYSTYPE YYFAR*)yyvalptr) -> attr.op = LT;
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[0] = yyattribute(1 - 3);
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[1] = yyattribute(3 - 3);
#line 1305 "myparser.cpp"
			}
		}
		break;
	case 65:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 477 ".\\myparser.y"
      
				(*(YYSTYPE YYFAR*)yyvalptr) = newExpNode(OpK);
                (*(YYSTYPE YYFAR*)yyvalptr) -> attr.op = GE;
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[0] = yyattribute(1 - 3);
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[1] = yyattribute(3 - 3);
#line 1322 "myparser.cpp"
			}
		}
		break;
	case 66:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 482 ".\\myparser.y"
      
				(*(YYSTYPE YYFAR*)yyvalptr) = newExpNode(OpK);
                (*(YYSTYPE YYFAR*)yyvalptr) -> attr.op = LE;
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[0] = yyattribute(1 - 3);
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[1] = yyattribute(3 - 3);
#line 1339 "myparser.cpp"
			}
		}
		break;
	case 67:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 489 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 1352 "myparser.cpp"
			}
		}
		break;
	case 68:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 490 ".\\myparser.y"
      
				(*(YYSTYPE YYFAR*)yyvalptr) = newExpNode(OpK);
                (*(YYSTYPE YYFAR*)yyvalptr) -> attr.op = LSHIFT;
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[0] = yyattribute(1 - 3);
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[1] = yyattribute(3 - 3);
#line 1369 "myparser.cpp"
			}
		}
		break;
	case 69:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 495 ".\\myparser.y"
      
				(*(YYSTYPE YYFAR*)yyvalptr) = newExpNode(OpK);
                (*(YYSTYPE YYFAR*)yyvalptr) -> attr.op = RSHIFT;
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[0] = yyattribute(1 - 3);
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[1] = yyattribute(3 - 3);
#line 1386 "myparser.cpp"
			}
		}
		break;
	case 70:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 501 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 1399 "myparser.cpp"
			}
		}
		break;
	case 71:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 502 ".\\myparser.y"
      
				(*(YYSTYPE YYFAR*)yyvalptr) = newExpNode(OpK);
                (*(YYSTYPE YYFAR*)yyvalptr) -> attr.op = ADD;
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[0] = yyattribute(1 - 3);
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[1] = yyattribute(3 - 3);
#line 1416 "myparser.cpp"
			}
		}
		break;
	case 72:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 507 ".\\myparser.y"
      
				(*(YYSTYPE YYFAR*)yyvalptr) = newExpNode(OpK);
                (*(YYSTYPE YYFAR*)yyvalptr) -> attr.op = SUB;
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[0] = yyattribute(1 - 3);
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[1] = yyattribute(3 - 3);
#line 1433 "myparser.cpp"
			}
		}
		break;
	case 73:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 513 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 1446 "myparser.cpp"
			}
		}
		break;
	case 74:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 514 ".\\myparser.y"
      
				(*(YYSTYPE YYFAR*)yyvalptr) = newExpNode(OpK);
                (*(YYSTYPE YYFAR*)yyvalptr) -> attr.op = MUL;
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[0] = yyattribute(1 - 3);
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[1] = yyattribute(3 - 3);
#line 1463 "myparser.cpp"
			}
		}
		break;
	case 75:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 519 ".\\myparser.y"
      
				(*(YYSTYPE YYFAR*)yyvalptr) = newExpNode(OpK);
                (*(YYSTYPE YYFAR*)yyvalptr) -> attr.op = DIV;
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[0] = yyattribute(1 - 3);
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[1] = yyattribute(3 - 3);
#line 1480 "myparser.cpp"
			}
		}
		break;
	case 76:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 524 ".\\myparser.y"
      
				(*(YYSTYPE YYFAR*)yyvalptr) = newExpNode(OpK);
                (*(YYSTYPE YYFAR*)yyvalptr) -> attr.op = DELIVERY;
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[0] = yyattribute(1 - 3);
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[1] = yyattribute(3 - 3);
#line 1497 "myparser.cpp"
			}
		}
		break;
	case 77:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 531 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 1510 "myparser.cpp"
			}
		}
		break;
	case 78:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[3];
			yyinitdebug((void YYFAR**)yya, 3);
#endif
			{
#line 531 ".\\myparser.y"
      
				(*(YYSTYPE YYFAR*)yyvalptr) = newExpNode(OpK);
                (*(YYSTYPE YYFAR*)yyvalptr) -> attr.op = ADD;
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[0] = yyattribute(2 - 2);
#line 1526 "myparser.cpp"
			}
		}
		break;
	case 79:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[3];
			yyinitdebug((void YYFAR**)yya, 3);
#endif
			{
#line 535 ".\\myparser.y"
      
				(*(YYSTYPE YYFAR*)yyvalptr) = newExpNode(OpK);
                (*(YYSTYPE YYFAR*)yyvalptr) -> attr.op = SUB;
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[0] = yyattribute(2 - 2);
#line 1542 "myparser.cpp"
			}
		}
		break;
	case 80:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[3];
			yyinitdebug((void YYFAR**)yya, 3);
#endif
			{
#line 539 ".\\myparser.y"
      
				(*(YYSTYPE YYFAR*)yyvalptr) = newExpNode(OpK);
                (*(YYSTYPE YYFAR*)yyvalptr) -> attr.op = SADD;
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[0] = yyattribute(2 - 2);
#line 1558 "myparser.cpp"
			}
		}
		break;
	case 81:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[3];
			yyinitdebug((void YYFAR**)yya, 3);
#endif
			{
#line 543 ".\\myparser.y"
      
				(*(YYSTYPE YYFAR*)yyvalptr) = newExpNode(OpK);
                (*(YYSTYPE YYFAR*)yyvalptr) -> attr.op = SADD;
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[0] = yyattribute(1 - 2);
#line 1574 "myparser.cpp"
			}
		}
		break;
	case 82:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[3];
			yyinitdebug((void YYFAR**)yya, 3);
#endif
			{
#line 547 ".\\myparser.y"
      
				(*(YYSTYPE YYFAR*)yyvalptr) = newExpNode(OpK);
                (*(YYSTYPE YYFAR*)yyvalptr) -> attr.op = SSUB;
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[0] = yyattribute(2 - 2);
#line 1590 "myparser.cpp"
			}
		}
		break;
	case 83:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[3];
			yyinitdebug((void YYFAR**)yya, 3);
#endif
			{
#line 551 ".\\myparser.y"
      
				(*(YYSTYPE YYFAR*)yyvalptr) = newExpNode(OpK);
                (*(YYSTYPE YYFAR*)yyvalptr) -> attr.op = SSUB;
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[0] = yyattribute(1 - 2);
#line 1606 "myparser.cpp"
			}
		}
		break;
	case 84:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[3];
			yyinitdebug((void YYFAR**)yya, 3);
#endif
			{
#line 555 ".\\myparser.y"
      
				(*(YYSTYPE YYFAR*)yyvalptr) = newExpNode(OpK);
                (*(YYSTYPE YYFAR*)yyvalptr) -> attr.op = MUL;
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[0] = yyattribute(2 - 2);
#line 1622 "myparser.cpp"
			}
		}
		break;
	case 85:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[3];
			yyinitdebug((void YYFAR**)yya, 3);
#endif
			{
#line 559 ".\\myparser.y"
      
				(*(YYSTYPE YYFAR*)yyvalptr) = newExpNode(OpK);
                (*(YYSTYPE YYFAR*)yyvalptr) -> attr.op = LN;
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[0] = yyattribute(2 - 2);
#line 1638 "myparser.cpp"
			}
		}
		break;
	case 86:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[3];
			yyinitdebug((void YYFAR**)yya, 3);
#endif
			{
#line 563 ".\\myparser.y"
      
				(*(YYSTYPE YYFAR*)yyvalptr) = newExpNode(OpK);
                (*(YYSTYPE YYFAR*)yyvalptr) -> attr.op = AND;
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[0] = yyattribute(2 - 2);
#line 1654 "myparser.cpp"
			}
		}
		break;
	case 87:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[5];
			yyinitdebug((void YYFAR**)yya, 5);
#endif
			{
#line 567 ".\\myparser.y"
      
				(*(YYSTYPE YYFAR*)yyvalptr) = newExpNode(OpK);
                (*(YYSTYPE YYFAR*)yyvalptr) -> attr.op = SIZEOF;
                (*(YYSTYPE YYFAR*)yyvalptr) -> child[0] = yyattribute(3 - 4);
#line 1670 "myparser.cpp"
			}
		}
		break;
	case 88:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 572 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 1683 "myparser.cpp"
			}
		}
		break;
	case 89:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 574 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 1696 "myparser.cpp"
			}
		}
		break;
	case 90:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[2];
			yyinitdebug((void YYFAR**)yya, 2);
#endif
			{
#line 574 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(1 - 1);
#line 1709 "myparser.cpp"
			}
		}
		break;
	case 91:
		{
#ifdef YYDEBUG
			YYSTYPE YYFAR* yya[4];
			yyinitdebug((void YYFAR**)yya, 4);
#endif
			{
#line 574 ".\\myparser.y"
(*(YYSTYPE YYFAR*)yyvalptr)=yyattribute(2 - 3);
#line 1722 "myparser.cpp"
			}
		}
		break;
	default:
		yyassert(0);
		break;
	}
}

void YYPARSERNAME::yytables()
{
	yyattribute_size = sizeof(YYSTYPE);
	yysstack_size = YYSTACK_SIZE;
	yystack_max = YYSTACK_MAX;

#ifdef YYDEBUG
	static const yysymbol_t YYNEARFAR YYBASED_CODE symbol[] = {
		{ "$end", 0 },
		{ "error", 256 },
		{ "CONST", 257 },
		{ "ID", 258 },
		{ "ADD", 259 },
		{ "SUB", 260 },
		{ "MUL", 261 },
		{ "DIV", 262 },
		{ "DELIVERY", 263 },
		{ "SADD", 264 },
		{ "SSUB", 265 },
		{ "GT", 266 },
		{ "LT", 267 },
		{ "GE", 268 },
		{ "LE", 269 },
		{ "EQ", 270 },
		{ "DEQ", 271 },
		{ "NEQ", 272 },
		{ "LAND", 273 },
		{ "LOR", 274 },
		{ "LN", 275 },
		{ "AND", 276 },
		{ "OR", 277 },
		{ "NOT", 278 },
		{ "LSHIFT", 279 },
		{ "RSHIFT", 280 },
		{ "SIZEOF", 281 },
		{ "SEMI", 282 },
		{ "LP", 283 },
		{ "RP", 284 },
		{ "LB", 285 },
		{ "RB", 286 },
		{ "COMMA", 287 },
		{ "IF", 288 },
		{ "ELSE", 289 },
		{ "WHILE", 291 },
		{ "FOR", 293 },
		{ "BREAK", 294 },
		{ "CONTINUE", 295 },
		{ "RETURN", 296 },
		{ "INPUT", 297 },
		{ "OUTPUT", 298 },
		{ "INT", 299 },
		{ "CHAR", 300 },
		{ "BOOL", 301 },
		{ NULL, 0 }
	};
	yysymbol = symbol;

	static const char* const YYNEARFAR YYBASED_CODE rule[] = {
		"$accept: block",
		"block: ID LP RP LB stmts RB",
		"stmts: stmt stmts",
		"stmts: stmt",
		"stmts: stmts mblock stmts",
		"mblock: LB stmts RB",
		"stmt: expr_stmt",
		"stmt: if_stmt",
		"stmt: for_stmt",
		"stmt: jump_stmt",
		"stmt: decl_stmt",
		"stmt: in_stmt",
		"stmt: out_stmt",
		"stmt: sem_stmt",
		"sem_stmt: SEMI",
		"in_stmt: INPUT LP stmt RP SEMI",
		"out_stmt: OUTPUT LP expr RP SEMI",
		"if_stmt: IF LP expr RP stmt",
		"if_stmt: IF LP expr RP lbock ELSE lbock",
		"for_stmt: FOR LP expr SEMI expr SEMI expr RP lbock",
		"for_stmt: FOR LP SEMI expr SEMI expr RP lbock",
		"for_stmt: FOR LP expr SEMI SEMI expr RP lbock",
		"for_stmt: FOR LP expr SEMI expr SEMI RP lbock",
		"for_stmt: FOR LP SEMI SEMI expr RP lbock",
		"for_stmt: FOR LP SEMI expr SEMI RP lbock",
		"for_stmt: FOR LP expr SEMI SEMI RP lbock",
		"for_stmt: FOR LP SEMI SEMI RP lbock",
		"for_stmt: WHILE LP expr RP lbock",
		"expr_stmt: expr SEMIS",
		"SEMIS: SEMI",
		"jump_stmt: BREAK SEMIS",
		"jump_stmt: CONTINUE SEMIS",
		"jump_stmt: RETURN SEMIS",
		"jump_stmt: RETURN expr SEMIS",
		"decl_stmt: type id_list SEMI",
		"type: INT",
		"type: CHAR",
		"type: BOOL",
		"id_list: ID",
		"id_list: ID COMMA id_list",
		"lbock: LB stmts RB",
		"lbock: stmt",
		"expr: if_expr",
		"expr: if_expr EQ expr",
		"expr: expr DIV EQ if_expr",
		"expr: expr MUL EQ if_expr",
		"expr: expr DELIVERY EQ if_expr",
		"expr: expr ADD EQ if_expr",
		"expr: expr SUB EQ if_expr",
		"expr: expr AND EQ if_expr",
		"expr: expr OR EQ if_expr",
		"if_expr: or_expr",
		"or_expr: and_expr",
		"or_expr: or_expr LOR and_expr",
		"and_expr: or_bit_expr",
		"and_expr: and_expr LAND or_bit_expr",
		"or_bit_expr: nor_bit_expr",
		"or_bit_expr: or_bit_expr OR nor_bit_expr",
		"nor_bit_expr: and_bit_expr",
		"nor_bit_expr: nor_bit_expr NOT and_bit_expr",
		"and_bit_expr: ife_expr",
		"and_bit_expr: and_bit_expr AND ife_expr",
		"ife_expr: jug_expr",
		"ife_expr: ife_expr DEQ jug_expr",
		"ife_expr: ife_expr NEQ jug_expr",
		"jug_expr: shift_expr",
		"jug_expr: jug_expr GT shift_expr",
		"jug_expr: jug_expr LT shift_expr",
		"jug_expr: jug_expr GE shift_expr",
		"jug_expr: jug_expr LE shift_expr",
		"shift_expr: addsub_expr",
		"shift_expr: shift_expr LSHIFT addsub_expr",
		"shift_expr: shift_expr RSHIFT addsub_expr",
		"addsub_expr: muldiv_expr",
		"addsub_expr: addsub_expr ADD muldiv_expr",
		"addsub_expr: addsub_expr SUB muldiv_expr",
		"muldiv_expr: uo_expr",
		"muldiv_expr: muldiv_expr MUL uo_expr",
		"muldiv_expr: muldiv_expr DIV uo_expr",
		"muldiv_expr: muldiv_expr DELIVERY uo_expr",
		"uo_expr: post_expr",
		"uo_expr: ADD uo_expr",
		"uo_expr: SUB uo_expr",
		"uo_expr: SADD uo_expr",
		"uo_expr: uo_expr SADD",
		"uo_expr: SSUB uo_expr",
		"uo_expr: uo_expr SSUB",
		"uo_expr: MUL uo_expr",
		"uo_expr: LN uo_expr",
		"uo_expr: AND uo_expr",
		"uo_expr: SIZEOF LP uo_expr RP",
		"post_expr: basic_expr",
		"basic_expr: ID",
		"basic_expr: CONST",
		"basic_expr: LP expr RP"
	};
	yyrule = rule;
#endif

	static const yyreduction_t YYNEARFAR YYBASED_CODE reduction[] = {
		{ 0, 1, -1 },
		{ 1, 6, 0 },
		{ 2, 2, 1 },
		{ 2, 1, 2 },
		{ 2, 3, 3 },
		{ 3, 3, 4 },
		{ 4, 1, 5 },
		{ 4, 1, 6 },
		{ 4, 1, 7 },
		{ 4, 1, 8 },
		{ 4, 1, 9 },
		{ 4, 1, 10 },
		{ 4, 1, 11 },
		{ 4, 1, 12 },
		{ 5, 1, -1 },
		{ 6, 5, 13 },
		{ 7, 5, 14 },
		{ 8, 5, 15 },
		{ 8, 7, 16 },
		{ 9, 9, 17 },
		{ 9, 8, 18 },
		{ 9, 8, 19 },
		{ 9, 8, 20 },
		{ 9, 7, 21 },
		{ 9, 7, 22 },
		{ 9, 7, 23 },
		{ 9, 6, 24 },
		{ 9, 5, 25 },
		{ 10, 2, 26 },
		{ 11, 1, -1 },
		{ 12, 2, 27 },
		{ 12, 2, 28 },
		{ 12, 2, 29 },
		{ 12, 3, 30 },
		{ 13, 3, 31 },
		{ 14, 1, 32 },
		{ 14, 1, 33 },
		{ 14, 1, 34 },
		{ 15, 1, 35 },
		{ 15, 3, 36 },
		{ 16, 3, 37 },
		{ 16, 1, 38 },
		{ 17, 1, 39 },
		{ 17, 3, 40 },
		{ 17, 4, 41 },
		{ 17, 4, 42 },
		{ 17, 4, 43 },
		{ 17, 4, 44 },
		{ 17, 4, 45 },
		{ 17, 4, 46 },
		{ 17, 4, 47 },
		{ 18, 1, 48 },
		{ 19, 1, 49 },
		{ 19, 3, 50 },
		{ 20, 1, 51 },
		{ 20, 3, 52 },
		{ 21, 1, 53 },
		{ 21, 3, 54 },
		{ 22, 1, 55 },
		{ 22, 3, 56 },
		{ 23, 1, 57 },
		{ 23, 3, 58 },
		{ 24, 1, 59 },
		{ 24, 3, 60 },
		{ 24, 3, 61 },
		{ 25, 1, 62 },
		{ 25, 3, 63 },
		{ 25, 3, 64 },
		{ 25, 3, 65 },
		{ 25, 3, 66 },
		{ 26, 1, 67 },
		{ 26, 3, 68 },
		{ 26, 3, 69 },
		{ 27, 1, 70 },
		{ 27, 3, 71 },
		{ 27, 3, 72 },
		{ 28, 1, 73 },
		{ 28, 3, 74 },
		{ 28, 3, 75 },
		{ 28, 3, 76 },
		{ 29, 1, 77 },
		{ 29, 2, 78 },
		{ 29, 2, 79 },
		{ 29, 2, 80 },
		{ 29, 2, 81 },
		{ 29, 2, 82 },
		{ 29, 2, 83 },
		{ 29, 2, 84 },
		{ 29, 2, 85 },
		{ 29, 2, 86 },
		{ 29, 4, 87 },
		{ 30, 1, 88 },
		{ 31, 1, 89 },
		{ 31, 1, 90 },
		{ 31, 3, 91 }
	};
	yyreduction = reduction;

	yytokenaction_size = 188;

	static const yytokenaction_t YYNEARFAR YYBASED_CODE tokenaction[] = {
		{ 35, YYAT_SHIFT, 6 },
		{ 35, YYAT_SHIFT, 7 },
		{ 35, YYAT_SHIFT, 8 },
		{ 35, YYAT_SHIFT, 9 },
		{ 35, YYAT_SHIFT, 10 },
		{ 177, YYAT_SHIFT, 74 },
		{ 177, YYAT_SHIFT, 186 },
		{ 35, YYAT_SHIFT, 11 },
		{ 35, YYAT_SHIFT, 12 },
		{ 121, YYAT_SHIFT, 103 },
		{ 194, YYAT_SHIFT, 99 },
		{ 194, YYAT_SHIFT, 100 },
		{ 194, YYAT_SHIFT, 101 },
		{ 194, YYAT_SHIFT, 102 },
		{ 194, YYAT_SHIFT, 103 },
		{ 135, YYAT_SHIFT, 94 },
		{ 135, YYAT_SHIFT, 95 },
		{ 135, YYAT_SHIFT, 96 },
		{ 35, YYAT_SHIFT, 13 },
		{ 35, YYAT_SHIFT, 14 },
		{ 138, YYAT_SHIFT, 97 },
		{ 138, YYAT_SHIFT, 98 },
		{ 121, YYAT_SHIFT, 104 },
		{ 121, YYAT_SHIFT, 105 },
		{ 35, YYAT_SHIFT, 15 },
		{ 35, YYAT_SHIFT, 16 },
		{ 35, YYAT_SHIFT, 17 },
		{ 194, YYAT_SHIFT, 104 },
		{ 194, YYAT_SHIFT, 105 },
		{ 109, YYAT_SHIFT, 97 },
		{ 109, YYAT_SHIFT, 98 },
		{ 35, YYAT_SHIFT, 18 },
		{ 137, YYAT_SHIFT, 97 },
		{ 137, YYAT_SHIFT, 98 },
		{ 35, YYAT_SHIFT, 19 },
		{ 194, YYAT_SHIFT, 198 },
		{ 35, YYAT_SHIFT, 20 },
		{ 35, YYAT_SHIFT, 21 },
		{ 35, YYAT_SHIFT, 22 },
		{ 35, YYAT_SHIFT, 23 },
		{ 35, YYAT_SHIFT, 24 },
		{ 35, YYAT_SHIFT, 25 },
		{ 35, YYAT_SHIFT, 26 },
		{ 35, YYAT_SHIFT, 27 },
		{ 35, YYAT_SHIFT, 28 },
		{ 198, YYAT_SHIFT, 16 },
		{ 136, YYAT_SHIFT, 97 },
		{ 136, YYAT_SHIFT, 98 },
		{ 198, YYAT_SHIFT, 165 },
		{ 109, YYAT_SHIFT, 148 },
		{ 174, YYAT_SHIFT, 185 },
		{ 198, YYAT_SHIFT, 18 },
		{ 174, YYAT_ERROR, 0 },
		{ 184, YYAT_SHIFT, 192 },
		{ 198, YYAT_SHIFT, 19 },
		{ 182, YYAT_SHIFT, 190 },
		{ 198, YYAT_SHIFT, 20 },
		{ 198, YYAT_SHIFT, 21 },
		{ 198, YYAT_SHIFT, 22 },
		{ 198, YYAT_SHIFT, 23 },
		{ 198, YYAT_SHIFT, 24 },
		{ 198, YYAT_SHIFT, 25 },
		{ 198, YYAT_SHIFT, 26 },
		{ 198, YYAT_SHIFT, 27 },
		{ 198, YYAT_SHIFT, 28 },
		{ 185, YYAT_SHIFT, 6 },
		{ 185, YYAT_SHIFT, 7 },
		{ 185, YYAT_SHIFT, 8 },
		{ 185, YYAT_SHIFT, 9 },
		{ 185, YYAT_SHIFT, 10 },
		{ 130, YYAT_SHIFT, 92 },
		{ 130, YYAT_SHIFT, 93 },
		{ 185, YYAT_SHIFT, 11 },
		{ 185, YYAT_SHIFT, 12 },
		{ 132, YYAT_SHIFT, 83 },
		{ 132, YYAT_SHIFT, 84 },
		{ 132, YYAT_SHIFT, 85 },
		{ 132, YYAT_SHIFT, 86 },
		{ 131, YYAT_SHIFT, 83 },
		{ 131, YYAT_SHIFT, 84 },
		{ 131, YYAT_SHIFT, 85 },
		{ 131, YYAT_SHIFT, 86 },
		{ 173, YYAT_SHIFT, 183 },
		{ 185, YYAT_SHIFT, 13 },
		{ 185, YYAT_SHIFT, 14 },
		{ 42, YYAT_SHIFT, 83 },
		{ 42, YYAT_SHIFT, 84 },
		{ 42, YYAT_SHIFT, 85 },
		{ 42, YYAT_SHIFT, 86 },
		{ 185, YYAT_SHIFT, 15 },
		{ 172, YYAT_SHIFT, 181 },
		{ 185, YYAT_SHIFT, 17 },
		{ 185, YYAT_SHIFT, 193 },
		{ 134, YYAT_SHIFT, 94 },
		{ 134, YYAT_SHIFT, 95 },
		{ 134, YYAT_SHIFT, 96 },
		{ 47, YYAT_SHIFT, 94 },
		{ 47, YYAT_SHIFT, 95 },
		{ 47, YYAT_SHIFT, 96 },
		{ 129, YYAT_SHIFT, 92 },
		{ 129, YYAT_SHIFT, 93 },
		{ 128, YYAT_SHIFT, 87 },
		{ 128, YYAT_SHIFT, 88 },
		{ 127, YYAT_SHIFT, 87 },
		{ 127, YYAT_SHIFT, 88 },
		{ 126, YYAT_SHIFT, 87 },
		{ 126, YYAT_SHIFT, 88 },
		{ 125, YYAT_SHIFT, 87 },
		{ 125, YYAT_SHIFT, 88 },
		{ 124, YYAT_SHIFT, 89 },
		{ 124, YYAT_SHIFT, 90 },
		{ 61, YYAT_SHIFT, 97 },
		{ 61, YYAT_SHIFT, 98 },
		{ 60, YYAT_SHIFT, 97 },
		{ 60, YYAT_SHIFT, 98 },
		{ 59, YYAT_SHIFT, 97 },
		{ 59, YYAT_SHIFT, 98 },
		{ 58, YYAT_SHIFT, 97 },
		{ 58, YYAT_SHIFT, 98 },
		{ 57, YYAT_SHIFT, 97 },
		{ 57, YYAT_SHIFT, 98 },
		{ 56, YYAT_SHIFT, 97 },
		{ 56, YYAT_SHIFT, 98 },
		{ 55, YYAT_SHIFT, 97 },
		{ 55, YYAT_SHIFT, 98 },
		{ 48, YYAT_SHIFT, 97 },
		{ 48, YYAT_SHIFT, 98 },
		{ 46, YYAT_SHIFT, 92 },
		{ 46, YYAT_SHIFT, 93 },
		{ 44, YYAT_SHIFT, 89 },
		{ 44, YYAT_SHIFT, 90 },
		{ 43, YYAT_SHIFT, 87 },
		{ 43, YYAT_SHIFT, 88 },
		{ 171, YYAT_SHIFT, 180 },
		{ 167, YYAT_SHIFT, 178 },
		{ 165, YYAT_ERROR, 0 },
		{ 155, YYAT_SHIFT, 176 },
		{ 154, YYAT_SHIFT, 175 },
		{ 153, YYAT_SHIFT, 173 },
		{ 152, YYAT_SHIFT, 172 },
		{ 151, YYAT_SHIFT, 170 },
		{ 146, YYAT_SHIFT, 107 },
		{ 145, YYAT_ERROR, 0 },
		{ 133, YYAT_SHIFT, 81 },
		{ 123, YYAT_SHIFT, 78 },
		{ 122, YYAT_SHIFT, 91 },
		{ 120, YYAT_SHIFT, 82 },
		{ 119, YYAT_SHIFT, 74 },
		{ 118, YYAT_SHIFT, 156 },
		{ 117, YYAT_SHIFT, 155 },
		{ 116, YYAT_SHIFT, 154 },
		{ 114, YYAT_SHIFT, 153 },
		{ 113, YYAT_SHIFT, 151 },
		{ 112, YYAT_SHIFT, 150 },
		{ 111, YYAT_SHIFT, 149 },
		{ 108, YYAT_SHIFT, 147 },
		{ 107, YYAT_SHIFT, 146 },
		{ 105, YYAT_SHIFT, 145 },
		{ 104, YYAT_SHIFT, 144 },
		{ 103, YYAT_SHIFT, 143 },
		{ 102, YYAT_SHIFT, 142 },
		{ 101, YYAT_SHIFT, 141 },
		{ 100, YYAT_SHIFT, 140 },
		{ 99, YYAT_SHIFT, 139 },
		{ 77, YYAT_SHIFT, 74 },
		{ 70, YYAT_SHIFT, 67 },
		{ 66, YYAT_SHIFT, 113 },
		{ 63, YYAT_SHIFT, 110 },
		{ 45, YYAT_SHIFT, 91 },
		{ 41, YYAT_SHIFT, 82 },
		{ 40, YYAT_SHIFT, 81 },
		{ 39, YYAT_SHIFT, 80 },
		{ 38, YYAT_SHIFT, 79 },
		{ 37, YYAT_SHIFT, 78 },
		{ 34, YYAT_SHIFT, 75 },
		{ 25, YYAT_SHIFT, 73 },
		{ 24, YYAT_SHIFT, 72 },
		{ 23, YYAT_SHIFT, 67 },
		{ 22, YYAT_SHIFT, 67 },
		{ 20, YYAT_SHIFT, 66 },
		{ 19, YYAT_SHIFT, 65 },
		{ 18, YYAT_SHIFT, 64 },
		{ 15, YYAT_SHIFT, 62 },
		{ 4, YYAT_SHIFT, 5 },
		{ 3, YYAT_SHIFT, 4 },
		{ 2, YYAT_ACCEPT, 0 },
		{ 1, YYAT_SHIFT, 3 },
		{ 0, YYAT_SHIFT, 1 }
	};
	yytokenaction = tokenaction;

	static const yystateaction_t YYNEARFAR YYBASED_CODE stateaction[] = {
		{ -71, 1, YYAT_ERROR, 0 },
		{ -97, 1, YYAT_ERROR, 0 },
		{ 185, 1, YYAT_ERROR, 0 },
		{ -100, 1, YYAT_ERROR, 0 },
		{ -102, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_DEFAULT, 165 },
		{ 0, 0, YYAT_REDUCE, 93 },
		{ 0, 0, YYAT_REDUCE, 92 },
		{ 0, 0, YYAT_DEFAULT, 145 },
		{ 0, 0, YYAT_DEFAULT, 145 },
		{ 0, 0, YYAT_DEFAULT, 145 },
		{ 0, 0, YYAT_DEFAULT, 145 },
		{ 0, 0, YYAT_DEFAULT, 145 },
		{ 0, 0, YYAT_DEFAULT, 145 },
		{ 0, 0, YYAT_DEFAULT, 145 },
		{ -101, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_REDUCE, 14 },
		{ 0, 0, YYAT_DEFAULT, 145 },
		{ -102, 1, YYAT_ERROR, 0 },
		{ -103, 1, YYAT_ERROR, 0 },
		{ -104, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_DEFAULT, 22 },
		{ -104, 1, YYAT_ERROR, 0 },
		{ -105, 1, YYAT_DEFAULT, 153 },
		{ -107, 1, YYAT_ERROR, 0 },
		{ -108, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_REDUCE, 35 },
		{ 0, 0, YYAT_REDUCE, 36 },
		{ 0, 0, YYAT_REDUCE, 37 },
		{ 0, 0, YYAT_REDUCE, 6 },
		{ 0, 0, YYAT_REDUCE, 7 },
		{ 0, 0, YYAT_REDUCE, 8 },
		{ 0, 0, YYAT_REDUCE, 9 },
		{ 0, 0, YYAT_REDUCE, 10 },
		{ -112, 1, YYAT_DEFAULT, 177 },
		{ -257, 1, YYAT_REDUCE, 3 },
		{ 0, 0, YYAT_REDUCE, 91 },
		{ -105, 1, YYAT_REDUCE, 56 },
		{ -98, 1, YYAT_REDUCE, 42 },
		{ -103, 1, YYAT_REDUCE, 51 },
		{ -107, 1, YYAT_REDUCE, 54 },
		{ -107, 1, YYAT_REDUCE, 58 },
		{ -181, 1, YYAT_REDUCE, 62 },
		{ -148, 1, YYAT_REDUCE, 65 },
		{ -142, 1, YYAT_REDUCE, 60 },
		{ -105, 1, YYAT_REDUCE, 52 },
		{ -132, 1, YYAT_REDUCE, 70 },
		{ -165, 1, YYAT_REDUCE, 73 },
		{ -139, 1, YYAT_REDUCE, 76 },
		{ 0, 0, YYAT_REDUCE, 80 },
		{ 0, 0, YYAT_DEFAULT, 70 },
		{ 0, 0, YYAT_REDUCE, 12 },
		{ 0, 0, YYAT_DEFAULT, 146 },
		{ 0, 0, YYAT_REDUCE, 13 },
		{ 0, 0, YYAT_REDUCE, 11 },
		{ -141, 1, YYAT_REDUCE, 81 },
		{ -143, 1, YYAT_REDUCE, 82 },
		{ -145, 1, YYAT_REDUCE, 87 },
		{ -147, 1, YYAT_REDUCE, 83 },
		{ -149, 1, YYAT_REDUCE, 85 },
		{ -151, 1, YYAT_REDUCE, 88 },
		{ -153, 1, YYAT_REDUCE, 89 },
		{ 0, 0, YYAT_DEFAULT, 145 },
		{ -117, 1, YYAT_DEFAULT, 194 },
		{ 0, 0, YYAT_DEFAULT, 145 },
		{ 0, 0, YYAT_DEFAULT, 145 },
		{ -116, 1, YYAT_DEFAULT, 153 },
		{ 0, 0, YYAT_REDUCE, 29 },
		{ 0, 0, YYAT_REDUCE, 30 },
		{ 0, 0, YYAT_REDUCE, 31 },
		{ -117, 1, YYAT_DEFAULT, 174 },
		{ 0, 0, YYAT_REDUCE, 32 },
		{ 0, 0, YYAT_DEFAULT, 165 },
		{ 0, 0, YYAT_DEFAULT, 145 },
		{ 0, 0, YYAT_DEFAULT, 165 },
		{ 0, 0, YYAT_REDUCE, 1 },
		{ 0, 0, YYAT_DEFAULT, 165 },
		{ -121, 1, YYAT_REDUCE, 2 },
		{ 0, 0, YYAT_DEFAULT, 145 },
		{ 0, 0, YYAT_DEFAULT, 145 },
		{ 0, 0, YYAT_DEFAULT, 145 },
		{ 0, 0, YYAT_DEFAULT, 145 },
		{ 0, 0, YYAT_DEFAULT, 145 },
		{ 0, 0, YYAT_DEFAULT, 145 },
		{ 0, 0, YYAT_DEFAULT, 145 },
		{ 0, 0, YYAT_DEFAULT, 145 },
		{ 0, 0, YYAT_DEFAULT, 145 },
		{ 0, 0, YYAT_DEFAULT, 145 },
		{ 0, 0, YYAT_DEFAULT, 145 },
		{ 0, 0, YYAT_DEFAULT, 145 },
		{ 0, 0, YYAT_DEFAULT, 145 },
		{ 0, 0, YYAT_DEFAULT, 145 },
		{ 0, 0, YYAT_DEFAULT, 145 },
		{ 0, 0, YYAT_DEFAULT, 145 },
		{ 0, 0, YYAT_DEFAULT, 145 },
		{ 0, 0, YYAT_DEFAULT, 145 },
		{ 0, 0, YYAT_DEFAULT, 145 },
		{ 0, 0, YYAT_REDUCE, 84 },
		{ 0, 0, YYAT_REDUCE, 86 },
		{ -107, 1, YYAT_ERROR, 0 },
		{ -108, 1, YYAT_ERROR, 0 },
		{ -109, 1, YYAT_ERROR, 0 },
		{ -110, 1, YYAT_ERROR, 0 },
		{ -111, 1, YYAT_ERROR, 0 },
		{ -112, 1, YYAT_ERROR, 0 },
		{ -113, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_REDUCE, 28 },
		{ -131, 1, YYAT_REDUCE, 38 },
		{ -127, 1, YYAT_ERROR, 0 },
		{ -235, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_REDUCE, 94 },
		{ -130, 1, YYAT_DEFAULT, 194 },
		{ -131, 1, YYAT_DEFAULT, 194 },
		{ -130, 1, YYAT_DEFAULT, 153 },
		{ -131, 1, YYAT_DEFAULT, 174 },
		{ 0, 0, YYAT_REDUCE, 33 },
		{ -134, 1, YYAT_ERROR, 0 },
		{ -135, 1, YYAT_DEFAULT, 194 },
		{ -138, 1, YYAT_DEFAULT, 177 },
		{ -138, 1, YYAT_REDUCE, 4 },
		{ -130, 1, YYAT_REDUCE, 59 },
		{ -254, 1, YYAT_REDUCE, 43 },
		{ -128, 1, YYAT_REDUCE, 53 },
		{ -134, 1, YYAT_REDUCE, 57 },
		{ -162, 1, YYAT_REDUCE, 61 },
		{ -172, 1, YYAT_REDUCE, 66 },
		{ -174, 1, YYAT_REDUCE, 67 },
		{ -176, 1, YYAT_REDUCE, 68 },
		{ -178, 1, YYAT_REDUCE, 69 },
		{ -160, 1, YYAT_REDUCE, 71 },
		{ -189, 1, YYAT_REDUCE, 72 },
		{ -188, 1, YYAT_REDUCE, 63 },
		{ -192, 1, YYAT_REDUCE, 64 },
		{ -134, 1, YYAT_REDUCE, 55 },
		{ -168, 1, YYAT_REDUCE, 74 },
		{ -246, 1, YYAT_REDUCE, 75 },
		{ -218, 1, YYAT_REDUCE, 77 },
		{ -232, 1, YYAT_REDUCE, 78 },
		{ -244, 1, YYAT_REDUCE, 79 },
		{ 0, 0, YYAT_DEFAULT, 145 },
		{ 0, 0, YYAT_DEFAULT, 145 },
		{ 0, 0, YYAT_DEFAULT, 145 },
		{ 0, 0, YYAT_DEFAULT, 145 },
		{ 0, 0, YYAT_DEFAULT, 145 },
		{ 0, 0, YYAT_DEFAULT, 145 },
		{ -142, 1, YYAT_DEFAULT, 185 },
		{ -117, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_REDUCE, 34 },
		{ 0, 0, YYAT_REDUCE, 90 },
		{ 0, 0, YYAT_DEFAULT, 198 },
		{ 0, 0, YYAT_DEFAULT, 198 },
		{ -144, 1, YYAT_DEFAULT, 185 },
		{ -143, 1, YYAT_DEFAULT, 174 },
		{ -144, 1, YYAT_DEFAULT, 145 },
		{ -145, 1, YYAT_ERROR, 0 },
		{ -146, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_REDUCE, 5 },
		{ 0, 0, YYAT_REDUCE, 47 },
		{ 0, 0, YYAT_REDUCE, 48 },
		{ 0, 0, YYAT_REDUCE, 45 },
		{ 0, 0, YYAT_REDUCE, 44 },
		{ 0, 0, YYAT_REDUCE, 46 },
		{ 0, 0, YYAT_REDUCE, 49 },
		{ 0, 0, YYAT_REDUCE, 50 },
		{ 0, 0, YYAT_REDUCE, 39 },
		{ -150, 1, YYAT_DEFAULT, 198 },
		{ 0, 0, YYAT_REDUCE, 17 },
		{ -155, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_REDUCE, 41 },
		{ 0, 0, YYAT_REDUCE, 27 },
		{ 0, 0, YYAT_DEFAULT, 198 },
		{ -151, 1, YYAT_DEFAULT, 194 },
		{ -194, 1, YYAT_DEFAULT, 185 },
		{ -202, 1, YYAT_DEFAULT, 185 },
		{ -232, 1, YYAT_DEFAULT, 194 },
		{ 0, 0, YYAT_REDUCE, 15 },
		{ 0, 0, YYAT_REDUCE, 16 },
		{ -280, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_DEFAULT, 198 },
		{ 0, 0, YYAT_REDUCE, 26 },
		{ 0, 0, YYAT_DEFAULT, 198 },
		{ 0, 0, YYAT_DEFAULT, 198 },
		{ -229, 1, YYAT_DEFAULT, 194 },
		{ 0, 0, YYAT_DEFAULT, 198 },
		{ -231, 1, YYAT_DEFAULT, 194 },
		{ -192, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_REDUCE, 40 },
		{ 0, 0, YYAT_REDUCE, 18 },
		{ 0, 0, YYAT_REDUCE, 23 },
		{ 0, 0, YYAT_REDUCE, 24 },
		{ 0, 0, YYAT_DEFAULT, 198 },
		{ 0, 0, YYAT_REDUCE, 25 },
		{ 0, 0, YYAT_DEFAULT, 198 },
		{ 0, 0, YYAT_DEFAULT, 198 },
		{ -249, 1, YYAT_ERROR, 0 },
		{ 0, 0, YYAT_REDUCE, 20 },
		{ 0, 0, YYAT_REDUCE, 21 },
		{ 0, 0, YYAT_REDUCE, 22 },
		{ -237, 1, YYAT_DEFAULT, 153 },
		{ 0, 0, YYAT_REDUCE, 19 }
	};
	yystateaction = stateaction;

	yynontermgoto_size = 103;

	static const yynontermgoto_t YYNEARFAR YYBASED_CODE nontermgoto[] = {
		{ 198, 168 },
		{ 198, 53 },
		{ 198, 54 },
		{ 198, 51 },
		{ 198, 30 },
		{ 198, 31 },
		{ 198, 29 },
		{ 149, 166 },
		{ 198, 32 },
		{ 198, 33 },
		{ 198, 52 },
		{ 72, 116 },
		{ 198, 199 },
		{ 198, 50 },
		{ 185, 194 },
		{ 185, 38 },
		{ 185, 39 },
		{ 185, 45 },
		{ 23, 71 },
		{ 149, 167 },
		{ 96, 138 },
		{ 96, 49 },
		{ 96, 36 },
		{ 72, -1 },
		{ 23, 70 },
		{ 91, 133 },
		{ 91, 37 },
		{ 91, 41 },
		{ 90, 132 },
		{ 90, 43 },
		{ 90, 46 },
		{ 165, 177 },
		{ 193, 197 },
		{ 165, 35 },
		{ 145, -1 },
		{ 145, 163 },
		{ 93, 135 },
		{ 93, 48 },
		{ 88, 130 },
		{ 88, 47 },
		{ 86, -1 },
		{ 86, 128 },
		{ 82, 124 },
		{ 82, 42 },
		{ 81, -1 },
		{ 81, 123 },
		{ 80, 122 },
		{ 80, 40 },
		{ 78, 120 },
		{ 78, 44 },
		{ 192, 196 },
		{ 190, 195 },
		{ 183, 191 },
		{ 181, 189 },
		{ 180, 188 },
		{ 178, 187 },
		{ 177, 76 },
		{ 173, 184 },
		{ 172, 182 },
		{ 170, 179 },
		{ 153, 174 },
		{ 151, 171 },
		{ 150, 169 },
		{ 146, 164 },
		{ 144, 162 },
		{ 143, 161 },
		{ 142, 160 },
		{ 141, 159 },
		{ 140, 158 },
		{ 139, 157 },
		{ 113, 152 },
		{ 95, 137 },
		{ 94, 136 },
		{ 92, 134 },
		{ 89, 131 },
		{ 87, 129 },
		{ 85, 127 },
		{ 84, 126 },
		{ 83, 125 },
		{ 79, 121 },
		{ 76, 119 },
		{ 74, 118 },
		{ 73, 117 },
		{ 70, 115 },
		{ 66, 114 },
		{ 65, 112 },
		{ 64, 111 },
		{ 62, 109 },
		{ 52, 108 },
		{ 50, 106 },
		{ 35, 77 },
		{ 22, 69 },
		{ 21, 68 },
		{ 17, 63 },
		{ 14, 61 },
		{ 13, 60 },
		{ 12, 59 },
		{ 11, 58 },
		{ 10, 57 },
		{ 9, 56 },
		{ 8, 55 },
		{ 5, 34 },
		{ 0, 2 }
	};
	yynontermgoto = nontermgoto;

	static const yystategoto_t YYNEARFAR YYBASED_CODE stategoto[] = {
		{ 101, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 99, 165 },
		{ 0, -1 },
		{ 0, -1 },
		{ 71, 96 },
		{ 70, 96 },
		{ 69, 96 },
		{ 68, 96 },
		{ 67, 96 },
		{ 66, 96 },
		{ 65, 96 },
		{ 0, -1 },
		{ 0, -1 },
		{ 76, 185 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 81, -1 },
		{ 80, -1 },
		{ 7, 185 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, 177 },
		{ 88, 165 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 78, -1 },
		{ 0, -1 },
		{ 73, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 58, 96 },
		{ 0, -1 },
		{ 69, 185 },
		{ 68, 185 },
		{ 67, 185 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 72, -1 },
		{ 0, -1 },
		{ 7, 198 },
		{ 65, 185 },
		{ 79, 165 },
		{ 0, -1 },
		{ 78, 165 },
		{ 0, 177 },
		{ 25, 82 },
		{ 62, 185 },
		{ 26, 91 },
		{ 23, 91 },
		{ 18, 90 },
		{ 52, 86 },
		{ 51, 86 },
		{ 50, 86 },
		{ 15, 90 },
		{ 48, 88 },
		{ 11, 93 },
		{ 49, 90 },
		{ 3, 88 },
		{ 4, 78 },
		{ 45, 93 },
		{ 8, 96 },
		{ 43, 96 },
		{ 42, 96 },
		{ -9, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 53, 185 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, 177 },
		{ 0, 177 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 51, 145 },
		{ 50, 145 },
		{ 49, 145 },
		{ 48, 145 },
		{ 47, 145 },
		{ 46, 145 },
		{ 17, 185 },
		{ 48, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 3, 198 },
		{ 46, 198 },
		{ 44, 185 },
		{ 0, -1 },
		{ 43, 185 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 29, 72 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 43, 198 },
		{ 0, -1 },
		{ 41, 185 },
		{ 40, 185 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 53, -1 },
		{ 39, 198 },
		{ 0, -1 },
		{ 38, 198 },
		{ 37, 198 },
		{ 0, -1 },
		{ 36, 198 },
		{ 0, -1 },
		{ -3, 80 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 35, 198 },
		{ 0, -1 },
		{ 34, 198 },
		{ 16, 198 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ 0, -1 },
		{ -4, 185 },
		{ 0, -1 }
	};
	yystategoto = stategoto;

	yydestructorptr = NULL;

	yytokendestptr = NULL;
	yytokendest_size = 0;

	yytokendestbaseptr = NULL;
	yytokendestbase_size = 0;
}
#line 577 ".\\myparser.y"


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
	const char *types[4] = {"Void","Integer ","Char","Boolean"};
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
			const char *names[5] = {"Expr," , "Const Declaration,", "ID Declaration,","Type Specifier,","CK" };
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
    const char *types[4] = {"Void","Integer ","Char","Boolean"};
	struct TreeNode *temp ;
	printf("%d:",p->lineno);//行号
	switch(p->nodekind)
	{
		case StmtK:
		{	//
			const char *names[7] = {"If_statement,",  "While_statement," ,"Assign_statement," , "For_statement," , "Compound_statement,","Input_statement,","Print_statement," };
			printf("%s\t\t\t",names[p->kind]);//可以直接从数组里面打印，一一对应
			break;
		}
			
		case ExpK:
		{
			const char *names[5] = {"Expr," , "Const Declaration,", "ID Declaration,","Type Specifier,","CK" };
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
	mylexer lexer;
	myparser parser;
	freopen("input.txt", "r", stdin);
	if (parser.yycreate(&lexer)) {
		if (lexer.yycreate(&parser)) {
			n = parser.yyparse();
		}
	}
	getchar();
	return n;
}


