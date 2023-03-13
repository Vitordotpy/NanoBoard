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
                      .where((e) =>
                          e != "Upgrade" || e != "Settings" || e != "Help")
                      .toList()
                      .map((e) => SidebarItem(text: e, icon: pagesIcons[e]))
                      .toList(),
                ),
              ),
              const SidebarItem(text: 'Upgrade', icon: Icons.workspace_premium),
              const SidebarItem(text: 'Settings', icon: Icons.settings),
              const SidebarItem(text: 'Help', icon: Icons.help),
              const SizedBox(
                height: 8,
              )
            ]),
      ),
    );
  }
}
