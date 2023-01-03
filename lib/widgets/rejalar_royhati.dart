import 'package:flutter/material.dart';
import 'package:rejalar_dasturi/widgets/reja.dart';

import '../models/reja_modeli.dart';

class RejalarRuyxati extends StatelessWidget {
  final List<RejaModeli> rejalar;
  final Function bajarilganDebBelgila;
  final Function rejaniUchirish;

  RejalarRuyxati(
    this.rejalar,
    this.bajarilganDebBelgila,
    this.rejaniUchirish,
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: rejalar.length>0 ? ListView.builder(
        itemBuilder: (ctx, index) {
          return Reja(
            rejalar[index],
            bajarilganDebBelgila,
            rejaniUchirish,
          );
        },
        itemCount: rejalar.length,
      ):Center(
        child: Text("Hozircha rejalar yo'q"),
      ),
    );
  }
}
