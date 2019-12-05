#############################################################################
#                     U N R E G I S T E R E D   C O P Y
# 
# You are on day 56 of your 30 day trial period.
# 
# This file was produced by an UNREGISTERED COPY of Parser Generator. It is
# for evaluation purposes only. If you continue to use Parser Generator 30
# days after installation then you are required to purchase a license. For
# more information see the online help or go to the Bumble-Bee Software
# homepage at:
# 
# http://www.bumblebeesoftware.com
# 
# This notice must remain present in the file. It cannot be removed.
#############################################################################

#############################################################################
# myparser.v
# YACC verbose file generated from myparser.y.
# 
# Date: 12/05/19
# Time: 18:15:41
# 
# AYACC Version: 2.07
#############################################################################


##############################################################################
# Rules
##############################################################################

    0  $accept : block $end

    1  block : ID LP RP LB stmts RB

    2  stmts : stmt stmts
    3        | stmt
    4        | stmts mblock stmts

    5  mblock : LB stmts RB

    6  stmt : expr_stmt
    7       | if_stmt
    8       | for_stmt
    9       | jump_stmt
   10       | decl_stmt
   11       | in_stmt
   12       | out_stmt
   13       | sem_stmt

   14  sem_stmt : SEMI

   15  in_stmt : INPUT LP stmt RP SEMI

   16  out_stmt : OUTPUT LP expr RP SEMI

   17  if_stmt : IF LP expr RP stmt
   18          | IF LP expr RP lbock ELSE lbock

   19  for_stmt : FOR LP expr SEMI expr SEMI expr RP lbock
   20           | FOR LP SEMI expr SEMI expr RP lbock
   21           | FOR LP expr SEMI SEMI expr RP lbock
   22           | FOR LP expr SEMI expr SEMI RP lbock
   23           | FOR LP SEMI SEMI expr RP lbock
   24           | FOR LP SEMI expr SEMI RP lbock
   25           | FOR LP expr SEMI SEMI RP lbock
   26           | FOR LP SEMI SEMI RP lbock
   27           | WHILE LP expr RP lbock

   28  expr_stmt : expr SEMIS

   29  SEMIS : SEMI

   30  jump_stmt : BREAK SEMIS
   31            | CONTINUE SEMIS
   32            | RETURN SEMIS
   33            | RETURN expr SEMIS

   34  decl_stmt : type id_list SEMI

   35  type : INT
   36       | CHAR
   37       | BOOL

   38  id_list : ID
   39          | ID COMMA id_list

   40  lbock : LB stmts RB
   41        | stmt

   42  expr : if_expr
   43       | if_expr EQ expr
   44       | expr DIV EQ if_expr
   45       | expr MUL EQ if_expr
   46       | expr DELIVERY EQ if_expr
   47       | expr ADD EQ if_expr
   48       | expr SUB EQ if_expr
   49       | expr AND EQ if_expr
   50       | expr OR EQ if_expr

   51  if_expr : or_expr

   52  or_expr : and_expr
   53          | or_expr LOR and_expr

   54  and_expr : or_bit_expr
   55           | and_expr LAND or_bit_expr

   56  or_bit_expr : nor_bit_expr
   57              | or_bit_expr OR nor_bit_expr

   58  nor_bit_expr : and_bit_expr
   59               | nor_bit_expr NOT and_bit_expr

   60  and_bit_expr : ife_expr
   61               | and_bit_expr AND ife_expr

   62  ife_expr : jug_expr
   63           | ife_expr DEQ jug_expr
   64           | ife_expr NEQ jug_expr

   65  jug_expr : shift_expr
   66           | jug_expr GT shift_expr
   67           | jug_expr LT shift_expr
   68           | jug_expr GE shift_expr
   69           | jug_expr LE shift_expr

   70  shift_expr : addsub_expr
   71             | shift_expr LSHIFT addsub_expr
   72             | shift_expr RSHIFT addsub_expr

   73  addsub_expr : muldiv_expr
   74              | addsub_expr ADD muldiv_expr
   75              | addsub_expr SUB muldiv_expr

   76  muldiv_expr : uo_expr
   77              | muldiv_expr MUL uo_expr
   78              | muldiv_expr DIV uo_expr
   79              | muldiv_expr DELIVERY uo_expr

   80  uo_expr : post_expr
   81          | ADD uo_expr
   82          | SUB uo_expr
   83          | SADD uo_expr
   84          | uo_expr SADD
   85          | SSUB uo_expr
   86          | uo_expr SSUB
   87          | MUL uo_expr
   88          | LN uo_expr
   89          | AND uo_expr
   90          | SIZEOF LP uo_expr RP

   91  post_expr : basic_expr

   92  basic_expr : ID
   93             | CONST
   94             | LP expr RP


##############################################################################
# States
##############################################################################

state 0
	$accept : . block $end

	ID  shift 1

	block  goto 2


state 1
	block : ID . LP RP LB stmts RB

	LP  shift 3


state 2
	$accept : block . $end  (0)

	$end  accept


state 3
	block : ID LP . RP LB stmts RB

	RP  shift 4


state 4
	block : ID LP RP . LB stmts RB

	LB  shift 5


state 5
	block : ID LP RP LB . stmts RB

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	SEMI  shift 16
	LP  shift 17
	IF  shift 18
	WHILE  shift 19
	FOR  shift 20
	BREAK  shift 21
	CONTINUE  shift 22
	RETURN  shift 23
	INPUT  shift 24
	OUTPUT  shift 25
	INT  shift 26
	CHAR  shift 27
	BOOL  shift 28

	expr_stmt  goto 29
	if_stmt  goto 30
	for_stmt  goto 31
	jump_stmt  goto 32
	decl_stmt  goto 33
	stmts  goto 34
	stmt  goto 35
	basic_expr  goto 36
	nor_bit_expr  goto 37
	if_expr  goto 38
	or_expr  goto 39
	or_bit_expr  goto 40
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	and_expr  goto 45
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49
	expr  goto 50
	out_stmt  goto 51
	type  goto 52
	sem_stmt  goto 53
	in_stmt  goto 54


state 6
	basic_expr : CONST .  (93)

	.  reduce 93


state 7
	basic_expr : ID .  (92)

	.  reduce 92


state 8
	uo_expr : ADD . uo_expr

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17

	basic_expr  goto 36
	uo_expr  goto 55
	post_expr  goto 49


state 9
	uo_expr : SUB . uo_expr

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17

	basic_expr  goto 36
	uo_expr  goto 56
	post_expr  goto 49


state 10
	uo_expr : MUL . uo_expr

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17

	basic_expr  goto 36
	uo_expr  goto 57
	post_expr  goto 49


state 11
	uo_expr : SADD . uo_expr

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17

	basic_expr  goto 36
	uo_expr  goto 58
	post_expr  goto 49


state 12
	uo_expr : SSUB . uo_expr

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17

	basic_expr  goto 36
	uo_expr  goto 59
	post_expr  goto 49


state 13
	uo_expr : LN . uo_expr

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17

	basic_expr  goto 36
	uo_expr  goto 60
	post_expr  goto 49


state 14
	uo_expr : AND . uo_expr

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17

	basic_expr  goto 36
	uo_expr  goto 61
	post_expr  goto 49


state 15
	uo_expr : SIZEOF . LP uo_expr RP

	LP  shift 62


state 16
	sem_stmt : SEMI .  (14)

	.  reduce 14


state 17
	basic_expr : LP . expr RP

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17

	basic_expr  goto 36
	nor_bit_expr  goto 37
	if_expr  goto 38
	or_expr  goto 39
	or_bit_expr  goto 40
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	and_expr  goto 45
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49
	expr  goto 63


state 18
	if_stmt : IF . LP expr RP stmt
	if_stmt : IF . LP expr RP lbock ELSE lbock

	LP  shift 64


state 19
	for_stmt : WHILE . LP expr RP lbock

	LP  shift 65


