// main.dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // Remove the debug banner
        debugShowCheckedModeBanner: false,
        title: 'Animations',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: const HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

// Don't forget "with TickerProviderStateMixin"
class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  // Create a controller
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: false);

  // Create an animation with value of type "double"
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation'),
      ),
      body: Center(
        child: RotationTransition(
          turns: _animation,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                      color: Colors.amber, shape: BoxShape.circle),
                ),
                Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                      color: Colors.green, shape: BoxShape.circle),
                ),
                Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                      color: Colors.indigo, shape: BoxShape.circle),
                ),
                Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                      color: Colors.red, shape: BoxShape.circle),
                )
              ],
            ),
          ),
        ),
      ),
      // This button is used to pause/resume the animation
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.moving),
        onPressed: () {
          if (_controller.isAnimating) {
            _controller.stop(); // Stop the animation
          } else {
            _controller.repeat(); // Start the animation
          }
        },
      ),
    );
  }

// dispose the animation controller
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
