// ignore_for_file: unused_field, unused_element, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'view/sharedPreferenece.dart';

void main() async {
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}
