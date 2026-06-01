% --- FAKTA ---
% orang(Nama, JenisKelamin).
orang(budi, pria).
orang(slamet, pria).
orang(siti, wanita).
orang(tiara, wanita).

% orang_tua(AyahAtauIbu, Anaknya).
orang_tua(slamet, budi).
orang_tua(slamet, tiara).
orang_tua(siti, budi).
orang_tua(siti, tiara).

% --- ATURAN ---
% Seseorang adalah Ayah jika dia orang tua DAN dia pria.
ayah(Ayah, Anak) :- 
    orang_tua(Ayah, Anak), 
    orang(Ayah, pria).

% Seseorang punya anak jika dia adalah orang tua dari 'Siapa Saja' (_).
% Di sini kita pakai Anonymous Variable karena kita cuma mau tahu 
% dia sudah jadi orang tua, tidak peduli siapa nama anaknya.
punya_anak(Orang) :- 
    orang_tua(Orang, _).

% Saudara kandung: punya orang tua yang sama.
saudara(X, Y) :- 
    orang_tua(Ortu, X), 
    orang_tua(Ortu, Y), 
    X \= Y. % X bukan Y (biar nggak jadi saudara diri sendiri)