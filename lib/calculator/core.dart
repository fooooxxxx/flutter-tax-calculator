import 'dart:collection';

import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:flutter/material.dart';

// 计算核心逻辑
class RateCalculatorModel extends ChangeNotifier {
  final _PriceModel _model = _PriceModel();

  void changePretaxPrice(String pretaxPrice) {
    _model.setPretaxPrice(pretaxPrice);
    _model.afterTaxPrice =
        _model.pretaxPrice * _model.taxRate + _model.pretaxPrice;
    notifyListeners();
  }

  void changeAfterTaxPrice(String afterTaxPrice) {
    _model.setAfterTaxPrice(afterTaxPrice);
    _model.pretaxPrice =
        _model.pretaxPrice * _model.taxRate + _model.pretaxPrice;
    notifyListeners();
  }

  void changeTaxRate(String taxRate) {
    _model.setTaxRate(taxRate);
    _model.pretaxPrice =
        _countAfterTaxPrice(_model.pretaxPrice, _model._taxRate);
    notifyListeners();
  }

  Decimal _countAfterTaxPrice(Decimal pretaxPrice, Decimal taxRate) {
    return pretaxPrice * taxRate + pretaxPrice;
  }

  get pretaxPrice => _model._pretaxPrice;

  get afterTaxPrice => _model._afterTaxPrice;

  get taxRate => _model._taxRate;
}

class _PriceModel {
  /// 税前价格
  var _pretaxPrice = Decimal.zero;

  /// 税后价格
  var _afterTaxPrice = Decimal.zero;

  /// 税率
  var _taxRate = Decimal.zero;

  get pretaxPrice => _pretaxPrice;

  get afterTaxPrice => _afterTaxPrice;

  get taxRate => _taxRate;

  set taxRate(value) {
    _taxRate = value;
  }

  set afterTaxPrice(value) {
    _afterTaxPrice = value;
  }

  set pretaxPrice(value) {
    _pretaxPrice = value;
  }

  void setTaxRate(String value) {
    _taxRate = Decimal.parse(value);
  }

  void setPretaxPrice(String value) {
    _pretaxPrice = Decimal.parse(value);
  }

  void setAfterTaxPrice(String value) {
    _afterTaxPrice = Decimal.parse(value);
  }
}
