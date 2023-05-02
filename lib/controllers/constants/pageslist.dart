import 'package:flutter/material.dart';
import '../../views/pages/analytics.dart';
import '../../views/pages/crypto.dart';
import '../../views/pages/finances.dart';
import '../../views/pages/help.dart';
import '../../views/pages/home.dart';
import '../../views/pages/invest.dart';
import '../../views/pages/profile.dart';
import '../../views/pages/schedule.dart';
import '../../views/pages/settings.dart';
import '../../views/pages/upgrade.dart';

const Map<String, Widget> pagesList = {
  "Home": Home(),
  "Finances": Finances(),
  "Analytics": Analytics(),
  "Invest": Invest(),
  "Crypto": Crypto(),
  "Schedule": Schedule(),
  "Profile": Profile(),
  "Upgrade": Upgrade(),
  "Help": Help(),
  "Settings": Settings()
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
];

const Map<String, Widget> optionsList = {
  "Upgrade": Upgrade(),
  "Help": Help(),
  "Settings": Settings()
};

const List<String> opstionsNames = ["Upgrade", "Help", "Settings"];

const Map<String, IconData> opstionsIcons = {
  "Upgrade": Icons.workspace_premium,
  "Help": Icons.help,
  "Settings": Icons.settings
};
