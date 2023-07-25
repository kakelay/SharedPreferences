import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class GetStorages extends StatefulWidget {
  const GetStorages({super.key});

  @override
  State<GetStorages> createState() => _GetStoragesState();
}

class _GetStoragesState extends State<GetStorages> {
 final _storage = GetStorage();
  final TextEditingController _textFieldController = TextEditingController();
  String _savedText = '';

  @override
  void initState() {
    super.initState();
    _loadSavedText();
  }

  // Load the saved text from GetStorage
  _loadSavedText() {
    setState(() {
      _savedText = _storage.read('saved_text') ?? '';
    });
  }

  // Save the entered text to GetStorage
  _saveText(String text) {
    _storage.write('saved_text', text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetStorage Example'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _textFieldController,
                onChanged: (text) => setState(() {}),
                decoration: const InputDecoration(
                  labelText: 'Enter some text',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _textFieldController.text.isNotEmpty
                    ? () {
                        _saveText(_textFieldController.text);
                        _loadSavedText();
                      }
                    : null,
                child: const Text('Save Text'),
              ),
              const SizedBox(height: 20),
              Text('Saved Text: $_savedText'),
            ],
          ),
        ),
      ),
    );
  }
}