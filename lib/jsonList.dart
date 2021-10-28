import 'dart:convert';
import 'package:flutter/material.dart';

class jsonList extends StatefulWidget {
  const jsonList({Key? key}) : super(key: key);

  @override
  _jsonListState createState() => _jsonListState();
}

class _jsonListState extends State<jsonList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Json File'),
      ),
      body: Center(
        child: FutureBuilder(
          builder: (context, snapshot) {
            var showData = json.decode(snapshot.data.toString());
            return ListView.builder(
              itemCount: showData.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(showData[index]['empname']),
                  subtitle: Text(showData[index]['department']),
                );
              },
            );
          },
          future: DefaultAssetBundle.of(context)
              .loadString("assets//MOCK_DATA for Flutter layouting.json"),
        ),
      ),
    );
  }
}
