import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:nano_board/controllers/constants/instances.dart';
import 'package:nano_board/views/styles/colors.dart';

import 'topbarprofile.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 200,
      height: 50,
      color: white,
      child: Obx(
        () => Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                pageController.currentPage.value,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: darkBackground),
              ),
            ),
            const Expanded(child: SizedBox()),
            TopBarProfile()
          ],
        ),
      ),
    );
  }
}
