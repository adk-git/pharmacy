import 'package:pharmacy/src/api/repository.dart';
import 'package:pharmacy/src/model/fav_model.dart';
import 'package:pharmacy/src/model/http_result.dart';
import 'package:rxdart/rxdart.dart';
import '../model/drug_model.dart';
import '../model/pages_model.dart';
import '../model/sale_model.dart';

class HomeBloc {
  final Repository _repository = Repository();

  final _fetchSale = PublishSubject<SaleModel>();

  Stream<SaleModel> get allSale => _fetchSale.stream;

  getSale() async {
    HttpResult response = await _repository.getSales();
    if (response.isSuccess) {
      SaleModel saleModel = SaleModel.fromJson(response.result);
      _fetchSale.sink.add(saleModel);
    }
  }

  final _fetchDrugs = PublishSubject<DrugModel>();

  Stream<DrugModel> get allDrugs => _fetchDrugs.stream;

  getDrugs() async {
    var response = await Repository().getDrugs();

    if (response.isSuccess) {
      DrugModel drugModel = DrugModel.fromJson(response.result);
      List<FavModel> data = await _repository.getFav();
      for (int i = 0; i < drugModel.results.length; i++) {
        for (int j = 0; j < data.length; j++) {
          if (drugModel.results[i].id == data[j].id) {
            drugModel.results[i].favourite = true;
          }
        }
      }
      _fetchDrugs.sink.add(drugModel);
    }
  }

  saveFav(DrugModel data, int index) {
    if (data.results[index].favourite) {
      _repository.delete(data.results[index].id);
    } else {
      _repository.savFav(
        FavModel(
          id: data.results[index].id,
          image: data.results[index].image,
          name: data.results[index].name,
        ),
      );
    }
    data.results[index].favourite = !data.results[index].favourite;
    _fetchDrugs.sink.add(data);
  }

  final _fetchPages = PublishSubject<PagesModel>();

  Stream<PagesModel> get allPages => _fetchPages.stream;

  getPages() async {
    var response = await Repository().getPages();
    if (response.isSuccess) {
      PagesModel pagesModel = PagesModel.fromJson(response.result);
      _fetchPages.sink.add(pagesModel);
    }
  }
}

final homeBloc = HomeBloc();
