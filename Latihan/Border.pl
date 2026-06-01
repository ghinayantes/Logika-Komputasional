/* FAKTA - Definisi batas satu arah */
border(sussex, kent).
border(sussex, surrey).
border(surrey, kent).
border(hampshire, sussex).
border(hampshire, surrey).
border(hampshire, berkshire).
border(berkshire, surrey).
border(wiltshire, hampshire).

/* ATURAN */

% 1. Membuat hubungan bertetangga menjadi dua arah (simetris)
% Menggunakan operator ';' (OR) agar lebih ringkas
adjacent(X, Y) :- 
    border(X, Y) ; 
    border(Y, X).

% 2. Hubungan 'valid' (wilayah yang dipisahkan oleh tepat satu wilayah lain)
% Ditambahkan pengecekan (X \== Y) agar wilayah tidak dianggap valid terhadap dirinya sendiri
valid(X, Y) :- 
    adjacent(X, W), 
    adjacent(W, Y), 
    X \== Y.

% 3. Opsional: Aturan untuk mendapatkan daftar tetangga unik (mencegah duplikasi saat query)
neighbors(X, List) :-
    setof(Y, adjacent(X, Y), List).