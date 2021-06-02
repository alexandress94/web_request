import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_request/app/modules/home_page/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetBuilder<HomeController>(
          id: 'requestKey',
          initState: (state) {
            Get.find<HomeController>().request();
          },
          builder: (controller) {
            return ElevatedButton(
              onPressed: () {
                controller.request();
              },
              child: Text('Obter requisição'),
            );
          },
        ),
      ),
    );
  }
}
