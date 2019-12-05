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
# mylexer.v
# Lex verbose file generated from mylexer.l.
# 
# Date: 12/05/19
# Time: 18:15:41
# 
# ALex Version: 2.07
#############################################################################


#############################################################################
# Expressions
#############################################################################

    1  <INITIAL>\/\/(.)*\n

    2  <INITIAL>"/*"

    3  <COMMENT>"*/"

    4  <COMMENT>.|\n

    5  <INITIAL>\+

    6  <INITIAL>\-

    7  <INITIAL>\/

    8  <INITIAL>\*

    9  <INITIAL>\%

   10  <INITIAL>=

   11  <INITIAL>!=

   12  <INITIAL>==

   13  <INITIAL>\>

   14  <INITIAL>\<

   15  <INITIAL>\>=

   16  <INITIAL>\<=

   17  <INITIAL>\+\+

   18  <INITIAL>\-\-

   19  <INITIAL>&&

   20  <INITIAL>\|\|

   21  <INITIAL>!

   22  <INITIAL>&

   23  <INITIAL>\|

   24  <INITIAL>~

   25  <INITIAL>\<\<

   26  <INITIAL>\>\>

   27  <INITIAL>sizeof

   28  <INITIAL>\{

   29  <INITIAL>\}

   30  <INITIAL>\(

   31  <INITIAL>\)

   32  <INITIAL>\;

   33  <INITIAL>\,

   34  <INITIAL>\.

   35  <INITIAL>if

   36  <INITIAL>while

   37  <INITIAL>void

   38  <INITIAL>true|TRUE

   39  <INITIAL>switch

   40  <INITIAL>case

   41  <INITIAL>for

   42  <INITIAL>then

   43  <INITIAL>else

   44  <INITIAL>do

   45  <INITIAL>break

   46  <INITIAL>continue

   47  <INITIAL>return

   48  <INITIAL>goto

   49  <INITIAL>input

   50  <INITIAL>output

   51  <INITIAL>int

   52  <INITIAL>char

   53  <INITIAL>float

   54  <INITIAL>double

   55  <INITIAL>bool

   56  <INITIAL>long

   57  <INITIAL>short

   58  <INITIAL>([0-9]+(\.[0-9]+)?(e([\+\-])?[0-9]+)?)

   59  <INITIAL>'[_a-zA-Z0-9]*'

   60  <INITIAL>[_a-zA-Z][_a-zA-Z0-9]*

   61  [" "\n\t\r]+


#############################################################################
# States
#############################################################################

state 1
	INITIAL

	0x09 - 0x0a (2)    goto 5
	0x0d               goto 5
	0x20               goto 5
	0x21               goto 6
	0x22               goto 5
	0x25               goto 7
	0x26               goto 8
	0x27               goto 9
	0x28               goto 10
	0x29               goto 11
	0x2a               goto 12
	0x2b               goto 13
	0x2c               goto 14
	0x2d               goto 15
	0x2e               goto 16
	0x2f               goto 17
	0x30 - 0x39 (10)   goto 18
	0x3b               goto 19
	0x3c               goto 20
	0x3d               goto 21
	0x3e               goto 22
	0x41 - 0x53 (19)   goto 23
	0x54               goto 24
	0x55 - 0x5a (6)    goto 23
	0x5f               goto 23
	0x61               goto 23
	0x62               goto 25
	0x63               goto 26
	0x64               goto 27
	0x65               goto 28
	0x66               goto 29
	0x67               goto 30
	0x68               goto 23
	0x69               goto 31
	0x6a - 0x6b (2)    goto 23
	0x6c               goto 32
	0x6d - 0x6e (2)    goto 23
	0x6f               goto 33
	0x70 - 0x71 (2)    goto 23
	0x72               goto 34
	0x73               goto 35
	0x74               goto 36
	0x75               goto 23
	0x76               goto 37
	0x77               goto 38
	0x78 - 0x7a (3)    goto 23
	0x7b               goto 39
	0x7c               goto 40
	0x7d               goto 41
	0x7e               goto 42


