import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:nano_board/constants/instances.dart';
import 'package:nano_board/styles/colors.dart';

class SidebarItem extends StatelessWidget {
  final String text;
  final IconData? icon;
  const SidebarItem({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Obx(() => InkWell(
          onTap: () => pageController.currentPage.value = text,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: pageController.currentPage.value != text
                    ? greyBackground
                    : blueNanoBoard,
              ),
              Text(
                text,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: pageController.currentPage.value != text
                        ? greyBackground
                        : blueNanoBoard),
              )
            ],
          ),
        ));
  }
}
