NOMAINWIN

[Win001]
WindowWidth = 800 : WindowHeight = 600
UpperLeftX = 50 : UpperLeftY = 50
BackgroundColor$ = "lightgray"
Win001 = 1

MENU #Win001, "File", "Exit", [end_win]
MENU #Win001, "&Help", "HWE Testing Help", [help], "About...", [about]
STATICTEXT #Win001.Text001, "HARDY WEINBERG EQUILIBRIUM TESTING",                                                       WindowWidth/2-203, 20, 406, 30
STATICTEXT #Win001.Text002, "Copyright 2006-2018 by Fernando A. Bautzer Santos, Renan Barbosa Lemes and Paulo A. Otto", WindowWidth/2-230, 65, 450, 15
STATICTEXT #Win001.Text003, "Departamento de Genetica e Biologia Evolutiva, Universidade de Sao Paulo",                 WindowWidth/2-180, 80, 450, 15
STATICTEXT #Win001.Text004, "Caixa Postal (POBox) 11461 - 05422-970 Sao Paulo, SP, Brazil",                             WindowWidth/2-150, 95, 450, 15
STATICTEXT #Win001.Text005, "Correspondence to: otto@usp.br",                                                           WindowWidth/2-80, 110, 450, 15
STATICTEXT #Win001.Text002, "D = N(AA) =", WindowWidth/2+80, 255, 60, 30
STATICTEXT #Win001.Text002, "H = N(Aa) =", WindowWidth/2+80, 305, 60, 30
STATICTEXT #Win001.Text002, "R = N(aa) =", WindowWidth/2+80, 355, 60, 30
GROUPBOX #Win001.GroupBox001, "Statistical Tests", WindowWidth/2-330, 180, 290, 340
GROUPBOX #Win001.GroupBox002, "Genotype Data", WindowWidth/2+50, 190, 240, 240
CHECKBOX #Win001.CheckBox001, "Chi-square without correction", [win001_cb1_on], [win001_cb1_off], WindowWidth/2-310, 210, 240, 20
CHECKBOX #Win001.CheckBox002, "Chi-square with Yates' correction", [win001_cb2_on], [win001_cb2_off], WindowWidth/2-310, 240, 240, 20
CHECKBOX #Win001.CheckBox003, "Chi-square with Hogben/Levene correction", [win001_cb3_on], [win001_cb3_off], WindowWidth/2-310, 270, 240, 20
CHECKBOX #Win001.CheckBox004, "Chi-square with Cannings and Edwards correction", [win001_cb4_on], [win001_cb4_off], WindowWidth/2-310, 300, 260, 20
CHECKBOX #Win001.CheckBox005, "G or log-likelihood test without correction", [win001_cb5_on], [win001_cb5_off], WindowWidth/2-310, 330, 240, 20
CHECKBOX #Win001.CheckBox006, "log-likelihood test with cotinuity correction", [win001_cb6_on], [win001_cb6_off], WindowWidth/2-310, 360, 240, 20
CHECKBOX #Win001.CheckBox007, "Fisher's exact test", [win001_cb7_on], [win001_cb7_off], WindowWidth/2-310, 390, 240, 20
CHECKBOX #Win001.CheckBox008, "Haldane's exact test", [win001_cb8_on], [win001_cb8_off], WindowWidth/2-310, 420, 240, 20
CHECKBOX #Win001.CheckBox009, "Exact probability by simulation", [win001_cb9_on], [win001_cb9_off], WindowWidth/2-310, 450, 240, 20
TEXTBOX #Win001.TextBox001, WindowWidth/2+150, 250, 100, 25
TEXTBOX #Win001.TextBox002, WindowWidth/2+150, 300, 100, 25
TEXTBOX #Win001.TextBox003, WindowWidth/2+150, 350, 100, 25
BUTTON #Win001.Button001, "Select all", [win001_button001], UL, WindowWidth/2-310, 480, 240, 20
BUTTON #Win001.Button002, "Run", [Win002], UL, WindowWidth/2+150, 450

OPEN "Hardy Weinberg Equilibrium Test" FOR window_nf AS #Win001 ' "_nf" = window has no frame and cannot be resized by user
PRINT #Win001, "trapclose [end_win001]"
PRINT #Win001.Text001, "!font Arial 15"

[win0001_cb1_on]
PRINT #Win001.CheckBox001, "set"
tests = 1
WAIT
[win001_cb1_off]
PRINT #Win001.CheckBox001, "set"
WAIT
[win001_cb2_on]
tests = tests + 2
WAIT
[win001_cb2_off]
tests = tests - 2
WAIT
[win001_cb3_on]
tests = tests + 4
WAIT
[win001_cb3_off]
tests = tests - 4
WAIT
[win001_cb4_on]
tests = tests + 8
WAIT
[win001_cb4_off]
tests = tests - 8
WAIT
[win001_cb5_on]
tests = tests + 16
WAIT
[win001_cb5_off]
tests = tests - 16
WAIT
[win001_cb6_on]
tests = tests + 32
WAIT
[win001_cb6_off]
tests = tests - 32
WAIT
[win001_cb7_on]
tests = tests + 64
WAIT
[win001_cb7_off]
tests = tests - 64
WAIT
[win001_cb8_on]
tests = tests + 128
WAIT
[win001_cb8_off]
tests = tests - 128
WAIT
[win001_cb9_on]
tests = tests + 256
WAIT
[win001_cb9_off]
tests = tests - 256
WAIT

[win001_button001]
IF win001Button001 = 0 THEN
  PRINT #Win001.CheckBox002, "set" : PRINT #Win001.CheckBox003, "set" : PRINT #Win001.CheckBox004, "set"
  PRINT #Win001.CheckBox005, "set" : PRINT #Win001.CheckBox006, "set" : PRINT #Win001.CheckBox007, "set"
  PRINT #Win001.CheckBox008, "set" : PRINT #Win001.CheckBox009, "set"
  tests = 511
  win001Button001 = 1
  PRINT #Win001.Button001, "Unselect all"
 ELSE
  PRINT #Win001.CheckBox002, "reset" : PRINT #Win001.CheckBox003, "reset" : PRINT #Win001.CheckBox004, "reset"
  PRINT #Win001.CheckBox005, "reset" : PRINT #Win001.CheckBox006, "reset" : PRINT #Win001.CheckBox007, "reset"
  PRINT #Win001.CheckBox008, "reset" : PRINT #Win001.CheckBox009, "reset"
  tests = 1
  win001Button001 = 0
  PRINT #Win001.Button001, "Select all"
