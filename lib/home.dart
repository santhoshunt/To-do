import 'dart:io';

import 'package:flutter/material.dart';

import 'package:todo/storagefile.dart';

class Home extends StatefulWidget {
  final Storagefile storage;
  Home({Key key, @required this.storage}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controller = TextEditingController();
  String state;
  Future<Directory> _appdir;

  @override
  void initState() {
    super.initState();
    widget.storage.readData().then((String value) {
      setState(() {
        state = value;
      });
    });
  }

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
                    arr.add(value);
                    str = value;
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
