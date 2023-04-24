import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_board/constants/instances.dart';
import 'package:nano_board/widgets/add_transaction.dart';
import 'package:nano_board/widgets/finance_item.dart';

class Finances extends StatelessWidget {
  const Finances({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 200,
      height: MediaQuery.of(context).size.height - 50,
      child: Column(
        children: [
          const AddTransaction(),
          Obx(
            () => Wrap(
              children: currentUser.getUserFinances().isNotEmpty
                  ? currentUser
                      .getUserFinances()
                      .map((element) => FinanceItem(
                            transaction: element,
                          ))
                      .toList()
                  : [
                      const Text(
                        "You don't added a transaction yet",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
            ),
          )
        ],
      ),
    );
  }
}
