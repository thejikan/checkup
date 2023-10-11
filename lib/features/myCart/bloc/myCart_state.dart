part of 'myCart_cubit.dart';

class MyCartViewState extends Equatable {
  final List<TestDataConfig> myCartData;
  final double totalAmount;
  final double totalDiscount;

  const MyCartViewState({
    this.myCartData = const [],
    this.totalAmount = 0.0,
    this.totalDiscount = 0.0,
  });

  MyCartViewState copyWith({
    List<TestDataConfig>? myCartData,
    double? totalAmount,
    double? totalDiscount,
  }) {
    return MyCartViewState(
      myCartData: myCartData ?? this.myCartData,
      totalAmount: totalAmount ?? this.totalAmount,
      totalDiscount: totalDiscount ?? this.totalDiscount,
    );
  }

  @override
  List<Object?> get props => [myCartData, totalAmount, totalDiscount];
}
