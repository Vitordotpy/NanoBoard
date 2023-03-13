import 'package:flutter/material.dart';
import 'package:nano_board/constants/pageslist.dart';
import 'package:nano_board/styles/colors.dart';
import 'package:nano_board/widgets/sidebarItem.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkBackground,
      child: Container(
        width: 200,
        height: MediaQuery.of(context).size.height,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'NanoBoard',
                style: TextStyle(
                    color: blueNanoBoard,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView(
                  children: pagesNames
                      .map((e) => SidebarItem(text: e, icon: pagesIcons[e]))
                      .toList(),
                ),
              )
            ]),
      ),
    );
  }
}
