import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class loading_widget extends StatefulWidget {
  const loading_widget({super.key, required this.isLoading});
  final bool isLoading;
  @override
  State<loading_widget> createState() => _loading_widgetState();
}

class _loading_widgetState extends State<loading_widget> {
  @override
  Widget build(BuildContext context) {
    return widget.isLoading
        ? Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.3)),
          )
        : Container();
  }
}
