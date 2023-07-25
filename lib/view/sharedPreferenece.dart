// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_testing/view/get_storage.dart';
 
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _textFieldController = TextEditingController();
  final TextEditingController _textFieldControllerPass =
      TextEditingController();
  String _savedText = '';
  String _savedTextPass = '';
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _loadSavedData();
    _loadSavedDataPass();
  }

  // Load the saved text and counter from SharedPreferences
  _loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedText = prefs.getString('saved_text') ?? '';
      _counter = prefs.getInt('counter') ?? 0;
    });
  }

  // Save the entered text to SharedPreferences
  _saveText(String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('saved_text', text);
  }

  // Load the saved text and counter from SharedPreferences
  _loadSavedDataPass() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedTextPass = prefs.getString('saved_text_Pass') ?? '';
      _counter = prefs.getInt('counter') ?? 0;
    });
  }

  // Save the entered text to passwordfdfdgfdgfg
  _saveTextPass(String text) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('saved_text_Pass', text);
  }

  // Save the counter to SharedPreferences
  _saveCounter(int counter) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('counter)', counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SharedPreferences Example'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _textFieldController,
                  onChanged: (text) => setState(() {}),
                  decoration: const InputDecoration(
                    labelText: 'Enter gmail',
                  ),
                ),
                TextField(
                  controller: _textFieldControllerPass,
                  onChanged: (text) => setState(() {}),
                  decoration: const InputDecoration(
                    labelText: 'Enter password',
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _textFieldController.text.isNotEmpty
                      ? () {
                          if (_textFieldController.text.isNotEmpty) {
                            _saveText(_textFieldController.text);
                            _loadSavedData();
                          }

                          if (_textFieldControllerPass.text.isNotEmpty) {
                            _saveTextPass(_textFieldControllerPass.text);
                            _loadSavedDataPass();
                          }
                        }
                      : null,
                  child: const Center(
                      child: Text(
                    'Login',
                  )),
                ),
                const SizedBox(height: 20),
                Text('Gmail:      $_savedText'),
                  const SizedBox(height: 10),
                Text('Password:      $_savedTextPass'),
                const SizedBox(height: 20),
                Text('Counter:         $_counter'),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _counter++;
                          _saveCounter(_counter);
                        });
                      },
                      child: const Text('Increment'),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _counter = 0;
                          _saveCounter(_counter);
                        });
                      },
                      child: const Text('Reset'),
                    ),
                  ],
                ),
              const   SizedBox(height: 50,),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor:
                              Colors.red, // Set the text color of the button
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 12), // Adjust the padding
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                8), // Set the border radius of the button
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const GetStorages()),
                          );
                        },
                        child: const Text('Open Page GetStorage'),
                      ),
                       
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
