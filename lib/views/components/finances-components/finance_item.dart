import 'package:currency_formatter/currency_formatter.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_board/models/transaction_model.dart';
import 'package:nano_board/views/styles/colors.dart';

import '../../../controllers/constants/currencyslist.dart';
import '../../../controllers/constants/instances.dart';
import '../widgets/custom_text.dart';

class FinanceItem extends StatelessWidget {
  final TransactionModel transaction;
  const FinanceItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15, top: 10),
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(10),
        color: white,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: CustomText(text: "Type:"),
            ),
            Expanded(
                child: CustomText(
              text: transaction.getType(),
              color: darkBackground,
            )),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: CustomText(text: "Value:"),
            ),
            Expanded(
                child: Obx(
              () => CustomText(
                text: CurrencyFormatter.format(transaction.getValue(),
                    getCurrencySettings[userDAO.user.value.getCurrency()]!),
                color: transaction.getValue() < 0 ? Colors.red : Colors.green,
              ),
            )),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomText(text: "Date:"),
            ),
            Expanded(
              child: CustomText(
                  color: darkBackground,
                  text: formatDate(
                      transaction.getDateTime(), [dd, "/", mm, "/", yyyy])),
            )
          ],
        ),
      ),
    );
  }
}