END IF
WAIT

[import_data_win001]
FILEDIALOG "Import data", "*.txt", FileName$
IF FileName$ = "" THEN
  NOTICE "No file chosen"
 ELSE
  OPEN FileName$ FOR INPUT AS #000
  FOR i = 1 TO 3
    INPUT #000, TempVar
    IF i = 1 THEN PRINT #Win001.TextBox001, TempVar
    IF i = 2 THEN PRINT #Win001.TextBox002, TempVar
    IF i = 3 THEN PRINT #Win001.TextBox003, TempVar
  NEXT i
  CLOSE #000
END IF
WAIT

[end_win001]
CONFIRM "Are you sure you want to quit?"; quit$
IF quit$ = "no" THEN WAIT
Win001 = 0
CLOSE #Win001
WAIT

[Win002]
WindowWidth = 800 : WindowHeight = 600
UpperLeftX = 50 : UpperLeftY = 50
BackgroundColor$ = "lightgray"

PRINT #Win001.TextBox001, "!contents? D$";
PRINT #Win001.TextBox002, "!contents? H$";
PRINT #Win001.TextBox003, "!contents? R$";

FOR i = 1 TO len(D$)
  D1$ = MID$(D$, i, 1)
  IF instr("0123456789", D1$) = 0 THEN
    NOTICE "The values you just entered are invalid. Please run the program again."
    WAIT
  END IF
NEXT i
FOR i = 1 TO len(H$)
  H1$ = MID$(H$, i, 1)
  IF instr("0123456789", H1$) = 0 THEN
    NOTICE "The values you just entered are invalid. Please run the program again."
    WAIT
  END IF
NEXT i
FOR i = 1 TO len(R$)
  R1$ = MID$(R$, i, 1)
  IF instr("0123456789", R1$) = 0 THEN
    NOTICE "The values you just entered are invalid. Please run the program again."
    WAIT
  END IF
NEXT i
D = val(D$) : H = val(H$) : R = val(R$)

EPS = 0.0000000000000000001
N = D + H + R : P = 2 * D + H : Q = H + 2 * R
IF N > 1000 THEN NOTICE "Maximum population size exceeded. Please run the program again." : WAIT

' Warnings
IF D < 0 OR H < 0 OR R < 0 OR P = 0 OR Q = 0 OR N < 3 THEN
  NOTICE "The values you just entered are invalid. Please run the program again."
  WAIT
END IF

Win002 = 1
TernaryPlot = 0
OPEN "Hardy-Weinberg Equilibrium Testing" FOR text AS #Win002
PRINT #Win002, "!trapclose [end_win002]"

' chi-squared test without correction
FOR i001 = 1 TO 511 STEP 2
  IF tests <> i001 THEN GOTO [notCH1]
  DE0 = P ^ 2 / (4 * N)
  HE0 = P * Q / (2 * N)
  RE0 = Q ^ 2 / (4 * N)
  CH(1) = N * (H * H - 4 * D * R) ^ 2 / (P * Q) ^ 2
  [notCH1]
NEXT i001

' chi-squared test with Yates' continuity correction
FOR i001 = 1 TO 511 STEP 2
  FOR j001 = 0 TO 1
    IF tests <> 2*i001 + j001 THEN GOTO [notCH2]
    CH(2) = N * (abs(H * H - 4 * D * R) - 2 * N) ^ 2 / (P * Q) ^ 2
    [notCH2]
  NEXT j001
NEXT i001

' chi-squared test with Levene/Hogben correction
FOR i001 = 1 TO 511 STEP 2
  FOR j001 = 0 TO 3
    IF tests <> 4*i001 + j001 THEN GOTO [notCH3]
    DE1 = P * (P - 1) / (2 * (2 * N - 1))
    HE1 = P * Q / (2 * N - 1)
    RE1 = Q * (Q - 1) / (2 * (2 * N - 1))
    IF DE1 = 0 THEN DE1 = EPS
    IF HE1 = 0 THEN HE1 = EPS
    IF RE1 = 0 THEN RE1 = EPS
    CH(3) = D ^ 2 / DE1 + H ^ 2 / HE1 + R ^ 2 / RE1 - N
    [notCH3]
  NEXT j001
NEXT i001

' chi-squared test with Cannings & Edwards correction
FOR i001 = 1 TO 511 STEP 2
  FOR j001 = 0 TO 7
    IF tests <> 8*i001 + j001 THEN GOTO [notCH4]
    DE2 = (P ^ 2 - H) / (4 * N)
    HE2 = (P * Q + H) / (2 * N)
    RE2 = (Q ^ 2 - H) / (4 * N)
    IF DE2 = 0 THEN DE2 = EPS
    IF HE2 = 0 THEN HE2 = EPS
    IF RE2 = 0 THEN RE2 = EPS
    CH(4) = D ^ 2 / DE2 + H ^ 2 / HE2 + R ^ 2 / RE2 - N
    [notCH4]
  NEXT j001
NEXT i001

' g-test (log-likelihood test)
FOR i001 = 1 TO 511 STEP 2
  FOR j001 = 0 TO 15
    IF tests <> 16*i001 + j001 THEN GOTO [notCH5]
    D1 = D
    H1 = H / 2
    R1 = R
    IF D1 = 0 THEN D1 = EPS
    IF H1 = 0 THEN H1 = EPS
    IF R1 = 0 THEN R1 = EPS
    GT01 = D1 * log(D1) + 2 * H1 * log(H1) + R1 * log(R1)
    GT01 = GT01 - 2 * (D1 + H1) * log(D1 + H1)
    GT01 = GT01 - 2 * (H1 + R1) * log(H1 + R1)
    GT01 = GT01 + N * log(N)
    CH(5) = GT01 * 2
    [notCH5]
  NEXT j001
NEXT i001

' g-test (log-likelihood test) with correction
FOR i001 = 1 TO 511 STEP 2
  FOR j001 = 0 TO 31
    IF tests <> 32*i001 + j001 THEN GOTO [notCH6]
    IF D1 * R1 < H1 * H1 THEN
      D1 = D1 + .5
      R1 = R1 + .5
      IF H1 >= 1 THEN H1 = H1 - .5
    ELSE
      IF D1 >= 1 THEN D1 = D1 - .5
      IF R1 >= 1 THEN R1 = R1 - .5
      H1 = H1 + .5
    END IF
    GT02 = D1 * log(D1) + 2 * H1 * log(H1) + R1 * log(R1)
    GT02 = GT02 - 2 * (D1 + H1) * log(D1 + H1)
    GT02 = GT02 - 2 * (H1 + R1) * log(H1 + R1)
    GT02 = GT02 + N * log(N)
    CH(6) = GT02 * 2
    [notCH6]
  NEXT j001
