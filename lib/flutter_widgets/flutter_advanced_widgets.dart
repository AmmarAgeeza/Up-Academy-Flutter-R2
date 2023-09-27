import 'package:flutter/material.dart';

import 'second_screen.dart';

class FlutterAdvancedWidgets extends StatefulWidget {
  const FlutterAdvancedWidgets({super.key});

  @override
  State<FlutterAdvancedWidgets> createState() => _FlutterAdvancedWidgetsState();
}

class _FlutterAdvancedWidgetsState extends State<FlutterAdvancedWidgets> {
 
 List screens=[
   //screen1
              const Center(
                child: Text('Camera'),
              ),
              //screen2
              const Center(
                child: Text('Chat'),
              ),
              //screen3
              const Center(
                child: Text('Calls'),
              )
 ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          
         
        },
        items: const [
          //tab 1
          BottomNavigationBarItem(icon: Icon(Icons.camera), label: 'Camera'),
          //tab 2
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
          //tab 3
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Call'),
        ],
      ),
      appBar: AppBar(
        title: const Text(
          'Flutter Advanced Widgets',
        ),
      ),
      body: screens[currentIndex]
    );
  }
}

class CustomTabBarWidget extends StatelessWidget {
  const CustomTabBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    //step 1 => add DefaultTabController. [done]
    //setp 2 => add TabBar to bottom in appBar. [done]
    //step 3 => add TabBarView to body in Scaffold. [done]
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.camera_alt),
                  text: 'Camera',
                ),
                Tab(
                  icon: Icon(Icons.chat),
                  text: 'Chat',
                ),
                Tab(
                  icon: Icon(Icons.call),
                  text: 'Calls',
                ),
              ],
            ),
            title: const Text(
              'Flutter Advanced Widgets',
            ),
          ),
          body: const TabBarView(
            children: [
              //screen1
              Center(
                child: Text('Camera'),
              ),
              //screen2
              Center(
                child: Text('Chat'),
              ),
              //screen3
              Center(
                child: Text('Calls'),
              )
            ],
          )),
    );
  }
}

class CutomLogin extends StatefulWidget {
  const CutomLogin({super.key});

  @override
  State<CutomLogin> createState() => _CutomLoginState();
}

class _CutomLoginState extends State<CutomLogin> {
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var counter = 0;
  bool isShown = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            //email
            TextFormField(
              controller: email,
              validator: (data) {
                if (!data!.contains('@gmail.com')) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
            //password
            TextFormField(
              obscureText: isShown,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    isShown ? Icons.visibility_off_outlined : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      isShown = !isShown;
                    });
                  },
                ),
              ),
              controller: password,
              validator: (data) {
                if (data!.length < 6) {
                  return 'Please enter a valid password';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                // if (formKey.currentState!.validate()) {
                //   print('valid');
                // } else {
                //   print('not valid');
                // }
                // counter++;
                // setState(() {});
                // print(counter);

                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return SecondScreen(
                    email: email.text,
                    password: password.text,
                  );
                }));
              },
              child: const Text(
                'Login',
              ),
            ),
            Text(counter.toString()),
          ],
        ),
      ),
    );
  }
}

/*
1.Form
2.TextFormField
3.Statefull
4.password [eye icon] 
5.navigation
6.passing data from screen to another
7.TabBar
8.Bottom Navigation Bar
 */