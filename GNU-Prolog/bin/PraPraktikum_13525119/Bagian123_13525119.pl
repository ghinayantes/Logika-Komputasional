/* Bagian <I> */
/* Deklarasi Fakta */

/* a. pria(X) */
pria(loid).
pria(karma).
pria(levi).
pria(todoroki).
pria(william).
pria(razi).
pria(chopper).
pria(faqih).
pria(owen).
pria(zoro).
pria(fathur).

/* b. wanita(X) */
wanita(yor).
wanita(adinda).
wanita(kawakaze).
wanita(reze).
wanita(umaru).
wanita(karina).
wanita(tsunade).
wanita(ariana).
wanita(nezuko).
wanita(anya).

/* c. usia(X, Y) */
usia(loid, 135).
usia(yor, 132).
usia(faqih, 109).
usia(karina, 97).
usia(karma, 79).
usia(todoroki, 72).
usia(levi, 69).
usia(adinda, 67).
usia(owen, 64).
usia(zoro, 57).
usia(ariana, 52).
usia(tsunade, 46).
usia(william, 45).
usia(razi, 42).
usia(kawakaze, 37).
usia(reze, 35).
usia(umaru, 16).
usia(nezuko, 11).
usia(chopper, 8).
usia(anya, 7).
usia(fathur, 3).

/* d. menikah(X,Y) */
menikah(loid, yor).
menikah(yor, loid).

menikah(todoroki, adinda).
menikah(adinda, todoroki).
menikah(levi, adinda).
menikah(adinda, levi).

menikah(william, kawakaze).
menikah(kawakaze, william).

menikah(razi, reze).
menikah(reze, razi).

menikah(faqih, karina).
menikah(karina, faqih).

menikah(owen, tsunade).
menikah(tsunade, owen).

menikah(zoro, ariana).
menikah(ariana, zoro).

/* e. anak(X, Y) */
anak(karma, loid).
anak(karma, yor).

anak(adinda, loid).
anak(adinda, yor).

anak(william, todoroki).
anak(william, adinda).

anak(razi, levi).
anak(razi, adinda).

anak(umaru, william).
anak(umaru, kawakaze).

anak(chopper, razi).
anak(chopper, reze).

anak(owen, faqih).
anak(owen, karina).

anak(ariana, faqih).
anak(ariana, karina).

anak(nezuko, owen).
anak(nezuko, tsunade).

anak(fathur, owen).
anak(fathur, tsunade).

anak(anya, zoro).
anak(anya, ariana).

/* Deklarasi Rules */

/* a. saudara(X, Y) */
saudara(X, Y):-
    anak(X, _Z),
    anak(Y, _Z),
    X \== Y.

/* b. saudaratiri(X, Y) */
saudaratiri(X, Y):-
    anak(X, _U),
    anak(X, _V),
    anak(Y, _V),
    anak(Y, _W),
    menikah(_U, _V),
    menikah(_V, _W),
    X \== Y, _U \== _W.

/* c. sepupu(X, Y) */
sepupu(X, Y):-
    saudara(_V, _W),
    anak(X, _V),
    anak(Y, _W),
    X \== Y.

/* d. kakak(X, Y) */
kakak(X, Y):-
    saudara(X,Y),
    usia(X, _V),
    usia(Y, _W),
    _V > _W, X \== Y.

/* e. keponakan(X, Y) */
keponakan(X, Y):- 
    saudara(_Z, Y),
    anak(X, _Z),
    X \== Y.

/* f. mertua(X, Y) */
mertua(X, Y):-
    menikah(Y, _W),
    anak(_W, X),
    X \== Y.

/* g. nenek(X, Y) */
nenek(X, Y):-
    anak(_Z, X),
    anak(Y, _Z),
    wanita(X),
    X \== Y, X \== Z, Y \== Z.

/* h. keturunan(X, Y) */
keturunan(X, Y):-
    anak(X, Y), X \== Y.
