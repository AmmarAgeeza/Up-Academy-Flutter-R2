//screen => Scaffold [Widget]
import 'package:flutter/material.dart';

class FlutterScrollableWidgets extends StatelessWidget {
  FlutterScrollableWidgets({super.key});
  List<Color> colors = [
    Colors.red,
    Colors.black,
    Colors.amber,
    Colors.greenAccent,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: const Text('Flutter Scrollable Widgets'),
        ),
        body: ListView(
          children: const [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red,
                radius: 35,
                child: Text('text'),
              ),
              title: Text('Drawer'),
              subtitle: Row(
                children: [
                  Icon(Icons.check),
                  Text('subtitle'),
                ],
              ),
              trailing: Icon(Icons.arrow_forward),
            ),
          ],
        ));
  }
}

class StackComponent extends StatelessWidget {
  const StackComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //background
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.red,
        ),
        const Align(
          alignment: Alignment.bottomRight,
          child: FlutterLogo(
            size: 70,
          ),
        ),
        const Align(
          alignment: Alignment.centerRight,
          child: FlutterLogo(
            size: 70,
          ),
        ),
        Positioned.directional(
          textDirection: Directionality.of(context),
          top: 57,
          start: 21,
          child: const FlutterLogo(
            size: 70,
          ),
        ),
      ],
    );
  }
}

class ListViewBuilder extends StatelessWidget {
  const ListViewBuilder({
    super.key,
    required this.colors,
  });

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Colors'),
        Expanded(
          child: ListView.builder(
              itemCount: colors.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 300,
                  width: 300,
                  margin: const EdgeInsets.all(8),
                  color: colors[index],
                );
              }),
        ),
        const Text('aljdbgs')
      ],
    );
  }
}

class ListViewComponent extends StatelessWidget {
  const ListViewComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      // scrollDirection: Axis.horizontal,
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          height: 300,
          width: 300,
          color: Colors.red,
        ),
        Container(
          margin: const EdgeInsets.all(8),
          height: 300,
          width: 300,
          color: Colors.red,
        ),
        Container(
          margin: const EdgeInsets.all(8),
          height: 300,
          width: 300,
          color: Colors.black,
        ),
        Container(
          margin: const EdgeInsets.all(8),
          height: 300,
          width: 300,
          color: Colors.yellow,
        ),
      ],
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.amber[300],
      child: const SafeArea(
          child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            //user account drawer header
            UserAccountsDrawerHeader(
              accountName: Text('Ammar Ahmed'),
              accountEmail: Text('ammar@gmail.com'),
            ),
            // drawer text
            Row(
              children: [
                Icon(Icons.menu),
                SizedBox(
                  width: 16,
                ),
                Text('Drawer'),
                // SizedBox(width: 150,),
                Spacer(),
                Text('Dummy Data'),
                Icon(Icons.arrow_forward),
              ],
            ),
            Divider(
              color: Colors.white,
              key: Key('spacer'),
              thickness: 5,
              indent: 50,
              endIndent: 100,
            ),
          ],
        ),
      )),
    );
  }
}
