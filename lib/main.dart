import 'package:flutter/material.dart';
import 'package:magic_8_ball/respostas.dart';
import 'package:shake_gesture/shake_gesture.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Bola 8 Mágica'),
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
  String resposta = "Faz-me uma pergunta";

  void _shakeorbutton() async {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      resposta = Respostas.obterFraseAleatoria();
    });
    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      resposta = "Faz uma nova pergunta";
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Center(
              child: Text(
            widget.title,
          )),
        ),
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Image.asset('assets/images/bola8.png', fit: BoxFit.cover),
              SizedBox(
                  width: 75,
                  child: Text(
                    resposta,
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                    textScaler: const TextScaler.linear(0.65),
                    maxLines: 4,
                    textWidthBasis: TextWidthBasis.longestLine,
                  ))
            ],
          ),
        ),
        floatingActionButton: ShakeGesture(
            child: const Text(""),
            onShake: () {
              _shakeorbutton();
            }));
  }
}
