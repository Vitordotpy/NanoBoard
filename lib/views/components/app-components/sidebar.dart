import 'package:flutter/material.dart';
import 'package:nano_board/constants/pageslist.dart';
import 'package:nano_board/views/components/app-components/sidebarItem.dart';
import 'package:nano_board/views/styles/colors.dart';

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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'NanoBoard',
                  style: TextStyle(
                      color: blueNanoBoard,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Divider(
                height: 2,
                color: white,
              ),
              Expanded(
                child: ListView(
                  children: pagesNames
                      .map((e) => SidebarItem(text: e, icon: pagesIcons[e]))
                      .toList(),
                ),
              ),
              Column(
                children: opstionsNames
                    .map((e) => SidebarItem(text: e, icon: opstionsIcons[e]))
                    .toList(),
              ),
              const SizedBox(
                height: 8,
              )
            ]),
      ),
    );
  }
}
