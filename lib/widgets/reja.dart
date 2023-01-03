import 'package:flutter/material.dart';
import 'package:rejalar_dasturi/models/reja_modeli.dart';

class Reja extends StatelessWidget {
  final RejaModeli reja;
  final Function bajarilganDebBelgila;
  final Function rejaniUchirish;

  Reja(
    this.reja,
    this.bajarilganDebBelgila,
    this.rejaniUchirish,
  );

  @override
  Widget build(BuildContext context) {
    // print(reja);
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 8),
      leading: IconButton(
        onPressed: () {
          bajarilganDebBelgila(reja.id);
        },
        icon: Icon(
          reja.bajarildi ? Icons.check_circle_outline : Icons.circle_outlined,
          color: reja.bajarildi ? Colors.green : Colors.grey,
        ),
      ),
      title: Text(
        reja.nomi,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: reja.bajarildi ? Colors.grey : Colors.black,
          decoration:
              reja.bajarildi ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          rejaniUchirish(reja.id);
        },
        icon: Icon(
          Icons.delete_forever_outlined,
          size: 20,
        ),
      ),
    );
  }
}