keturunan(X, Y):-
    anak(_Z, Y),
    anak(X, _Z),
    X \== Y, Y \== _Z, X \== _Z.
keturunan(X, Y):-
    anak(_W, Y),
    anak(_V, _W),
    anak(X, _V),
    X \== Y, _V \== _W, _V \== Y, 
    X \== _V, X \== _W, Y \== _W.

/* i. lajang(X) */
lajang(X):-
    pria(X),
    \+ menikah(X, _Y).
lajang(X):-
    wanita(X),
    \+ menikah(X, _Y).

/* j. anakbungsu(X) */
anakbungsu(X):- 
    saudara(X, _Y),
    usia(X, _V),
    usia(_Y, _W),
    _V < _W, X \== _Y.
anakbungsu(X):-
    pria(X),
    \+ saudara(X, _),
    anak(X, _).
anakbungsu(X):-
    wanita(X),
    \+ saudara(X, _),
    anak(X, _).

/* k. anaksulung(X) */
anaksulung(X):-
    saudara(X, _Y),
    usia(X, _V),
    usia(_Y, _W),
    _V > _W, X \== _Y.
anaksulung(X):-
    (pria(X); wanita(X)),
    \+ saudara(X, _),
    anak(X, _).

/* l. anaktunggal(X) */
anaktunggal(X):-
    (pria(X); wanita(X)),
    anak(X, _Y),
    \+ saudara(X, _).


/* m. yatimpiatu(X) */
yatimpiatu(X):- 
    (pria(X); wanita(X)),
    \+ anak(X, _Y),
    X \== _Y.


/* Bagian <II> */
/* Deklarasi Fakta */
/* Base Case 1*/
sumToN(0, 0).

/* Deklarasi Rules */
/* Recursive 1*/
sumToN(N, X) :-
    N > 0,              
    _N1 is N - 1,       
    sumToN(_N1, _X1),     
    X is N + _X1.


/* penanganan khusus jika input N = 0 */
/* Base Case 2 */
countDigits(0, 1):-!.  
/* Recursive 2*/
countDigits(N, X):-
    N > 0,
    helperCount(N, X).

/* Deklarasi Fakta */
/* Base Case Helper*/
helperCount(0, 0).
/* Recursive Helper*/
helperCount(N, X):-
    N > 0,
    _N1 is N // 10,
    helperCount(_N1, _X1),
    X is 1 + _X1.

/* Recursive Helper */
reverseNum(N, Rev):-
    reverseHelper(N, 0, Rev).

/* Deklarasi Fakta */
/* Base Case Helper */
reverseHelper(0, X, X).
/* Recursive Helper */
reverseHelper(N, X, Rev):-
    N > 0,
    _Digit is N mod 10,
    _NewX is (X * 10) + _Digit,
    _NextN is N // 10,
    reverseHelper(_NextN, _NewX, Rev).

/* Rules Helper */
isPalindrom(N):-
    reverseNum(N, N).

/* Deklarasi Fakta */
/* Base Case 3*/
palSteps(N, 0):-    
    isPalindrom(N), !.

/* Recursive 3 */
palSteps(N, X):-
    reverseNum(N, _Rev),
    _NewN is N + _Rev,
    palSteps(_NewN, _X1),
    X is _X1 + 1.

/* Deklarasi Fakta */
/* Base Case Helper */
power(_N, 0, 1).
/* Recursive Helper */
power(N, Exp, Result):-
    Exp > 0,
    _NextExp is Exp - 1,
    power(N, _NextExp, _Result1),
    Result is N * _Result1.
    
/* Recursive 4 */
digitPowerSum(N, X):-
    solve(N, 1, X).

/* Deklarasi Fakta */
/* Base Case Helper */
solve(0, _Exp, 0).
/* Recursive Helper */
solve(N, Exp, X):-
    N > 0,
    _Digit is N mod 10,
    _SisaN is N // 10,
    _NextExp is Exp + 1,
    power(_Digit, Exp, _Val),
    solve(_SisaN, _NextExp, _Result1),
    X is _Val + _Result1.

