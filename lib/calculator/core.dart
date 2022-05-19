import 'package:decimal/decimal.dart';

// 计算核心逻辑
class RateCalculatorModel {
  final _PriceModel _model = _PriceModel();

  void changePretaxPrice(String pretaxPrice) {
    _model.setPretaxPrice(pretaxPrice);
    _model.afterTaxPrice =
        _countAfterTaxPrice(_model.pretaxPrice, _model.taxRate);
  }

  void changeAfterTaxPrice(String afterTaxPrice) {
    _model.setAfterTaxPrice(afterTaxPrice);
    var pretaxPriceRational =
        _model.afterTaxPrice / (_model.taxRate + Decimal.one);
    var pretaxPrice = Decimal.parse(pretaxPriceRational.toDouble().toString());
    _model.pretaxPrice = pretaxPrice;
  }

  /// 改变税率
  /// <p>这里是税率单位是%,所以计算前需要先除100</p>
  void changeTaxRate(String taxRate) {
    var rate = Decimal.parse(taxRate);
    _model._taxRate = rate.shift(-2);
    _model.afterTaxPrice =
        _countAfterTaxPrice(_model.pretaxPrice, _model.taxRate);
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
    if (value.isEmpty) {
      _taxRate = Decimal.zero;
    } else {
      _taxRate = Decimal.parse(value);
    }
  }

  void setPretaxPrice(String value) {
    if (value.isEmpty) {
      _pretaxPrice = Decimal.zero;
    } else {
      _pretaxPrice = Decimal.parse(value);
    }
  }

  void setAfterTaxPrice(String value) {
    if (value.isEmpty) {
      _afterTaxPrice = Decimal.zero;
    } else {
      _afterTaxPrice = Decimal.parse(value);
      /**/
    }
  }
}
