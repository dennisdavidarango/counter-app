

import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  
  int counter = 15;

  void increase(){
    counter++;
    setState(() {});
  }

  void decrease(){
    counter--;
    setState(() {});
  }

   void reset(){
    counter = 0;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {

    const fontSize30 =  TextStyle(fontSize: 30);

    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterScreen'),
        elevation: 10.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  <Widget>[
            const Text('Clicks Counter', style: fontSize30),
            Text('$counter', style: fontSize30),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingActions(increaseFn: increase, decreaseFn: decrease, resetFn: reset),
    );
  }
}





class CustomFloatingActions extends StatelessWidget {

  final Function increaseFn;
  final Function decreaseFn;
  final Function resetFn;

  const CustomFloatingActions({
    Key? key,
    required this.increaseFn, required this.decreaseFn, required this.resetFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      children: [
        FloatingActionButton(
          elevation: 10,
          onPressed: () => increaseFn(),
          child:  const Icon(Icons.exposure_plus_1_rounded),
        ),
         FloatingActionButton(
          elevation: 10,
          onPressed: () => resetFn(),
          child: const Icon(Icons.exposure_outlined),
        ),
         FloatingActionButton(
          elevation: 10,
          onPressed:  () => decreaseFn(),
          child: const Icon(Icons.exposure_minus_1_outlined),
        ),
      ],
    );
  }
}