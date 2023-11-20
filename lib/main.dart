import 'package:flutter/material.dart';
import 'dart:async';
import 'the_boys_model.dart';
import 'the_boys_list.dart';
import 'new_the_boys_form.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Boys characters ranked',
      theme: ThemeData(brightness: Brightness.dark),
      home: const MyHomePage(
        title: 'The Boys characters ranked',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TheBoys> initialTheBoys = [TheBoys('Homelander'), TheBoys('Butcher'), TheBoys('Hughie')];

  Future _showNewTheBoysForm() async {
    TheBoys newTheBoys = await Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
      return const AddTheBoysFormPage();
    }));
    //print(newTheBoys);
    initialTheBoys.add(newTheBoys);
      setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var key = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color(0xFF0B479E),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _showNewTheBoysForm,
          ),
        ],
      ),
      body: Container(
          color: const Color.fromARGB(255, 88, 111, 137),
          child: Center(
            child: TheBoysList(initialTheBoys),
          )),
    );
  }
}