state 20
	for_stmt : FOR . LP expr SEMI SEMI RP lbock
	for_stmt : FOR . LP SEMI SEMI RP lbock
	for_stmt : FOR . LP SEMI expr SEMI RP lbock
	for_stmt : FOR . LP expr SEMI expr SEMI expr RP lbock
	for_stmt : FOR . LP SEMI expr SEMI expr RP lbock
	for_stmt : FOR . LP expr SEMI SEMI expr RP lbock
	for_stmt : FOR . LP SEMI SEMI expr RP lbock
	for_stmt : FOR . LP expr SEMI expr SEMI RP lbock

	LP  shift 66


state 21
	jump_stmt : BREAK . SEMIS

	SEMI  shift 67

	SEMIS  goto 68


state 22
	jump_stmt : CONTINUE . SEMIS

	SEMI  shift 67

	SEMIS  goto 69


state 23
	jump_stmt : RETURN . expr SEMIS
	jump_stmt : RETURN . SEMIS

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	SEMI  shift 67
	LP  shift 17

	basic_expr  goto 36
	nor_bit_expr  goto 37
	if_expr  goto 38
	or_expr  goto 39
	or_bit_expr  goto 40
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	and_expr  goto 45
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49
	expr  goto 70
	SEMIS  goto 71


state 24
	in_stmt : INPUT . LP stmt RP SEMI

	LP  shift 72


state 25
	out_stmt : OUTPUT . LP expr RP SEMI

	LP  shift 73


state 26
	type : INT .  (35)

	.  reduce 35


state 27
	type : CHAR .  (36)

	.  reduce 36


state 28
	type : BOOL .  (37)

	.  reduce 37


state 29
	stmt : expr_stmt .  (6)

	.  reduce 6


state 30
	stmt : if_stmt .  (7)

	.  reduce 7


state 31
	stmt : for_stmt .  (8)

	.  reduce 8


state 32
	stmt : jump_stmt .  (9)

	.  reduce 9


state 33
	stmt : decl_stmt .  (10)

	.  reduce 10


state 34
	block : ID LP RP LB stmts . RB
	stmts : stmts . mblock stmts

	LB  shift 74
	RB  shift 75

	mblock  goto 76


state 35
	stmts : stmt . stmts
	stmts : stmt .  (3)

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	SEMI  shift 16
	LP  shift 17
	IF  shift 18
	WHILE  shift 19
	FOR  shift 20
	BREAK  shift 21
	CONTINUE  shift 22
	RETURN  shift 23
	INPUT  shift 24
	OUTPUT  shift 25
	INT  shift 26
	CHAR  shift 27
	BOOL  shift 28
	.  reduce 3

	expr_stmt  goto 29
	if_stmt  goto 30
	for_stmt  goto 31
	jump_stmt  goto 32
	decl_stmt  goto 33
	stmts  goto 77
	stmt  goto 35
	basic_expr  goto 36
	nor_bit_expr  goto 37
	if_expr  goto 38
	or_expr  goto 39
	or_bit_expr  goto 40
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	and_expr  goto 45
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49
	expr  goto 50
	out_stmt  goto 51
	type  goto 52
	sem_stmt  goto 53
	in_stmt  goto 54


state 36
	post_expr : basic_expr .  (91)

	.  reduce 91


state 37
	nor_bit_expr : nor_bit_expr . NOT and_bit_expr
	or_bit_expr : nor_bit_expr .  (56)

	NOT  shift 78
	.  reduce 56


state 38
	expr : if_expr .  (42)
	expr : if_expr . EQ expr

	EQ  shift 79
	.  reduce 42


state 39
	if_expr : or_expr .  (51)
	or_expr : or_expr . LOR and_expr

	LOR  shift 80
	.  reduce 51


40: shift-reduce conflict (shift 81, reduce 54) on OR
state 40
	and_expr : or_bit_expr .  (54)
	or_bit_expr : or_bit_expr . OR nor_bit_expr

	OR  shift 81
	.  reduce 54


41: shift-reduce conflict (shift 82, reduce 58) on AND
state 41
	nor_bit_expr : and_bit_expr .  (58)
	and_bit_expr : and_bit_expr . AND ife_expr

	AND  shift 82
	.  reduce 58


state 42
	ife_expr : jug_expr .  (62)
	jug_expr : jug_expr . LE shift_expr
	jug_expr : jug_expr . GT shift_expr
	jug_expr : jug_expr . GE shift_expr
	jug_expr : jug_expr . LT shift_expr

	GT  shift 83
	LT  shift 84
	GE  shift 85
	LE  shift 86
	.  reduce 62


state 43
	jug_expr : shift_expr .  (65)
	shift_expr : shift_expr . RSHIFT addsub_expr
	shift_expr : shift_expr . LSHIFT addsub_expr

	LSHIFT  shift 87
	RSHIFT  shift 88
	.  reduce 65


state 44
	and_bit_expr : ife_expr .  (60)
	ife_expr : ife_expr . NEQ jug_expr
	ife_expr : ife_expr . DEQ jug_expr

	DEQ  shift 89
	NEQ  shift 90
	.  reduce 60


state 45
	or_expr : and_expr .  (52)
	and_expr : and_expr . LAND or_bit_expr

	LAND  shift 91
	.  reduce 52


46: shift-reduce conflict (shift 92, reduce 70) on ADD
46: shift-reduce conflict (shift 93, reduce 70) on SUB
state 46
	addsub_expr : addsub_expr . SUB muldiv_expr
	addsub_expr : addsub_expr . ADD muldiv_expr
	shift_expr : addsub_expr .  (70)

	ADD  shift 92
	SUB  shift 93
	.  reduce 70


47: shift-reduce conflict (shift 94, reduce 73) on MUL
47: shift-reduce conflict (shift 95, reduce 73) on DIV
47: shift-reduce conflict (shift 96, reduce 73) on DELIVERY
state 47
	muldiv_expr : muldiv_expr . MUL uo_expr
	addsub_expr : muldiv_expr .  (73)
	muldiv_expr : muldiv_expr . DELIVERY uo_expr
	muldiv_expr : muldiv_expr . DIV uo_expr

	MUL  shift 94
	DIV  shift 95
	DELIVERY  shift 96
	.  reduce 73


state 48
	uo_expr : uo_expr . SADD
	muldiv_expr : uo_expr .  (76)
	uo_expr : uo_expr . SSUB

	SADD  shift 97
	SSUB  shift 98
	.  reduce 76


state 49
	uo_expr : post_expr .  (80)

	.  reduce 80


state 50
	expr : expr . MUL EQ if_expr
	expr : expr . DIV EQ if_expr
	expr : expr . DELIVERY EQ if_expr
	expr : expr . ADD EQ if_expr
	expr : expr . SUB EQ if_expr
	expr_stmt : expr . SEMIS
	expr : expr . AND EQ if_expr
	expr : expr . OR EQ if_expr

	ADD  shift 99
	SUB  shift 100
	MUL  shift 101
	DIV  shift 102
	DELIVERY  shift 103
	AND  shift 104
	OR  shift 105
	SEMI  shift 67

	SEMIS  goto 106


state 51
	stmt : out_stmt .  (12)

	.  reduce 12


state 52
	decl_stmt : type . id_list SEMI

	ID  shift 107

	id_list  goto 108


state 53
	stmt : sem_stmt .  (13)

	.  reduce 13


state 54
	stmt : in_stmt .  (11)

	.  reduce 11


55: shift-reduce conflict (shift 97, reduce 81) on SADD
55: shift-reduce conflict (shift 98, reduce 81) on SSUB
state 55
	uo_expr : uo_expr . SADD
	uo_expr : ADD uo_expr .  (81)
	uo_expr : uo_expr . SSUB

	SADD  shift 97
	SSUB  shift 98
	.  reduce 81


56: shift-reduce conflict (shift 97, reduce 82) on SADD
56: shift-reduce conflict (shift 98, reduce 82) on SSUB
state 56
	uo_expr : uo_expr . SADD
	uo_expr : SUB uo_expr .  (82)
	uo_expr : uo_expr . SSUB

	SADD  shift 97
	SSUB  shift 98
	.  reduce 82


