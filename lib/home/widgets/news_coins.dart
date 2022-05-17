import 'package:flutter/material.dart';
import 'package:flutter_crypto_app/home/providers/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../domain/models/models.dart';
import 'coin_card.dart';

class NewsCoins extends StatefulWidget {
  final List<DataModel> coins;
  const NewsCoins({Key? key, required this.coins}) : super(key: key);

  @override
  State<NewsCoins> createState() => _NewsCoinsState();
}

class _NewsCoinsState extends State<NewsCoins> {
  final RefreshController refreshController = RefreshController(initialRefresh: false);
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
                "New Cryptocurrencies (${widget.coins.length})",
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
            height: 450,
            width: double.infinity,
            child: SmartRefresher(
              enablePullUp: true,
              onRefresh: () async {
                bool result = await Provider.of<HomeProvider>(context, listen: false).refreshOrLoadNewsCoin(isRefresh: true);
                if (result) {
                  refreshController.refreshCompleted();
                } else {
                  refreshController.refreshFailed();
                }
              },
              onLoading: () async {
                bool result = await Provider.of<HomeProvider>(context, listen: false).refreshOrLoadNewsCoin();
                if (result) {
                  refreshController.loadComplete();
                } else {
                  refreshController.loadFailed();
                }
              },
              controller: refreshController,
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return CoinCard(
                      coin: widget.coins[index],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 15,
                    );
                  },
                  itemCount: widget.coins.length),
            ),
          ),
        ],
      ),
    );
  }
}
