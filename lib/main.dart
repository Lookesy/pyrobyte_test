import 'package:flutter/material.dart';
import 'vendingPage.dart';
import 'bottomSheet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.arrow_back, size: 35,)
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(onPressed: (){
                    showModalBottomSheet(
                        context: context,
                        builder: (context){
                          return SingleChildScrollViewExample();
                        }
                    );
                  }, icon: Icon(Icons.settings, size: 35,)
                  ),
                ),
              ],
            )
            )
        ],
      ),
      body: VendingPage(),
    );
  }
}

