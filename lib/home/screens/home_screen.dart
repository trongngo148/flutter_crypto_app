import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_crypto_app/home/domain/models/big_data_model.dart';
import 'package:flutter_crypto_app/home/domain/repository/repository.dart';
import 'package:flutter_crypto_app/home/providers/home_provider.dart';
import 'package:flutter_crypto_app/home/widgets/notification_bell.dart';
import 'package:provider/provider.dart';

import '../domain/models/models.dart';
import '../widgets/account_balance.dart';
import '../widgets/news_coins.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeProvider homeProvider;
  var coinData = <DataModel>[];
  @override
  void initState() {
    super.initState();
    homeProvider = Provider.of<HomeProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Consumer<HomeProvider>(builder: (context, provider, child) {
        return FutureBuilder<BigDataModel>(
          future: provider.newsCoin,
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (provider.indexLoop > 0) {
                  coinData.addAll(snapshot.data!.dataModel);
                } else {
                  coinData = snapshot.data!.dataModel;
                }
              }
              return body(coinData);
            }
            return Center(child: CircularProgressIndicator());
          }),
        );
      }),
    );
  }

  AppBar appBar() {
    return AppBar(
      leading: GestureDetector(
        child: Icon(Icons.menu),
      ),
      centerTitle: true,
      title: Text("My Money"),
      actions: const [
        SizedBox(
          height: 30,
          width: 30,
          child: CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage("assets/images/author.jpg"),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        NotificationBel()
      ],
    );
  }

  Widget body(List<DataModel> coins) {
    return SingleChildScrollView(
        child: Column(
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
        NewsCoins(
          coins: coins,
        )
      ],
    ));
  }
}
