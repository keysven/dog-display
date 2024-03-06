import 'package:flutter/material.dart';
import 'package:flutter_application_1/dog/dog_card.dart';
import 'package:flutter_application_1/dog/dog_model.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Text(widget.title),
      theme: ThemeData(brightness: Brightness.dark),
      home: MyHomPage(
        title: 'We Rate Dogs',
        key: null,
      ),
    );
  }
}

class MyHomPage extends StatefulWidget {
  MyHomPage({required Key key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomPage> {
  List<Dog> initialDoggos = []
    ..add(Dog('Ruby', 'Portland, OR, USA',
        'Ruby is a very good girl. Yes : Fetch, loungin\'.No: Dogs who get on furniture'))
    ..add(Dog('Rex', 'Seattle, WA, USA', 'Best in Show 1999'))
    ..add(Dog('Rod Stewart', 'Prague, CZ',
        'Star good boy on international snooze team.'))
    ..add(Dog('Herbert', 'Dallas, TX, USA', 'A Very Good Boy'))
    ..add(Dog('Buddy', 'North Pole, Earth', 'Self proclaimed human lover.'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black87
      ),
      body: Container(
        child: Center(
          child: DogCard(initialDoggos[1]),
        ),
      ),
    );
  }
}
