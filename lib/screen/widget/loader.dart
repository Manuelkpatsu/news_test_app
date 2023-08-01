import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final String keyValue;

  const Loader({super.key, required this.keyValue});

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator(key: Key(keyValue)));
  }
}
