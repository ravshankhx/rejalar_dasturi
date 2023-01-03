import 'package:flutter/material.dart';

import '../models/reja_modeli.dart';

class RejalarMalumoti extends StatelessWidget {
  final int rejalarSoni;
  final int bajarilganRejalarSoni;

  RejalarMalumoti(
    this.rejalarSoni,
    this.bajarilganRejalarSoni,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                rejalarSoni < 10
                    ? "0$rejalarSoni"
                    : "$rejalarSoni",

                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                "Barcha rejalaringiz",
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                bajarilganRejalarSoni < 10
                    ? "0$bajarilganRejalarSoni"
                    : "$bajarilganRejalarSoni",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                "Bajarilgan rejalaringiz",
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
