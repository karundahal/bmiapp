import 'package:bmsapp/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMS CALCULATOR',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: splash(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  var bgColor = Colors.purple.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Container(
          color: bgColor,
          child: Center(
            child: SizedBox(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'BMI CALCULATOR',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                      color: Colors.deepPurple,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: wtController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.purple,
                        )
                      ),
                      label: const Text('Enter your weight in kgs',style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: Colors.deepPurple,
                      )),
                      prefixIcon: const Icon(Icons.line_weight),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  TextField(
                    controller: ftController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color:Colors.purple,
                        )
                      ),
                      label: const Text('Enter your height in feet',style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                          color: Colors.deepPurple,
                      ),),
                      prefixIcon: const Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  TextField(
                    controller: inController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color:Colors.purple,
                        )
                      ),
                      label: const Text('Enter your height in inch',style: TextStyle(
                          fontSize:19 ,
                          fontWeight: FontWeight.w500,
                        color: Colors.deepPurple,
                      )),
                      prefixIcon: const Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        var wt = wtController.text.toString();
                        var ft = ftController.text.toString();
                        var inc = inController.text.toString();

                        if (wt != "" && ft != "" && inc != "") {
                          var iwt = int.parse(wt);
                          var ift = int.parse(ft);
                          var iin = int.parse(inc);

                          var tinch = (ift * 12) + iin;
                          var tcm = tinch * 2.54;
                          var tm = tcm / 100;

                          var bmi = iwt / (tm * tm);
                          result = "Your BMI is $bmi";

                          String message;
                          if (bmi > 25) {
                            message = "You are Over Weight";
                            bgColor = Colors.orange.shade200;
                          } else if (bmi < 18) {
                            message = "You are Under Weight";
                            bgColor = Colors.red.shade200;
                          } else {
                            message = "You are Healthy";
                            bgColor = Colors.green.shade200;
                          }
                          setState(() {
                            result =
                            "$message \n Your BMI is ${bmi.toStringAsFixed(4)}";
                          });
                        } else {
                          setState(() {
                            result = "Please fill all the blanks!!!";
                            bgColor = Colors.white10;
                          });
                        }
                      },
                      child: const Text("Calculate",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),)),
                  const SizedBox(
                    height: 11,
                  ),
                  Text(
                    result,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text("©Powered By Karun Dahal",style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w900,
                    color: Colors.deepPurple,
                  ),),
                ],
              ),
            ),
          ),
        ));
  }
}
