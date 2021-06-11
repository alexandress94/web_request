import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_request/app/data/models/todo_model.dart';
import 'package:web_request/app/modules/home_page/home_controller.dart';

class SuccessWidget extends StatelessWidget {
  final List<TodoModel> state;
  SuccessWidget({Key? key, required this.state}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: _detailsTodo(),
    );
  }

  Widget _detailsTodo() {
    return ListView.separated(
      itemBuilder: (BuildContext _, int index) {
        final TodoModel items = state[index];
        bool isCompleted = items.completed == true;
        MaterialColor color = isCompleted ? Colors.green : Colors.red;
        IconData icon = isCompleted ? Icons.check : Icons.close;
        return Container(
          height: 100,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Icon(icon, color: color),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  '${items.title}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              Row(
                children: [
                  GetBuilder<HomeController>(
                    id: 'patch',
                    builder: (_) => TextButton(
                      onPressed: () {
                        _.patchTodo(items);
                      },
                      child: Text('Patch'),
                    ),
                  ),
                  GetBuilder<HomeController>(
                    id: 'Put',
                    builder: (_) => TextButton(
                      onPressed: () {
                        _.putTodo(items);
                      },
                      child: Text('Put'),
                    ),
                  ),
                  GetBuilder<HomeController>(
                    id: "delete",
                    builder: (_) => TextButton(
                      onPressed: () {
                        _.deleteTodo(items);
                      },
                      child: Text('Del'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      separatorBuilder: (BuildContext _, int index) {
        return Divider(thickness: 1, height: 1);
      },
      itemCount: state.length,
    );
  }
}
