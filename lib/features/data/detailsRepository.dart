import 'dart:convert';

import 'package:checkup/features/data/detailsProvider.dart';

class DetailsRepository implements IDetailsRepository {
  IDetailsProvider provider;

  DetailsRepository({
    required this.provider,
  });


}

abstract class IDetailsRepository {
}
