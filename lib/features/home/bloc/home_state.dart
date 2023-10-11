part of 'home_cubit.dart';

class HomeViewState extends Equatable {
  final List<TestDataConfig> allData;
  final List<TestDataConfig> allTestsData;
  final List<TestDataConfig> fullPackageData;
  final List<TestDataConfig> myCartData;

  const HomeViewState({
    this.allData = const [],
    this.allTestsData = const [],
    this.fullPackageData = const [],
    this.myCartData = const [],
  });

  HomeViewState copyWith({
    List<TestDataConfig>? allData,
    List<TestDataConfig>? allTestsData,
    List<TestDataConfig>? fullPackageData,
    List<TestDataConfig>? myCartData,
  }) {
    return HomeViewState(
      allData: allData ?? this.allData,
      fullPackageData: fullPackageData ?? this.fullPackageData,
      myCartData: myCartData ?? this.myCartData,
      allTestsData: allTestsData ?? this.allTestsData,
    );
  }

  @override
  List<Object?> get props => [allData, fullPackageData, myCartData, allTestsData,];
}
