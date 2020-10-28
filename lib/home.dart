import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String str = "";
  List arr = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To-Do"),
      ),
      body: Column(
        children: [
          Container(
            child: Expanded(
              child: ListView.builder(
                itemCount: arr.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text("${index + 1}"),
                    title: Text(arr[index]),
                    onLongPress: () {
                      setState(() {
                        arr.removeAt(index);
                      });
                    },
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: TextField(
                onSubmitted: (String value) {
                  print(value);
                  setState(() {
                    List arr1 = arr;
                    arr1.add(value);
                    str = value;
                    print(arr.toString());
                    arr = arr1;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
