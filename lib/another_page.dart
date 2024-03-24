

import 'package:flutter/material.dart';


class AnotherPage extends StatelessWidget {
  const AnotherPage({super.key});

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(title: Text("Another Page")),
      body: Center(child: Text(data.toString())),
    );
  }
}
