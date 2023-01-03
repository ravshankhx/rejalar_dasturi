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

  List<RejaModeli> kunBoyichaRoyxat(DateTime date) {
    return _ruyxat
        .where((todo) =>
            todo.kuni.day == date.day &&
            todo.kuni.month == date.month &&
            todo.kuni.year == date.year)
        .toList();
  }

  void addTodo(String rejaNomi, DateTime rejaKuni) {
    _ruyxat.add(RejaModeli(
      id: "r${_ruyxat.length + 1}",
      nomi: rejaNomi,
      kuni: rejaKuni,
    ));
  }

  void removeTodo(String id){
    _ruyxat.removeWhere((reja) => reja.id == id);
  }


}