/* Recursive 5 */
safeBinary(N, X):-
    N >= 1,
    isValid(N, 0, X).

/* Deklarasi Fakta */
/* Base Case Helper */
isValid(0, _Bin, 1):-!.
/* Recursive Helper */
isValid(N, 0, X):-
    N >= 1,
    _NextN is N - 1,
    isValid(_NextN, 0, _X0),
    isValid(_NextN, 1, _X1),
    X is _X0 + _X1.

/* Recursive Helper */
isValid(N, 1, X):-
    N >= 1,
    _NextN is N - 1,
    isValid(_NextN, 0, X).

/* Deklarasi Fakta */
/* Base Case */
altFactorial(1, 1):-!.
/* Recursive 6 */
altFactorial(N, X):-
    N > 1,
    _N1 is N - 1,
    altFactorial(_N1, _SubR),
    factorialHelper(N, _FactR),
    (0 is N mod 2 -> X is _SubR - _FactR ; X is _SubR + _FactR).

/* Deklarasi Fakta */
/* Base Case Helper */
factorialHelper(0, 1):-!.
/* Recursive Helper */
factorialHelper(N, X):-
    _NextN is N - 1,
    factorialHelper(_NextN, _X1),
    X is N * _X1.

/* Deklarasi Fakta */
/* Base Case */
vaultTransform(_Code, 0, _Code):-!.
/* Recursive 7 */
vaultTransform(Code, K, FinalCode):-
    Code >= 0,
    K > 0,
    _NewK is K - 1,
    reverseCode(Code, _RevCode),
    digitsSum(Code, _Digit),
    _NextCode is _RevCode + _Digit,
    vaultTransform(_NextCode, _NewK, FinalCode).

/* Recursive Helper */
reverseCode(Code, RevCode):-
    reverseCodeHelper(Code, 0, RevCode).

/* Deklarasi Fakta */
/* Base Case Helper */
reverseCodeHelper(0, RevCode, RevCode):-!.
/* Recursive Helper */
reverseCodeHelper(Code, N, RevCode):-
    Code > 0,
    _Digit is Code mod 10,
    _NewN is (N * 10) + _Digit,
    _NextCode is Code // 10,
    reverseCodeHelper(_NextCode, _NewN, RevCode).

/* Deklarasi Fakta */
/* Base Case Helper */
digitsSum(0, 0):-!.
/* Recursive Helper */
digitsSum(Code, Sum):-
    Code > 0,
    _Last is Code mod 10,
    _Rest is Code // 10,
    digitsSum(_Rest, _SubSum),
    Sum is _Last + _SubSum.


/* Deklarasi Fakta */
/* Base Case */
palPrimeCount(B, B, X):-
    (isAPalindrom(B), isAPrime(B) -> X is 1 ; X is 0), !.
/* Recursive 8 */
palPrimeCount(A, B, X):-
    A < B,
    _NextA is A + 1,
    palPrimeCount(_NextA, B, _SubX),
    (isAPalindrom(A), isAPrime(A) -> X is 1 + _SubX ; X is _SubX).

/* Recursive Helper */
isAPalindrom(A):-
    reverseA(A, A).

/* Recursive Helper */
reverseA(A, RevA):-
    reverseAHelper(A, 0, RevA).

/* Deklarasi Fakta */
/* Base Case Helper */
reverseAHelper(0, RevA, RevA):-!.
/* Recursive Helper */
reverseAHelper(A, X, RevA):-
    A > 0,
    _Digit is A mod 10,
    _NewX is (X * 10) + _Digit,
    _NextA is A // 10,
    reverseAHelper(_NextA, _NewX, RevA).

/* Deklarasi Fakta */
/* Base Case Helper */
isAPrime(2):-!.
/* Recursive Helper */
isAPrime(A):-
    A > 2,
    A mod 2 =\= 0,
    \+ factorA(A, 3).

