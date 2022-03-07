import 'package:pharmacy/src/api/app_provider.dart';
import 'package:pharmacy/src/model/fav_model.dart';

import '../database/database_helper.dart';
import '../model/http_result.dart';


class Repository {
  final AppProvider _provider = AppProvider();
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Future<HttpResult> getLogin(String login) {
    return _provider.getLogin(login);
  }

  Future<HttpResult> getAccept(String login, String smsCode) =>
      _provider.getAccept(login, smsCode);

  Future<HttpResult> getSales() async => _provider.getSales();

  Future<HttpResult> getDrugs() async => _provider.getDrugs();

  Future<HttpResult> getPages() async => _provider.getPages();

  Future<HttpResult> getCatalog() async => _provider.getCatalog();

  Future<HttpResult> getRegion() async => _provider.getRegion();

  Future<List<FavModel>> getFav() async => _databaseHelper.getDrug();

  Future<int> savFav(FavModel data) async => _databaseHelper.saveDrug(data);

  Future<int> delete(int id) async => _databaseHelper.deleteDrug(id);
}
