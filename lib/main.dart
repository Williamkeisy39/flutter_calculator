import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 121, 68, 213)),
        useMaterial3: true,
      ),
      home: const UTipsi(),
    );
  }
}

class UTipsi extends StatefulWidget {
  const UTipsi({super.key});

  @override
  State<UTipsi> createState() => _UTipsiState();
}

class _UTipsiState extends State<UTipsi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UTipsi"),
      ),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(10)),
              child: const Column(
                children: [
                  Text('Total per Person'),
                  Text('\$23.29'),
                ],
              )),
        ],
      ),
    );
  }
}
