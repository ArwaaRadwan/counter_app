import 'package:counter_app/widgets/text_field_counter.dart';
import 'package:flutter/material.dart';


class CreateCounter extends StatefulWidget {
  const CreateCounter({super.key});

  @override
  State<CreateCounter> createState() => _CreateCounterState();
}

class _CreateCounterState extends State<CreateCounter> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController initialController = TextEditingController(
    text: '0',
  );
  final TextEditingController incrementController = TextEditingController(
    text: '1',
  );

  Color selectedColor = Colors.white;
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.yellow,
    Colors.brown,
    Colors.purple,
    Colors.blue,
    Colors.teal,
  ];
  
  void pickColor(Color color) {
    setState(() {
      selectedColor = color;
    });
  }

  void saveCounter() {
    final name = nameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a counter name')),
      );
        return;
    }
    final initialValue = int.tryParse(initialController.text) ?? 0;
    final incrementValue = int.tryParse(incrementController.text) ?? 1;

 

  Navigator.pop(context, {
  'name': name,
  'value': initialValue,
  'increment': incrementValue,
  'color': selectedColor,
});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New Counter",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        actions: [
          IconButton(
            onPressed: saveCounter,
          
            
            icon: Icon(Icons.done),
            iconSize: 27,
            color: Colors.white,
          ),
        ],
        backgroundColor: Colors.blueAccent,
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldCounter(label: "Name", controller: nameController),
              TextFieldCounter(
                label: "Initial Value",
                controller: initialController,
              ),
              TextFieldCounter(
                label: "Increment Value",
                controller: incrementController,
              ),

              Text(
                "Color",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),

              Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var color in colors)
                    GestureDetector(
                      onTap: () => pickColor(color),
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: selectedColor == color
                                ? Colors.black
                                : Colors.transparent,
                            width: 3,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
