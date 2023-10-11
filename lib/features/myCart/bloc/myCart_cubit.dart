import 'package:checkup/features/service/detailsService.dart';
import 'package:checkup/models/testDataConfig.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'myCart_state.dart';

class MyCartViewCubit extends Cubit<MyCartViewState> {
  MyCartViewCubit(this._detailsService) : super(const MyCartViewState()) {
    initialState();
  }

  final DetailsService _detailsService;

  double _totalAmount = 0.0;
  double _totalDiscount = 0.0;

  void initialState() async {
    List<TestDataConfig> data = _detailsService.getMyCartData();
    for(var test in data){
      _totalAmount += test.amount;
      _totalDiscount += test.discount;
    }

    emit(state.copyWith(
      myCartData: data,
      totalAmount: _totalAmount,
      totalDiscount: _totalDiscount,
    ));
  }

  void removeData(TestDataConfig data) {
    _detailsService.removeMyCartData(data);

    emit(state.copyWith(
      myCartData: _detailsService.getMyCartData(),
    ));
  }

}
