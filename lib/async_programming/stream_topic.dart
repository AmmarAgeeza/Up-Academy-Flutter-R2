// void main() {
//   // Future.delayed(const Duration(seconds:11),()=>3).then((data){print(data);});
//   // Stream.periodic(const Duration(seconds:1),(element)=>element).listen((event){
//   //   print(event);
//   // });
//   // final s1=Stream.periodic(const Duration(seconds:1),(element)=>element*element).take(5); //0 1 2 3 4
//   // s1.forEach((e){print(++e);});

//   final s2 = Stream.periodic(const Duration(seconds: 1), (element) => element)
//       .listen((_) => _);
//   s2.onData((element) {
//     element > 5 ? s2.cancel() : print(element);
//   });
// }
import 'package:flutter/material.dart';

class StreamTopic extends StatelessWidget {
  const StreamTopic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Stream Topic'),
      ),
        body: StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 1),(e)=>e.toString()),
      builder: (context, snapShot) {
        return 
        // snapShot.connectionState == ConnectionState.waiting
           !snapShot.hasData
          // snapShot.hasError
            ? const Center(child: CircularProgressIndicator())
            : Center(
                child: Text(
                  snapShot.data.toString(),
                  style: const TextStyle(
                    fontSize: 35,
                  ),
                ),
              );
      },
    ));
  }
}