state 2
	^INITIAL

	0x09 - 0x0a (2)    goto 5
	0x0d               goto 5
	0x20               goto 5
	0x21               goto 6
	0x22               goto 5
	0x25               goto 7
	0x26               goto 8
	0x27               goto 9
	0x28               goto 10
	0x29               goto 11
	0x2a               goto 12
	0x2b               goto 13
	0x2c               goto 14
	0x2d               goto 15
	0x2e               goto 16
	0x2f               goto 17
	0x30 - 0x39 (10)   goto 18
	0x3b               goto 19
	0x3c               goto 20
	0x3d               goto 21
	0x3e               goto 22
	0x41 - 0x53 (19)   goto 23
	0x54               goto 24
	0x55 - 0x5a (6)    goto 23
	0x5f               goto 23
	0x61               goto 23
	0x62               goto 25
	0x63               goto 26
	0x64               goto 27
	0x65               goto 28
	0x66               goto 29
	0x67               goto 30
	0x68               goto 23
	0x69               goto 31
	0x6a - 0x6b (2)    goto 23
	0x6c               goto 32
	0x6d - 0x6e (2)    goto 23
	0x6f               goto 33
	0x70 - 0x71 (2)    goto 23
	0x72               goto 34
	0x73               goto 35
	0x74               goto 36
	0x75               goto 23
	0x76               goto 37
	0x77               goto 38
	0x78 - 0x7a (3)    goto 23
	0x7b               goto 39
	0x7c               goto 40
	0x7d               goto 41
	0x7e               goto 42


state 3
	COMMENT

	0x00 - 0x08 (9)    goto 147
	0x09 - 0x0a (2)    goto 148
	0x0b - 0x0c (2)    goto 147
	0x0d               goto 148
	0x0e - 0x1f (18)   goto 147
	0x20               goto 148
	0x21               goto 147
	0x22               goto 148
	0x23 - 0x29 (7)    goto 147
	0x2a               goto 149
	0x2b - 0xff (213)  goto 147


state 4
	^COMMENT

	0x00 - 0x08 (9)    goto 147
	0x09 - 0x0a (2)    goto 148
	0x0b - 0x0c (2)    goto 147
	0x0d               goto 148
	0x0e - 0x1f (18)   goto 147
	0x20               goto 148
	0x21               goto 147
	0x22               goto 148
	0x23 - 0x29 (7)    goto 147
	0x2a               goto 149
	0x2b - 0xff (213)  goto 147


state 5
	0x09 - 0x0a (2)    goto 5
	0x0d               goto 5
	0x20               goto 5
	0x22               goto 5

	match 61


state 6
	0x3d               goto 43

	match 21


state 7
	match 9


state 8
	0x26               goto 44

	match 22


state 9
	0x27               goto 45
	0x30 - 0x39 (10)   goto 9
	0x41 - 0x5a (26)   goto 9
	0x5f               goto 9
	0x61 - 0x7a (26)   goto 9


state 10
	match 30


state 11
	match 31


state 12
	match 8


state 13
	0x2b               goto 46

	match 5


state 14
	match 33


state 15
	0x2d               goto 47

	match 6


state 16
	match 34


state 17
	0x2a               goto 48
	0x2f               goto 49

	match 7


state 18
	0x2e               goto 50
	0x30 - 0x39 (10)   goto 18
	0x65               goto 51

	match 58


state 19
	match 32


state 20
	0x3c               goto 52
	0x3d               goto 53

	match 14


state 21
	0x3d               goto 54

	match 10


state 22
	0x3d               goto 55
	0x3e               goto 56

	match 13


state 23
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x7a (26)   goto 23

	match 60


state 24
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x51 (17)   goto 23
	0x52               goto 57
	0x53 - 0x5a (8)    goto 23
	0x5f               goto 23
	0x61 - 0x7a (26)   goto 23

	match 60


state 25
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x6e (14)   goto 23
	0x6f               goto 58
	0x70 - 0x71 (2)    goto 23
	0x72               goto 59
	0x73 - 0x7a (8)    goto 23

	match 60


state 26
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61               goto 60
	0x62 - 0x67 (6)    goto 23
	0x68               goto 61
	0x69 - 0x6e (6)    goto 23
	0x6f               goto 62
	0x70 - 0x7a (11)   goto 23

	match 60


state 27
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x6e (14)   goto 23
	0x6f               goto 63
	0x70 - 0x7a (11)   goto 23

	match 60