NEXT i001

' Obtaining P-values
FOR i = 1 TO 6
  IF CH(i) < EPS THEN
    PC(i) = 1
   ELSE
    v = 1 : w = abs(CH(i)) : GOSUB [CHISQDIS] : PC(i) = PCHI
  END IF
NEXT i

' Fisher exact test
FOR i001 = 1 TO 511 STEP 2
  FOR j001 = 0 TO 63
    FISHFLAG = 0
    IF tests <> 64*i001 + j001 THEN GOTO [notCH7]
    P1 = 0 : PR2 = 0 : PR3 = 0 : P99 = 0
    D99 = D : H99 = H : R99 = R : N99 = N
    IF (D = 0 AND H = 1) OR (R = 0 AND H = 1) THEN
      FISHFLAG = 1
      GOTO [EXACTTEST]
    END IF
    A = D99 : D = R99
    IF int(H99 / 2) = H99 / 2 THEN
      B = H99 / 2 : C = H99 / 2
     ELSE
      IF H > 1 THEN B = (H99 + 1) / 2 : C = (H99 - 1) / 2 ELSE B = 1: C = 0
    END IF
    E = A + C : F = B + D : G = A + B : H = C + D : N = G + H
    IF G > H THEN
      GTEMP = H : H = G : G = GTEMP
      ATEMP = C : C = A : A = ATEMP
      BTEMP = D : D = B : B = BTEMP
    END IF
    IF E > F THEN
      ETEMP = F : F = E : E = ETEMP
      ATEMP = B : B = A : A = ATEMP
      CTEMP = D : D = C : C = CTEMP
    END IF
    IF G > E THEN
      GTEMP = E : E = G : G = GTEMP
      FTEMP = H : H = F : F = FTEMP
      BTEMP = C : C = B : B = BTEMP
    END IF
    IF A > B THEN
      ATEMP = B : B = A : A = ATEMP
      CTEMP = D : D = C : C = CTEMP
      ETEMP = F : F = E : E = ETEMP
    END IF
    AD = A - E * G / N : DA = D - A
    I99 = A : GOSUB [FACTRL] : P1 = P99 : EPS = P1 / 10000
    IF P1 < .00000001 THEN P1 = 0 : PR2 = 0 : PR3 = 0 : GOTO [END_FISHER]
    IF AD = 0 THEN PR2 = (1 - P1) / 2 : PR3 = PR2 : GOTO [END_FISHER]
    FOR I99 = A - 1 TO 0 STEP -1 : GOSUB [FACTRL] : P2 = P99
      IF P1 > P2 THEN PR2 = PR2 + P2
      IF P2 < EPS THEN EXIT FOR
    NEXT I99
    FOR I99 = A + 1 TO G : GOSUB [FACTRL] : P3 = P99
      IF P1 > P3 THEN PR3 = PR3 + P3
      IF P3 < EPS THEN EXIT FOR
    NEXT I99
    [END_FISHER]
    PFISH = P1 + PR2 + PR3
    D = D99 : H = H99 : R = R99 : N = N99
    [notCH7]
  NEXT j001
NEXT i001

' Hardy-Weinberg exact test (Haldane)
[EXACTTEST]
FOR i001 = 1 TO 511 STEP 2
  FOR j001 = 0 TO 127
    IF tests <> 128*i001 + j001 THEN GOTO [notCH8]
    IF int(H / 2) = H / 2 THEN HMIN = 0 ELSE HMIN = 1
    IF D > R THEN HMAX = Q ELSE HMAX = P
    k = N : GOSUB [FACTORIAL] : NFAC = FACT
    k = 2 * N : GOSUB [FACTORIAL] : N2FAC = FACT
    k = P: GOSUB [FACTORIAL] : PFAC = FACT
    k = Q: GOSUB [FACTORIAL] : QFAC = FACT
    CONSTFAC = NFAC - N2FAC + PFAC + QFAC
    D1 = D : H1 = H : R1 = R : GOSUB [FACTOFDHR]
    PROB2 = CONSTFAC - DFAC - HFAC - RFAC + H * log(2) : PROB2 = exp(PROB2)
    PROBT = 0
    FOR H9 = HMIN TO HMAX STEP 2
      H1 = H9: D1 = (P - H1) / 2: R1 = (Q - H1) / 2
      GOSUB [FACTOFDHR] : PROB1 = CONSTFAC - DFAC - HFAC - RFAC + H1 * log(2)
      PROB1 = exp(PROB1) : IF PROB1 <= PROB2 THEN PROBT = PROBT + PROB1
    NEXT H9
    [notCH8]
  NEXT j001
NEXT i001

