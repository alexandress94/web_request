import 'package:web_request/app/data/provider/api_provider.dart';

class RequestHomeRepository {
  final ApiProvider apiProvider;

  RequestHomeRepository({required this.apiProvider});

  fetch() {
    return apiProvider.fetch();
  }
}
