{-# OPTIONS_GHC -w #-}
module Grammar where
import Token
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.9

data HappyAbsSyn t6 t7 t8
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 ([ Exp ])
	| HappyAbsSyn5 ([String])
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,134) ([41472,4106,4096,32853,0,0,16,16,0,43552,256,1024,0,0,16384,0,0,2,2722,16,0,0,0,4096,17408,8213,0,0,2,128,0,1092,19,0,32,0,32768,0,2048,32768,680,4,0,0,4368,76,20736,2053,17408,4868,0,49152,69,0,0,0,128,0,0,4096,0,32768,0,32768,24712,2,0,128,0,0,0,32768,0,0,0,0,0,0,0,4368,76,34944,608,17408,4868,8192,38946,0,0,16,2184,38,0,33664,0,0,2,57344,32,32,0,0,0,8192,0,0,0,0,16384,16,0,130,0,1116,16384,0,0,32768,0,16384,0,0,0,0,32,0,1024,43136,1026,0,0,16384,0,0,0,0,0,128,256,0,0,0,1,0,0,2048,0,0,256,43552,257,512,0,0,0,0,512,0,0,16,2184,38,0,1024,8704,2434,0,57344,34,0,128,0,2232,0,8192,0,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parseProg","Exps","VarList","Exp","FunctionDT","VarOps","int","var","fVar","string","copy","if","else","updateVar","inputArgs","appendHead","function","forEach","return","','","'f$'","'$'","'='","'+'","'-'","'*'","'('","')'","';'","'{'","'}'","'/'","%eof"]
        bit_start = st * 35
        bit_end = (st + 1) * 35
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..34]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (10) = happyShift action_3
action_0 (14) = happyShift action_4
action_0 (16) = happyShift action_5
action_0 (18) = happyShift action_6
action_0 (20) = happyShift action_7
action_0 (29) = happyShift action_8
action_0 (4) = happyGoto action_9
action_0 (6) = happyGoto action_10
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (10) = happyShift action_3
action_1 (14) = happyShift action_4
action_1 (16) = happyShift action_5
action_1 (18) = happyShift action_6
action_1 (20) = happyShift action_7
action_1 (29) = happyShift action_8
action_1 (6) = happyGoto action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (31) = happyShift action_18
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (12) = happyShift action_17
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (10) = happyShift action_3
action_4 (14) = happyShift action_4
action_4 (16) = happyShift action_5
action_4 (18) = happyShift action_6
action_4 (20) = happyShift action_7
action_4 (29) = happyShift action_8
action_4 (6) = happyGoto action_16
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (12) = happyShift action_15
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (29) = happyShift action_14
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (29) = happyShift action_13
action_7 _ = happyFail (happyExpListPerState 7)

action_8 (10) = happyShift action_3
action_8 (14) = happyShift action_4
action_8 (16) = happyShift action_5
action_8 (18) = happyShift action_6
action_8 (20) = happyShift action_7
action_8 (29) = happyShift action_8
action_8 (6) = happyGoto action_12
action_8 _ = happyFail (happyExpListPerState 8)

action_9 (35) = happyAccept
action_9 _ = happyFail (happyExpListPerState 9)

action_10 (31) = happyShift action_11
action_10 _ = happyFail (happyExpListPerState 10)

action_11 (10) = happyShift action_3
action_11 (14) = happyShift action_4
action_11 (16) = happyShift action_5
action_11 (18) = happyShift action_6
action_11 (20) = happyShift action_7
action_11 (29) = happyShift action_8
action_11 (4) = happyGoto action_19
action_11 (6) = happyGoto action_10
action_11 _ = happyReduce_2

action_12 (30) = happyShift action_31
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (17) = happyShift action_30
action_13 _ = happyFail (happyExpListPerState 13)

action_14 (9) = happyShift action_24
action_14 (13) = happyShift action_25
action_14 (17) = happyShift action_26
action_14 (23) = happyShift action_27
action_14 (24) = happyShift action_28
action_14 (27) = happyShift action_29
action_14 (8) = happyGoto action_23
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (25) = happyShift action_22
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (32) = happyShift action_21
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (25) = happyShift action_20
action_17 _ = happyFail (happyExpListPerState 17)

action_18 (10) = happyShift action_3
action_18 (14) = happyShift action_4
action_18 (16) = happyShift action_5
action_18 (18) = happyShift action_6
action_18 (20) = happyShift action_7
action_18 (29) = happyShift action_8
action_18 (4) = happyGoto action_19
action_18 (6) = happyGoto action_10
action_18 _ = happyFail (happyExpListPerState 18)

action_19 _ = happyReduce_1

action_20 (9) = happyShift action_24
action_20 (13) = happyShift action_25
action_20 (17) = happyShift action_26
action_20 (23) = happyShift action_27
action_20 (24) = happyShift action_28
action_20 (27) = happyShift action_29
action_20 (8) = happyGoto action_44
action_20 _ = happyFail (happyExpListPerState 20)

action_21 (10) = happyShift action_3
action_21 (14) = happyShift action_4
action_21 (16) = happyShift action_5
action_21 (18) = happyShift action_6
action_21 (20) = happyShift action_7
action_21 (29) = happyShift action_8
action_21 (6) = happyGoto action_43
action_21 _ = happyFail (happyExpListPerState 21)

action_22 (9) = happyShift action_24
action_22 (13) = happyShift action_25
action_22 (17) = happyShift action_26
action_22 (23) = happyShift action_27
action_22 (24) = happyShift action_28
action_22 (27) = happyShift action_29
action_22 (8) = happyGoto action_42
action_22 _ = happyFail (happyExpListPerState 22)

action_23 (26) = happyShift action_37
action_23 (27) = happyShift action_38
action_23 (28) = happyShift action_39
action_23 (30) = happyShift action_40
action_23 (34) = happyShift action_41
action_23 _ = happyFail (happyExpListPerState 23)

action_24 _ = happyReduce_16

action_25 (29) = happyShift action_36
action_25 _ = happyFail (happyExpListPerState 25)

action_26 _ = happyReduce_17

action_27 (12) = happyShift action_35
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (12) = happyShift action_34
action_28 _ = happyFail (happyExpListPerState 28)

action_29 (9) = happyShift action_24
action_29 (13) = happyShift action_25
action_29 (17) = happyShift action_26
action_29 (23) = happyShift action_27
action_29 (24) = happyShift action_28
action_29 (27) = happyShift action_29
action_29 (8) = happyGoto action_33
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (30) = happyShift action_32
action_30 _ = happyFail (happyExpListPerState 30)

action_31 _ = happyReduce_6

action_32 (32) = happyShift action_52
action_32 _ = happyFail (happyExpListPerState 32)

action_33 _ = happyReduce_22

action_34 _ = happyReduce_15

action_35 _ = happyReduce_14

action_36 (9) = happyShift action_24
action_36 (13) = happyShift action_25
action_36 (17) = happyShift action_26
action_36 (23) = happyShift action_27
action_36 (24) = happyShift action_28
action_36 (27) = happyShift action_29
action_36 (8) = happyGoto action_51
action_36 _ = happyFail (happyExpListPerState 36)

action_37 (9) = happyShift action_24
action_37 (13) = happyShift action_25
action_37 (17) = happyShift action_26
action_37 (23) = happyShift action_27
action_37 (24) = happyShift action_28
action_37 (27) = happyShift action_29
action_37 (8) = happyGoto action_50
action_37 _ = happyFail (happyExpListPerState 37)

action_38 (9) = happyShift action_24
action_38 (13) = happyShift action_25
action_38 (17) = happyShift action_26
action_38 (23) = happyShift action_27
action_38 (24) = happyShift action_28
action_38 (27) = happyShift action_29
action_38 (8) = happyGoto action_49
action_38 _ = happyFail (happyExpListPerState 38)

action_39 (9) = happyShift action_24
action_39 (13) = happyShift action_25
action_39 (17) = happyShift action_26
action_39 (23) = happyShift action_27
action_39 (24) = happyShift action_28
action_39 (27) = happyShift action_29
action_39 (8) = happyGoto action_48
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (29) = happyShift action_47
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (9) = happyShift action_24
action_41 (13) = happyShift action_25
action_41 (17) = happyShift action_26
action_41 (23) = happyShift action_27
action_41 (24) = happyShift action_28
action_41 (27) = happyShift action_29
action_41 (8) = happyGoto action_46
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (26) = happyShift action_37
action_42 (27) = happyShift action_38
action_42 (28) = happyShift action_39
action_42 (34) = happyShift action_41
action_42 _ = happyReduce_9

action_43 (33) = happyShift action_45
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (26) = happyShift action_37
action_44 (27) = happyShift action_38
action_44 (28) = happyShift action_39
action_44 (34) = happyShift action_41
action_44 _ = happyReduce_5

action_45 (15) = happyShift action_57
action_45 _ = happyReduce_7

action_46 _ = happyReduce_21

action_47 (17) = happyShift action_56
action_47 _ = happyFail (happyExpListPerState 47)

action_48 _ = happyReduce_20

action_49 (28) = happyShift action_39
action_49 (34) = happyShift action_41
action_49 _ = happyReduce_19

action_50 (28) = happyShift action_39
action_50 (34) = happyShift action_41
action_50 _ = happyReduce_18

action_51 (26) = happyShift action_37
action_51 (27) = happyShift action_38
action_51 (28) = happyShift action_39
action_51 (30) = happyShift action_55
action_51 (34) = happyShift action_41
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (19) = happyShift action_54
action_52 (7) = happyGoto action_53
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (33) = happyShift action_61
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (29) = happyShift action_60
action_54 _ = happyFail (happyExpListPerState 54)

action_55 _ = happyReduce_23

action_56 (30) = happyShift action_59
action_56 _ = happyFail (happyExpListPerState 56)

action_57 (32) = happyShift action_58
action_57 _ = happyFail (happyExpListPerState 57)

action_58 (10) = happyShift action_3
action_58 (14) = happyShift action_4
action_58 (16) = happyShift action_5
action_58 (18) = happyShift action_6
action_58 (20) = happyShift action_7
action_58 (29) = happyShift action_8
action_58 (6) = happyGoto action_64
action_58 _ = happyFail (happyExpListPerState 58)

action_59 _ = happyReduce_10

action_60 (11) = happyShift action_63
action_60 (5) = happyGoto action_62
action_60 _ = happyFail (happyExpListPerState 60)

action_61 _ = happyReduce_11

action_62 (30) = happyShift action_67
action_62 _ = happyFail (happyExpListPerState 62)

action_63 (12) = happyShift action_66
action_63 _ = happyFail (happyExpListPerState 63)

action_64 (33) = happyShift action_65
action_64 _ = happyFail (happyExpListPerState 64)

action_65 _ = happyReduce_8

action_66 (22) = happyShift action_69
action_66 _ = happyReduce_4

action_67 (32) = happyShift action_68
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (10) = happyShift action_3
action_68 (14) = happyShift action_4
action_68 (16) = happyShift action_5
action_68 (18) = happyShift action_6
action_68 (20) = happyShift action_7
action_68 (21) = happyShift action_72
action_68 (29) = happyShift action_8
action_68 (4) = happyGoto action_71
action_68 (6) = happyGoto action_10
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (11) = happyShift action_63
action_69 (5) = happyGoto action_70
action_69 _ = happyFail (happyExpListPerState 69)

action_70 _ = happyReduce_3

action_71 (21) = happyShift action_74
action_71 _ = happyFail (happyExpListPerState 71)

action_72 (29) = happyShift action_73
action_72 _ = happyFail (happyExpListPerState 72)

action_73 (9) = happyShift action_24
action_73 (13) = happyShift action_25
action_73 (17) = happyShift action_26
action_73 (23) = happyShift action_27
action_73 (24) = happyShift action_28
action_73 (27) = happyShift action_29
action_73 (8) = happyGoto action_76
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (29) = happyShift action_75
action_74 _ = happyFail (happyExpListPerState 74)

action_75 (9) = happyShift action_24
action_75 (13) = happyShift action_25
action_75 (17) = happyShift action_26
action_75 (23) = happyShift action_27
action_75 (24) = happyShift action_28
action_75 (27) = happyShift action_29
action_75 (8) = happyGoto action_78
action_75 _ = happyFail (happyExpListPerState 75)

action_76 (26) = happyShift action_37
action_76 (27) = happyShift action_38
action_76 (28) = happyShift action_39
action_76 (30) = happyShift action_77
action_76 (34) = happyShift action_41
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (33) = happyShift action_80
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (26) = happyShift action_37
action_78 (27) = happyShift action_38
action_78 (28) = happyShift action_39
action_78 (30) = happyShift action_79
action_78 (34) = happyShift action_41
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (33) = happyShift action_81
action_79 _ = happyFail (happyExpListPerState 79)

action_80 _ = happyReduce_13

action_81 _ = happyReduce_12

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
happyReduction_5 ((HappyAbsSyn8  happy_var_4) `HappyStk`
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

happyReduce_7 = happyReduce 5 6 happyReduction_7
happyReduction_7 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (IfThen happy_var_2 happy_var_4
	) `HappyStk` happyRest

happyReduce_8 = happyReduce 9 6 happyReduction_8
happyReduction_8 (_ `HappyStk`
	(HappyAbsSyn6  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn6  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (IfElse happy_var_2 happy_var_4 happy_var_8
	) `HappyStk` happyRest

happyReduce_9 = happyReduce 4 6 happyReduction_9
happyReduction_9 ((HappyAbsSyn8  happy_var_4) `HappyStk`
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
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (AppendHead happy_var_3
	) `HappyStk` happyRest

happyReduce_11 = happyReduce 7 6 happyReduction_11
happyReduction_11 (_ `HappyStk`
	(HappyAbsSyn7  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (ForEach happy_var_6
	) `HappyStk` happyRest

happyReduce_12 = happyReduce 11 7 happyReduction_12
happyReduction_12 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_9) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Function happy_var_3 happy_var_6 happy_var_9
	) `HappyStk` happyRest

happyReduce_13 = happyReduce 10 7 happyReduction_13
happyReduction_13 (_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_8) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (Function happy_var_3 [] happy_var_8
	) `HappyStk` happyRest

happyReduce_14 = happySpecReduce_2  8 happyReduction_14
happyReduction_14 (HappyTerminal (TokenString _ happy_var_2))
	_
	 =  HappyAbsSyn8
		 (FuncVar happy_var_2
	)
happyReduction_14 _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_2  8 happyReduction_15
happyReduction_15 (HappyTerminal (TokenString _ happy_var_2))
	_
	 =  HappyAbsSyn8
		 (CallVar happy_var_2
	)
happyReduction_15 _ _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_1  8 happyReduction_16
happyReduction_16 (HappyTerminal (TokenInt _ happy_var_1))
	 =  HappyAbsSyn8
		 (Int happy_var_1
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_1  8 happyReduction_17
happyReduction_17 _
	 =  HappyAbsSyn8
		 (InputArgs
	)

happyReduce_18 = happySpecReduce_3  8 happyReduction_18
happyReduction_18 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (Plus happy_var_1 happy_var_3
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  8 happyReduction_19
happyReduction_19 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (Minus happy_var_1 happy_var_3
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  8 happyReduction_20
happyReduction_20 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (Times happy_var_1 happy_var_3
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  8 happyReduction_21
happyReduction_21 (HappyAbsSyn8  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (Divide happy_var_1 happy_var_3
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_2  8 happyReduction_22
happyReduction_22 (HappyAbsSyn8  happy_var_2)
	_
	 =  HappyAbsSyn8
		 (Negate happy_var_2
	)
happyReduction_22 _ _  = notHappyAtAll 

happyReduce_23 = happyReduce 4 8 happyReduction_23
happyReduction_23 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn8
		 (Copy happy_var_3
	) `HappyStk` happyRest

happyNewToken action sts stk [] =
	action 35 35 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenInt _ happy_dollar_dollar -> cont 9;
	TokenInitVar _ -> cont 10;
	TokenFVarInit _ -> cont 11;
	TokenString _ happy_dollar_dollar -> cont 12;
	TokenCopy _ -> cont 13;
	TokenIf _ -> cont 14;
	TokenElse _ -> cont 15;
	TokenUpdateVar _ -> cont 16;
	TokenInputArgs _ -> cont 17;
	TokenAppendHead _ -> cont 18;
	TokenFunction _ -> cont 19;
	TokenForEach _ -> cont 20;
	TokenReturn _ -> cont 21;
	TokenComma _ -> cont 22;
	TokenFVarCall _ -> cont 23;
	TokenVarCall _ -> cont 24;
	TokenEq _ -> cont 25;
	TokenPlus _ -> cont 26;
	TokenMinus _ -> cont 27;
	TokenTimes _ -> cont 28;
	TokenLParen _ -> cont 29;
	TokenRParen _ -> cont 30;
	TokenEndStmt _ -> cont 31;
	TokenLBracket _ -> cont 32;
	TokenRBracket _ -> cont 33;
	TokenDivide _ -> cont 34;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 35 tk tks = happyError' (tks, explist)
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
            | InputArgs
	    deriving Show

data FunctionDT = Function [String] [Exp] VarOps deriving Show

data Exp = InitVar String VarOps
         | UpdateVar String VarOps
         | IfElse Exp Exp Exp
         | IfThen Exp Exp
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