/* Recursive Helper */
factorA(A, Factor):-
    Factor * Factor =< A,
    (A mod Factor =:= 0 -> true ; _NextFactor is Factor + 2, factorA(A, _NextFactor)).


/* Recursive 9 */
towerJourney(N, Energy, FinalEnergy):-
    processRooms(1, N, Energy, FinalEnergy).

/* Deklarasi Fakta */
/* Base Case Helper */
processRooms(Current, N, Energy, Energy) :- 
    Current > N, !.
/* Deklarasi Fakta */
/* Base Case Helper */
processRooms(_, _, Energy, 0) :- 
    Energy =< 0,!.

/* Recursive Helper */
processRooms(T, N, Energy, FinalEnergy) :- 
    T =< N,
    rules(T, Energy, NextEnergy),
    (NextEnergy =< 0 -> FinalEnergy = 0 ; NextT is T + 1, processRooms(NextT, N, NextEnergy, FinalEnergy)).

/* Recursive Helper */
rules(T, Energy, FinalEnergy):-
    (T mod 2 =:= 0 -> Energy1 is Energy + 3 ; Energy1 is Energy),
    (T mod 5 =:= 0 -> Energy2 is Energy1 - 4 ; Energy2 is Energy1),
    (isNPrime(T) -> Energy3 is Energy2 + 2 ; Energy3 is Energy2),
    (isNPerfectSquare(T) -> FinalEnergy is Energy3 - 1 ; FinalEnergy is Energy3).

/* Deklarasi Fakta */
/* Base Case Helper */
isNPrime(2):-!.
/* Recursive Helper */
isNPrime(N):-
    N > 2,
    N mod 2 =\= 0,
    \+ factorN(N, 3).

/* Recursive Helper */
factorN(N, Factor):-
    Factor * Factor =< N,
    (N mod Factor =:= 0 -> true ; NextFactor is Factor + 2, factorN(N, NextFactor)).

/* Deklarasi Fakta */
/* Base Case Helper */
isNPerfectSquare(0):-!.
isNPerfectSquare(1):-!.
/* Recursive Helper */
isNPerfectSquare(N):-
    N > 1,
    checkSquare(N, 1).

/* Recursive Helper */
checkSquare(N, I):-
    Square is I * I,
    (Square =:= N -> true ; Square < N -> NextI is I + 1, checkSquare(N, NextI) ; false).

/* Recursive 10 */
makeDiamond(N):-
    N >= 0,
    N mod 2 =\= 0,
    _Middle is (N + 1) // 2,
    writeDiamondsRows(1, N, _Middle).

/* Recursive Helper */
writeDiamondsRows(I, N, Mid):-
    I =< N,
    _Space is abs(Mid - I),
    writeSpace(_Space),
    _MaxNum is Mid - abs(Mid - I),
    writeNumbers(1, _MaxNum),
    nl,
    _NextI is I + 1,
    writeDiamondsRows(_NextI, N, Mid).

/* Deklarasi Fakta */
/* Base Case Helper */
writeSpace(0):-!.
/* Recursive Helper */
writeSpace(Space):-
    Space > 0,
    write('  '),
    _Space1 is Space - 1,
    writeSpace(_Space1).

/* Recursive Helper */
writeNumbers(_Cur, _Max):-
    writeAscend(1, _Max),
    _StartDescend is _Max - 1,
    writeDescend(_StartDescend).

/* Deklarasi Fakta */
/* Base Case Helper */
writeAscend(Cur, Max):-
    Cur > Max, !.
/* Recursive Helper */
writeAscend(Cur, Max):-
    Cur =< Max,
    write(Cur), write(' '),
    _Next is Cur + 1,
    writeAscend(_Next, Max).

/* Deklarasi Fakta */
/* Base Case Helper */
writeDescend(0):-!.
/* Recursive Helper */
writeDescend(StartDescend):-
    StartDescend > 0,
    write(StartDescend), write(' '),
    _NextDescend is StartDescend - 1,
    writeDescend(_NextDescend).