57: shift-reduce conflict (shift 97, reduce 87) on SADD
57: shift-reduce conflict (shift 98, reduce 87) on SSUB
state 57
	uo_expr : uo_expr . SADD
	uo_expr : uo_expr . SSUB
	uo_expr : MUL uo_expr .  (87)

	SADD  shift 97
	SSUB  shift 98
	.  reduce 87


58: shift-reduce conflict (shift 97, reduce 83) on SADD
58: shift-reduce conflict (shift 98, reduce 83) on SSUB
state 58
	uo_expr : uo_expr . SADD
	uo_expr : SADD uo_expr .  (83)
	uo_expr : uo_expr . SSUB

	SADD  shift 97
	SSUB  shift 98
	.  reduce 83


59: shift-reduce conflict (shift 97, reduce 85) on SADD
59: shift-reduce conflict (shift 98, reduce 85) on SSUB
state 59
	uo_expr : uo_expr . SADD
	uo_expr : SSUB uo_expr .  (85)
	uo_expr : uo_expr . SSUB

	SADD  shift 97
	SSUB  shift 98
	.  reduce 85


60: shift-reduce conflict (shift 97, reduce 88) on SADD
60: shift-reduce conflict (shift 98, reduce 88) on SSUB
state 60
	uo_expr : LN uo_expr .  (88)
	uo_expr : uo_expr . SADD
	uo_expr : uo_expr . SSUB

	SADD  shift 97
	SSUB  shift 98
	.  reduce 88


61: shift-reduce conflict (shift 97, reduce 89) on SADD
61: shift-reduce conflict (shift 98, reduce 89) on SSUB
state 61
	uo_expr : AND uo_expr .  (89)
	uo_expr : uo_expr . SADD
	uo_expr : uo_expr . SSUB

	SADD  shift 97
	SSUB  shift 98
	.  reduce 89


state 62
	uo_expr : SIZEOF LP . uo_expr RP

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17

	basic_expr  goto 36
	uo_expr  goto 109
	post_expr  goto 49


state 63
	expr : expr . MUL EQ if_expr
	expr : expr . DIV EQ if_expr
	expr : expr . DELIVERY EQ if_expr
	expr : expr . ADD EQ if_expr
	expr : expr . SUB EQ if_expr
	expr : expr . AND EQ if_expr
	expr : expr . OR EQ if_expr
	basic_expr : LP expr . RP

	ADD  shift 99
	SUB  shift 100
	MUL  shift 101
	DIV  shift 102
	DELIVERY  shift 103
	AND  shift 104
	OR  shift 105
	RP  shift 110


state 64
	if_stmt : IF LP . expr RP stmt
	if_stmt : IF LP . expr RP lbock ELSE lbock

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17

	basic_expr  goto 36
	nor_bit_expr  goto 37
	if_expr  goto 38
	or_expr  goto 39
	or_bit_expr  goto 40
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	and_expr  goto 45
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49
	expr  goto 111


state 65
	for_stmt : WHILE LP . expr RP lbock

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17

	basic_expr  goto 36
	nor_bit_expr  goto 37
	if_expr  goto 38
	or_expr  goto 39
	or_bit_expr  goto 40
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	and_expr  goto 45
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49
	expr  goto 112


state 66
	for_stmt : FOR LP . expr SEMI SEMI RP lbock
	for_stmt : FOR LP . SEMI SEMI RP lbock
	for_stmt : FOR LP . SEMI expr SEMI RP lbock
	for_stmt : FOR LP . expr SEMI expr SEMI expr RP lbock
	for_stmt : FOR LP . SEMI expr SEMI expr RP lbock
	for_stmt : FOR LP . expr SEMI SEMI expr RP lbock
	for_stmt : FOR LP . SEMI SEMI expr RP lbock
	for_stmt : FOR LP . expr SEMI expr SEMI RP lbock

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	SEMI  shift 113
	LP  shift 17

	basic_expr  goto 36
	nor_bit_expr  goto 37
	if_expr  goto 38
	or_expr  goto 39
	or_bit_expr  goto 40
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	and_expr  goto 45
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49
	expr  goto 114


state 67
	SEMIS : SEMI .  (29)

	.  reduce 29


state 68
	jump_stmt : BREAK SEMIS .  (30)

	.  reduce 30


state 69
	jump_stmt : CONTINUE SEMIS .  (31)

	.  reduce 31


state 70
	expr : expr . MUL EQ if_expr
	expr : expr . DIV EQ if_expr
	expr : expr . DELIVERY EQ if_expr
	jump_stmt : RETURN expr . SEMIS
	expr : expr . ADD EQ if_expr
	expr : expr . SUB EQ if_expr
	expr : expr . AND EQ if_expr
	expr : expr . OR EQ if_expr

	ADD  shift 99
	SUB  shift 100
	MUL  shift 101
	DIV  shift 102
	DELIVERY  shift 103
	AND  shift 104
	OR  shift 105
	SEMI  shift 67

	SEMIS  goto 115


state 71
	jump_stmt : RETURN SEMIS .  (32)

	.  reduce 32


state 72
	in_stmt : INPUT LP . stmt RP SEMI

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	SEMI  shift 16
	LP  shift 17
	IF  shift 18
	WHILE  shift 19
	FOR  shift 20
	BREAK  shift 21
	CONTINUE  shift 22
	RETURN  shift 23
	INPUT  shift 24
	OUTPUT  shift 25
	INT  shift 26
	CHAR  shift 27
	BOOL  shift 28

	expr_stmt  goto 29
	if_stmt  goto 30
	for_stmt  goto 31
	jump_stmt  goto 32
	decl_stmt  goto 33
	stmt  goto 116
	basic_expr  goto 36
	nor_bit_expr  goto 37
	if_expr  goto 38
	or_expr  goto 39
	or_bit_expr  goto 40
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	and_expr  goto 45
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49
	expr  goto 50
	out_stmt  goto 51
	type  goto 52
	sem_stmt  goto 53
	in_stmt  goto 54


state 73
	out_stmt : OUTPUT LP . expr RP SEMI

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17

	basic_expr  goto 36
	nor_bit_expr  goto 37
	if_expr  goto 38
	or_expr  goto 39
	or_bit_expr  goto 40
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	and_expr  goto 45
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49
	expr  goto 117


state 74
	mblock : LB . stmts RB

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	SEMI  shift 16
	LP  shift 17
	IF  shift 18
	WHILE  shift 19
	FOR  shift 20
	BREAK  shift 21
	CONTINUE  shift 22
	RETURN  shift 23
	INPUT  shift 24
	OUTPUT  shift 25
	INT  shift 26
	CHAR  shift 27
	BOOL  shift 28

	expr_stmt  goto 29
	if_stmt  goto 30
	for_stmt  goto 31
	jump_stmt  goto 32
	decl_stmt  goto 33
	stmts  goto 118
	stmt  goto 35
	basic_expr  goto 36
	nor_bit_expr  goto 37
	if_expr  goto 38
	or_expr  goto 39
	or_bit_expr  goto 40
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	and_expr  goto 45
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49
	expr  goto 50
	out_stmt  goto 51
	type  goto 52
	sem_stmt  goto 53
	in_stmt  goto 54


state 75
	block : ID LP RP LB stmts RB .  (1)

	.  reduce 1


state 76
	stmts : stmts mblock . stmts

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	SEMI  shift 16
	LP  shift 17
	IF  shift 18
	WHILE  shift 19
	FOR  shift 20
	BREAK  shift 21
	CONTINUE  shift 22
	RETURN  shift 23
	INPUT  shift 24
	OUTPUT  shift 25
	INT  shift 26
	CHAR  shift 27
	BOOL  shift 28

	expr_stmt  goto 29
	if_stmt  goto 30
	for_stmt  goto 31
	jump_stmt  goto 32
	decl_stmt  goto 33
	stmts  goto 119
	stmt  goto 35
	basic_expr  goto 36
	nor_bit_expr  goto 37
	if_expr  goto 38
	or_expr  goto 39
	or_bit_expr  goto 40
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	and_expr  goto 45
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49
	expr  goto 50
	out_stmt  goto 51
	type  goto 52
	sem_stmt  goto 53
	in_stmt  goto 54


