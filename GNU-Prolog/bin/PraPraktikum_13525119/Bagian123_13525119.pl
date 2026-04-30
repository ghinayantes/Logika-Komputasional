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
    X \== Y, U \== W.

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
    V > W, X \== Y.

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