state 28
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x6b (11)   goto 23
	0x6c               goto 64
	0x6d - 0x7a (14)   goto 23

	match 60


state 29
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x6b (11)   goto 23
	0x6c               goto 65
	0x6d - 0x6e (2)    goto 23
	0x6f               goto 66
	0x70 - 0x7a (11)   goto 23

	match 60


state 30
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x6e (14)   goto 23
	0x6f               goto 67
	0x70 - 0x7a (11)   goto 23

	match 60


state 31
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x65 (5)    goto 23
	0x66               goto 68
	0x67 - 0x6d (7)    goto 23
	0x6e               goto 69
	0x6f - 0x7a (12)   goto 23

	match 60


state 32
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x6e (14)   goto 23
	0x6f               goto 70
	0x70 - 0x7a (11)   goto 23

	match 60


state 33
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x74 (20)   goto 23
	0x75               goto 71
	0x76 - 0x7a (5)    goto 23

	match 60


state 34
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x64 (4)    goto 23
	0x65               goto 72
	0x66 - 0x7a (21)   goto 23

	match 60


state 35
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x67 (7)    goto 23
	0x68               goto 73
	0x69               goto 74
	0x6a - 0x76 (13)   goto 23
	0x77               goto 75
	0x78 - 0x7a (3)    goto 23

	match 60


state 36
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x67 (7)    goto 23
	0x68               goto 76
	0x69 - 0x71 (9)    goto 23
	0x72               goto 77
	0x73 - 0x7a (8)    goto 23

	match 60


state 37
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x6e (14)   goto 23
	0x6f               goto 78
	0x70 - 0x7a (11)   goto 23

	match 60


state 38
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x67 (7)    goto 23
	0x68               goto 79
	0x69 - 0x7a (18)   goto 23

	match 60


state 39
	match 28


state 40
	0x7c               goto 80

	match 23


state 41
	match 29


state 42
	match 24


state 43
	match 11


state 44
	match 19


state 45
	match 59


state 46
	match 17


state 47
	match 18


state 48
	match 2


state 49
	0x00 - 0x09 (10)   goto 49
	0x0a               goto 81
	0x0b - 0xff (245)  goto 49


state 50
	0x30 - 0x39 (10)   goto 82


state 51
	0x2b               goto 83
	0x2d               goto 83
	0x30 - 0x39 (10)   goto 84


state 52
	match 25


state 53
	match 16


state 54
	match 12


state 55
	match 15


state 56
	match 26


state 57
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x54 (20)   goto 23
	0x55               goto 85
	0x56 - 0x5a (5)    goto 23
	0x5f               goto 23
	0x61 - 0x7a (26)   goto 23

	match 60


state 58
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x6e (14)   goto 23
	0x6f               goto 86
	0x70 - 0x7a (11)   goto 23

	match 60


state 59
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x64 (4)    goto 23
	0x65               goto 87
	0x66 - 0x7a (21)   goto 23

	match 60


state 60
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x72 (18)   goto 23
	0x73               goto 88
	0x74 - 0x7a (7)    goto 23

	match 60


state 61
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61               goto 89
	0x62 - 0x7a (25)   goto 23

	match 60


state 62
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x6d (13)   goto 23
	0x6e               goto 90
	0x6f - 0x7a (12)   goto 23

	match 60


state 63
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x74 (20)   goto 23
	0x75               goto 91
	0x76 - 0x7a (5)    goto 23

	match 44


state 64
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x72 (18)   goto 23
	0x73               goto 92
	0x74 - 0x7a (7)    goto 23

	match 60


state 65
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x6e (14)   goto 23
	0x6f               goto 93
	0x70 - 0x7a (11)   goto 23

	match 60


state 66
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x71 (17)   goto 23
	0x72               goto 94
	0x73 - 0x7a (8)    goto 23

	match 60


state 67
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x73 (19)   goto 23
	0x74               goto 95
	0x75 - 0x7a (6)    goto 23

	match 60


state 68
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x7a (26)   goto 23

	match 35


state 69
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x6f (15)   goto 23
	0x70               goto 96
	0x71 - 0x73 (3)    goto 23
	0x74               goto 97
	0x75 - 0x7a (6)    goto 23

	match 60