77: shift-reduce conflict (shift 74, reduce 2) on LB
state 77
	stmts : stmt stmts .  (2)
	stmts : stmts . mblock stmts

	LB  shift 74
	.  reduce 2

	mblock  goto 76


state 78
	nor_bit_expr : nor_bit_expr NOT . and_bit_expr

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17

	basic_expr  goto 36
	and_bit_expr  goto 120
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49


state 79
	expr : if_expr EQ . expr

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17

	basic_expr  goto 36
	nor_bit_expr  goto 37
	if_expr  goto 38
	or_expr  goto 39
	or_bit_expr  goto 40
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	and_expr  goto 45
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49
	expr  goto 121


state 80
	or_expr : or_expr LOR . and_expr

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17

	basic_expr  goto 36
	nor_bit_expr  goto 37
	or_bit_expr  goto 40
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	and_expr  goto 122
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49


state 81
	or_bit_expr : or_bit_expr OR . nor_bit_expr

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17

	basic_expr  goto 36
	nor_bit_expr  goto 123
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49


state 82
	and_bit_expr : and_bit_expr AND . ife_expr

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17

	basic_expr  goto 36
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 124
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49


state 83
	jug_expr : jug_expr GT . shift_expr

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17

	basic_expr  goto 36
	shift_expr  goto 125
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49


state 84
	jug_expr : jug_expr LT . shift_expr

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17

	basic_expr  goto 36
	shift_expr  goto 126
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49


state 85
	jug_expr : jug_expr GE . shift_expr

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17

	basic_expr  goto 36
	shift_expr  goto 127
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49


state 86
	jug_expr : jug_expr LE . shift_expr

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17

	basic_expr  goto 36
	shift_expr  goto 128
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49


state 87
	shift_expr : shift_expr LSHIFT . addsub_expr

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17

	basic_expr  goto 36
	addsub_expr  goto 129
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49


state 88
	shift_expr : shift_expr RSHIFT . addsub_expr

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17

	basic_expr  goto 36
	addsub_expr  goto 130
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49


state 89
	ife_expr : ife_expr DEQ . jug_expr

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17

	basic_expr  goto 36
	jug_expr  goto 131
	shift_expr  goto 43
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49


state 90
	ife_expr : ife_expr NEQ . jug_expr

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17

	basic_expr  goto 36
	jug_expr  goto 132
	shift_expr  goto 43
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49


state 91
	and_expr : and_expr LAND . or_bit_expr

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17

	basic_expr  goto 36
	nor_bit_expr  goto 37
	or_bit_expr  goto 133
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49


state 92
	addsub_expr : addsub_expr ADD . muldiv_expr

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17

	basic_expr  goto 36
	muldiv_expr  goto 134
	uo_expr  goto 48
	post_expr  goto 49


state 93
	addsub_expr : addsub_expr SUB . muldiv_expr

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17

	basic_expr  goto 36
	muldiv_expr  goto 135
	uo_expr  goto 48
	post_expr  goto 49


state 94
	muldiv_expr : muldiv_expr MUL . uo_expr

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17

	basic_expr  goto 36
	uo_expr  goto 136
	post_expr  goto 49


state 95
	muldiv_expr : muldiv_expr DIV . uo_expr

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17

	basic_expr  goto 36
	uo_expr  goto 137
	post_expr  goto 49


state 96
	muldiv_expr : muldiv_expr DELIVERY . uo_expr

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17

	basic_expr  goto 36
	uo_expr  goto 138
	post_expr  goto 49


state 97
	uo_expr : uo_expr SADD .  (84)

	.  reduce 84


state 98
	uo_expr : uo_expr SSUB .  (86)

	.  reduce 86


state 99
	expr : expr ADD . EQ if_expr

	EQ  shift 139


state 100
	expr : expr SUB . EQ if_expr

	EQ  shift 140


state 101
	expr : expr MUL . EQ if_expr

	EQ  shift 141


state 102
	expr : expr DIV . EQ if_expr

	EQ  shift 142


state 103
	expr : expr DELIVERY . EQ if_expr

	EQ  shift 143


state 104
	expr : expr AND . EQ if_expr

	EQ  shift 144


state 105
	expr : expr OR . EQ if_expr

	EQ  shift 145


state 106
	expr_stmt : expr SEMIS .  (28)

	.  reduce 28


state 107
	id_list : ID .  (38)
	id_list : ID . COMMA id_list

	COMMA  shift 146
	.  reduce 38


state 108
	decl_stmt : type id_list . SEMI

	SEMI  shift 147


state 109
	uo_expr : SIZEOF LP uo_expr . RP
	uo_expr : uo_expr . SADD
	uo_expr : uo_expr . SSUB

	SADD  shift 97
	SSUB  shift 98
	RP  shift 148


state 110
	basic_expr : LP expr RP .  (94)

	.  reduce 94


state 111
	if_stmt : IF LP expr . RP stmt
	if_stmt : IF LP expr . RP lbock ELSE lbock
	expr : expr . MUL EQ if_expr
	expr : expr . DIV EQ if_expr
	expr : expr . DELIVERY EQ if_expr
	expr : expr . ADD EQ if_expr
	expr : expr . SUB EQ if_expr
	expr : expr . AND EQ if_expr
	expr : expr . OR EQ if_expr

	ADD  shift 99
	SUB  shift 100
	MUL  shift 101
	DIV  shift 102
	DELIVERY  shift 103
	AND  shift 104
	OR  shift 105
	RP  shift 149


state 112
	for_stmt : WHILE LP expr . RP lbock
	expr : expr . MUL EQ if_expr
	expr : expr . DIV EQ if_expr
	expr : expr . DELIVERY EQ if_expr
	expr : expr . ADD EQ if_expr
	expr : expr . SUB EQ if_expr
	expr : expr . AND EQ if_expr
	expr : expr . OR EQ if_expr

	ADD  shift 99
	SUB  shift 100
	MUL  shift 101
	DIV  shift 102
	DELIVERY  shift 103
	AND  shift 104
	OR  shift 105
	RP  shift 150


state 113
	for_stmt : FOR LP SEMI . SEMI RP lbock
	for_stmt : FOR LP SEMI . expr SEMI RP lbock
	for_stmt : FOR LP SEMI . expr SEMI expr RP lbock
	for_stmt : FOR LP SEMI . SEMI expr RP lbock

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	SEMI  shift 151
	LP  shift 17

	basic_expr  goto 36
	nor_bit_expr  goto 37
	if_expr  goto 38
	or_expr  goto 39
	or_bit_expr  goto 40
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	and_expr  goto 45
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49
	expr  goto 152


state 114
	for_stmt : FOR LP expr . SEMI SEMI RP lbock
	for_stmt : FOR LP expr . SEMI expr SEMI expr RP lbock
	for_stmt : FOR LP expr . SEMI SEMI expr RP lbock
	for_stmt : FOR LP expr . SEMI expr SEMI RP lbock
	expr : expr . MUL EQ if_expr
	expr : expr . DIV EQ if_expr
	expr : expr . DELIVERY EQ if_expr
	expr : expr . ADD EQ if_expr
	expr : expr . SUB EQ if_expr
	expr : expr . AND EQ if_expr
	expr : expr . OR EQ if_expr

	ADD  shift 99
	SUB  shift 100
	MUL  shift 101
	DIV  shift 102
	DELIVERY  shift 103
	AND  shift 104
	OR  shift 105
	SEMI  shift 153


state 115
	jump_stmt : RETURN expr SEMIS .  (33)

	.  reduce 33


state 116
	in_stmt : INPUT LP stmt . RP SEMI

	RP  shift 154


