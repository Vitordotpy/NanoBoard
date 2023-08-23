import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_board/constants/currencyslist.dart';
import 'package:nano_board/instances/instances.dart';

import '../../styles/colors.dart';

class TopBarProfile extends StatelessWidget {
  const TopBarProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(children: [
        Obx(() => DropdownButtonHideUnderline(
              child: DropdownButton(
                  padding: const EdgeInsets.all(5),
                  elevation: 0,
                  onChanged: (value) =>
                      userDAO.setCurrency(value), // não está reativo
                  value: userDAO.getCurrency(),
                  items: [1, 2]
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Row(children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Image(
                                  width: 20,
                                  height: 20,
                                  image: AssetImage(getCurrencyFlag[e]!),
                                  color: null,
                                ),
                              ),
                              Text(getCurrencyLocation[e]!),
                            ]),
                          ))
                      .toList()),
            )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Profile",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: darkBackground),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            child: Icon(Icons.person),
          ),
        )
      ]),
    );
  }
}
