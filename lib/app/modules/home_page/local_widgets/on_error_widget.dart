import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_request/app/modules/home_page/home_controller.dart';
import 'package:web_request/app/routes/routes.dart';

class OnErrorWidget extends GetView<HomeController> {
  const OnErrorWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Falha na conexão! '),
          ElevatedButton.icon(
            icon: Icon(Icons.wifi_off),
            onPressed: () {
              print('onPressed');
              Get.offAndToNamed(Routes.HOME_PAGE);
            },
            label: Text('Tentar novamente!'),
          ),
        ],
      ),
    );
  }
}
