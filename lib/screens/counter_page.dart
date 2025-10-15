import 'package:counter_app/widgets/list_counter.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
    final GlobalKey<ListCounterState> _listKey = GlobalKey<ListCounterState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Counter",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        leading: Row(
          children: [
            Icon(Icons.view_headline, color: Colors.white),
            Image.network(
              "https://cdn-icons-png.flaticon.com/512/6357/6357834.png",
              height: 32,
              width: 32,
              alignment: Alignment.center,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              
               _listKey.currentState?.addNewCounter();
              
            },
            icon: const Icon(Icons.add),
            color: Colors.white,
            iconSize: 30,
          ),
          IconButton(onPressed: (){}, 
          icon: Icon( Icons.mode_edit ,
           color: Colors.white,
           size: 25,))
        ],
      ),
      
    body:ListCounter(key: _listKey)
    
    );
  }
}

