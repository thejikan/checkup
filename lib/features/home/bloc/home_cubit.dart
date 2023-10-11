import 'package:checkup/features/service/detailsService.dart';
import 'package:checkup/models/testDataConfig.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeViewCubit extends Cubit<HomeViewState> {
  HomeViewCubit(this._detailsService) : super(const HomeViewState()) {
    initialState();
  }

  final DetailsService _detailsService;

  void initialState() async {
    Map<String, List<TestDataConfig>> data = _detailsService.allData();
    List<TestDataConfig> data1 = [];
    for(int i = 0; i < 4; i++){
      data1.add(data['allData']![i]);
    }
    emit(state.copyWith(
      allTestsData: data['allData'],
      allData: data1,
      fullPackageData: data['fullPackageData'],
    ));
  }

  void addToCart(TestDataConfig data) {
    _detailsService.setMyCartData(data);

      emit(state.copyWith(
        myCartData: _detailsService.getMyCartData(),
      ));
  }

}
