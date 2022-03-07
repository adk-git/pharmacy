import 'package:pharmacy/src/api/repository.dart';
import 'package:rxdart/rxdart.dart';

import '../model/catalog_model.dart';

class CatalogBloc {
  final Repository _repository = Repository();

  final _fetchCatalog = PublishSubject<CatalogModel>();

  Stream<CatalogModel> get allCatalog => _fetchCatalog.stream;

  getCatalog() async {
    var response = await _repository.getCatalog();

    if (response.isSuccess) {
      CatalogModel catalogModel = CatalogModel.fromJson(response.result);
      _fetchCatalog.sink.add(catalogModel);
    }
  }
}

final catalogBloc = CatalogBloc();
