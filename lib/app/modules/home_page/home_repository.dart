import 'package:web_request/app/data/provider/api_provider.dart';

class HomeRepository {
  final ApiProvider apiProvider;

  HomeRepository({required this.apiProvider});

  fetch() {
    return apiProvider.fetch();
  }
}
