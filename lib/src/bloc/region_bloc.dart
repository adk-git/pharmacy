import 'dart:convert';

import 'package:pharmacy/src/api/repository.dart';
import 'package:pharmacy/src/model/region_model.dart';
import 'package:rxdart/rxdart.dart';

class RegionBloc {
  final Repository _repository = Repository();

  final _fetchRegion = PublishSubject<List<RegionModel>>();

  Stream<List<RegionModel>> get allRegion => _fetchRegion.stream;

  getRegion() async {
    var response = await _repository.getRegion();
    if (response.isSuccess) {
      List<RegionModel> regionModel =
          regionModelFromJson(json.encode(response.result));
      _fetchRegion.sink.add(regionModel);
    }
  }
}

final regionBloc = RegionBloc();
