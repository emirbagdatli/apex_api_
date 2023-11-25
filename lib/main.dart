import 'package:apex_api/pages/home/home_view.dart';
import 'package:apex_api/service/apex_service.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Apex App',
      home: HomeView(),
    );
  }
}
