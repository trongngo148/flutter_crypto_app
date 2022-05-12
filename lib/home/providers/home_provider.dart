import 'package:flutter/foundation.dart';

import '../domain/models/big_data_model.dart';
import '../domain/repository/repository.dart';

class HomeProvider with ChangeNotifier {
  Repository repository = Repository();
  int startItem = 1;
  int maxItemPerPage = 10;
  bool isRefresh = false;
  late Future<BigDataModel> _newsCoin = repository.getCoins(startItem, maxItemPerPage);

  Future<BigDataModel> get newsCoin => _newsCoin;

  void loadNewsCoin() async {
    _newsCoin = repository.getCoins(startItem * maxItemPerPage - 1, maxItemPerPage);
    notifyListeners();
  }

  Future<bool> refreshOrLoadNewsCoin({bool isRefresh = false}) async {
    if (isRefresh) {
      startItem = 1;
      isRefresh = true;
    } else {
      startItem += 1;
    }
    loadNewsCoin();

    return true;
  }
}
