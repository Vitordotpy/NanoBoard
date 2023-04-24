import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_board/constants/instances.dart';
import 'package:nano_board/models/transaction.dart';
import 'package:nano_board/styles/colors.dart';
import 'package:nano_board/widgets/custom_textfield.dart';
import 'package:uuid/uuid.dart';

class AddTransaction extends StatelessWidget {
  const AddTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController typeController = TextEditingController(text: '');
    TextEditingController valueController = TextEditingController(text: '');

    FocusNode typeFocus = FocusNode();
    FocusNode valueFocus = FocusNode();

    Rx<DateTime> dateTime = Rx<DateTime>(DateTime.now());
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
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
                  labelText: 'Value - or +',
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
                          lastDate:
                              DateTime.now().add(const Duration(days: 30)),
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
                                    dateTime.value, [mm, '/', dd, '/', yyyy]))),
                          )),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5),
                width: 100,
                child: ElevatedButton(
                  onPressed: () {
                    if (typeController.text.isNotEmpty &&
                        valueController.text.isNotEmpty) {
                      currentUser.addTransaction(Transaction(
                          const Uuid().v1().toString(),
                          typeController.text,
                          double.parse(valueController.text),
                          dateTime.value));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      backgroundColor: blueNanoBoard),
                  child: const Center(child: Text('ADD')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
