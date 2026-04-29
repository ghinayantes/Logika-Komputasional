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
    anak(X, Z),
    anak(Y, Z),
    X \== Y.

/* b. saudaratiri(X, Y) */
saudaratiri(X, Y):-
    anak(X, U),
    anak(X, V),
    anak(Y, V),
    anak(Y, W),
    menikah(U, V),
    menikah(V, W),
    X \== Y, U \== W.

/* c. sepupu(X, Y) */
sepupu(X, Y):-
    saudara(V, W),
    anak(X, V),
    anak(Y, W),
    X \== Y.

/* d. kakak(X, Y) */
kakak(X, Y):-
    saudara(X,Y),
    usia(X, V),
    usia(Y, W),
    V > W, X \== Y.

/* e. keponakan(X, Y) */
keponakan(X, Y):- 
    saudara(Z, Y),
    anak(X, Z),
    X \== Y.

