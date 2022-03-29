import 'package:flutter/material.dart';
import 'package:flutter_crypto_app/home/domain/models/big_data_model.dart';
import 'package:flutter_crypto_app/home/domain/repository/repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<BigDataModel> _futureCoins;
  late Repository repository;
  @override
  void initState() {
    // TODO: implement initState
    repository = Repository();
    _futureCoins = repository.getCoins();
    print(_futureCoins);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<BigDataModel>(
          future: _futureCoins,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var coinData = snapshot.data!.dataModel;
              return Text(coinData.toString());
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