state 70
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x6d (13)   goto 23
	0x6e               goto 98
	0x6f - 0x7a (12)   goto 23

	match 60


state 71
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x73 (19)   goto 23
	0x74               goto 99
	0x75 - 0x7a (6)    goto 23

	match 60


state 72
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x73 (19)   goto 23
	0x74               goto 100
	0x75 - 0x7a (6)    goto 23

	match 60


state 73
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x6e (14)   goto 23
	0x6f               goto 101
	0x70 - 0x7a (11)   goto 23

	match 60


state 74
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x79 (25)   goto 23
	0x7a               goto 102

	match 60


state 75
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x68 (8)    goto 23
	0x69               goto 103
	0x6a - 0x7a (17)   goto 23

	match 60


state 76
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x64 (4)    goto 23
	0x65               goto 104
	0x66 - 0x7a (21)   goto 23

	match 60


state 77
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x74 (20)   goto 23
	0x75               goto 105
	0x76 - 0x7a (5)    goto 23

	match 60


state 78
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x68 (8)    goto 23
	0x69               goto 106
	0x6a - 0x7a (17)   goto 23

	match 60


state 79
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x68 (8)    goto 23
	0x69               goto 107
	0x6a - 0x7a (17)   goto 23

	match 60


state 80
	match 20


state 81
	match 1


state 82
	0x30 - 0x39 (10)   goto 82
	0x65               goto 51

	match 58


state 83
	0x30 - 0x39 (10)   goto 84


state 84
	0x30 - 0x39 (10)   goto 84

	match 58


state 85
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x44 (4)    goto 23
	0x45               goto 108
	0x46 - 0x5a (21)   goto 23
	0x5f               goto 23
	0x61 - 0x7a (26)   goto 23

	match 60


state 86
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x6b (11)   goto 23
	0x6c               goto 109
	0x6d - 0x7a (14)   goto 23

	match 60


state 87
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61               goto 110
	0x62 - 0x7a (25)   goto 23

	match 60


state 88
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x64 (4)    goto 23
	0x65               goto 111
	0x66 - 0x7a (21)   goto 23

	match 60


state 89
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x71 (17)   goto 23
	0x72               goto 112
	0x73 - 0x7a (8)    goto 23

	match 60


state 90
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x73 (19)   goto 23
	0x74               goto 113
	0x75 - 0x7a (6)    goto 23

	match 60


state 91
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61               goto 23
	0x62               goto 114
	0x63 - 0x7a (24)   goto 23

	match 60


state 92
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x64 (4)    goto 23
	0x65               goto 115
	0x66 - 0x7a (21)   goto 23

	match 60


state 93
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61               goto 116
	0x62 - 0x7a (25)   goto 23

	match 60


state 94
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x7a (26)   goto 23

	match 41


state 95
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x6e (14)   goto 23
	0x6f               goto 117
	0x70 - 0x7a (11)   goto 23

	match 60


state 96
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x74 (20)   goto 23
	0x75               goto 118
	0x76 - 0x7a (5)    goto 23

	match 60


state 97
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x7a (26)   goto 23

	match 51


state 98
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x66 (6)    goto 23
	0x67               goto 119
	0x68 - 0x7a (19)   goto 23

	match 60


state 99
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x6f (15)   goto 23
	0x70               goto 120
	0x71 - 0x7a (10)   goto 23

	match 60


state 100
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x74 (20)   goto 23
	0x75               goto 121
	0x76 - 0x7a (5)    goto 23

	match 60


state 101
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x71 (17)   goto 23
	0x72               goto 122
	0x73 - 0x7a (8)    goto 23

	match 60


state 102
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x64 (4)    goto 23
	0x65               goto 123
	0x66 - 0x7a (21)   goto 23

	match 60


state 103
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x73 (19)   goto 23
	0x74               goto 124
	0x75 - 0x7a (6)    goto 23

	match 60


state 104
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x6d (13)   goto 23
	0x6e               goto 125
	0x6f - 0x7a (12)   goto 23

	match 60


state 105
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x64 (4)    goto 23
	0x65               goto 108
	0x66 - 0x7a (21)   goto 23

	match 60


state 106
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x63 (3)    goto 23
	0x64               goto 126
	0x65 - 0x7a (22)   goto 23

	match 60


