import 'package:flutter/material.dart';

import '../styles/colors.dart';

class TopBarProfile extends StatelessWidget {
  const TopBarProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(children: [
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            child: Icon(Icons.person),
          ),
        )
      ]),
    );
  }
}
