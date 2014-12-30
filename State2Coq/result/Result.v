Definition g0 : guard := BAnd(BLe(AMult(APlus(AId  a)(AId  b))(AId  c))(ANum  1))(BGt(APlus(AId  c)(AId  d))(ANum   10)).
Definition g1 : guard := BGt(APlus(AId  a)(AId  b))(ANum  3).
Definition g2 : guard := BGt(APlus(AId  a)(AId  b))(ANum  3).
Definition g3 : guard := BLe(APlus(AId  a)(AId  b))(ANum  12).

Definition t3: trans := ("t3", 2, nil, "eid", g0, "eerror" :: nil, nil, 3, none).
Definition t2: trans := ("t2", 3, nil, "ecmd", g1, nil, nil, 2, shallow).
Definition t1: trans := ("t1", 0, nil, "eid", g2, nil, nil, 1, none).
Definition t4: trans := ("t4", 2, ("Spwd" :: nil), "epwd", g3, "eloginsucc" :: nil, nil, 3, none).
Definition t5: trans := ("t5", 5, nil, "eid", BTrue, nil, nil, 6, none).

Definition n0 : sc := basic_sc "Sid" (nil, nil).
Definition n1 : sc := basic_sc "Spwd" (nil, nil).
Definition n2 : sc := or_sc "Sident" (n0 :: n1 :: nil) 0 (t1 :: nil) (nil, "exlogin" :: nil).
Definition n3 : sc := basic_sc "SCmd" ("encmd" :: nil, nil).
Definition n4 : sc := or_sc "Sexecute" (n2 :: n3 :: nil) 0 (t3 :: t2 :: t4 :: nil) (nil, nil).
Definition n5 : sc := basic_sc "Lwait" (nil, nil).
Definition n6 : sc := basic_sc "Lwrite" (nil, nil).
Definition n7 : sc := or_sc "SLog" (n5 :: n6 :: nil) 0 (t5 :: nil) (nil, nil).
Definition n8 : sc := and_sc "Sserver" (n4 :: n7 :: nil) (nil, nil).
