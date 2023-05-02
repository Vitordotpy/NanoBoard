import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_board/controllers/constants/instances.dart';
import 'package:nano_board/views/components/app-components/topbar.dart';
import 'package:nano_board/views/styles/colors.dart';

import 'controllers/constants/pageslist.dart';
import 'views/components/app-components/sidebar.dart';

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
