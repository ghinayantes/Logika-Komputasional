% Memuat data eksternal 
start :- 
    consult('data_user.txt'), 
    write('Data berhasil dimuat!'), nl. 
 
p1(X, Y) :- 
    friend(X, Y), 
    user(X, Kota, _), 
    user(Y, Kota, _). 
 
p2(X, Y) :- 
    friend(X, Y), 
    user(Y, _, Follower), 
    Follower > 3000. 
 
p3(X, Y) :- 
    friend(X, Y); 
    (friend(X, Z), friend(Z, Y), X \= Y, X \= Z, Y \= Z). 
 
p4(Kota, RataRata) :- 
    findall(Follower, user(_, Kota, Follower), FList), 
    sumlist(FList, Total),
    length(FList, Count), 
    Count > 0, 
    RataRata is Total / Count.

p5(Kota, Nama) :- 
    follower_rata_rata(Kota, Avg), 
    user(Nama, Kota, IPK), 
    Follower < Avg.

follower_rata_rata(Kota, RataRata) :- p4(Kota, RataRata).