state 117
	out_stmt : OUTPUT LP expr . RP SEMI
	expr : expr . MUL EQ if_expr
	expr : expr . DIV EQ if_expr
	expr : expr . DELIVERY EQ if_expr
	expr : expr . ADD EQ if_expr
	expr : expr . SUB EQ if_expr
	expr : expr . AND EQ if_expr
	expr : expr . OR EQ if_expr

	ADD  shift 99
	SUB  shift 100
	MUL  shift 101
	DIV  shift 102
	DELIVERY  shift 103
	AND  shift 104
	OR  shift 105
	RP  shift 155


state 118
	stmts : stmts . mblock stmts
	mblock : LB stmts . RB

	LB  shift 74
	RB  shift 156

	mblock  goto 76


119: shift-reduce conflict (shift 74, reduce 4) on LB
state 119
	stmts : stmts mblock stmts .  (4)
	stmts : stmts . mblock stmts

	LB  shift 74
	.  reduce 4

	mblock  goto 76


120: shift-reduce conflict (shift 82, reduce 59) on AND
state 120
	nor_bit_expr : nor_bit_expr NOT and_bit_expr .  (59)
	and_bit_expr : and_bit_expr . AND ife_expr

	AND  shift 82
	.  reduce 59


121: shift-reduce conflict (shift 103, reduce 43) on DELIVERY
121: shift-reduce conflict (shift 104, reduce 43) on AND
121: shift-reduce conflict (shift 105, reduce 43) on OR
state 121
	expr : expr . MUL EQ if_expr
	expr : expr . DIV EQ if_expr
	expr : expr . DELIVERY EQ if_expr
	expr : expr . ADD EQ if_expr
	expr : expr . SUB EQ if_expr
	expr : if_expr EQ expr .  (43)
	expr : expr . AND EQ if_expr
	expr : expr . OR EQ if_expr

	DELIVERY  shift 103
	AND  shift 104
	OR  shift 105
	.  reduce 43


state 122
	and_expr : and_expr . LAND or_bit_expr
	or_expr : or_expr LOR and_expr .  (53)

	LAND  shift 91
	.  reduce 53


state 123
	nor_bit_expr : nor_bit_expr . NOT and_bit_expr
	or_bit_expr : or_bit_expr OR nor_bit_expr .  (57)

	NOT  shift 78
	.  reduce 57


state 124
	and_bit_expr : and_bit_expr AND ife_expr .  (61)
	ife_expr : ife_expr . NEQ jug_expr
	ife_expr : ife_expr . DEQ jug_expr

	DEQ  shift 89
	NEQ  shift 90
	.  reduce 61


state 125
	jug_expr : jug_expr GT shift_expr .  (66)
	shift_expr : shift_expr . RSHIFT addsub_expr
	shift_expr : shift_expr . LSHIFT addsub_expr

	LSHIFT  shift 87
	RSHIFT  shift 88
	.  reduce 66


state 126
	shift_expr : shift_expr . RSHIFT addsub_expr
	jug_expr : jug_expr LT shift_expr .  (67)
	shift_expr : shift_expr . LSHIFT addsub_expr

	LSHIFT  shift 87
	RSHIFT  shift 88
	.  reduce 67


state 127
	jug_expr : jug_expr GE shift_expr .  (68)
	shift_expr : shift_expr . RSHIFT addsub_expr
	shift_expr : shift_expr . LSHIFT addsub_expr

	LSHIFT  shift 87
	RSHIFT  shift 88
	.  reduce 68


state 128
	jug_expr : jug_expr LE shift_expr .  (69)
	shift_expr : shift_expr . RSHIFT addsub_expr
	shift_expr : shift_expr . LSHIFT addsub_expr

	LSHIFT  shift 87
	RSHIFT  shift 88
	.  reduce 69


129: shift-reduce conflict (shift 92, reduce 71) on ADD
129: shift-reduce conflict (shift 93, reduce 71) on SUB
state 129
	addsub_expr : addsub_expr . SUB muldiv_expr
	addsub_expr : addsub_expr . ADD muldiv_expr
	shift_expr : shift_expr LSHIFT addsub_expr .  (71)

	ADD  shift 92
	SUB  shift 93
	.  reduce 71


130: shift-reduce conflict (shift 92, reduce 72) on ADD
130: shift-reduce conflict (shift 93, reduce 72) on SUB
state 130
	addsub_expr : addsub_expr . SUB muldiv_expr
	addsub_expr : addsub_expr . ADD muldiv_expr
	shift_expr : shift_expr RSHIFT addsub_expr .  (72)

	ADD  shift 92
	SUB  shift 93
	.  reduce 72


state 131
	jug_expr : jug_expr . LE shift_expr
	jug_expr : jug_expr . GT shift_expr
	jug_expr : jug_expr . GE shift_expr
	ife_expr : ife_expr DEQ jug_expr .  (63)
	jug_expr : jug_expr . LT shift_expr

	GT  shift 83
	LT  shift 84
	GE  shift 85
	LE  shift 86
	.  reduce 63


state 132
	jug_expr : jug_expr . LE shift_expr
	ife_expr : ife_expr NEQ jug_expr .  (64)
	jug_expr : jug_expr . GT shift_expr
	jug_expr : jug_expr . GE shift_expr
	jug_expr : jug_expr . LT shift_expr

	GT  shift 83
	LT  shift 84
	GE  shift 85
	LE  shift 86
	.  reduce 64


133: shift-reduce conflict (shift 81, reduce 55) on OR
state 133
	and_expr : and_expr LAND or_bit_expr .  (55)
	or_bit_expr : or_bit_expr . OR nor_bit_expr

	OR  shift 81
	.  reduce 55


134: shift-reduce conflict (shift 96, reduce 74) on DELIVERY
state 134
	muldiv_expr : muldiv_expr . MUL uo_expr
	addsub_expr : addsub_expr ADD muldiv_expr .  (74)
	muldiv_expr : muldiv_expr . DELIVERY uo_expr
	muldiv_expr : muldiv_expr . DIV uo_expr

	MUL  shift 94
	DIV  shift 95
	DELIVERY  shift 96
	.  reduce 74


135: shift-reduce conflict (shift 96, reduce 75) on DELIVERY
state 135
	addsub_expr : addsub_expr SUB muldiv_expr .  (75)
	muldiv_expr : muldiv_expr . MUL uo_expr
	muldiv_expr : muldiv_expr . DELIVERY uo_expr
	muldiv_expr : muldiv_expr . DIV uo_expr

	MUL  shift 94
	DIV  shift 95
	DELIVERY  shift 96
	.  reduce 75


state 136
	muldiv_expr : muldiv_expr MUL uo_expr .  (77)
	uo_expr : uo_expr . SADD
	uo_expr : uo_expr . SSUB

	SADD  shift 97
	SSUB  shift 98
	.  reduce 77


state 137
	uo_expr : uo_expr . SADD
	muldiv_expr : muldiv_expr DIV uo_expr .  (78)
	uo_expr : uo_expr . SSUB

	SADD  shift 97
	SSUB  shift 98
	.  reduce 78


state 138
	uo_expr : uo_expr . SADD
	muldiv_expr : muldiv_expr DELIVERY uo_expr .  (79)
	uo_expr : uo_expr . SSUB

	SADD  shift 97
	SSUB  shift 98
	.  reduce 79


state 139
	expr : expr ADD EQ . if_expr

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17

	basic_expr  goto 36
	nor_bit_expr  goto 37
	if_expr  goto 157
	or_expr  goto 39
	or_bit_expr  goto 40
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	and_expr  goto 45
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49


state 140
	expr : expr SUB EQ . if_expr

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17

	basic_expr  goto 36
	nor_bit_expr  goto 37
	if_expr  goto 158
	or_expr  goto 39
	or_bit_expr  goto 40
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	and_expr  goto 45
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49


state 141
	expr : expr MUL EQ . if_expr

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17

	basic_expr  goto 36
	nor_bit_expr  goto 37
	if_expr  goto 159
	or_expr  goto 39
	or_bit_expr  goto 40
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	and_expr  goto 45
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49


