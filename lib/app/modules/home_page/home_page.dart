import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_request/app/data/models/todo_model.dart';
import 'package:web_request/app/modules/home_page/home_controller.dart';
import 'package:web_request/app/modules/home_page/local_widgets/on_error_widget.dart';
import 'package:web_request/app/modules/home_page/local_widgets/on_loading_widget.dart';
import 'package:web_request/app/modules/home_page/local_widgets/on_empty_widget.dart';
import 'package:web_request/app/modules/home_page/local_widgets/success_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Dados fake para inserção de registro
          TodoModel todo = TodoModel(
            userId: 3,
            title: 'lorem title',
            completed: true,
          );

          controller.postTodo(todo);
        },
      ),
      appBar: AppBar(
        title: Text('Web Request'),
      ),
      body: controller.obx(
        (state) => SuccessWidget(
          state: state!,
        ),
        onError: (_) => OnErrorWidget(),
        onLoading: OnLoadingWidget(),
        onEmpty: OnEmptyWidget(),
      ),
    );
  }
}
