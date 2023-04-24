import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_board/constants/instances.dart';
import 'package:nano_board/styles/colors.dart';
import 'package:nano_board/widgets/sidebar.dart';
import 'package:nano_board/widgets/topbar.dart';

import 'constants/pageslist.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: greyBackground,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            SideBar(),
            Column(
              children: [
                TopBar(),
                Obx(() => pagesList[pageController.currentPage.value]!)
              ],
            )
          ],
        ),
      ),
    );
  }
}
