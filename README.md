# Logika Komputasional 

Repositori ini berisi kumpulan tugas dan praktikum untuk mata kuliah **IF2121 Logika Komputasional** di Institut Teknologi Bandung. Fokus utama dari repositori ini adalah implementasi pemrograman logika menggunakan **GNU Prolog**.

## 📂 Struktur Direktori

*   **GNU-Prolog/bin/**: Berisi file program utama (`.pl`) yang mencakup latihan dasar dan tugas praktikum.
    *   `keluarga.pl`: Implementasi pohon silsilah keluarga dan relasi logika.
    *   `aritmatika.pl`: Latihan operasi matematika dasar dan rekursi.
    *   `Border.pl`, `coba.pl`, `test.pl`: Kumpulan solusi untuk soal-soal latihan dan eksplorasi logika.
    *   **PraPraktikum_13525119/**: Folder khusus yang berisi tugas persiapan praktikum.

## Cara Menjalankan

1.  Pastikan sudah menginstal **GNU Prolog**.
2.  Buka terminal atau *command prompt*.
3.  Masuk ke direktori file berada, lalu jalankan interpreter:
    ```bash
    gprolog
    ```
4.  Muat file yang diinginkan (misal `keluarga.pl`):
    ```prolog
    [keluarga].
    ```
5.  Silakan lakukan *query* yang diinginkan

## 🛠️ Tech Stack

*   **Language**: Prolog
*   **Compiler**: GNU Prolog (gprolog)
*   **Tools**: VS Code

---

# PraPraktikum Logika Komputasional
**NIM:** 13525119

Repositori ini berisi jawaban Pra-Praktikum mata kuliah **Logika Komputasional** menggunakan **GNU Prolog**. Program mencakup empat bagian: permasalahan aritmetika, binary string, list processing, dan simulasi permainan kartu.

---

## Struktur File

```
PraPraktikum_13525119/
├── Bagian123_13525119.pl   # Bagian I, II, III — Aritmetika, Binary, dan List
├── Bagian4_13525119.pl     # Bagian IV — Simulasi permainan kartu (main file)
├── random_13525119.pl      # Utilitas random untuk Bagian IV (diimpor otomatis)
├── kartu_13525119.txt      # Input kartu pemain (format Prolog term)
└── hasil_13525119.txt      # Output hasil permainan (dibuat otomatis saat exit)
```

---

## Cara Menjalankan

### Prasyarat
- [GNU Prolog](http://www.gprolog.org/) sudah terinstal

### Memuat file di GNU Prolog

```prolog
| ?- consult('Bagian123_13525119.pl').
| ?- consult('Bagian4_13525119.pl').
```

> `Bagian4_13525119.pl` secara otomatis mengimpor `random_13525119.pl` via `:- include(...)`, jadi tidak perlu di-consult terpisah.

---

## Bagian I & II — Aritmetika & Binary String

File: `Bagian123_13525119.pl`

### `safeBinary(N, X)`

Menghitung jumlah string biner sepanjang `N` yang tidak memiliki dua angka `1` berurutan.

**Cara kerja:** Menggunakan dynamic programming via rekursi Prolog. `isValid(N, PrevBit, X)` menghitung berapa banyak cara melanjutkan string sepanjang N, jika bit sebelumnya adalah `PrevBit`.

```prolog
| ?- safeBinary(3, X).
X = 5

| ?- safeBinary(5, X).
X = 13
```

---

## Bagian III — List Processing

File: `Bagian123_13525119.pl`

Semua soal menggunakan operator pipe `|` dan **tidak** menggunakan built-in list processing GNU Prolog.

### 1. `minMaxScaling(Input, Result)`

Melakukan transformasi min-max scaling pada setiap elemen list ke range [0, 1].

**Rumus:** `X_scaled = (X - X_min) / (X_max - X_min)`

```prolog
| ?- minMaxScaling([4,3,1,5,12], Result).
Result = [0.2727..., 0.1818..., 0.0, 0.3636..., 1.0]

| ?- minMaxScaling([-5,30,21,-23,2], Result).
Result = [0.3396..., 1.0, 0.8301..., 0.0, 0.4716...]
```

Helper yang digunakan: `listMin/2`, `listMax/2`, `scaleList/4`

---

### 2. `pemusnahKarbit(Input, Result)`

Memfilter list sehingga hanya menyimpan elemen yang bernilai `0` atau `1`. Elemen lain dibuang.

```prolog
| ?- pemusnahKarbit([3,0,10,1,5], Result).
Result = [0,1]

| ?- pemusnahKarbit([-2,100,1,1,4,7,0,2,1], Result).
Result = [1,1,0,1]
```

---

### 3. `fansBarcelona(Input, FanCount, Result)`

Mencari tim yang paling sering muncul dalam list (modus), lalu menambahkan sejumlah `FanCount` nama tim tersebut ke belakang list. Pengecualian: jika tim yang paling sering muncul adalah `"real madrid"`, tambahkan `"hater"` sebagai gantinya.

> **Catatan:** Input menggunakan double quotes (`"..."`) yang di GNU Prolog direpresentasikan sebagai list of character codes.

```prolog
| ?- fansBarcelona(["psg","bayern","psg","bayern","real madrid","psg"], 2, Result).
Result = ["psg","bayern","psg","bayern","real madrid","psg","psg","psg"]

| ?- fansBarcelona(["real madrid","inter","man city","real madrid","liverpool"], 3, Result).
Result = ["real madrid","inter","man city","real madrid","liverpool","hater","hater","hater"]
```

Helper yang digunakan: `countElmt/3`, `findMode/2`, `appendN/4`

---

## Bagian IV — Simulasi Permainan Kartu

File utama: `Bagian4_13525119.pl`  
File utilitas: `random_13525119.pl`

Simulasi permainan kartu satu pemain. Tujuan: habiskan semua kartu di tangan. Setiap `play_card`, program memilih kartu secara **acak**.

### Persiapan Input

Buat file `kartu_13525119.txt` berisi list angka (1–9) dalam format Prolog term:

```prolog
[3, 7, 1, 5, 2].
```

### Perintah Permainan

| Perintah | Fungsi |
|---|---|
| `start.` | Memulai permainan, membaca kartu dari `kartu_13525119.txt` |
| `play_card.` | Memainkan satu kartu secara acak dari tangan |
| `display_status.` | Menampilkan jumlah dan isi kartu di tangan saat ini |
| `exit.` | Keluar dari permainan dan menyimpan hasil ke `hasil_13525119.txt` |

### Contoh Sesi Permainan

```prolog
| ?- start.
Selamat datang di meja kartu! Habiskan semua kartumu :D
Kartumu: [3, 2, 1]
yes

| ?- display_status.
Banyak Kartu di Tangan: 3
Kartumu: [3, 2, 1]

| ?- play_card.
Angka 1 dimainkan!
yes

| ?- play_card.
Angka 3 dimainkan!
yes

| ?- play_card.
Angka 2 dimainkan!
Selamat! Kamu menghabiskan semua kartumu. Kamu menang!!!
yes

| ?- exit.
Hasil permainan telah disimpan ke hasil_13525119.txt.
Sampai jumpa di meja kartu berikutnya.
yes
```

### Format Output `hasil_13525119.txt`

Jika menang (kartu habis):
```
Status: Menang
Sisa Kartu: []
```

Jika keluar sebelum menang:
```
Status: Tidak Selesai
Sisa Kartu: [7, 1]
```

---

## Catatan Teknis

- Semua soal Bagian III menggunakan operator **pipe `|`** dan rekursi manual, tanpa built-in seperti `msort`, `last`, `nth`, dll.
- Bagian IV menggunakan `assert/retract` untuk menyimpan state permainan (kartu di tangan, status game) secara dinamis antar query.
- String di GNU Prolog dengan double quotes (`"abc"`) direpresentasikan sebagai **list of ASCII character codes**, bukan atom.
