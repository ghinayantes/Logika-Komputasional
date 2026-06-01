/* Bagian <IV> */
/* Fungsi Random untuk Bagian4_13525119.pl */
/* Deklarasi Rules*/
randomizeCard(Card, H):-
    listLength(H, Len),
    random(0, Len, I),
    getElmt(I, H, Card).

/* Base Case Helper */
listLength([], 0):-!.
/* Recursive Helper */
listLength([_|T], Len):-
    listLength(T, Prev),
    Len is Prev + 1.

/* Base Case Helper */
getElmt(0, [H|_], H):-!.
/* Recursive Helper */
getElmt(I, [_|T], Elem):-
    I > 0,
    I1 is I - 1,
    getElmt(I1, T, Elem).

/* Base Case Helper */
removeFirst(_Elem, [], []):-!.
removeFirst(H, [H|T], T):-!.
/* Recursive Helper */
removeFirst(X, [H|T], [H|Rest]):-
    removeFirst(X, T, Rest).