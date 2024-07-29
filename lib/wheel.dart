import 'package:flutter/material.dart';

class WheelList extends StatelessWidget {
  final List<WheelListItem> items;
  final Function(WheelListItem) onItemSelected;

  WheelList({required this.items, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade100,
      appBar: AppBar(
        title: const Text(
          'Galaxy item',
          style: TextStyle(fontFamily: 'Varela'),
        ),
        backgroundColor: Colors.brown.shade300,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.cloud),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: ListWheelScrollView(
          itemExtent: 260,
          perspective: 0.002,
          diameterRatio: 2,
          children: items.map((item) {
            return InkWell(
              onTap: () {
                onItemSelected(item);
                Navigator.of(context).pop();
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(item.imagePath,
                        height: 150, width: 600, fit: BoxFit.contain),
                    const SizedBox(height: 10),
                    Text(
                      item.text,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF545D68),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class WheelListItem {
  final String imagePath;
  final String text;

  WheelListItem({
    required this.imagePath,
    required this.text,
  });
}