state 142
	expr : expr DIV EQ . if_expr

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17

	basic_expr  goto 36
	nor_bit_expr  goto 37
	if_expr  goto 160
	or_expr  goto 39
	or_bit_expr  goto 40
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	and_expr  goto 45
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49


state 143
	expr : expr DELIVERY EQ . if_expr

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17

	basic_expr  goto 36
	nor_bit_expr  goto 37
	if_expr  goto 161
	or_expr  goto 39
	or_bit_expr  goto 40
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	and_expr  goto 45
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49


state 144
	expr : expr AND EQ . if_expr

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17

	basic_expr  goto 36
	nor_bit_expr  goto 37
	if_expr  goto 162
	or_expr  goto 39
	or_bit_expr  goto 40
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	and_expr  goto 45
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49


state 145
	expr : expr OR EQ . if_expr

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17

	basic_expr  goto 36
	nor_bit_expr  goto 37
	if_expr  goto 163
	or_expr  goto 39
	or_bit_expr  goto 40
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	and_expr  goto 45
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49


state 146
	id_list : ID COMMA . id_list

	ID  shift 107

	id_list  goto 164


state 147
	decl_stmt : type id_list SEMI .  (34)

	.  reduce 34


state 148
	uo_expr : SIZEOF LP uo_expr RP .  (90)

	.  reduce 90


state 149
	if_stmt : IF LP expr RP . stmt
	if_stmt : IF LP expr RP . lbock ELSE lbock

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	SEMI  shift 16
	LP  shift 17
	LB  shift 165
	IF  shift 18
	WHILE  shift 19
	FOR  shift 20
	BREAK  shift 21
	CONTINUE  shift 22
	RETURN  shift 23
	INPUT  shift 24
	OUTPUT  shift 25
	INT  shift 26
	CHAR  shift 27
	BOOL  shift 28

	expr_stmt  goto 29
	if_stmt  goto 30
	for_stmt  goto 31
	jump_stmt  goto 32
	decl_stmt  goto 33
	stmt  goto 166
	basic_expr  goto 36
	nor_bit_expr  goto 37
	if_expr  goto 38
	or_expr  goto 39
	or_bit_expr  goto 40
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	and_expr  goto 45
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49
	expr  goto 50
	out_stmt  goto 51
	type  goto 52
	sem_stmt  goto 53
	in_stmt  goto 54
	lbock  goto 167


state 150
	for_stmt : WHILE LP expr RP . lbock

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	SEMI  shift 16
	LP  shift 17
	LB  shift 165
	IF  shift 18
	WHILE  shift 19
	FOR  shift 20
	BREAK  shift 21
	CONTINUE  shift 22
	RETURN  shift 23
	INPUT  shift 24
	OUTPUT  shift 25
	INT  shift 26
	CHAR  shift 27
	BOOL  shift 28

	expr_stmt  goto 29
	if_stmt  goto 30
	for_stmt  goto 31
	jump_stmt  goto 32
	decl_stmt  goto 33
	stmt  goto 168
	basic_expr  goto 36
	nor_bit_expr  goto 37
	if_expr  goto 38
	or_expr  goto 39
	or_bit_expr  goto 40
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	and_expr  goto 45
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49
	expr  goto 50
	out_stmt  goto 51
	type  goto 52
	sem_stmt  goto 53
	in_stmt  goto 54
	lbock  goto 169


state 151
	for_stmt : FOR LP SEMI SEMI . RP lbock
	for_stmt : FOR LP SEMI SEMI . expr RP lbock

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17
	RP  shift 170

	basic_expr  goto 36
	nor_bit_expr  goto 37
	if_expr  goto 38
	or_expr  goto 39
	or_bit_expr  goto 40
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	and_expr  goto 45
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49
	expr  goto 171


state 152
	for_stmt : FOR LP SEMI expr . SEMI RP lbock
	for_stmt : FOR LP SEMI expr . SEMI expr RP lbock
	expr : expr . MUL EQ if_expr
	expr : expr . DIV EQ if_expr
	expr : expr . DELIVERY EQ if_expr
	expr : expr . ADD EQ if_expr
	expr : expr . SUB EQ if_expr
	expr : expr . AND EQ if_expr
	expr : expr . OR EQ if_expr

	ADD  shift 99
	SUB  shift 100
	MUL  shift 101
	DIV  shift 102
	DELIVERY  shift 103
	AND  shift 104
	OR  shift 105
	SEMI  shift 172


state 153
	for_stmt : FOR LP expr SEMI . SEMI RP lbock
	for_stmt : FOR LP expr SEMI . expr SEMI expr RP lbock
	for_stmt : FOR LP expr SEMI . SEMI expr RP lbock
	for_stmt : FOR LP expr SEMI . expr SEMI RP lbock

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	SEMI  shift 173
	LP  shift 17

	basic_expr  goto 36
	nor_bit_expr  goto 37
	if_expr  goto 38
	or_expr  goto 39
	or_bit_expr  goto 40
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	and_expr  goto 45
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49
	expr  goto 174


state 154
	in_stmt : INPUT LP stmt RP . SEMI

	SEMI  shift 175


state 155
	out_stmt : OUTPUT LP expr RP . SEMI

	SEMI  shift 176


state 156
	mblock : LB stmts RB .  (5)

	.  reduce 5


state 157
	expr : expr ADD EQ if_expr .  (47)

	.  reduce 47


state 158
	expr : expr SUB EQ if_expr .  (48)

	.  reduce 48


state 159
	expr : expr MUL EQ if_expr .  (45)

	.  reduce 45


state 160
	expr : expr DIV EQ if_expr .  (44)

	.  reduce 44


state 161
	expr : expr DELIVERY EQ if_expr .  (46)

	.  reduce 46


state 162
	expr : expr AND EQ if_expr .  (49)

	.  reduce 49


state 163
	expr : expr OR EQ if_expr .  (50)

	.  reduce 50


state 164
	id_list : ID COMMA id_list .  (39)

	.  reduce 39


state 165
	lbock : LB . stmts RB

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	SEMI  shift 16
	LP  shift 17
	IF  shift 18
	WHILE  shift 19
	FOR  shift 20
	BREAK  shift 21
	CONTINUE  shift 22
	RETURN  shift 23
	INPUT  shift 24
	OUTPUT  shift 25
	INT  shift 26
	CHAR  shift 27
	BOOL  shift 28

	expr_stmt  goto 29
	if_stmt  goto 30
	for_stmt  goto 31
	jump_stmt  goto 32
	decl_stmt  goto 33
	stmts  goto 177
	stmt  goto 35
	basic_expr  goto 36
	nor_bit_expr  goto 37
	if_expr  goto 38
	or_expr  goto 39
	or_bit_expr  goto 40
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	and_expr  goto 45
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49
	expr  goto 50
	out_stmt  goto 51
	type  goto 52
	sem_stmt  goto 53
	in_stmt  goto 54


166: reduce-reduce conflict (reduce 17, reduce 41) on ELSE
state 166
	if_stmt : IF LP expr RP stmt .  (17)
	lbock : stmt .  (41)

	.  reduce 17


state 167
	if_stmt : IF LP expr RP lbock . ELSE lbock

	ELSE  shift 178


state 168
	lbock : stmt .  (41)

	.  reduce 41


state 169
	for_stmt : WHILE LP expr RP lbock .  (27)

	.  reduce 27


state 170
	for_stmt : FOR LP SEMI SEMI RP . lbock

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	SEMI  shift 16
	LP  shift 17
	LB  shift 165
	IF  shift 18
	WHILE  shift 19
	FOR  shift 20
	BREAK  shift 21
	CONTINUE  shift 22
	RETURN  shift 23
	INPUT  shift 24
	OUTPUT  shift 25
	INT  shift 26
	CHAR  shift 27
	BOOL  shift 28

	expr_stmt  goto 29
	if_stmt  goto 30
	for_stmt  goto 31
	jump_stmt  goto 32
	decl_stmt  goto 33
	stmt  goto 168
	basic_expr  goto 36
	nor_bit_expr  goto 37
	if_expr  goto 38
	or_expr  goto 39
	or_bit_expr  goto 40
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	and_expr  goto 45
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49
	expr  goto 50
	out_stmt  goto 51
	type  goto 52
	sem_stmt  goto 53
	in_stmt  goto 54
	lbock  goto 179