PRINT #Win002, ""
PRINT #Win002, "                       HARDY-WEINBERG TESTING"
PRINT #Win002, ""
PRINT #Win002, "                       Copyright 2015-2019 by"
PRINT #Win002, "   Fernando A. Bautzer Santos, Renan Barbosa Lemes & Paulo A. Otto"
PRINT #Win002, "            Departamento de Genetica e Biologia Evolutiva"
PRINT #Win002, "                     Universidade de Sao Paulo"
PRINT #Win002, "                    Caixa  Postal (POBox) 11461"
PRINT #Win002, "                   05422-970 Sao Paulo SP, Brazil"
PRINT #Win002, "                   otto@usp.br or lemes.rb.usp.br"
PRINT #Win002, ""
PRINT #Win002, "                                        AA         Aa         aa          N"
PRINT #Win002, "---------------------------------------------------------------------------"
PRINT #Win002, "obs. abs. frequencies                 ";
PRINT #Win002, using("####",D); : PRINT #Win002, "       ";
PRINT #Win002, using("####",H); : PRINT #Win002, "       ";
PRINT #Win002, using("####",R); : PRINT #Win002, "       ";
PRINT #Win002, using("####",N)
PRINT #Win002, "exp. abs .freq. (without correction)  ";
PRINT #Win002, using("####.###",DE0); : PRINT #Win002, "   ";
PRINT #Win002, using("####.###",HE0); : PRINT #Win002, "   ";
PRINT #Win002, using("####.###",RE0); : PRINT #Win002, "   ";
PRINT #Win002, using("####",N)
PRINT #Win002, "exp. abs. freq. (Hogben/Levene)       ";
PRINT #Win002, using("####.###",DE1); : PRINT #Win002, "   ";
PRINT #Win002, using("####.###",HE1); : PRINT #Win002, "   ";
PRINT #Win002, using("####.###",RE1); : PRINT #Win002, "   ";
PRINT #Win002, using("####",N)
PRINT #Win002, "exp. abs. freq. (Cannings & Edwards)  ";
PRINT #Win002, using("####.###",DE2); : PRINT #Win002, "   ";
PRINT #Win002, using("####.###",HE2); : PRINT #Win002, "   ";
PRINT #Win002, using("####.###",RE2); : PRINT #Win002, "   ";
PRINT #Win002, using("####",N)
PRINT #Win002, "---------------------------------------------------------------------------"
PRINT #Win002, "obs. rel. frequencies                 ";
PRINT #Win002, using("####.###",D/N); : PRINT #Win002, "   ";
PRINT #Win002, using("####.###",H/N); : PRINT #Win002, "   ";
PRINT #Win002, using("####.###",R/N); : PRINT #Win002, "   ";
PRINT #Win002, "   -"
PRINT #Win002, "exp. rel .freq. (without correction)  ";
PRINT #Win002, using("####.###",DE0/N); : PRINT #Win002, "   ";
PRINT #Win002, using("####.###",HE0/N); : PRINT #Win002, "   ";
PRINT #Win002, using("####.###",RE0/N); : PRINT #Win002, "   ";
PRINT #Win002, "   -"
PRINT #Win002, "exp. rel. freq. (Hogben/Levene)       ";
PRINT #Win002, using("####.###",DE1/N); : PRINT #Win002, "   ";
PRINT #Win002, using("####.###",HE1/N); : PRINT #Win002, "   ";
PRINT #Win002, using("####.###",RE1/N); : PRINT #Win002, "   ";
PRINT #Win002, "   -"
PRINT #Win002, "exp. rel. freq. (Cannings & Edwards)  ";
PRINT #Win002, using("####.###",DE2/N); : PRINT #Win002, "   ";
PRINT #Win002, using("####.###",HE2/N); : PRINT #Win002, "   ";
PRINT #Win002, using("####.###",RE2/N); : PRINT #Win002, "   ";
PRINT #Win002, "   -"
PRINT #Win002, "---------------------------------------------------------------------------"
PRINT #Win002, ""
P = P / (2 * N) : Q = Q / (2 * N) : SEPQ1 = sqr(P * Q / (2 * N))
SEPQ2 = sqr((P + D / N - 2 * P * P) / (2 * N))
PRINT #Win002, "p = P(A) = "; : PRINT #Win002, using("###.####", P)
PRINT #Win002, "q = P(a) = "; : PRINT #Win002, using("###.####", Q)
PRINT #Win002, "H0:{d,h,r}        s.e.(p) = s.e.(q) = "; : PRINT #Win002, using("###.####", SEPQ2)
PRINT #Win002, "Ha:{p^2,2pq,q^2}  s.e.(p) = s.e.(q) = "; : PRINT #Win002, using("###.####", SEPQ1)
PRINT #Win002, ""

FOR i001 = 1 TO 511 STEP 2
  IF tests <> i001 THEN GOTO [notCH1_2]
  PRINT #Win002, "P(chi-squared test without correction)  ";
  IF PC(1) >= 10^(-4) THEN
    PRINT #Win002, " = "; : PRINT #Win002, using("#.####", PC(1))
  ELSE
    IF PC(1) >= 10^(-5) THEN
      PRINT #Win002, " < 10^-4"
    ELSE
      IF PC(1) >= 10^(-6) THEN
        PRINT #Win002, " < 10^-5"
      ELSE
        PRINT #Win002, " < 10^-6"
      END IF
    END IF
  END IF
  [notCH1_2]
NEXT i001
FOR i001 = 1 TO 511 STEP 2
  FOR j001 = 0 TO 1
    IF tests <> 2*i001 + j001 THEN GOTO [notCH2_2]
    PRINT #Win002, "P(chi-sq. test with Yates' correction)  ";
    IF PC(2) >= 10^(-4) THEN
      PRINT #Win002, " = "; : PRINT #Win002, using("#.####", PC(2))
    ELSE
      IF PC(2) >= 10^(-5) THEN
        PRINT #Win002, " < 10^-4"
      ELSE
        IF PC(2) >= 10^(-6) THEN
          PRINT #Win002, " < 10^-5"
        ELSE
          PRINT #Win002, " < 10^-6"
        END IF
      END IF
    END IF
    [notCH2_2]
  NEXT j001
NEXT i001
FOR i001 = 1 TO 511 STEP 2
  FOR j001 = 0 TO 3
    IF tests <> 4*i001 + j001 THEN GOTO [notCH3_2]
    PRINT #Win002, "P(c.s. test w/ Hogben/Levene correct.)  ";
    IF PC(3) >= 10^(-4) THEN
      PRINT #Win002, " = "; : PRINT #Win002, using("#.####", PC(3))
    ELSE
      IF PC(3) >= 10^(-5) THEN
        PRINT #Win002, " < 10^-4"
      ELSE
        IF PC(3) >= 10^(-6) THEN
          PRINT #Win002, " < 10^-5"
        ELSE
          PRINT #Win002, " < 10^-6"
        END IF
      END IF
    END IF
    [notCH3_2]
  NEXT j001
NEXT i001
FOR i001 = 1 TO 511 STEP 2
  FOR j001 = 0 TO 7
    IF tests <> 8*i001 + j001 THEN GOTO [notCH4_2]
    PRINT #Win002, "P(c.s. test w/ Cannings & Edwards corr.)";
    IF PC(4) >= 10^(-4) THEN
      PRINT #Win002, " = "; : PRINT #Win002, using("#.####", PC(4))
    ELSE
      IF PC(4) >= 10^(-5) THEN
        PRINT #Win002, " < 10^-4"
      ELSE
        IF PC(4) >= 10^(-6) THEN
          PRINT #Win002, " < 10^-5"
        ELSE
          PRINT #Win002, " < 10^-6"
        END IF
      END IF
    END IF
    [notCH4_2]
  NEXT j001
NEXT i001
FOR i001 = 1 TO 511 STEP 2
  FOR j001 = 0 TO 15
    IF tests <> 16*i001 + j001 THEN GOTO [notCH5_2]
    PRINT #Win002, "P(G or log-likelihood test without cor.)";
    IF PC(5) >= 10^(-4) THEN
      PRINT #Win002, " = "; : PRINT #Win002, using("#.####", PC(5))
    ELSE
      IF PC(5) >= 10^(-5) THEN
        PRINT #Win002, " < 10^-4"
      ELSE
        IF PC(5) >= 10^(-6) THEN
          PRINT #Win002, " < 10^-5"
        ELSE
          PRINT #Win002, " < 10^-6"
        END IF
      END IF
    END IF
    [notCH5_2]
  NEXT j001
