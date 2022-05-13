// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_crud_api_sample_app/repository.dart';

class Addusers extends StatefulWidget {
  const Addusers({Key? key}) : super(key: key);

  @override
  _AddusersState createState() => _AddusersState();
}

class _AddusersState extends State<Addusers> {
  Repository repository = Repository();
  final _tittelController = TextEditingController();
  final _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as List<String>;
    if (args[1].isNotEmpty) {
      _tittelController.text = args[1];
    }
    if (args[2].isNotEmpty) {
      _contentController.text = args[2];
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add users'),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),
            TextField(
              controller: _tittelController,
              decoration: InputDecoration(
                  hintText: "Nama",
                  labelText: "Nama",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0))),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(
                  hintText: "nim",
                  labelText: "nim",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0))),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),
            ElevatedButton(
                onPressed: () async {
                  bool response = await repository.postData(
                      _tittelController.text, _contentController.text);
                  if (response) {
                    Navigator.of(context).popAndPushNamed('/home');
                  } else {
                    // ignore: avoid_print
                    print('error');
                  }
                },
                child: const Text('submit')),
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
            ),
            ElevatedButton(
                onPressed: () async {
                  bool response = await repository.putData(int.parse(args[0]),
                      _tittelController.text, _contentController.text);
                  if (response) {
                    Navigator.of(context).popAndPushNamed('/home');
                  } else {
                    // ignore: avoid_print
                    print('error');
                  }
                },
                child: const Text('update')),
          ],
        ),
      ),
    );
  }
}
