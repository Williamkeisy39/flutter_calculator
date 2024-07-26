import 'package:flutter/material.dart';
import 'package:utipsi/widgets/person_counter.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
  int _personCount = 1;
  //Methods
  void increment() {
    setState(() {
      _personCount = _personCount + 1;
    });
  }

  void decrement() {
    setState(() {
      if (_personCount > 0) {
        _personCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    //Add style
    final style = theme.textTheme.titleMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("UTipsi"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Text(
                      'Total per Person',
                      style: style,
                    ),
                    Text('\$23.29',
                        style: style.copyWith(
                            color: theme.colorScheme.onPrimary,
                            fontSize: theme.textTheme.displaySmall?.fontSize)),
                  ],
                )),
          ),
          //form
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: theme.colorScheme.primary, width: 2)),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.attach_money),
                        labelText: 'Bill Amount'),
                    keyboardType: TextInputType.number,
                    onChanged: (String value) {
                      print("Value:$value ");
                    },
                  ),
                  //Split Bill Area
                  PersonCounter(
                    theme: theme,
                    personCount: _personCount,
                    onDecrement: decrement,
                    onIncrement: increment,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

