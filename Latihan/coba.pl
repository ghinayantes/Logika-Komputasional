member(X, [X|_]).
member(X, [_|T]) :- 
member(X, T).

/*
?- member(X, [1,2,3]).
X = 1 ;
X = 2 ;  taro ';' supaya bisa liat semua hasilnya di gnu
X = 3.
*/