state 171
	for_stmt : FOR LP SEMI SEMI expr . RP lbock
	expr : expr . MUL EQ if_expr
	expr : expr . DIV EQ if_expr
	expr : expr . DELIVERY EQ if_expr
	expr : expr . ADD EQ if_expr
	expr : expr . SUB EQ if_expr
	expr : expr . AND EQ if_expr
	expr : expr . OR EQ if_expr

	ADD  shift 99
	SUB  shift 100
	MUL  shift 101
	DIV  shift 102
	DELIVERY  shift 103
	AND  shift 104
	OR  shift 105
	RP  shift 180


state 172
	for_stmt : FOR LP SEMI expr SEMI . RP lbock
	for_stmt : FOR LP SEMI expr SEMI . expr RP lbock

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17
	RP  shift 181

	basic_expr  goto 36
	nor_bit_expr  goto 37
	if_expr  goto 38
	or_expr  goto 39
	or_bit_expr  goto 40
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	and_expr  goto 45
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49
	expr  goto 182


state 173
	for_stmt : FOR LP expr SEMI SEMI . RP lbock
	for_stmt : FOR LP expr SEMI SEMI . expr RP lbock

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17
	RP  shift 183

	basic_expr  goto 36
	nor_bit_expr  goto 37
	if_expr  goto 38
	or_expr  goto 39
	or_bit_expr  goto 40
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	and_expr  goto 45
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49
	expr  goto 184


state 174
	for_stmt : FOR LP expr SEMI expr . SEMI expr RP lbock
	for_stmt : FOR LP expr SEMI expr . SEMI RP lbock
	expr : expr . MUL EQ if_expr
	expr : expr . DIV EQ if_expr
	expr : expr . DELIVERY EQ if_expr
	expr : expr . ADD EQ if_expr
	expr : expr . SUB EQ if_expr
	expr : expr . AND EQ if_expr
	expr : expr . OR EQ if_expr

	ADD  shift 99
	SUB  shift 100
	MUL  shift 101
	DIV  shift 102
	DELIVERY  shift 103
	AND  shift 104
	OR  shift 105
	SEMI  shift 185


state 175
	in_stmt : INPUT LP stmt RP SEMI .  (15)

	.  reduce 15


state 176
	out_stmt : OUTPUT LP expr RP SEMI .  (16)

	.  reduce 16


state 177
	stmts : stmts . mblock stmts
	lbock : LB stmts . RB

	LB  shift 74
	RB  shift 186

	mblock  goto 76


state 178
	if_stmt : IF LP expr RP lbock ELSE . lbock

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	SEMI  shift 16
	LP  shift 17
	LB  shift 165
	IF  shift 18
	WHILE  shift 19
	FOR  shift 20
	BREAK  shift 21
	CONTINUE  shift 22
	RETURN  shift 23
	INPUT  shift 24
	OUTPUT  shift 25
	INT  shift 26
	CHAR  shift 27
	BOOL  shift 28

	expr_stmt  goto 29
	if_stmt  goto 30
	for_stmt  goto 31
	jump_stmt  goto 32
	decl_stmt  goto 33
	stmt  goto 168
	basic_expr  goto 36
	nor_bit_expr  goto 37
	if_expr  goto 38
	or_expr  goto 39
	or_bit_expr  goto 40
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	and_expr  goto 45
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49
	expr  goto 50
	out_stmt  goto 51
	type  goto 52
	sem_stmt  goto 53
	in_stmt  goto 54
	lbock  goto 187


state 179
	for_stmt : FOR LP SEMI SEMI RP lbock .  (26)

	.  reduce 26


state 180
	for_stmt : FOR LP SEMI SEMI expr RP . lbock

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	SEMI  shift 16
	LP  shift 17
	LB  shift 165
	IF  shift 18
	WHILE  shift 19
	FOR  shift 20
	BREAK  shift 21
	CONTINUE  shift 22
	RETURN  shift 23
	INPUT  shift 24
	OUTPUT  shift 25
	INT  shift 26
	CHAR  shift 27
	BOOL  shift 28

	expr_stmt  goto 29
	if_stmt  goto 30
	for_stmt  goto 31
	jump_stmt  goto 32
	decl_stmt  goto 33
	stmt  goto 168
	basic_expr  goto 36
	nor_bit_expr  goto 37
	if_expr  goto 38
	or_expr  goto 39
	or_bit_expr  goto 40
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	and_expr  goto 45
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49
	expr  goto 50
	out_stmt  goto 51
	type  goto 52
	sem_stmt  goto 53
	in_stmt  goto 54
	lbock  goto 188


state 181
	for_stmt : FOR LP SEMI expr SEMI RP . lbock

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	SEMI  shift 16
	LP  shift 17
	LB  shift 165
	IF  shift 18
	WHILE  shift 19
	FOR  shift 20
	BREAK  shift 21
	CONTINUE  shift 22
	RETURN  shift 23
	INPUT  shift 24
	OUTPUT  shift 25
	INT  shift 26
	CHAR  shift 27
	BOOL  shift 28

	expr_stmt  goto 29
	if_stmt  goto 30
	for_stmt  goto 31
	jump_stmt  goto 32
	decl_stmt  goto 33
	stmt  goto 168
	basic_expr  goto 36
	nor_bit_expr  goto 37
	if_expr  goto 38
	or_expr  goto 39
	or_bit_expr  goto 40
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	and_expr  goto 45
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49
	expr  goto 50
	out_stmt  goto 51
	type  goto 52
	sem_stmt  goto 53
	in_stmt  goto 54
	lbock  goto 189


state 182
	for_stmt : FOR LP SEMI expr SEMI expr . RP lbock
	expr : expr . MUL EQ if_expr
	expr : expr . DIV EQ if_expr
	expr : expr . DELIVERY EQ if_expr
	expr : expr . ADD EQ if_expr
	expr : expr . SUB EQ if_expr
	expr : expr . AND EQ if_expr
	expr : expr . OR EQ if_expr

	ADD  shift 99
	SUB  shift 100
	MUL  shift 101
	DIV  shift 102
	DELIVERY  shift 103
	AND  shift 104
	OR  shift 105
	RP  shift 190


state 183
	for_stmt : FOR LP expr SEMI SEMI RP . lbock

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	SEMI  shift 16
	LP  shift 17
	LB  shift 165
	IF  shift 18
	WHILE  shift 19
	FOR  shift 20
	BREAK  shift 21
	CONTINUE  shift 22
	RETURN  shift 23
	INPUT  shift 24
	OUTPUT  shift 25
	INT  shift 26
	CHAR  shift 27
	BOOL  shift 28

	expr_stmt  goto 29
	if_stmt  goto 30
	for_stmt  goto 31
	jump_stmt  goto 32
	decl_stmt  goto 33
	stmt  goto 168
	basic_expr  goto 36
	nor_bit_expr  goto 37
	if_expr  goto 38
	or_expr  goto 39
	or_bit_expr  goto 40
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	and_expr  goto 45
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49
	expr  goto 50
	out_stmt  goto 51
	type  goto 52
	sem_stmt  goto 53
	in_stmt  goto 54
	lbock  goto 191


state 184
	for_stmt : FOR LP expr SEMI SEMI expr . RP lbock
	expr : expr . MUL EQ if_expr
	expr : expr . DIV EQ if_expr
	expr : expr . DELIVERY EQ if_expr
	expr : expr . ADD EQ if_expr
	expr : expr . SUB EQ if_expr
	expr : expr . AND EQ if_expr
	expr : expr . OR EQ if_expr

	ADD  shift 99
	SUB  shift 100
	MUL  shift 101
	DIV  shift 102
	DELIVERY  shift 103
	AND  shift 104
	OR  shift 105
	RP  shift 192


