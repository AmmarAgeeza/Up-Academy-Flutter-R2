import 'package:flutter/material.dart';

class FlutterInteactiveWidgets extends StatelessWidget {
  FlutterInteactiveWidgets({super.key});
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            tooltip: 'This is a FAB',
            onPressed: () {
              print(emailController.text);
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              emailController.clear();
            },
            child: const Icon(Icons.minimize),
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text('Flutter Inteactive Widgets'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: emailController,
                cursorColor: Colors.red,
                decoration:  InputDecoration(
                  prefixIcon: const Icon(Icons.mail),
                  hintText: 'EnterYourEmail',
                  labelText: 'E-mail',
                  enabledBorder: const OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(35)
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButtons extends StatelessWidget {
  const CustomButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //!Outlined
        OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
        //! TextButton
        TextButton(
          onPressed: () {},
          child: const Text(
            'Click',
            style: TextStyle(fontSize: 55),
          ),
        ),
        InkWell(
          child: const Text(
            'Inkwell?',
            style: TextStyle(fontSize: 55),
          ),
          onTap: () {
            print('Inkwell');
          },
        ),
        GestureDetector(
          child: const Text(
            'GestureDetector?',
            style: TextStyle(fontSize: 55),
          ),
          onTap: () {
            print('GestureDetector');
          },
          onLongPress: () {
            print('onLongPress');
          },
        ),
        //! Icon Button
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            print('IconButton');
          },
        ),
        MaterialButton(
          onPressed: () {},
          color: Colors.amber,
          child: const Text('Login Login Login Login'),
        ),
        SizedBox(
          width: 250,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            onPressed: () {},
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Next'),
                Icon(Icons.arrow_forward),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/image.png',
          height: 300,
          width: 300,
          fit: BoxFit.cover,
        ),
        const CircleAvatar(
          backgroundImage: AssetImage('assets/images/image.png'),
          radius: 50,
        ),
        Container(
          height: 300,
          width: 300,
          // alignment: Alignment.center,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/image.png'))),
          child: const Text(
            'Image',
            style: TextStyle(color: Colors.black, fontSize: 55),
          ),
        ),
      ],
    );
  }
}
