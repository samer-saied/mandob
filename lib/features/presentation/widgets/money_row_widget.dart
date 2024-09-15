import 'package:flutter/material.dart';

import '../../data/models/fiat_model.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class MoneyRow extends StatelessWidget {
  final Fiatmodel fiat;
  const MoneyRow({super.key, required this.fiat});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.currency(symbol: "");
    //('#,###');
    final formattedNumber = formatter.format(fiat.getFiatTotal());

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //////// fiat Widget with x sign  example: 200 X
        Flexible(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: fiat.color.withOpacity(0.25),
                  ),
                  height: 50,
                  child: Center(
                    child: Text(
                      fiat.type.toString(),
                      style: const TextStyle(
                        fontSize: 22,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  'X',
                  style: TextStyle(
                    fontSize: 22,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        //////// First Package FormField Widget
        Flexible(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: SizedBox(
              height: 50,
              child: Center(
                child: TextFormField(
                  // controller: textController,
                  initialValue: fiat.package.toString(),
                  decoration: InputDecoration(
                    hintText: fiat.package.toString(),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.withOpacity(.50)),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (val) {
                    print(val);
                  },
                  onSaved: (val) {
                    print(val);
                  },
                  validator: (val) {
                    print(val);
                  },
                ),
              ),
            ),
          ),
        ),
        //////// Secand Package FormField Widget
        Flexible(
          flex: 1,
          child: SizedBox(
            height: 50,
            child: Center(
              child: TextFormField(
                // controller: textController,
                initialValue: fiat.ref.toString(),
                decoration: InputDecoration(
                  hintText: fiat.ref.toString(),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.withOpacity(.50)),
                  ),
                ),
                keyboardType: TextInputType.number,
                onChanged: (val) {
                  print(val);
                },
                onSaved: (val) {
                  print(val);
                },
                validator: (val) {
                  print(val);
                },
              ),
            ),
          ),
        ),
        //////// Total Widget with = sign  example: = 6,767.00
        Flexible(
          flex: 1,
          child: FittedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Text(
                    '=',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Text(
                  formattedNumber,
                  style: const TextStyle(
                    // fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
