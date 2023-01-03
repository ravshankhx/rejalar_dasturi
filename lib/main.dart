import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rejalar_dasturi/widgets/rejalar_malumoti.dart';
import 'package:rejalar_dasturi/widgets/rejalar_royhati.dart';
import 'package:rejalar_dasturi/widgets/rejalar_sanasi.dart';

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
  List<RejaModeli> _rejalar = Rejalar().ruyxat;

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
      _rejalar.firstWhere((reja) => reja.id == rejaId).bajarildimiUzgartirish();
    });
  }


  void _rejaniUchirish(String rejaId){

    setState(() {
      _rejalar.removeWhere((reja) => reja.id == rejaId);
    });
  }

  int get _rejalarSoni{
    return _rejalar.length;
  }
  int get _bajarilganRejalarSoni{
    return _rejalar.where((reja) => reja.bajarildi).length;
  }


  void _rejaQoshishEkraniniOchish(BuildContext context){
    showModalBottomSheet(context: context, builder: (ctx){
      return Container(


          padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
               TextField(
                 keyboardType: TextInputType.multiline,
                maxLines: 5,

                decoration: InputDecoration(

                  labelText: "Reja nomi"
                ),

              ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Reja kuni tanlanmagan"),
                TextButton(onPressed: (){}, child: Text("KUNNI TANLASH"))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(onPressed: (){}, child: Text("BEKOR QILISH"),),
                ElevatedButton(onPressed: (){}, child: Text("KIRITISH"),)
              ],
            ),

          ],
        )
      );
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
            _rejalar,
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
