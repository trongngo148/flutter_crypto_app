import 'package:flutter/material.dart';
import 'package:flutter_crypto_app/home/domain/models/data_model.dart';

import '../../home/widgets/account_balance.dart';
import '../../home/widgets/news_coins.dart';

class DashboardScreen extends StatefulWidget {
  final List<DataModel> coinData;
  const DashboardScreen({Key? key, required this.coinData}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 25.0,
        ),
        AccountBalance(),
        SizedBox(
          height: 40.0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Divider(color: Color.fromRGBO(97, 99, 119, 1)),
        ),
        SizedBox(
          height: 15.0,
        ),
        Flexible(
          child: NewsCoins(
            coins: widget.coinData,
          ),
        )
      ],
    );
  }
}
