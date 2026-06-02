jumlah_geo(_, _, 0, 0):-!.
jumlah_geo(P, R, B, H) :-
    B >= 0,
    B1 is B - 1,
    P1 is P * R,
    jumlah_geo(P1, R, B1, H1),
    H is H1 + P.