import 'package:flutter/material.dart';
import 'package:nano_board/styles/colors.dart';
import 'package:nano_board/widgets/custom_text.dart';

class CustomTextField extends StatelessWidget {
  final String outsideText;
  final String labelText;
  final IconData? labelIcon;
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final TextInputType textInputType;
  const CustomTextField({
    super.key,
    required this.outsideText,
    required this.labelText,
    this.labelIcon,
    required this.textEditingController,
    required this.focusNode,
    required this.textInputType,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 5.0),
              child: CustomText(
                text: outsideText,
                color: darkBackground,
              ),
            ),
            Expanded(
              child: TextField(
                cursorColor: blueNanoBoard,
                controller: textEditingController,
                focusNode: focusNode,
                keyboardType: textInputType,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 5),
                    labelText: labelText,
                    floatingLabelStyle: TextStyle(color: blueNanoBoard),
                    labelStyle: TextStyle(color: darkBackground),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: blueNanoBoard)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: darkBackground))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