state 185
	for_stmt : FOR LP expr SEMI expr SEMI . expr RP lbock
	for_stmt : FOR LP expr SEMI expr SEMI . RP lbock

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	LP  shift 17
	RP  shift 193

	basic_expr  goto 36
	nor_bit_expr  goto 37
	if_expr  goto 38
	or_expr  goto 39
	or_bit_expr  goto 40
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	and_expr  goto 45
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49
	expr  goto 194


state 186
	lbock : LB stmts RB .  (40)

	.  reduce 40


state 187
	if_stmt : IF LP expr RP lbock ELSE lbock .  (18)

	.  reduce 18


state 188
	for_stmt : FOR LP SEMI SEMI expr RP lbock .  (23)

	.  reduce 23


state 189
	for_stmt : FOR LP SEMI expr SEMI RP lbock .  (24)

	.  reduce 24


state 190
	for_stmt : FOR LP SEMI expr SEMI expr RP . lbock

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	SEMI  shift 16
	LP  shift 17
	LB  shift 165
	IF  shift 18
	WHILE  shift 19
	FOR  shift 20
	BREAK  shift 21
	CONTINUE  shift 22
	RETURN  shift 23
	INPUT  shift 24
	OUTPUT  shift 25
	INT  shift 26
	CHAR  shift 27
	BOOL  shift 28

	expr_stmt  goto 29
	if_stmt  goto 30
	for_stmt  goto 31
	jump_stmt  goto 32
	decl_stmt  goto 33
	stmt  goto 168
	basic_expr  goto 36
	nor_bit_expr  goto 37
	if_expr  goto 38
	or_expr  goto 39
	or_bit_expr  goto 40
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	and_expr  goto 45
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49
	expr  goto 50
	out_stmt  goto 51
	type  goto 52
	sem_stmt  goto 53
	in_stmt  goto 54
	lbock  goto 195


state 191
	for_stmt : FOR LP expr SEMI SEMI RP lbock .  (25)

	.  reduce 25


state 192
	for_stmt : FOR LP expr SEMI SEMI expr RP . lbock

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	SEMI  shift 16
	LP  shift 17
	LB  shift 165
	IF  shift 18
	WHILE  shift 19
	FOR  shift 20
	BREAK  shift 21
	CONTINUE  shift 22
	RETURN  shift 23
	INPUT  shift 24
	OUTPUT  shift 25
	INT  shift 26
	CHAR  shift 27
	BOOL  shift 28

	expr_stmt  goto 29
	if_stmt  goto 30
	for_stmt  goto 31
	jump_stmt  goto 32
	decl_stmt  goto 33
	stmt  goto 168
	basic_expr  goto 36
	nor_bit_expr  goto 37
	if_expr  goto 38
	or_expr  goto 39
	or_bit_expr  goto 40
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	and_expr  goto 45
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49
	expr  goto 50
	out_stmt  goto 51
	type  goto 52
	sem_stmt  goto 53
	in_stmt  goto 54
	lbock  goto 196


state 193
	for_stmt : FOR LP expr SEMI expr SEMI RP . lbock

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	SEMI  shift 16
	LP  shift 17
	LB  shift 165
	IF  shift 18
	WHILE  shift 19
	FOR  shift 20
	BREAK  shift 21
	CONTINUE  shift 22
	RETURN  shift 23
	INPUT  shift 24
	OUTPUT  shift 25
	INT  shift 26
	CHAR  shift 27
	BOOL  shift 28

	expr_stmt  goto 29
	if_stmt  goto 30
	for_stmt  goto 31
	jump_stmt  goto 32
	decl_stmt  goto 33
	stmt  goto 168
	basic_expr  goto 36
	nor_bit_expr  goto 37
	if_expr  goto 38
	or_expr  goto 39
	or_bit_expr  goto 40
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	and_expr  goto 45
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49
	expr  goto 50
	out_stmt  goto 51
	type  goto 52
	sem_stmt  goto 53
	in_stmt  goto 54
	lbock  goto 197


state 194
	for_stmt : FOR LP expr SEMI expr SEMI expr . RP lbock
	expr : expr . MUL EQ if_expr
	expr : expr . DIV EQ if_expr
	expr : expr . DELIVERY EQ if_expr
	expr : expr . ADD EQ if_expr
	expr : expr . SUB EQ if_expr
	expr : expr . AND EQ if_expr
	expr : expr . OR EQ if_expr

	ADD  shift 99
	SUB  shift 100
	MUL  shift 101
	DIV  shift 102
	DELIVERY  shift 103
	AND  shift 104
	OR  shift 105
	RP  shift 198


state 195
	for_stmt : FOR LP SEMI expr SEMI expr RP lbock .  (20)

	.  reduce 20


state 196
	for_stmt : FOR LP expr SEMI SEMI expr RP lbock .  (21)

	.  reduce 21


state 197
	for_stmt : FOR LP expr SEMI expr SEMI RP lbock .  (22)

	.  reduce 22


state 198
	for_stmt : FOR LP expr SEMI expr SEMI expr RP . lbock

	CONST  shift 6
	ID  shift 7
	ADD  shift 8
	SUB  shift 9
	MUL  shift 10
	SADD  shift 11
	SSUB  shift 12
	LN  shift 13
	AND  shift 14
	SIZEOF  shift 15
	SEMI  shift 16
	LP  shift 17
	LB  shift 165
	IF  shift 18
	WHILE  shift 19
	FOR  shift 20
	BREAK  shift 21
	CONTINUE  shift 22
	RETURN  shift 23
	INPUT  shift 24
	OUTPUT  shift 25
	INT  shift 26
	CHAR  shift 27
	BOOL  shift 28

	expr_stmt  goto 29
	if_stmt  goto 30
	for_stmt  goto 31
	jump_stmt  goto 32
	decl_stmt  goto 33
	stmt  goto 168
	basic_expr  goto 36
	nor_bit_expr  goto 37
	if_expr  goto 38
	or_expr  goto 39
	or_bit_expr  goto 40
	and_bit_expr  goto 41
	jug_expr  goto 42
	shift_expr  goto 43
	ife_expr  goto 44
	and_expr  goto 45
	addsub_expr  goto 46
	muldiv_expr  goto 47
	uo_expr  goto 48
	post_expr  goto 49
	expr  goto 50
	out_stmt  goto 51
	type  goto 52
	sem_stmt  goto 53
	in_stmt  goto 54
	lbock  goto 199


state 199
	for_stmt : FOR LP expr SEMI expr SEMI expr RP lbock .  (19)

	.  reduce 19


##############################################################################
# Summary
##############################################################################

State 40 contains 1 shift-reduce conflict(s)
State 41 contains 1 shift-reduce conflict(s)
State 46 contains 2 shift-reduce conflict(s)
State 47 contains 3 shift-reduce conflict(s)
State 55 contains 2 shift-reduce conflict(s)
State 56 contains 2 shift-reduce conflict(s)
State 57 contains 2 shift-reduce conflict(s)
State 58 contains 2 shift-reduce conflict(s)
State 59 contains 2 shift-reduce conflict(s)
State 60 contains 2 shift-reduce conflict(s)
State 61 contains 2 shift-reduce conflict(s)
State 77 contains 1 shift-reduce conflict(s)
State 119 contains 1 shift-reduce conflict(s)
State 120 contains 1 shift-reduce conflict(s)
State 121 contains 3 shift-reduce conflict(s)
State 129 contains 2 shift-reduce conflict(s)
State 130 contains 2 shift-reduce conflict(s)
State 133 contains 1 shift-reduce conflict(s)
State 134 contains 1 shift-reduce conflict(s)
State 135 contains 1 shift-reduce conflict(s)
State 166 contains 1 reduce-reduce conflict(s)


45 token(s), 32 nonterminal(s)
95 grammar rule(s), 200 state(s)


##############################################################################
# End of File
##############################################################################
