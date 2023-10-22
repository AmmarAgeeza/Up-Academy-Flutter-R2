import 'package:flutter/material.dart';

class WidgetLifeCycle extends StatefulWidget {
  const WidgetLifeCycle({super.key});

  @override
  State<WidgetLifeCycle> createState() {
    print('createState');
    return _WidgetLifeCycleState();
  }
}

class _WidgetLifeCycleState extends State<WidgetLifeCycle> {
  int _counter = 0;
  void _increment() {
    _counter = _counter + 1;
    setState(() {
      print('setState');
    });
  }

  @override
  void initState() {
    print('initState');
    controller = TextEditingController(text: 'Ammar');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    print('dispose');
    controller.dispose();
    super.dispose();
  }

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
        appBar: AppBar(title: const Text('Screen1')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_counter.toString()),
              ElevatedButton(
                onPressed: _increment,
                child: const Text("Increment"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => Scaffold(
                              appBar: AppBar(
                                  automaticallyImplyLeading: false,
                                  title: const Text('Screen2')))));
                },
                child: const Text("Navigate"),
              ),
            ],
          ),
        ));
  }
}
