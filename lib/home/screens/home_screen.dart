import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_crypto_app/dashboard/screens/dashboard_screen.dart';
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

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late HomeProvider homeProvider;
  var coinData = <DataModel>[];
  bool isCollapsed = true;
  late double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _menuScaleAnimation;

  @override
  void initState() {
    super.initState();
    homeProvider = Provider.of<HomeProvider>(context, listen: false);
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.6).animate(_controller);
    _menuScaleAnimation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(_controller);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;

    return Stack(
      children: [
        menu(context),
        AnimatedPositioned(
          top: 0,
          bottom: 0,
          left: isCollapsed ? 0 : 0.6 * screenWidth,
          right: isCollapsed ? 0 : -0.4 * screenWidth,
          duration: duration,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Material(
              animationDuration: duration,
              borderRadius: BorderRadius.all(Radius.circular(40)),
              elevation: 8,
              child: Scaffold(
                appBar: appBar(),
                body: body(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Consumer<HomeProvider> body() {
    return Consumer<HomeProvider>(builder: (context, provider, child) {
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
            List<Widget> pages = [
              DashboardScreen(coinData: coinData),
            ];
            return pages[0];
          }
          return Center(child: CircularProgressIndicator());
        }),
      );
    });
  }

  Widget menu(context) {
    return Scaffold(
      body: SlideTransition(
        position: _slideAnimation,
        child: ScaleTransition(
          scale: _menuScaleAnimation,
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Dashboard",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Coin Stats",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Utility Bills",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Funds Transfer",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Branches",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      leading: GestureDetector(
        child: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => setState(() {
            if (isCollapsed) {
              _controller.forward();
            } else {
              _controller.reverse();
            }
            isCollapsed = !isCollapsed;
          }),
        ),
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
}
