// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_crud_api_sample_app/model.dart';
import 'package:flutter_crud_api_sample_app/repository.dart';

import 'add-blog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/home': (context) => const MyHomePage(
              title: 'Flutter Demo',
            ),
        '/add-blog': (context) => const Addusers()
      },
      home: const MyHomePage(title: 'rest api'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Users> listUsers = [];
  Repository repository = Repository();
  getData() async {
    listUsers = await repository.getData();
  }

  @override
  // ignore: todo
  //TODO: implement build
  // ignore: unused_element
  void initState() {
    getData();

    // ignore: todo
    //TODO: implement initState
    super.initState();
  }

  @override
  // ignore: unused_element
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.of(context).popAndPushNamed('/add-blog'),
          )
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            // ignore: avoid_unnecessary_containers
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context)
                      .popAndPushNamed('/add-blog', arguments: [
                    listUsers[index].id,
                    listUsers[index].tittel,
                    listUsers[index].content
                  ]),
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          listUsers[index].tittel,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(listUsers[index].content),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    bool response =
                        await repository.deleteData(listUsers[index].id);
                    if (response) {
                      // ignore: avoid_print
                      print('success');
                    } else {
                      // ignore: avoid_print
                      print('delete data gagal');
                    }
                    getData();
                  },
                  icon: const Icon(Icons.delete),
                  color: Colors.red,
                ),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: listUsers.length),
      bottomNavigationBar: BottomAppBar(
        //color: Colors.transparent,
        child: Container(
          height: 60,
          color: const Color.fromARGB(136, 0, 4, 255),
          alignment: Alignment.center,
          child: const Text(
            'Developed i kadek diksa',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
        //elevation: 0,
      ),
    );
  }
}
