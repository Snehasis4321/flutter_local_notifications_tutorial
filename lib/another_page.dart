import 'package:flutter/material.dart';

class AnotherPage extends StatelessWidget {
  final String payload;
  const AnotherPage({super.key, required this.payload});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Another Page")),
      body: Center(child: Text(payload)),
    );
  }
}
