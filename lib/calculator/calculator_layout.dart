import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core.dart';

class CalculatorWidget extends StatefulWidget {
  const CalculatorWidget({Key? key}) : super(key: key);

  @override
  State<CalculatorWidget> createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (ctx) => RateCalculatorModel(),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  labelText: '税前金额: ',
                  hintText: '请输入税前金额',
                  prefixIcon: Icon(Icons.attach_money),
                ),
                keyboardType: TextInputType.number,
                onChanged: (String value) {
                  Provider.of<RateCalculatorModel>(context, listen: false)
                      .changePretaxPrice(value);
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: '税后金额: ',
                  hintText: '请输入税后金额',
                  prefixIcon: Icon(Icons.attach_money),
                ),
                keyboardType: TextInputType.number,
                onChanged: (String value) {
                  print(value);
                },
              ),
            ],
          ),
        ));
  }
}
