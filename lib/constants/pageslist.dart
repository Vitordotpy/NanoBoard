import 'package:flutter/material.dart';
import 'package:nano_board/views/analytics.dart';
import 'package:nano_board/views/crypto.dart';
import 'package:nano_board/views/finances.dart';
import 'package:nano_board/views/home.dart';
import 'package:nano_board/views/invest.dart';
import 'package:nano_board/views/profile.dart';
import 'package:nano_board/views/schedule.dart';
import 'package:nano_board/views/upgrade.dart';

const Map<String, Widget> pagesList = {
  "Home": Home(),
  "Finances": Finances(),
  "Analytics": Analytics(),
  "Invest": Invest(),
  "Crypto": Crypto(),
  "Schedule": Schedule(),
  "Profile": Profile(),
  "Upgrade": Upgrade(),
  "Settings": Upgrade(),
  "Help": Upgrade()
};
const Map<String, IconData> pagesIcons = {
  "Home": Icons.home,
  "Finances": Icons.wallet,
  "Analytics": Icons.analytics,
  "Invest": Icons.trending_up,
  "Crypto": Icons.currency_bitcoin,
  "Schedule": Icons.schedule,
  "Profile": Icons.person,
};
const List<String> pagesNames = [
  "Home",
  "Finances",
  "Analytics",
  "Invest",
  "Crypto",
  "Schedule",
  "Profile",
  "Upgrade",
  "Settings",
  "Help"
];
