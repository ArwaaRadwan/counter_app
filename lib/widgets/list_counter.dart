import 'package:counter_app/screens/create_counter.dart';
import 'package:flutter/material.dart';

class ListCounter extends StatefulWidget {
  final Future<void> Function()? onAddCounter; // callback من الصفحة الرئيسية

  const ListCounter({super.key, this.onAddCounter});

  @override
  State<ListCounter> createState() => ListCounterState();
}

class ListCounterState extends State<ListCounter> {
  List<Map<String, dynamic>> counters = [];

  Future<void> addNewCounter() async {
    final newCounter = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CreateCounter()),
    );

    if (newCounter != null) {
      setState(() {
        counters.add(newCounter);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: counters.isEmpty
          ? const Center(
              child: Text(
                "No counters yet",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: counters.length,
              itemBuilder: (context, index) {
                final counter = counters[index];

                return Card(
                  color: counter['color']?.withOpacity(0.2),
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // زرار ناقص
                        IconButton(
                          icon: const Icon(Icons.remove_circle_outline,
                              size: 32, color: Colors.black87),
                          onPressed: () {
                            setState(() {
                              counter['value']--;
                            });
                          },
                        ),

                        // النصوص (الاسم + القيمة)
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              counter['name'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "${counter['value']}",
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ],
                        ),

                        // زرار زائد
                        IconButton(
                          icon: const Icon(Icons.add_circle_outline,
                              size: 32, color: Colors.black87),
                          onPressed: () {
                            setState(() {
                              counter['value'] += counter['increment'];
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