NEXT i001
FOR i001 = 1 TO 511 STEP 2
  FOR j001 = 0 TO 31
    IF tests <> 32*i001 + j001 THEN GOTO [notCH6_2]
    PRINT #Win002, "P(log-likelih. test w/ continuity corr.)";
    IF PC(6) >= 10^(-4) THEN
      PRINT #Win002, " = "; : PRINT #Win002, using("#.####", PC(6))
    ELSE
      IF PC(6) >= 10^(-5) THEN
        PRINT #Win002, " < 10^-4"
      ELSE
        IF PC(6) >= 10^(-6) THEN
          PRINT #Win002, " < 10^-5"
        ELSE
          PRINT #Win002, " < 10^-6"
        END IF
      END IF
    END IF
    [notCH6_2]
  NEXT j001
NEXT i001
FOR i001 = 1 TO 511 STEP 2
  FOR j001 = 0 TO 63
    IF tests <> 64*i001 + j001 THEN GOTO [notCH7_2]
    IF FISHFLAG = 1 THEN
      PRINT #Win002, "P(Fisher's exact test)                   =    -"
     ELSE
      PRINT #Win002, "P(Fisher's exact test)                  ";
      IF PFISH >= 10^(-4) THEN
        PRINT #Win002, " = "; : PRINT #Win002, using("#.####", PFISH)
      ELSE
        IF PFISH >= 10^(-5) THEN
          PRINT #Win002, " < 10^-4"
        ELSE
          IF PFISH >= 10^(-6) THEN
            PRINT #Win002, " < 10^-5"
          ELSE
            PRINT #Win002, " < 10^-6"
          END IF
        END IF
      END IF
    END IF
    [notCH7_2]
  NEXT j001
NEXT i001
FOR i001 = 1 TO 511 STEP 2
  FOR j001 = 0 TO 127
    IF tests <> 128*i001 + j001 THEN GOTO [notCH8_2]
    PRINT #Win002, "P(Haldane's exact test)                 ";
    IF PROBT >= 10^(-4) THEN
      PRINT #Win002, " = "; : PRINT #Win002, using("#.####", PROBT)
    ELSE
      IF PROBT >= 10^(-5) THEN
        PRINT #Win002, " < 10^-4"
      ELSE
        IF PROBT >= 10^(-6) THEN
          PRINT #Win002, " < 10^-5"
        ELSE
          PRINT #Win002, " < 10^-6"
        END IF
      END IF
    END IF
    [notCH8_2]
  NEXT j001
NEXT i001

IF tests < 256 THEN GOTO [notCH9]
' Exact test (1000 bootstrap simulations)
T = 1000 : PROBT = 0
DIM OD(T), OH(T), ED(T), EH(T)
' Estimating exact probability of the sample
P = 2*D + H : Q = H + 2*R : P0 = P / (2*N) : P1 = P : Q1 = Q
ExpD = P0^2 : ExpH = 2*P0*(1-P0) : ExpR = (1-P0)^2
D1 = D : H1 = H : R1 = R
k = N :     GOSUB [FACTORIAL] : NFAC  = FACT
k = 2 * N : GOSUB [FACTORIAL] : N2FAC = FACT
CONSTFAC = NFAC - N2FAC : D1 = D : H1 = H : R1 = R : GOSUB [FACTPQDHR]
PROB2 = exp(CONSTFAC + PFAC + QFAC - DFAC - HFAC - RFAC + H1 * log(2))

PTOT = 0 : D1TOT = 0 : H1TOT = 0 : R1TOT = 0 : OD1TOT = 0 : OH1TOT = 0 : OR1TOT = 0
FOR i = 1 TO T
  R1 = 0 : D1 = 0 : H1 = 0 : OD1 = 0 : OH1 = 0 : OR1 = 0
  FOR INDIV = 1 TO N
    ' Obtaining D and H from simulation of expected frequencies (exact test and ternary plot)
    A = rnd(1)
    IF A <= ExpD THEN
      D1 = D1 + 1
     ELSE
      IF A >= ExpD + ExpH THEN
        R1 = R1 + 1
       ELSE
        H1 = H1 + 1
      END IF
    END IF

    IF A <= D/N THEN
      OD1 = OD1 + 1
     ELSE
      IF A > D/N AND A <= (D+H)/N THEN
        OH1 = OH1 + 1
       ELSE
        OR1 = OR1 + 1
      END IF
    END IF
  NEXT INDIV
  ' Comparing exact probability from simulation with the one from the sample
  P1 = 2 * D1 + H1 : Q1 = H1 + 2 * R1
  D1TOT = D1TOT + D1 : H1TOT = H1TOT + H1 : R1TOT = R1TOT + R1
  PTOT = PTOT + P1 / (2 * N)
  GOSUB [FACTPQDHR]
  PROB1 = EXP(CONSTFAC + PFAC + QFAC - DFAC - HFAC - RFAC + H1 * LOG(2))
  IF PROB1 <= PROB2 THEN PROBT = PROBT + 1
  OD1TOT = OD1TOT + OD1 : OH1TOT = OH1TOT + OH1 : OR1TOT = OR1TOT + OR1
  ' Saving variables to make the ternary plot
  OD(i) = OD1 : OH(i) = OH1 : ED(i) = D1 : EH(i) = H1
NEXT i

PRINT #Win002, "" : PRINT #Win002, "'EXACT' BOOTSTRAP (1000 SIMULATIONS) ESTIMATES" : PRINT #Win002, ""
PRINT #Win002, "OBS. SAMPLE p = P(A)  = (2D+H)/2N        = "; : PRINT #Win002, using("#.####", P0)
PRINT #Win002, "BOOTSTRAP EST. p                         = "; : PRINT #Win002, using("#.####", PTOT/T)
PRINT #Win002, ""
PRINT #Win002, "EXACT PROBABILITY (1000 SIMUL.)         ";
IF PROBT/T >= 10^(-4) THEN
  PRINT #Win002, " = "; : PRINT #Win002, using("#.####", PROBT/T)
ELSE
  IF PROBT/T >= 10^(-5) THEN
    PRINT #Win002, " < 10^-4"
  ELSE
    IF PROBT/T >= 10^(-6) THEN
      PRINT #Win002, " < 10^-5"
    ELSE
      PRINT #Win002, " < 10^-6"
    END IF
  END IF
