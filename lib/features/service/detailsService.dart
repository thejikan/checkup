import 'package:checkup/features/data/detailsRepository.dart';
import 'package:checkup/models/detailsModel.dart';
import 'package:checkup/models/testDataConfig.dart';
import 'package:rxdart/subjects.dart';

class DetailsService {
  IDetailsRepository repository;

  late DetailsModel _detailsModel;
  late BehaviorSubject<DetailsModel> detailsController;

  DetailsService({required this.repository, DetailsModel? detailsModel}) {
    _detailsModel = detailsModel ?? DetailsModel.empty();
  }

  List<TestDataConfig> _cartData = [];
  List<TestDataConfig> _testsData = [];
  List<TestDataConfig> _fullPackageData = [];


  Map<String, List<TestDataConfig>> allData() {
    Map<String, List<TestDataConfig>> completeData = {};
    List<TestDataConfig> allData = [
      TestDataConfig(title: 'Thyroid Profile', tests: 3, amount: 1000, discount: 400, id: 1),
      TestDataConfig(title: 'Iron Study Test', tests: 4, amount: 600, discount: 200, id: 2),
      TestDataConfig(title: 'Thyroid Profile', tests: 3, amount: 1000, discount: 400, id: 3),
      TestDataConfig(title: 'Iron Study Test', tests: 4, amount: 600, discount: 200, id: 4),
      TestDataConfig(title: 'Thyroid Profile', tests: 3, amount: 1000, discount: 400, id: 5),
      TestDataConfig(title: 'Iron Study Test', tests: 4, amount: 600, discount: 200, id: 6),
    ];

    List<TestDataConfig> fullPackageData = [
      TestDataConfig(title: 'Full Body Checkup', tests: 92, amount: 4000, discount: 800, id: 11),
      TestDataConfig(title: 'Full Body Checkup', tests: 60, amount: 2600, discount: 600, id: 12),
      TestDataConfig(title: 'Full Body Checkup', tests: 72, amount: 3200, discount: 600, id: 13),
      TestDataConfig(title: 'Full Body Checkup', tests: 42, amount: 2000, discount: 400, id: 14),
    ];

    completeData['allData'] = allData;
    completeData['fullPackageData'] = fullPackageData;
    return completeData;
  }

  List<TestDataConfig> getAllData() {
    return _testsData;
  }

  void setAllData(List<TestDataConfig> data) {
    _testsData = data;
  }

  List<TestDataConfig> getFullPackageData() {
    return _fullPackageData;
  }

  void setFullPackageData(List<TestDataConfig> data) {
    _fullPackageData = data;
  }

  List<TestDataConfig> getMyCartData() {
    return _cartData;
  }

  void setMyCartData(TestDataConfig data) {
    bool flag = true;
    for(var test in _cartData){
      if(test.id == data.id){
        flag = false;
      }
    }
    if(flag){
      _cartData.add(data);
    }
  }

  void removeMyCartData(TestDataConfig data) {
    bool flag = true;
    for(var test in _cartData){
      if(test.id == data.id){
        flag = false;
      }
    }
    if(!flag){
      _cartData.remove(data);
    }
  }

}
