import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/counter_controller.dart';

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterController>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter: ${counter.counter}', style: TextStyle(fontSize: 32)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(icon: Icon(Icons.remove), onPressed: counter.decrement),
                IconButton(icon: Icon(Icons.add), onPressed: counter.increment),
              ],
            )
          ],
        ),
      ),
    );
  }
}