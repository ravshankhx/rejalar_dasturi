import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rejalar_dasturi/widgets/rejalar_malumoti.dart';
import 'package:rejalar_dasturi/widgets/rejalar_royhati.dart';
import 'package:rejalar_dasturi/widgets/rejalar_sanasi.dart';
import 'package:rejalar_dasturi/widgets/yangi_reja.dart';

import 'models/reja_modeli.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: GoogleFonts.montserrat().fontFamily),
      home: RejalarDasturi(),
    );
  }
}

class RejalarDasturi extends StatefulWidget {
  @override
  State<RejalarDasturi> createState() => _RejalarDasturiState();
}

class _RejalarDasturiState extends State<RejalarDasturi> {
  // List<RejaModeli> _rejalar = Rejalar().ruyxat;

  Rejalar _rejalar = Rejalar();

  DateTime _belgilanganKun = DateTime.now();

  void _sananiTanlash(BuildContext context) {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime(2024))
        .then((tanlanganKun) {
      if (tanlanganKun != null) {
        setState(() {
          _belgilanganKun = tanlanganKun;
        });
      }
    });
  }

  void _oldingiSana() {
    setState(() {
      _belgilanganKun = DateTime(
          _belgilanganKun.year, _belgilanganKun.month, _belgilanganKun.day - 1);
    });
  }

  void _keyingiSana() {
    setState(() {
      _belgilanganKun = DateTime(
          _belgilanganKun.year, _belgilanganKun.month, _belgilanganKun.day + 1);
    });
  }

  void _bajarilganDebBelgila(String rejaId) {
    setState(() {
      _rejalar.kunBoyichaRoyxat(_belgilanganKun)

          .firstWhere((reja) => reja.id == rejaId)
          .bajarildimiUzgartirish();
    });
  }

  void _rejaniQoshish(String rejaNomi, DateTime rejaningKuni) {
    setState(() {
      _rejalar.addTodo(
        rejaNomi,
        rejaningKuni,
      );
    });

    Navigator.of(context).pop();
  }

  void _rejaniUchirish(String rejaId) {
    setState(() {
      _rejalar.removeTodo(rejaId);
      // _rejalar.kunBoyichaRoyxat(_belgilanganKun).removeWhere((reja) => reja.id == rejaId);
    });
  }

  int get _rejalarSoni {
    return _rejalar.kunBoyichaRoyxat(_belgilanganKun).length;
  }

  int get _bajarilganRejalarSoni {
    return _rejalar.kunBoyichaRoyxat(_belgilanganKun).where((reja) => reja.bajarildi).length;
  }

  void _rejaQoshishEkraniniOchish(BuildContext context) {
    showModalBottomSheet(
      isDismissible: false,
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return YangiReja(_rejaniQoshish);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Rejalar Dasturi"),
      ),
      body: Column(
        children: [
          RejalarSanasi(
            _sananiTanlash,
            _belgilanganKun,
            _oldingiSana,
            _keyingiSana,
          ),
          RejalarMalumoti(
            _rejalarSoni,
            _bajarilganRejalarSoni,
          ),
          RejalarRuyxati(
            _rejalar.kunBoyichaRoyxat(_belgilanganKun),
            _bajarilganDebBelgila,
            _rejaniUchirish,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _rejaQoshishEkraniniOchish(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
