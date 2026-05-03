/* Bagian <IV> */
:-dynamic(game_started/0).
:-dynamic(hand/1).

/* set game */
:-include('random_13525119.pl').

/* start */
/* Deklarasi Rules */
start:- 
    (game_started -> write('Permainan sudah dimulai. Gunakan "exit" untuk keluar dan memulai ulang.'), nl
    ; 
    readCards(Cards), 
    assertz(game_started), 
    assertz(hand(Cards)),
    write('Selamat datang di meja kartu! Habiskan semua kartumu :D'), nl,
    format('Kartumu: ~w~n', [Cards])).

/* readCards */
/* Deklarasi Rules Helper*/
readCards(Cards):-
    open('kartu_13525119.txt', read, Stream),
    read(Stream, Cards),
    close(Stream).

/* play_card */
/* Deklarasi Rules */
play_card:-
    (\+ game_started -> fail ; hand(H),
    (H = [] -> write('Kartumu sudah habis!'), nl ;
    randomizeCard(Card, H), 
    removeFirst(Card, H, NewHand),
    retract(hand(H)), 
    assertz(hand(NewHand)), 
    format('Angka ~w dimainkan!~n', [Card]),
    (NewHand = [] -> write('Selamat! Kamu menghabiskan semua kartumu. Kamu menang!!!'), nl ; true))).

/* display_status */
/* Deklarasi Rules */
display_status:-
    (\+ game_started -> fail
    ;
    hand(H),
    listLength(H, Len),
    format('Banyak Kartu di Tangan: ~w~n', [Len]),
    format('Kartumu: ~w~n', [H])).

/* exit */
/* Deklarasi Rules */
exit:-
    (\+ game_started -> write('Permainan belum dimulai. Gunakan "start" untuk memulai.'), nl
    ;
    hand(FinalHand), writeResult(FinalHand),
    retract(game_started), retract(hand(_)),
    write('Hasil permainan telah disimpan ke hasil_13525119.txt.'), nl,
    write('Sampai jumpa di meja kartu berikutnya.'), nl).

/* writeResult */
/* Deklarasi Rules Helper*/
writeResult(FinalHand):-
    open('hasil_13525119.txt', write, Stream),
    (FinalHand = [] -> write(Stream, 'Status: Menang'), nl(Stream) ;  write(Stream, 'Status: Tidak Selesai'), nl(Stream)),
    format(Stream, 'Sisa Kartu: ~w.~n', [FinalHand]),
    close(Stream).
