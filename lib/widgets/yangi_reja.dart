import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class YangiReja extends StatefulWidget {
  final Function rejaniQoshish;

  YangiReja(this.rejaniQoshish);

  @override
  State<YangiReja> createState() => _YangiRejaState();
}

class _YangiRejaState extends State<YangiReja> {
  DateTime? _rejaqoshishgabelgilanganKun;
  final _rejaNomiController = TextEditingController();

  void _rejaniqoshishUchunKalendarniOchish(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2024),
    ).then((tanlanganKun) {
      if (tanlanganKun != null) {
        setState(() {
          _rejaqoshishgabelgilanganKun = tanlanganKun;
        });
      }
    });
  }

  void submit() {
    if (_rejaNomiController.text.isEmpty ||
        _rejaqoshishgabelgilanganKun == null) {
      return;
    }
    widget.rejaniQoshish(
        _rejaNomiController.text, _rejaqoshishgabelgilanganKun);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.only(
            top: 16,
            right: 16,
            left: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom > 0
                ? MediaQuery.of(context).viewInsets.bottom + 16
                : 200,
          ),
          child: Column(
            children: [
              TextField(
                controller: _rejaNomiController,
                decoration: InputDecoration(labelText: "Reja nomi"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _rejaqoshishgabelgilanganKun == null
                        ? "Reja kuni tanlanmagan"
                        : DateFormat("EEEE, d MMMM, YYYY")
                            .format(_rejaqoshishgabelgilanganKun!),
                  ),
                  TextButton(
                      onPressed: () =>
                          _rejaniqoshishUchunKalendarniOchish(context),
                      child: Text("KUNNI TANLASH"))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("BEKOR QILISH"),
                  ),
                  ElevatedButton(
                    onPressed: submit,
                    child: Text("KIRITISH"),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
