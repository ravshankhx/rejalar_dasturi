class RejaModeli {
  final String id;
  final String nomi;
  final DateTime kuni;
  bool bajarildi = false;

  RejaModeli({required this.id, required this.nomi, required this.kuni});

  void bajarildimiUzgartirish() {
    bajarildi = !bajarildi;
  }
}

class Rejalar {
  // _ = private | Shaxsiy
  List<RejaModeli> _ruyxat = [
    RejaModeli(id: "r1", nomi: "Bozorga borish", kuni: DateTime.now()),
    RejaModeli(id: "r2", nomi: "Kitob o'qish", kuni: DateTime.now()),
    RejaModeli(id: "r3", nomi: "Futbolga borish", kuni: DateTime.now()),
  ];
  List<RejaModeli> get ruyxat {
    return _ruyxat;
  }


}
