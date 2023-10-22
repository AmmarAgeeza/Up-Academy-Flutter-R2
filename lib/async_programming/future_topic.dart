//isolate

// void main(){
//   //1.
//   print('object');
//   //2. //5 mins
//   int x=5;
//   // task();
//   //3.
//   print(x++);
// }

// void task(){
//   for(int i=0;i<20000000000;i++){
//     if(i==20000000000)
//     print(i);
//   }
// }
import 'package:flutter/material.dart';
//create state
//init state 
//buid 

class FutureTopic extends StatefulWidget {
  const FutureTopic({super.key});

  @override
  State<FutureTopic> createState() => _FutureTopicState();
}

class _FutureTopicState extends State<FutureTopic> {
  // @override
  // void initState() {
    
  //   super.initState();
  // Future.delayed(const Duration(seconds: 3), () => Navigator.push(context, MaterialPageRoute(builder: (_)=>Scaffold())));
  // }
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Future Topic'),
      ),
        body: RefreshIndicator(
          onRefresh: ()async{

          },
          child: FutureBuilder(
              future: Future.delayed(const Duration(seconds: 3), () => 3),
              builder: (context, snapShot) {
          return 
          snapShot.connectionState == ConnectionState.waiting
            //  snapShot.hasData
            // snapShot.hasError
              ? const Center(child: Text('Splash Screen'))
              : Center(
                  child: Text(
                    snapShot.data.toString(),
                    style: const TextStyle(
                      fontSize: 35,
                    ),
                  ),
                );
              },
            ),
        ));
  }
}
