import 'package:flutter/material.dart';
import 'package:flutte_async/services/mockapi.dart';
import 'package:flutter/services.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> with TickerProviderStateMixin {
  late AnimationController controller, controller2, controller3;
  late Animation colorAnimation, colorAnimation2, colorAnimation3;
  late Animation sizeAnimation, sizeAnimation2, sizeAnimation3;

  var valor1 = 0, 
  valor2 = 0, 
  valor3 = 0;

  final height = 25;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    controller2 =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    controller3 =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    colorAnimation =
        ColorTween(begin: Colors.white, end: Color.fromARGB(255, 244, 205, 36)).animate(controller);
    colorAnimation2 =
        ColorTween(begin: Colors.white, end: const Color.fromARGB(255, 246, 135, 127)).animate(controller2);
    colorAnimation3 =
        ColorTween(begin: Colors.white, end: Color.fromARGB(255, 238, 8, 184)).animate(controller3);

    sizeAnimation = Tween<double>(begin: 20, end: 300).animate(controller);
    sizeAnimation2 = Tween<double>(begin: 20, end: 300).animate(controller2);
    sizeAnimation3 = Tween<double>(begin: 20, end: 300).animate(controller3);

    controller.addListener(() {
      setState(() {});
    });
    controller2.addListener(() {
      setState(() {});
    });
    controller3.addListener(() {
      setState(() {});
    });
  }

  Widget clickMorado() {
    return GestureDetector(
      child: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 211, 0, 244),
        foregroundColor: Colors.black,
        onPressed: () {
          sizeAnimation = Tween<double>(begin: 1, end: 500).animate(controller);

          controller.reset();
          colorAnimation = ColorTween(begin: const Color.fromARGB(255, 153, 76, 175), end: Colors.white)
              .animate(controller);

          controller.forward();

          MockApi().getFerrariInteger().then((value) => {
                setState((() {
                  valor1 = value;
                })),
              });
        },
        child: const Icon(Icons.add_business),
      ),
    );
  }

  Widget clickRosado() {
    return GestureDetector(
      child: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 169, 65, 127),
        foregroundColor: Colors.black,
        onPressed: () {
          sizeAnimation2 =
              Tween<double>(begin: 1, end: 500).animate(controller2);

          controller2.reset();
          colorAnimation2 = ColorTween(begin: const Color.fromARGB(255, 255, 0, 187), end: Colors.white)
              .animate(controller2);

          controller2.forward();

          MockApi().getFerrariInteger().then((value) => {
                setState((() {
                  valor2 = value;
                }))
              });
        },
        child: const Icon(Icons.add_photo_alternate),
      ),
    );
  }

  Widget clickCeleste() {
    return GestureDetector(
      child: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 0, 141, 242),
        foregroundColor: Colors.black,
        onPressed: () {
          sizeAnimation3 =
              Tween<double>(begin: 1, end: 500).animate(controller3);

          controller3.reset();
          colorAnimation3 = ColorTween(begin: const Color.fromARGB(255, 54, 168, 244), end: Colors.white)
              .animate(controller3);

          controller3.forward();
          MockApi().getFerrariInteger().then((value) => {
                setState((() {
                  valor3 = value;
                }))
              });
        },
        child: const Icon(Icons.add_shopping_cart),
      ),
    );
  }

  Widget divMorado() {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 70),
        curve: Curves.fastLinearToSlowEaseIn,
        height: height.toDouble(),
        width: sizeAnimation.value,
        color: colorAnimation.value,
      ),
    );
  }

  Widget divRosado() {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 80),
        curve: Curves.fastLinearToSlowEaseIn,
        height: 25,
        width: sizeAnimation2.value,
        color: colorAnimation2.value,
      ),
    );
  }

  Widget divCeleste() {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        curve: Curves.fastLinearToSlowEaseIn,
        height: 25,
        width: sizeAnimation3.value,
        color: colorAnimation3.value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
              child: const Text('Flutter Asincronia',
                  textAlign: TextAlign.center))),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(children: <Widget>[
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 255, 255, 255),
                  ])),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 40),
                    clickMorado(),
                    const SizedBox(height: 6),
                    divMorado(),
                    Text(
                      "$valor1",
                      style: const TextStyle(
                        color: Color.fromARGB(255, 210, 30, 255),
                        fontSize: 50,
                      ),
                    ),
                    const SizedBox(height: 6),
                    clickRosado(),
                    const SizedBox(height: 6),
                    divRosado(),
                    Text(
                      "$valor2",
                      style: const TextStyle(
                        color: Color.fromARGB(255, 255, 0, 212),
                        fontSize: 50,
                      ),
                    ),
                    const SizedBox(height: 6),
                    clickCeleste(),
                    const SizedBox(height: 6),
                    divCeleste(),
                    Text(
                      "$valor3",
                      style: const TextStyle(
                        color: Color.fromARGB(210, 12, 138, 255),
                        fontSize: 50,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
