import 'package:flutter/material.dart';
import '../domain/models/models.dart';
import 'coin_card.dart';

class NewsCoins extends StatelessWidget {
  final List<DataModel> coins;
  const NewsCoins({Key? key, required this.coins}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "New Cryptocurrencies (${coins.length})",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              // Text(
              //   "Total Amount \$378.15",
              //   style: _theme.textTheme.caption,
              // ),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            height: 600,
            width: double.infinity,
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return CoinCard(
                    coin: coins[index],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 15,
                  );
                },
                itemCount: coins.length),
          ),
        ],
      ),
    );
  }
}
