import 'package:flutter/material.dart';

void main() {
  runApp(const RootWidget());
}

class RootWidget extends StatelessWidget {
  const RootWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Up Flutter Round Two',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          title: const Text('Welcome to Flutter'),
          // centerTitle: true,
          leading: const Icon(
            Icons.menu,
            size: 35,
            color: Color(0xff000000),
          ),
          actions: const [Icon(Icons.chat), Text('Chat')],
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 66),
                  child: Text(
                    'Hello ',
                    style: TextStyle(
                      // wordSpacing: 25,
                      color: Color(0xff2a392c),
                      fontSize: 25,
                      backgroundColor: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // SizedBox(
                //   height:35,
                // ),
                const Text(
                  ' Round ',
                  style: TextStyle(
                    // wordSpacing: 25,
                    color: Color(0xff2a392c),
                    fontSize: 25,
                    backgroundColor: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Container(
                  margin: const EdgeInsets.all(24),
                  padding: const EdgeInsets.all(10),
                  decoration:  BoxDecoration(
                    
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(55)
                  ),
                  // color: Colors.white,
                  width: 400,
                  height: 35,
                  child: const Text(
                    'My name is Ammar, i am Flutter Dev from Egypt',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