state 107
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x6b (11)   goto 23
	0x6c               goto 127
	0x6d - 0x7a (14)   goto 23

	match 60


state 108
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x7a (26)   goto 23

	match 38


state 109
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x7a (26)   goto 23

	match 55


state 110
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x6a (10)   goto 23
	0x6b               goto 128
	0x6c - 0x7a (15)   goto 23

	match 60


state 111
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x7a (26)   goto 23

	match 40


state 112
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x7a (26)   goto 23

	match 52


state 113
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x68 (8)    goto 23
	0x69               goto 129
	0x6a - 0x7a (17)   goto 23

	match 60


state 114
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x6b (11)   goto 23
	0x6c               goto 130
	0x6d - 0x7a (14)   goto 23

	match 60


state 115
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x7a (26)   goto 23

	match 43


state 116
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x73 (19)   goto 23
	0x74               goto 131
	0x75 - 0x7a (6)    goto 23

	match 60


state 117
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x7a (26)   goto 23

	match 48


state 118
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x73 (19)   goto 23
	0x74               goto 132
	0x75 - 0x7a (6)    goto 23

	match 60


state 119
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x7a (26)   goto 23

	match 56


state 120
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x74 (20)   goto 23
	0x75               goto 133
	0x76 - 0x7a (5)    goto 23

	match 60


state 121
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x71 (17)   goto 23
	0x72               goto 134
	0x73 - 0x7a (8)    goto 23

	match 60


state 122
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x73 (19)   goto 23
	0x74               goto 135
	0x75 - 0x7a (6)    goto 23

	match 60


state 123
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x6e (14)   goto 23
	0x6f               goto 136
	0x70 - 0x7a (11)   goto 23

	match 60


state 124
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x62 (2)    goto 23
	0x63               goto 137
	0x64 - 0x7a (23)   goto 23

	match 60


state 125
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x7a (26)   goto 23

	match 42


state 126
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x7a (26)   goto 23

	match 37


state 127
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x64 (4)    goto 23
	0x65               goto 138
	0x66 - 0x7a (21)   goto 23

	match 60


state 128
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x7a (26)   goto 23

	match 45


state 129
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x6d (13)   goto 23
	0x6e               goto 139
	0x6f - 0x7a (12)   goto 23

	match 60


state 130
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x64 (4)    goto 23
	0x65               goto 140
	0x66 - 0x7a (21)   goto 23

	match 60


state 131
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x7a (26)   goto 23

	match 53


state 132
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x7a (26)   goto 23

	match 49


state 133
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x73 (19)   goto 23
	0x74               goto 141
	0x75 - 0x7a (6)    goto 23

	match 60


state 134
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x6d (13)   goto 23
	0x6e               goto 142
	0x6f - 0x7a (12)   goto 23

	match 60


state 135
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x7a (26)   goto 23

	match 57


state 136
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x65 (5)    goto 23
	0x66               goto 143
	0x67 - 0x7a (20)   goto 23

	match 60


state 137
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x67 (7)    goto 23
	0x68               goto 144
	0x69 - 0x7a (18)   goto 23

	match 60


state 138
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x7a (26)   goto 23

	match 36


state 139
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x74 (20)   goto 23
	0x75               goto 145
	0x76 - 0x7a (5)    goto 23

	match 60


state 140
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x7a (26)   goto 23

	match 54


state 141
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x7a (26)   goto 23

	match 50


state 142
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x7a (26)   goto 23

	match 47


state 143
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x7a (26)   goto 23

	match 27


state 144
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x7a (26)   goto 23

	match 39


state 145
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x64 (4)    goto 23
	0x65               goto 146
	0x66 - 0x7a (21)   goto 23

	match 60


state 146
	0x30 - 0x39 (10)   goto 23
	0x41 - 0x5a (26)   goto 23
	0x5f               goto 23
	0x61 - 0x7a (26)   goto 23

	match 46


state 147
	match 4


state 148
	0x09 - 0x0a (2)    goto 5
	0x0d               goto 5
	0x20               goto 5
	0x22               goto 5

	match 4


state 149
	0x2f               goto 150

	match 4


state 150
	match 3


#############################################################################
# Summary
#############################################################################

2 start state(s)
61 expression(s), 150 state(s)


#############################################################################
# End of File
#############################################################################
