import 'package:flutter/material.dart';

class OnEmptyWidget extends StatelessWidget {
  const OnEmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Nenhum dado foi carregado!'),
      ),
    );
  }
}
