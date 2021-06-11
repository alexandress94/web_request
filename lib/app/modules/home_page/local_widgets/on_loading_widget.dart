import 'package:flutter/material.dart';
import 'package:web_request/app/core/theme/app_color.dart';

class OnLoadingWidget extends StatelessWidget {
  const OnLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: appPrimeryColor,
      ),
    );
  }
}
