dataKaryawan(adi, 5000000, 10, 50000, 5).

gajibersih(Karyawan, Gajibersih) :-
    gajikotor(Karyawan, Gajikotor),
    pajak(Karyawan, Pajak),
    Gajibersih is Gajikotor - Pajak.

gajikotor(Karyawan, Gajikotor) :-
    dataKaryawan(Karyawan, Gajipokok, JamLembur, TarifLembur, _),
    Gajikotor is Gajipokok + (JamLembur * TarifLembur).

pajak(Karyawan, Pajak) :-
    dataKaryawan(Karyawan, _, _, _, PPajak),
    gajikotor(Karyawan, Gajikotor),
    Pajak is Gajikotor - (PPajak/100).