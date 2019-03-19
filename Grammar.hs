{-# OPTIONS_GHC -w #-}
module Grammar where
import Token
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.9

data HappyAbsSyn t6 t7 t8 t9
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 ([ Exp ])
	| HappyAbsSyn5 ([String])
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,157) ([17408,21,4,10888,2048,0,0,64,128,0,0,0,64,512,0,0,0,256,0,0,2,5444,1024,0,0,0,0,16384,8192,170,32,0,32768,0,64,0,2176,16480,0,0,1,8704,384,1,0,4,4096,85,16,0,0,8192,6146,16,0,0,1,0,8447,0,0,0,0,1024,8192,0,0,64,0,4096,3073,8,544,4120,0,0,4464,0,0,2,0,0,0,0,32,68,515,34816,1536,4,272,2060,0,0,64,1088,8240,0,0,8416,0,0,0,0,0,0,0,0,136,1030,4096,3073,8,544,4120,16384,12292,32,2176,16480,0,49169,128,0,0,32,0,1792,4097,85,16,0,7168,4,0,2104,0,28672,16,0,8416,0,49152,65,0,35712,0,0,0,2048,0,0,0,0,0,8192,8,0,4160,0,2,0,0,8192,0,0,4,0,4096,0,0,0,0,0,2,8,0,0,0,0,2,0,0,0,0,0,2048,8192,0,0,0,32768,8192,170,32,0,4,0,0,1024,20736,13,1,4,0,0,0,64,0,0,0,0,0,0,1,0,0,64,1088,8240,0,0,256,4352,32960,0,0,35712,0,0,128,0,11776,2,0,512,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseProg","Exps","VarList","Exp","Bools","FunctionDT","VarOps","int","var","fVar","string","copy","if","else","updateVar","inputArgs","appendHead","function","forEach","return","','","'f$'","'$'","'='","'=='","'<'","'>'","'<='","'>='","'+'","'-'","'*'","'('","')'","';'","'{'","'}'","'/'","%eof"]
        bit_start = st * 41
        bit_end = (st + 1) * 41
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..40]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (11) = happyShift action_3
action_0 (15) = happyShift action_4
action_0 (17) = happyShift action_5
action_0 (19) = happyShift action_6
action_0 (21) = happyShift action_7
action_0 (35) = happyShift action_8
action_0 (4) = happyGoto action_9
action_0 (6) = happyGoto action_10
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (11) = happyShift action_3
action_1 (15) = happyShift action_4
action_1 (17) = happyShift action_5
action_1 (19) = happyShift action_6
action_1 (21) = happyShift action_7
action_1 (35) = happyShift action_8
action_1 (6) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (37) = happyShift action_18
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (13) = happyShift action_17
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (35) = happyShift action_16
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (13) = happyShift action_15
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (35) = happyShift action_14
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (35) = happyShift action_13
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (11) = happyShift action_3
action_8 (15) = happyShift action_4
action_8 (17) = happyShift action_5
action_8 (19) = happyShift action_6
action_8 (21) = happyShift action_7
action_8 (35) = happyShift action_8
action_8 (6) = happyGoto action_12
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (41) = happyAccept
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (37) = happyShift action_11
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (11) = happyShift action_3
action_11 (15) = happyShift action_4
action_11 (17) = happyShift action_5
action_11 (19) = happyShift action_6
action_11 (21) = happyShift action_7
action_11 (35) = happyShift action_8
action_11 (4) = happyGoto action_19
action_11 (6) = happyGoto action_10
action_11 _ = happyReduce_2

action_12 (36) = happyShift action_31
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (18) = happyShift action_30
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (10) = happyShift action_23
action_14 (14) = happyShift action_24
action_14 (24) = happyShift action_25
action_14 (25) = happyShift action_26
action_14 (33) = happyShift action_27
action_14 (9) = happyGoto action_29
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (26) = happyShift action_28
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (10) = happyShift action_23
action_16 (14) = happyShift action_24
action_16 (24) = happyShift action_25
action_16 (25) = happyShift action_26
action_16 (33) = happyShift action_27
action_16 (7) = happyGoto action_21
action_16 (9) = happyGoto action_22
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (26) = happyShift action_20
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (11) = happyShift action_3
action_18 (15) = happyShift action_4
action_18 (17) = happyShift action_5
action_18 (19) = happyShift action_6
action_18 (21) = happyShift action_7
action_18 (35) = happyShift action_8
action_18 (4) = happyGoto action_19
action_18 (6) = happyGoto action_10
action_18 _ = happyFail (happyExpListPerState 18)

action_19 _ = happyReduce_1

action_20 (10) = happyShift action_23
action_20 (14) = happyShift action_24
action_20 (24) = happyShift action_25
action_20 (25) = happyShift action_26
action_20 (33) = happyShift action_27
action_20 (9) = happyGoto action_49
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (36) = happyShift action_48
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (27) = happyShift action_43
action_22 (28) = happyShift action_44
action_22 (29) = happyShift action_45
action_22 (30) = happyShift action_46
action_22 (31) = happyShift action_47
action_22 (32) = happyShift action_33
action_22 (33) = happyShift action_34
action_22 (34) = happyShift action_35
action_22 (40) = happyShift action_37
action_22 _ = happyFail (happyExpListPerState 22)

action_23 _ = happyReduce_21

action_24 (35) = happyShift action_42
action_24 _ = happyFail (happyExpListPerState 24)

action_25 (13) = happyShift action_41
action_25 _ = happyFail (happyExpListPerState 25)

action_26 (13) = happyShift action_40
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (10) = happyShift action_23
action_27 (14) = happyShift action_24
action_27 (24) = happyShift action_25
action_27 (25) = happyShift action_26
action_27 (33) = happyShift action_27
action_27 (9) = happyGoto action_39
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (10) = happyShift action_23
action_28 (14) = happyShift action_24
action_28 (24) = happyShift action_25
action_28 (25) = happyShift action_26
action_28 (33) = happyShift action_27
action_28 (9) = happyGoto action_38
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (32) = happyShift action_33
action_29 (33) = happyShift action_34
action_29 (34) = happyShift action_35
action_29 (36) = happyShift action_36
action_29 (40) = happyShift action_37
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (36) = happyShift action_32
action_30 _ = happyFail (happyExpListPerState 30)

action_31 _ = happyReduce_6

action_32 (38) = happyShift action_62
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (10) = happyShift action_23
action_33 (14) = happyShift action_24
action_33 (24) = happyShift action_25
action_33 (25) = happyShift action_26
action_33 (33) = happyShift action_27
action_33 (9) = happyGoto action_61
action_33 _ = happyFail (happyExpListPerState 33)

action_34 (10) = happyShift action_23
action_34 (14) = happyShift action_24
action_34 (24) = happyShift action_25
action_34 (25) = happyShift action_26
action_34 (33) = happyShift action_27
action_34 (9) = happyGoto action_60
action_34 _ = happyFail (happyExpListPerState 34)

action_35 (10) = happyShift action_23
action_35 (14) = happyShift action_24
action_35 (24) = happyShift action_25
action_35 (25) = happyShift action_26
action_35 (33) = happyShift action_27
action_35 (9) = happyGoto action_59
action_35 _ = happyFail (happyExpListPerState 35)

action_36 (35) = happyShift action_58
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (10) = happyShift action_23
action_37 (14) = happyShift action_24
action_37 (24) = happyShift action_25
action_37 (25) = happyShift action_26
action_37 (33) = happyShift action_27
action_37 (9) = happyGoto action_57
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (32) = happyShift action_33
action_38 (33) = happyShift action_34
action_38 (34) = happyShift action_35
action_38 (40) = happyShift action_37
action_38 _ = happyReduce_9

action_39 _ = happyReduce_26

action_40 _ = happyReduce_20

action_41 _ = happyReduce_19

action_42 (10) = happyShift action_23
action_42 (14) = happyShift action_24
action_42 (24) = happyShift action_25
action_42 (25) = happyShift action_26
action_42 (33) = happyShift action_27
action_42 (9) = happyGoto action_56
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (10) = happyShift action_23
action_43 (14) = happyShift action_24
action_43 (24) = happyShift action_25
action_43 (25) = happyShift action_26
action_43 (33) = happyShift action_27
action_43 (9) = happyGoto action_55
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (10) = happyShift action_23
action_44 (14) = happyShift action_24
action_44 (24) = happyShift action_25
action_44 (25) = happyShift action_26
action_44 (33) = happyShift action_27
action_44 (9) = happyGoto action_54
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (10) = happyShift action_23
action_45 (14) = happyShift action_24
action_45 (24) = happyShift action_25
action_45 (25) = happyShift action_26
action_45 (33) = happyShift action_27
action_45 (9) = happyGoto action_53
action_45 _ = happyFail (happyExpListPerState 45)

action_46 (10) = happyShift action_23
action_46 (14) = happyShift action_24
action_46 (24) = happyShift action_25
action_46 (25) = happyShift action_26
action_46 (33) = happyShift action_27
action_46 (9) = happyGoto action_52
action_46 _ = happyFail (happyExpListPerState 46)

action_47 (10) = happyShift action_23
action_47 (14) = happyShift action_24
action_47 (24) = happyShift action_25
action_47 (25) = happyShift action_26
action_47 (33) = happyShift action_27
action_47 (9) = happyGoto action_51
action_47 _ = happyFail (happyExpListPerState 47)

action_48 (38) = happyShift action_50
action_48 _ = happyFail (happyExpListPerState 48)

action_49 (32) = happyShift action_33
action_49 (33) = happyShift action_34
action_49 (34) = happyShift action_35
action_49 (40) = happyShift action_37
action_49 _ = happyReduce_5

action_50 (11) = happyShift action_3
action_50 (15) = happyShift action_4
action_50 (17) = happyShift action_5
action_50 (19) = happyShift action_6
action_50 (21) = happyShift action_7
action_50 (35) = happyShift action_8
action_50 (4) = happyGoto action_67
action_50 (6) = happyGoto action_10
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (32) = happyShift action_33
action_51 (33) = happyShift action_34
action_51 (34) = happyShift action_35
action_51 (40) = happyShift action_37
action_51 _ = happyReduce_15

action_52 (32) = happyShift action_33
action_52 (33) = happyShift action_34
action_52 (34) = happyShift action_35
action_52 (40) = happyShift action_37
action_52 _ = happyReduce_16

action_53 (32) = happyShift action_33
action_53 (33) = happyShift action_34
action_53 (34) = happyShift action_35
action_53 (40) = happyShift action_37
action_53 _ = happyReduce_13

action_54 (32) = happyShift action_33
action_54 (33) = happyShift action_34
action_54 (34) = happyShift action_35
action_54 (40) = happyShift action_37
action_54 _ = happyReduce_14

action_55 (32) = happyShift action_33
action_55 (33) = happyShift action_34
action_55 (34) = happyShift action_35
action_55 (40) = happyShift action_37
action_55 _ = happyReduce_12

action_56 (32) = happyShift action_33
action_56 (33) = happyShift action_34
action_56 (34) = happyShift action_35
action_56 (36) = happyShift action_66
action_56 (40) = happyShift action_37
action_56 _ = happyFail (happyExpListPerState 56)

action_57 _ = happyReduce_25

action_58 (18) = happyShift action_65
action_58 _ = happyFail (happyExpListPerState 58)

action_59 _ = happyReduce_24

action_60 (34) = happyShift action_35
action_60 (40) = happyShift action_37
action_60 _ = happyReduce_23

action_61 (34) = happyShift action_35
action_61 (40) = happyShift action_37
action_61 _ = happyReduce_22

action_62 (20) = happyShift action_64
action_62 (8) = happyGoto action_63
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (39) = happyShift action_71
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (35) = happyShift action_70
action_64 _ = happyFail (happyExpListPerState 64)

action_65 (36) = happyShift action_69
action_65 _ = happyFail (happyExpListPerState 65)

action_66 _ = happyReduce_27

action_67 (39) = happyShift action_68
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (16) = happyShift action_74
action_68 _ = happyReduce_7

action_69 _ = happyReduce_10

action_70 (12) = happyShift action_73
action_70 (5) = happyGoto action_72
action_70 _ = happyFail (happyExpListPerState 70)

action_71 _ = happyReduce_11

action_72 (36) = happyShift action_77
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (13) = happyShift action_76
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (38) = happyShift action_75
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (11) = happyShift action_3
action_75 (15) = happyShift action_4
action_75 (17) = happyShift action_5
action_75 (19) = happyShift action_6
action_75 (21) = happyShift action_7
action_75 (35) = happyShift action_8
action_75 (4) = happyGoto action_80
action_75 (6) = happyGoto action_10
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (23) = happyShift action_79
action_76 _ = happyReduce_4

action_77 (38) = happyShift action_78
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (11) = happyShift action_3
action_78 (15) = happyShift action_4
action_78 (17) = happyShift action_5
action_78 (19) = happyShift action_6
action_78 (21) = happyShift action_7
action_78 (22) = happyShift action_84
action_78 (35) = happyShift action_8
action_78 (4) = happyGoto action_83
action_78 (6) = happyGoto action_10
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (12) = happyShift action_73
action_79 (5) = happyGoto action_82
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (39) = happyShift action_81
action_80 _ = happyFail (happyExpListPerState 80)

action_81 _ = happyReduce_8

action_82 _ = happyReduce_3

action_83 (22) = happyShift action_86
action_83 _ = happyFail (happyExpListPerState 83)

action_84 (35) = happyShift action_85
action_84 _ = happyFail (happyExpListPerState 84)

action_85 (10) = happyShift action_23
action_85 (14) = happyShift action_24
action_85 (24) = happyShift action_25
action_85 (25) = happyShift action_26
action_85 (33) = happyShift action_27
action_85 (9) = happyGoto action_88
action_85 _ = happyFail (happyExpListPerState 85)

action_86 (35) = happyShift action_87
action_86 _ = happyFail (happyExpListPerState 86)

action_87 (10) = happyShift action_23
action_87 (14) = happyShift action_24
action_87 (24) = happyShift action_25
action_87 (25) = happyShift action_26
action_87 (33) = happyShift action_27
action_87 (9) = happyGoto action_90
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (32) = happyShift action_33
action_88 (33) = happyShift action_34
action_88 (34) = happyShift action_35
action_88 (36) = happyShift action_89
action_88 (40) = happyShift action_37
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (39) = happyShift action_92
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (32) = happyShift action_33
action_90 (33) = happyShift action_34
action_90 (34) = happyShift action_35
action_90 (36) = happyShift action_91
action_90 (40) = happyShift action_37
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (39) = happyShift action_93
action_91 _ = happyFail (happyExpListPerState 91)

action_92 _ = happyReduce_18

action_93 _ = happyReduce_17

happyReduce_1 = happySpecReduce_3  4 happyReduction_1
happyReduction_1 (HappyAbsSyn4  happy_var_3)
	_
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn4
		 (happy_var_1 : happy_var_3
	)
happyReduction_1 _ _ _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_2  4 happyReduction_2
happyReduction_2 _
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn4
		 ([happy_var_1]
	)
happyReduction_2 _ _  = notHappyAtAll 

happyReduce_3 = happyReduce 4 5 happyReduction_3
happyReduction_3 ((HappyAbsSyn5  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn5
		 (happy_var_2 : happy_var_4
	) `HappyStk` happyRest

happyReduce_4 = happySpecReduce_2  5 happyReduction_4
happyReduction_4 (HappyTerminal (TokenString _ happy_var_2))
	_
	 =  HappyAbsSyn5
		 ([happy_var_2]
	)
happyReduction_4 _ _  = notHappyAtAll 

happyReduce_5 = happyReduce 4 6 happyReduction_5
happyReduction_5 ((HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (InitVar happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_6 = happySpecReduce_3  6 happyReduction_6
happyReduction_6 _
	(HappyAbsSyn6  happy_var_2)
	_
	 =  HappyAbsSyn6
		 (happy_var_2
	)
happyReduction_6 _ _ _  = notHappyAtAll 

happyReduce_7 = happyReduce 7 6 happyReduction_7
happyReduction_7 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (IfThen happy_var_3 happy_var_6
	) `HappyStk` happyRest

happyReduce_8 = happyReduce 11 6 happyReduction_8
happyReduction_8 (_ `HappyStk`
	(HappyAbsSyn4  happy_var_10) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (IfElse happy_var_3 happy_var_6 happy_var_10
	) `HappyStk` happyRest

happyReduce_9 = happyReduce 4 6 happyReduction_9
happyReduction_9 ((HappyAbsSyn9  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString _ happy_var_2)) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (UpdateVar happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_10 = happyReduce 7 6 happyReduction_10
happyReduction_10 (_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (AppendHead happy_var_3
	) `HappyStk` happyRest

happyReduce_11 = happyReduce 7 6 happyReduction_11
happyReduction_11 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (ForEach happy_var_6
	) `HappyStk` happyRest

happyReduce_12 = happySpecReduce_3  7 happyReduction_12
happyReduction_12 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn7
		 (Equal happy_var_1 happy_var_3
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_3  7 happyReduction_13
happyReduction_13 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn7
		 (GreaterThan happy_var_1 happy_var_3
	)
happyReduction_13 _ _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  7 happyReduction_14
happyReduction_14 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn7
		 (LessThan happy_var_1 happy_var_3
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_3  7 happyReduction_15
happyReduction_15 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn7
		 (GtEq happy_var_1 happy_var_3
	)
happyReduction_15 _ _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_3  7 happyReduction_16
happyReduction_16 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn7
		 (LtEq happy_var_1 happy_var_3
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happyReduce 11 8 happyReduction_17
happyReduction_17 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_9) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Function happy_var_3 happy_var_6 happy_var_9
	) `HappyStk` happyRest

happyReduce_18 = happyReduce 10 8 happyReduction_18
happyReduction_18 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn9  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Function happy_var_3 [] happy_var_8
	) `HappyStk` happyRest

happyReduce_19 = happySpecReduce_2  9 happyReduction_19
happyReduction_19 (HappyTerminal (TokenString _ happy_var_2))
	_
	 =  HappyAbsSyn9
		 (FuncVar happy_var_2
	)
happyReduction_19 _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_2  9 happyReduction_20
happyReduction_20 (HappyTerminal (TokenString _ happy_var_2))
	_
	 =  HappyAbsSyn9
		 (CallVar happy_var_2
	)
happyReduction_20 _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_1  9 happyReduction_21
happyReduction_21 (HappyTerminal (TokenInt _ happy_var_1))
	 =  HappyAbsSyn9
		 (Int happy_var_1
	)
happyReduction_21 _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  9 happyReduction_22
happyReduction_22 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (Plus happy_var_1 happy_var_3
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  9 happyReduction_23
happyReduction_23 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (Minus happy_var_1 happy_var_3
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_3  9 happyReduction_24
happyReduction_24 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (Times happy_var_1 happy_var_3
	)
happyReduction_24 _ _ _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_3  9 happyReduction_25
happyReduction_25 (HappyAbsSyn9  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn9
		 (Divide happy_var_1 happy_var_3
	)
happyReduction_25 _ _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_2  9 happyReduction_26
happyReduction_26 (HappyAbsSyn9  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (Negate happy_var_2
	)
happyReduction_26 _ _  = notHappyAtAll 

happyReduce_27 = happyReduce 4 9 happyReduction_27
happyReduction_27 (_ `HappyStk`
	(HappyAbsSyn9  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (Copy happy_var_3
	) `HappyStk` happyRest

happyNewToken action sts stk [] =
	action 41 41 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenInt _ happy_dollar_dollar -> cont 10;
	TokenInitVar _ -> cont 11;
	TokenFVarInit _ -> cont 12;
	TokenString _ happy_dollar_dollar -> cont 13;
	TokenCopy _ -> cont 14;
	TokenIf _ -> cont 15;
	TokenElse _ -> cont 16;
	TokenUpdateVar _ -> cont 17;
	TokenInputArgs _ -> cont 18;
	TokenAppendHead _ -> cont 19;
	TokenFunction _ -> cont 20;
	TokenForEach _ -> cont 21;
	TokenReturn _ -> cont 22;
	TokenComma _ -> cont 23;
	TokenFVarCall _ -> cont 24;
	TokenVarCall _ -> cont 25;
	TokenEq _ -> cont 26;
	TokenCompEq _ -> cont 27;
	TokenCompLt _ -> cont 28;
	TokenCompGt _ -> cont 29;
	TokenCompLtEq _ -> cont 30;
	TokenCompGtEq _ -> cont 31;
	TokenPlus _ -> cont 32;
	TokenMinus _ -> cont 33;
	TokenTimes _ -> cont 34;
	TokenLParen _ -> cont 35;
	TokenRParen _ -> cont 36;
	TokenEndStmt _ -> cont 37;
	TokenLBracket _ -> cont 38;
	TokenRBracket _ -> cont 39;
	TokenDivide _ -> cont 40;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 41 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [String]) -> HappyIdentity a
happyError' = HappyIdentity . (\(tokens, _) -> parseError tokens)
parseProg tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a
parseError [] = error "Unknown Parse Error"
parseError (t:ts) = error ("Parse error at line:column " ++ (tokenPosn t))

data VarOps = FuncVar String
	    | CallVar String
	    | Int Int
	    | Plus VarOps VarOps
	    | Minus VarOps VarOps
            | Times VarOps VarOps
            | Divide VarOps VarOps
            | Negate VarOps
            | Copy VarOps
	    deriving Show

data Bools = Equal VarOps VarOps
	   | GreaterThan VarOps VarOps
	   | LessThan VarOps VarOps
	   | GtEq VarOps VarOps
	   | LtEq VarOps VarOps
	   deriving Show

data FunctionDT = Function [String] [Exp] VarOps deriving Show

data Exp = InitVar String VarOps
         | UpdateVar String VarOps
         | IfElse Bools [Exp] [Exp]
         | IfThen Bools [Exp]
         | AppendHead VarOps
         | ForEach FunctionDT
         deriving Show
{-# LINE 1 "templates/GenericTemplate.hs" #-}





































































































































































































-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 











data Happy_IntList = HappyCons Int Happy_IntList




















infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action




indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.

