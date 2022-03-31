import 'package:flutter/material.dart';
import 'package:flutter_crypto_app/constants/constants.dart';

class AccountBalance extends StatelessWidget {
  const AccountBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Balance",
          style: _theme.textTheme.caption,
        ),
        SizedBox(
          height: 6.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$378.15",
              style: TextStyle(color: Colors.white, fontSize: 26.0),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                decoration: BoxDecoration(color: Color.fromRGBO(55, 66, 92, 78), borderRadius: BorderRadius.circular(20.0)),
                child: Center(
                  child: Text(
                    "+ Add Bank",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 3.0,
        ),
        Row(
          children: [
            Text(
              "+2.14%",
              style: TextStyle(color: kSuccessColor, fontSize: 16.0),
            ),
            Icon(
              Icons.keyboard_arrow_up,
              color: kSuccessColor,
            )
          ],
        )
      ]),
    );
  }
}
