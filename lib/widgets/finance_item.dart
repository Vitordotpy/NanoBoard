import 'package:flutter/material.dart';
import 'package:nano_board/models/transaction.dart';

class FinanceItem extends StatelessWidget {
  final Transaction transaction;
  const FinanceItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
      children: [
        Text(
            "Type: ${transaction.getType()} Value: ${transaction.getValue()} Date: ${transaction.getDateTime().toString()}")
      ],
    ));
  }
}
