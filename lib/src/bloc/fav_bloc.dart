import 'package:pharmacy/src/api/repository.dart';
import 'package:rxdart/subjects.dart';

import '../model/fav_model.dart';

class FavBloc {
  final Repository _repository = Repository();
  final _fetchFave = PublishSubject<List<FavModel>>();

  Stream<List<FavModel>> get allFave => _fetchFave.stream;

  getFav() async {
    List<FavModel> data = await _repository.getFav();
    _fetchFave.sink.add(data);
  }
}

final favBloc = FavBloc();
