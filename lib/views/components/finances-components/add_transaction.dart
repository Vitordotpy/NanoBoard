import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:nano_board/controllers/constants/currencyslist.dart';
import 'package:nano_board/controllers/constants/instances.dart';
import 'package:nano_board/models/transaction_model.dart';
import 'package:nano_board/views/styles/colors.dart';
import 'package:uuid/uuid.dart';

import '../widgets/custom_textfield.dart';

class AddTransaction extends StatelessWidget {
  const AddTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController typeController = TextEditingController(text: '');
    var valueController = MoneyMaskedTextController(
        thousandSeparator: ',',
        decimalSeparator: '.',
        leftSymbol: getCurrencySymbol[userDAO.user.value.getCurrency()]!);

    FocusNode typeFocus = FocusNode();
    FocusNode valueFocus = FocusNode();

    Rx<DateTime> dateTime = Rx<DateTime>(DateTime.now());
    return Container(
      color: white,
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 200,
        height: 50,
        child: Row(
          children: [
            CustomTextField(
                outsideText: 'Type',
                labelText: 'Type',
                textEditingController: typeController,
                focusNode: typeFocus,
                textInputType: TextInputType.text),
            CustomTextField(
                outsideText: 'Value',
                labelText: 'Value',
                textEditingController: valueController,
                focusNode: valueFocus,
                textInputType: TextInputType.number),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: SizedBox(
                child: Material(
                  elevation: 1,
                  borderRadius: BorderRadius.circular(8),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(8),
                    hoverColor: blueNanoBoard.withOpacity(0.2),
                    onTap: () async {
                      DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate:
                            DateTime.now().subtract(const Duration(days: 30)),
                        lastDate: DateTime.now().add(const Duration(days: 30)),
                      );
                      if (newDate != null) {
                        dateTime.value = newDate;
                      } else {
                        return;
                      }
                    },
                    child: Obx(() => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                              child: Text(formatDate(
                                  dateTime.value, [dd, '/', mm, '/', yyyy]))),
                        )),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              width: 110,
              child: ElevatedButton(
                onPressed: () {
                  if (typeController.text.isNotEmpty &&
                      valueController.text.isNotEmpty) {
                    userDAO.user.value.addTransaction(TransactionModel(
                        id: const Uuid().v1().toString(),
                        description: typeController.text,
                        value: valueController.numberValue,
                        dateTime: dateTime.value));

                    userDAO.user.value.setBalance(valueController.numberValue);
                  }
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: blueNanoBoard),
                child: const Center(child: Text('ADD')),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5),
              width: 110,
              child: ElevatedButton(
                onPressed: () {
                  if (typeController.text.isNotEmpty &&
                      valueController.text.isNotEmpty) {
                    userDAO.user.value.addTransaction(TransactionModel(
                        id: const Uuid().v1().toString(),
                        description: typeController.text,
                        value: -valueController.numberValue,
                        dateTime: dateTime.value));
                    userDAO.user.value.setBalance(-valueController.numberValue);
                  }
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    backgroundColor: blueNanoBoard),
                child: const Center(child: Text('SUBTRACT')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
