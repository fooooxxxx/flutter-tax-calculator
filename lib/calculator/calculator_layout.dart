import 'package:flutter/material.dart';

import 'core.dart';

class CalculatorWidget extends StatefulWidget {
  const CalculatorWidget({Key? key}) : super(key: key);

  @override
  State<CalculatorWidget> createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  static final defaultScale = 4;

  final _pretaxPriceCtrl = TextEditingController(text: '0');
  final _afterTaxPriceCtrl = TextEditingController(text: '0');
  final _taxRateCtrl = TextEditingController(text: '0');
  final _calModel = RateCalculatorModel();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              labelText: '税前金额: ',
              hintText: '请输入税前金额',
              prefixIcon: Icon(Icons.attach_money),
            ),
            controller: _pretaxPriceCtrl,
            keyboardType: TextInputType.number,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: '税后金额: ',
              hintText: '请输入税后金额',
              prefixIcon: Icon(Icons.attach_money),
            ),
            controller: _afterTaxPriceCtrl,
            keyboardType: TextInputType.number,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: '税率%: ',
              hintText: '请输入税率',
            ),
            controller: _taxRateCtrl,
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _pretaxPriceCtrl.addListener(() {
      if (_pretaxPriceCtrl.text.isNotEmpty) {
        _calModel.changePretaxPrice(_pretaxPriceCtrl.text.toString());
        _afterTaxPriceCtrl.text =
            _calModel.afterTaxPrice.round(scale: defaultScale).toString();
      }
    });

    _afterTaxPriceCtrl.addListener(() {
      if (_pretaxPriceCtrl.text.isNotEmpty) {
        _calModel.changeAfterTaxPrice(_afterTaxPriceCtrl.text.toString());
        _pretaxPriceCtrl.text =
            _calModel.pretaxPrice.round(scale: defaultScale).toString();
      }
    });

    _taxRateCtrl.addListener(() {
      if (_pretaxPriceCtrl.text.isNotEmpty) {
        _calModel.changeTaxRate(_taxRateCtrl.text.toString());
        _afterTaxPriceCtrl.text =
            _calModel.afterTaxPrice.round(scale: defaultScale).toString();
      }
    });
  }

  @override
  void dispose() {
    _pretaxPriceCtrl.dispose();
    _afterTaxPriceCtrl.dispose();
    _taxRateCtrl.dispose();
    super.dispose();
  }
}
