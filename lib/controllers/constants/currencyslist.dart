import 'package:currency_formatter/currency_formatter.dart';

Map<int, CurrencyFormatterSettings> getCurrencySettings = {
  1: CurrencyFormatterSettings.usd,
  2: CurrencyFormatterSettings(
      symbol: getCurrencySymbol[2]!,
      thousandSeparator: '.',
      symbolSeparator: ' ',
      decimalSeparator: ',')
};

Map<int, String> getCurrencySymbol = {1: '\$', 2: 'R\$'};

Map<int, String> getCurrencyLocation = {1: 'USD', 2: 'BRL'};

Map<int, String> getCurrencyFlag = {
  1: 'assets/currencyflags/united-states.png',
  2: 'assets/currencyflags/brazil.png'
};
