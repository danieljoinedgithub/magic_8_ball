import 'package:flutter/material.dart';
import 'package:shake_gesture/shake_gesture.dart';
import 'package:magic_8_ball/respostas.dart';

class ShakeHandler extends StatefulWidget {
  static String resposta = "Faz-me uma pergunta e abana-me";

  @override
  _ShakeHandlerState createState() => _ShakeHandlerState();
}

class _ShakeHandlerState extends State<ShakeHandler> {
  DateTime _lastShakeTime = DateTime.now().subtract(Duration(seconds: 6));

  void _onShakeTriggered() {
    final currentTime = DateTime.now();
    if (currentTime.difference(_lastShakeTime).inSeconds >= 6) {
      _lastShakeTime = currentTime;
      _shakeorbutton(); // Trigger the shake handler
    }
  }

  void _shakeorbutton() async {
    print("\n\nShook");
    setState(() {
      ShakeHandler.resposta =
          Respostas.obterFraseAleatoria(); // Update the text
    });

    await Future.delayed(const Duration(seconds: 5));

    setState(() {
      ShakeHandler.resposta = "Faz-me uma nova pergunta"; // Reset the text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Image.asset('assets/images/bola8.png', fit: BoxFit.cover),
        SizedBox(
          width: 75,
          child: ShakeGesture(
            onShake: _onShakeTriggered,
            child: Text(
              ShakeHandler.resposta, // Display the current response text
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
              textScaler: const TextScaler.linear(0.65),
              maxLines: 4,
              textWidthBasis: TextWidthBasis.longestLine,
            ),
          ),
        )
      ],
    );
  }
}
