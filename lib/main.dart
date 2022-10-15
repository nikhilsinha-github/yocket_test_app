import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: OrderPage(),
        ),
      ),
    );
  }
}

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  bool isShowing = true;
  Widget? blueCounter, redCounter;

  @override
  void initState() {
    super.initState();
    blueCounter = CounterButton(key: UniqueKey(), color: Colors.blue);
    redCounter = CounterButton(key: UniqueKey(), color: Colors.red);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: (const Text('Delete blue')),
          onPressed: () {
            setState(() {
              isShowing = !isShowing;
            });
          },
        ),

        if (isShowing) blueCounter!,
        //SizedBox(height : 8),
        redCounter!,
      ],
    );
  }
}

class CounterButton extends StatefulWidget {
  final Color color;

  const CounterButton({Key? key, required this.color}) : super(key: key);

  @override
  _CounterButtonState createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: (Text('$count')),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateColor.resolveWith((states) => widget.color),
      ),
      onPressed: () {
        setState(() {
          count++;
        });
        // print(count);
      },
    );
  }
}
