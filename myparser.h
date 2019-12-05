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
* myparser.h
* C++ header file generated from myparser.y.
* 
* Date: 12/05/19
* Time: 18:15:41
* 
* AYACC Version: 2.07
****************************************************************************/

#ifndef _MYPARSER_H
#define _MYPARSER_H

#include <yycpars.h>

/////////////////////////////////////////////////////////////////////////////
// myparser

#ifndef YYEXPPARSER
#define YYEXPPARSER
#endif

class YYEXPPARSER YYFAR myparser : public _YL yyfparser {
public:
	myparser();
	virtual ~myparser();

protected:
	void yytables();
	virtual void yyaction(int action);
#ifdef YYDEBUG
	void YYFAR* yyattribute1(int index) const;
	void yyinitdebug(void YYFAR** p, int count) const;
#endif

	// attribute functions
	virtual void yystacktoval(int index);
	virtual void yyvaltostack(int index);
	virtual void yylvaltoval();
	virtual void yyvaltolval();
	virtual void yylvaltostack(int index);

	virtual void YYFAR* yynewattribute(int count);
	virtual void yydeleteattribute(void YYFAR* attribute);
	virtual void yycopyattribute(void YYFAR* dest, const void YYFAR* src, int count);

public:
#line 115 ".\\myparser.y"

	// place any extra class members here


#line 70 "myparser.h"
};

#ifndef YYPARSERNAME
#define YYPARSERNAME myparser
#endif

#line 131 ".\\myparser.y"

#ifndef YYSTYPE
#define YYSTYPE TreeNode*
#endif

extern int lineno;


#line 86 "myparser.h"
#define CONST 257
#define ID 258
#define ADD 259
#define SUB 260
#define MUL 261
#define DIV 262
#define DELIVERY 263
#define SADD 264
#define SSUB 265
#define GT 266
#define LT 267
#define GE 268
#define LE 269
#define EQ 270
#define DEQ 271
#define NEQ 272
#define LAND 273
#define LOR 274
#define LN 275
#define AND 276
#define OR 277
#define NOT 278
#define LSHIFT 279
#define RSHIFT 280
#define SIZEOF 281
#define SEMI 282
#define LP 283
#define RP 284
#define LB 285
#define RB 286
#define COMMA 287
#define IF 288
#define ELSE 289
#define THEN 290
#define WHILE 291
#define DO 292
#define FOR 293
#define BREAK 294
#define CONTINUE 295
#define RETURN 296
#define INPUT 297
#define OUTPUT 298
#define INT 299
#define CHAR 300
#define BOOL 301
#define DOUBLE 302
#define FLOAT 303
#define UMINUS 304
#endif