END IF

DIM P(T), H88(25)
PRINT #Win002, ""
PRINT #Win002, "               normal approximation            bootstrap (1000 simul.)"
PRINT #Win002, "genotype      calc.P         95% C.I.        meanP  med.P      95% C.I."
PRINT #Win002, "-------------------------------------------------------------------------"
PRINT #Win002, "   AA       obs. "; : PRINT #Win002, using ("#.###", D/N);
TempVar = D/N - 1.96 * sqr(D/N * (1 - D/N) / N) : IF TempVar < 0 THEN TempVar = 0
PRINT #Win002, "    {"; : PRINT #Win002, using ("#.###", TempVar); : PRINT #Win002, ",";
TempVar = D/N + 1.96 * sqr(D/N * (1 - D/N) / N) : IF TempVar > 1 THEN TempVar = 1
PRINT #Win002, using("#.###", TempVar); : PRINT #Win002, "}    ";
FOR i = 1 TO T : P(i) = OD(i)/N : NEXT i
GOSUB [SORTVALUES]
PRINT #Win002, using("###.###", OD1TOT/(T*N)); : PRINT #Win002, using("###.###", (P(500)+P(501))/2);
PRINT #Win002, "   {"; : PRINT #Win002, using("#.###", P(26)); : PRINT #Win002, ",";
PRINT #Win002, using("#.###", P(975)); : PRINT #Win002, "}"
PRINT #Win002, "            exp. "; : PRINT #Win002, using("#.###", ExpD);
TempVar = ExpD - 1.96 * sqr(4*P0^3 * (1-P0) / (2*N)) : IF TempVar < 0 THEN TempVar = 0
PRINT #Win002, "    {"; : PRINT #Win002, using("#.###", TempVar); : PRINT #Win002, ",";
TempVar = ExpD + 1.96 * sqr(4*P0^3 * (1-P0) / (2*N)) : IF TempVar > 1 THEN TempVar = 1
PRINT #Win002, using("#.###", TempVar); : PRINT #Win002, "}    ";
FOR i = 1 TO T : P(i) = ED(i)/N : NEXT i
GOSUB [SORTVALUES]
PRINT #Win002, using("###.###", D1TOT/(T*N)); : PRINT #Win002, using("###.###", (P(500)+P(501))/2);
PRINT #Win002, "   {"; : PRINT #Win002, using("#.###", P(26)); : PRINT #Win002, ",";
PRINT #Win002, using("#.###", P(975)); : PRINT #Win002, "}"
PRINT #Win002, "   Aa       obs. "; : PRINT #Win002, using ("#.###", H/N);
TempVar = H/N - 1.96 * sqr(H/N * (1 - H/N) / N) : IF TempVar < 0 THEN TempVar = 0
PRINT #Win002, "    {"; : PRINT #Win002, using ("#.###", TempVar); : PRINT #Win002, ",";
TempVar = H/N + 1.96 * sqr(H/N * (1 - H/N) / N) : IF TempVar > 1 THEN TempVar = 1
PRINT #Win002, using("#.###", TempVar); : PRINT #Win002, "}    ";
FOR i = 1 TO T : P(i) = OH(i)/N : NEXT i
GOSUB [SORTVALUES]
PRINT #Win002, using("###.###", OH1TOT/(T*N)); : PRINT #Win002, using("###.###", (P(500)+P(501))/2);
PRINT #Win002, "   {"; : PRINT #Win002, using("#.###", P(26)); : PRINT #Win002, ",";
PRINT #Win002, using("#.###", P(975)); : PRINT #Win002, "}"
PRINT #Win002, "            exp. "; : PRINT #Win002, using("#.###", ExpH);
TempVar = ExpH - 1.96 * sqr(4*P0*(1-P0) * (P0 + (1-P0) - 4*P0*(1-P0)) / (2*N)) : IF TempVar < 0 THEN TempVar = 0
PRINT #Win002, "    {"; : PRINT #Win002, using("#.###", TempVar); : PRINT #Win002, ",";
TempVar = ExpH + 1.96 * sqr(4*P0*(1-P0) * (P0 + (1-P0) - 4*P0*(1-P0)) / (2*N)) : IF TempVar > 1 THEN TempVar = 1
PRINT #Win002, using("#.###", TempVar); : PRINT #Win002, "}    ";
FOR i = 1 TO T : P(i) = EH(i)/N : NEXT i
GOSUB [SORTVALUES]
PRINT #Win002, using("###.###", H1TOT/(T*N)); : PRINT #Win002, using("###.###", (P(500)+P(501))/2);
PRINT #Win002, "   {"; : PRINT #Win002, using("#.###", P(26)); : PRINT #Win002, ",";
PRINT #Win002, using("#.###", P(975)); : PRINT #Win002, "}"
PRINT #Win002, "   aa       obs. "; : PRINT #Win002, using ("#.###", R/N);
TempVar = R/N - 1.96 * sqr(R/N * (1 - R/N) / N) : IF TempVar < 0 THEN TempVar = 0
PRINT #Win002, "    {"; : PRINT #Win002, using ("#.###", TempVar); : PRINT #Win002, ",";
TempVar = R/N + 1.96 * sqr(R/N * (1 - R/N) / N) : IF TempVar > 1 THEN TempVar = 1
PRINT #Win002, using("#.###", TempVar); : PRINT #Win002, "}    ";
FOR i = 1 TO T : P(i) = (N - (OD(i) + OH(i)))/N : NEXT i
GOSUB [SORTVALUES]
PRINT #Win002, using("###.###", OR1TOT/(T*N)); : PRINT #Win002, using("###.###", (P(500)+P(501))/2);
PRINT #Win002, "   {"; : PRINT #Win002, using("#.###", P(26)); : PRINT #Win002, ",";
PRINT #Win002, using("#.###", P(975)); : PRINT #Win002, "}"
PRINT #Win002, "            exp. "; : PRINT #Win002, using("#.###", ExpR);
TempVar = ExpR - 1.96 * sqr(4*(1-P0)^3 * P0 / (2*N)) : IF TempVar < 0 THEN TempVar = 0
PRINT #Win002, "    {"; : PRINT #Win002, using("#.###", TempVar); : PRINT #Win002, ",";
TempVar = ExpR + 1.96 * sqr(4*(1-P0)^3 * P0 / (2*N)) : IF TempVar > 1 THEN TempVar = 1
PRINT #Win002, using("#.###", TempVar); : PRINT #Win002, "}    ";
FOR i = 1 TO T : P(i) = (N - (ED(i) + EH(i)))/N : NEXT i
GOSUB [SORTVALUES]
PRINT #Win002, using("###.###", R1TOT/(T*N)); : PRINT #Win002, using("###.###", (P(500)+P(501))/2);
PRINT #Win002, "   {"; : PRINT #Win002, using("#.###", P(26)); : PRINT #Win002, ",";
PRINT #Win002, using("#.###", P(975)); : PRINT #Win002, "}"
PRINT #Win002, "-------------------------------------------------------------------------"
TernaryPlot = 1
[notCH9]

