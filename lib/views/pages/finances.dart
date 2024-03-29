import 'package:currency_formatter/currency_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_board/instances/instances.dart';
import 'package:nano_board/views/styles/colors.dart';
import 'package:nano_board/views/components/finances-components/add_transaction.dart';
import 'package:nano_board/views/components/finances-components/finance_item.dart';

import '../../constants/currencyslist.dart';
import '../components/widgets/custom_text.dart';

class Finances extends StatelessWidget {
  const Finances({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 200,
      height: MediaQuery.of(context).size.height - 50,
      child: Column(
        children: [
          Container(
            color: white,
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(
                () => CustomText(
                    text:
                        'Balance: ${CurrencyFormatter.format(userDAO.getBalance(), getCurrencySettings[userDAO.getCurrency()]!)}'),
              ),
            ),
          ),
          const AddTransaction(),
          Obx(
            () => Wrap(
              children: userDAO.getUserFinances().isNotEmpty
                  ? userDAO
                      .getUserFinances()
                      .map((element) => FinanceItem(
                            transaction: element,
                          ))
                      .toList()
                  : [
                      const CustomText(
                        text: "You don't added a transaction yet",
                      )
                    ],
            ),
          )
        ],
      ),
    );
  }
}
