import 'package:flutter/material.dart';
import 'package:flutter_crypto_app/constants/constants.dart';

class NotificationBel extends StatelessWidget {
  const NotificationBel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(right: 16.0, top: 20.0),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Icon(Icons.notifications),
            Container(width: 10.0, height: 10.0, decoration: BoxDecoration(shape: BoxShape.circle, color: kDangerColor))
          ],
        ),
      ),
    );
  }
}
