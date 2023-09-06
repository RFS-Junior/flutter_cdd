import 'package:flutter/material.dart';

class SomeAnimationAnimatedControllerScreen extends StatefulWidget {
  const SomeAnimationAnimatedControllerScreen({super.key});

  @override
  SomeAnimationAnimatedControllerScreenState createState() =>
      SomeAnimationAnimatedControllerScreenState();
}

class SomeAnimationAnimatedControllerScreenState
    extends State<SomeAnimationAnimatedControllerScreen>
    with SingleTickerProviderStateMixin {
  // 1 PONTO DE IPC (WIDGET ANIMADO) //
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0, end: 200).animate(_controller)
      ..addListener(() {
        setState(() {});
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplo de Animação com AnimatedController'),
      ),
      body: Center(
        child: Container(
          width: _animation.value,
          height: _animation.value,
          color: Colors.blue,
          alignment: Alignment.center,
          child: const Text(
            'Animado!',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