IF TernaryPlot = 1 THEN GOTO [Win004]
WAIT

[end_win002]
CONFIRM "Are you sure you want to quit?"; quit$
IF quit$ = "no" THEN WAIT
Win002 = 0
CLOSE #Win002
WAIT

[Win004]
SIZE = DisplayHeight * .6
WindowWidth  = DisplayHeight * .8
WindowHeight = DisplayHeight * .8
UpperLeftX = DisplayWidth * .2 : UpperLeftY = 10

MENU #Win004, "&File", "Save As...", [saveAs_win004], "Exit", [end_win004]
OPEN "Hardy Weinberg Equilibrium Test" FOR graphics_nsb_nf AS #Win004 ' "_nsb" = no scrollbars; "_nf" = window has no frame and cannot be resized by user
PRINT #Win004, "trapclose [end_win004]"

CritChisq = 5.9915 ' Critical Chi-sqared value for alpha = 0.05 (2 degree of freedom)

' Ternary plot
#Win004, "place "+str$(SIZE*.85+50)+" 50 ; down; goto "+str$(SIZE*.7+50)+" "+str$(SIZE*.3+50)
#Win004, "place "+str$(SIZE*.85+50)+" 50 ; down; goto "+str$(SIZE+50)+" "+str$(SIZE*.3+50)
#Win004, "place "+str$(SIZE*.7+50)+" "+str$(SIZE*.3+50)+" ; down; goto "+str$(SIZE+50)+" "+str$(SIZE*.3+50)
#Win004, "place "+str$(SIZE*.82+50)+" "+str$(SIZE*.18+50)+"; circle 2"
#Win004, "place "+str$(SIZE*.82+50)+" "+str$(SIZE*.19+50)+" ; down; goto "+str$(SIZE*.82+50)+" "+str$(SIZE*.3+50)
#Win004, "place "+str$(SIZE*.76+50)+" "+str$(SIZE*.18+50)+" ; down; goto "+str$(SIZE*.81+50)+" "+str$(SIZE*.18+50)
#Win004, "place "+str$(SIZE*.83+50)+" "+str$(SIZE*.18+50)+" ; down; goto "+str$(SIZE*.94+50)+" "+str$(SIZE*.18+50)
#Win004, "down; place "+str$(SIZE*.815+50)+" "+str$(SIZE*.25+50) : #Win004, "|h"
#Win004, "down; place "+str$(SIZE*.78+50)+" "+str$(SIZE*.185+50) : #Win004, "|d"
#Win004, "down; place "+str$(SIZE*.88+50)+" "+str$(SIZE*.185+50) : #Win004, "|r"
#Win004, "down; place "+str$(SIZE*.75+50)+" "+str$(SIZE*.305+50) : #Win004, "|p"
#Win004, "down; place "+str$(SIZE*.9+50) +" "+str$(SIZE*.305+50) : #Win004, "|q"

#Win004 "place "+str$(SIZE/2+50)+" 50 ; down; goto 50 "+str$(SIZE+50)
#Win004 "place "+str$(SIZE/2+50)+" 50 ; down; goto "+str$(SIZE+50)+" "+str$(SIZE+50)
#Win004 "place 50 "+str$(SIZE+50)+" ; down; goto "+str$(SIZE+50)+" "+str$(SIZE+50)

#Win004 "place 40 50 ; down; goto 40 "+str$(SIZE+50)
FOR i = 0 TO 20 : #Win004 "place 35 "+str$(SIZE*i/20+50)+" ; down; goto 40 "+str$(SIZE*i/20+50) : NEXT i
#Win004, "down; place 12 55" : #Win004, "|1.0"
#Win004, "down; place 12 "+str$(SIZE+55) : #Win004, "|0.0"
#Win004 "place 50 "+str$(SIZE+60)+" ; down; goto "+str$(SIZE+50)+" "+str$(SIZE+60)
FOR i = 0 TO 20 : #Win004 "place "+str$(SIZE*i/20+50)+" "+str$(SIZE+60)+" ; down; goto "+str$(SIZE*i/20+50)+" "+str$(SIZE+65) : NEXT i
#Win004, "down; place 42 "+str$(SIZE+80) : #Win004, "|0.0"
#Win004, "down; place "+str$(SIZE+42)+" "+str$(SIZE+80) : #Win004, "|1.0"

' Plotting parabolas
FOR i = 1 TO SIZE
  X1 = 50 + i
  pGraph = i/SIZE
  hGraph = 2*pGraph*(1-pGraph)
  Y1 = (50 + SIZE) - SIZE*hGraph
  #Win004 "set "+str$(X1)+" "+str$(Y1)+""
NEXT i
' Bottom limit
FOR i = 1 TO SIZE
  X1 = 50 + i
  pGraph = i/SIZE
  FGraph = (CritChisq/N)^(1/2)
  hGraph = 2*pGraph*(1-pGraph)*(1-FGraph)
  Y1 = (50 + SIZE) - SIZE*hGraph
  IF N > CritChisq THEN #Win004 "set "+str$(X1)+" "+str$(Y1)+""
NEXT i
' Upper limit
FOR i = 1 TO SIZE
  X1 = 50 + i
  pGraph = i/SIZE
  FGraph = 0-(CritChisq/N)^(1/2)
  hGraph = 2*pGraph*(1-pGraph)*(1-FGraph)
  Y1 = (50 + SIZE) - SIZE*hGraph
  IF  FGraph*(1-pGraph) >= 0-pGraph AND FGraph*pGraph >= pGraph-1 THEN #Win004 "set "+str$(X1)+" "+str$(Y1)+""
NEXT i

