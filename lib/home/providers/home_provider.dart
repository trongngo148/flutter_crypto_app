import 'package:flutter/foundation.dart';
import 'package:flutter_crypto_app/home/domain/models/models.dart';

import '../domain/models/big_data_model.dart';
import '../domain/repository/repository.dart';

class HomeProvider with ChangeNotifier {
  Repository repository = Repository();
  int indexLoop = 0;
  int maxItemPerPage = 10;
  late Future<BigDataModel> _newsCoin = repository.getCoins(indexLoop, maxItemPerPage);

  Future<BigDataModel> get newsCoin => _newsCoin;

  void loadNewsCoin() async {
    _newsCoin = repository.getCoins(indexLoop, maxItemPerPage);
    notifyListeners();
  }

  Future<bool> refreshOrLoadNewsCoin({bool isRefresh = false}) async {
    if (isRefresh) {
      indexLoop = 0;
    } else {
      indexLoop += 1;
    }
    loadNewsCoin();

    return true;
  }
}
