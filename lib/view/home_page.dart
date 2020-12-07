import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {


  MyHomePage();
  void _incrementCounter(BuildContext context) {
 //   Provider.of<Counter>(context, listen: false).incrementCounter();
  }
  @override
  Widget build(BuildContext context) {
  //  var _counter = Provider.of<Counter>(context).getCounter;
    return Scaffold(
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(''
  //      '$_counter',
        //      style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){_incrementCounter(context);},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}