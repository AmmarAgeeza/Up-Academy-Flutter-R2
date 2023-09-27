import 'package:flutter/material.dart';

import 'flutter_widgets/flutter_advanced_widgets.dart';

void main() {
  runApp(const RootWidget());
}

class RootWidget extends StatelessWidget {
  const RootWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      title: 'Up Flutter Round Two',
      debugShowCheckedModeBanner: false,
     
      home: FlutterAdvancedWidgets(),
    );
  }
}