' Plotting points (expected and observed)
DIM X(2*T) , Y(2*T)
j = 0
FOR i = 1 TO T
  j = j + 1
  X(j) = 50 + SIZE*((ED(i) + EH(i)/2)/N) : Y(j) = (50+SIZE) - SIZE*(EH(i)/N)
  #Win004 "place "+str$(X(j))+" "+str$(Y(j))+"; color red; backcolor red; circlefilled 2"
  j = j + 1
  X(j) = 50 + SIZE*((OD(i) + OH(i)/2)/N) : Y(j) = (50+SIZE) - SIZE*(OH(i)/N)
  #Win004 "place "+str$(X(j))+" "+str$(Y(j))+"; color black; backcolor black; circlefilled 2"
NEXT i
XC = 50 + SIZE*((D + H/2)/N) : YC1 = (50+SIZE) - SIZE*(H/N) : YC2 = (50+SIZE) - SIZE*(ExpH)
#Win004 "set "+str$(XC)+" "+str$(YC1)+"; color black; backcolor blue; circlefilled 4"
#Win004 "set "+str$(XC)+" "+str$(YC2)+"; color black; backcolor blue; circlefilled 4"

' Plotting parabolas
FOR i = 1 TO SIZE
  X1 = 50 + i
  pGraph = i/SIZE
  hGraph = 2*pGraph*(1-pGraph)
  Y1 = (50 + SIZE) - SIZE*hGraph
  #Win004 "set "+str$(X1)+" "+str$(Y1)+""
NEXT i
' Bottom limit
FOR i = 1 TO SIZE
  X1 = 50 + i
  pGraph = i/SIZE
  FGraph = (CritChisq/N)^(1/2)
  hGraph = 2*pGraph*(1-pGraph)*(1-FGraph)
  Y1 = (50 + SIZE) - SIZE*hGraph
  IF N > CritChisq THEN #Win004 "set "+str$(X1)+" "+str$(Y1)+""
NEXT i
' Upper limit
FOR i = 1 TO SIZE
  X1 = 50 + i
  pGraph = i/SIZE
  FGraph = 0-(CritChisq/N)^(1/2)
  hGraph = 2*pGraph*(1-pGraph)*(1-FGraph)
  Y1 = (50 + SIZE) - SIZE*hGraph
  IF  FGraph*(1-pGraph) >= 0-pGraph AND FGraph*pGraph >= pGraph-1 THEN #Win004 "set "+str$(X1)+" "+str$(Y1)+""
NEXT i

PRINT #Win004, "flush"
WAIT

[saveAs_win004]
PRINT #Win004, "getbmp TernaryPlot 0 0 "+str$(SIZE+100)+" "+str$(SIZE+100)
FILEDIALOG "Save As... ", "*.bmp", savefile$
IF savefile$ = "" THEN
  NOTICE "No filename specified. File NOT saved!"
  WAIT
END IF
BMPSAVE "TernaryPlot", savefile$
NOTICE "Ternary plot saved as ";savefile$
WAIT

[end_win004]
CONFIRM "Are you sure you want to quit?"; quit$
IF quit$ = "no" THEN WAIT
Win004 = 0
CLOSE #Win004
WAIT

' SUBROUTINES

[CHISQDIS]
  R9 = 1: FOR I9 = v TO 2 STEP -2: R9 = R9 * I9: NEXT I9
  K9 = w ^ (INT((v + 1) / 2)) / EXP(w / 2) / R9
  IF INT(v / 2) = v / 2 THEN 2400
  J9 = SQR(2 / w / 3.141592653599)
  GOTO 2500
2400 J9 = 1
2500 L9 = 1: M9 = 1
2700 v = v + 2: M9 = M9 * w / v
  IF M9 < .0000001 THEN 3300
  L9 = L9 + M9: GOTO 2700
3300
PCHI = 1 - J9 * K9 * L9
RETURN

[FACTRL]
P99 = 1
FOR I6 = 1 TO I99
  P99 = P99 * (G + I6 - I99) / (F + I6)
NEXT I6
FOR I6 = I99 + 1 TO E
  P99 = P99 * (1 - G / (F + I6)) / (1 - I99 / I6)
NEXT I6
RETURN

[FACTORIAL]
FACT = 0
FOR j = 1 TO k
  FACT = FACT + log(j)
NEXT j
RETURN

[FACTPQDHR]
k = P1: GOSUB [FACTORIAL] : PFAC = FACT
k = Q1: GOSUB [FACTORIAL] : QFAC = FACT
[FACTOFDHR]
k = D1: GOSUB [FACTORIAL] : DFAC = FACT
k = H1: GOSUB [FACTORIAL] : HFAC = FACT
k = R1: GOSUB [FACTORIAL] : RFAC = FACT
RETURN

[SORTVALUES]
D88 = 10: K88 = 1: L88 = 1: R88 = T
[560] ' EXCHANGE SORT IF BLOCKSIZE <= D88
    IF R88 - L88 + 1 > D88 THEN [590]
    GOSUB [900]: GOTO [780]
[590] I88 = L88: J88 = R88: W88 = RND(1) * (R88 - L88) + .5
    W88 = int(W88 + L88): F88 = P(W88)
    ' PARTITION PHASE
[620] IF P(I88) >= F88 THEN [640]
    I88 = I88 + 1:  GOTO [620]
[640] IF P(J88) <= F88 THEN [660]
    J88 = J88 - 1:  GOTO [640]
[660] IF I88 > J88 THEN [680]
    W88 = P(I88): P(I88) = P(J88): P(J88) = W88: I88 = I88 + 1: J88 = J88 - 1
[680] IF I88 <= J88 THEN [620]
    ' BOOKKEEPING PHASE
    IF J88 - L88 >= R88 - I88 THEN [740]
    IF I88 >= R88 THEN [730]
    H88(K88) = I88: K88 = K88 + 1: H88(K88) = R88: K88 = K88 + 1
[730] R88 = J88:  GOTO [770]
[740] IF L88 >= J88 THEN [760]
    H88(K88) = L88: K88 = K88 + 1: H88(K88) = J88: K88 = K88 + 1
[760] L88 = I88
[770] IF L88 < R88 THEN [590]
[780] IF K88 <= 1 THEN [800]
    K88 = K88 - 1: R88 = H88(K88): K88 = K88 - 1: L88 = H88(K88): GOTO [560]
[800] RETURN
[900] ' EXCHANGE SORT
    FOR I88 = L88 TO R88 - 1: K1 = I88
    FOR J88 = I88 + 1 TO R88: IF P(J88) >= P(K1) THEN [940]
    K1 = J88
[940] NEXT J88
    IF K1 = I88 THEN [970]
    W88 = P(I88): P(I88) = P(K1): P(K1) = W88
[970] NEXT I88
RETURN

