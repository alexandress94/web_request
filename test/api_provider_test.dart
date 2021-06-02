import 'package:flutter_test/flutter_test.dart';
import 'package:web_request/app/data/provider/api_provider.dart';

void main() {
  final _apiProvider = ApiProvider();
  test(
    'return todoModel',
    () async {
      final todoLists = await _apiProvider.fetch();
      print(todoLists[2].title);
    },
  );
}
