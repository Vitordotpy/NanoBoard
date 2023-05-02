import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_board/controllers/constants/instances.dart';
import 'package:nano_board/views/styles/colors.dart';

class SidebarItem extends StatelessWidget {
  final String text;
  final IconData? icon;
  const SidebarItem({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Obx(() => InkWell(
          onTap: () => pageController.currentPage.value = text,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: pageController.currentPage.value != text
                      ? greyBackground
                      : blueNanoBoard,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    text,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: pageController.currentPage.value != text
                            ? greyBackground
                            : blueNanoBoard),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
