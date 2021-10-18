import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final imgList = [
  'https://static.kulturologia.ru/files/u21941/219410846.jpg',
  'https://static.kulturologia.ru/files/u21941/219411854.jpg',
  'https://izo-life.ru/wp-content/uploads/black_lovett_cover.png',
  'https://static.kulturologia.ru/files/u21941/13-19.jpg',
  'https://static.kulturologia.ru/files/u21941/219415738.jpg',
  'https://ic.pics.livejournal.com/t_demi/24199402/153260/153260_600.jpg',
  'https://ic.pics.livejournal.com/t_demi/24199402/153506/153506_600.jpg',
  'https://ic.pics.livejournal.com/t_demi/24199402/153632/153632_600.jpg',
  'https://ic.pics.livejournal.com/t_demi/24199402/154387/154387_600.jpg'
];

final textList = [
  '1 - Лондон',
  '2 - Залив Савант',
  '3 - Венеция',
  '4 - Лесная дорога после дождя',
  '5 - Вечер',
  '6',
  '7',
  '8',
  '9'
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image viewer',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const MyHomePage(title: 'Image viewer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counterNumOfImg = 0;

  void incrementCounter() {
    setState(() {
      counterNumOfImg++;
      if (counterNumOfImg > imgList.length - 1) {
        counterNumOfImg = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image viewer'),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(24.0),
        child: FloatingActionButton(
          foregroundColor: Colors.white,
          onPressed: incrementCounter,
          child: const Icon(Icons.three_p_sharp),
        ),
      ),
      body: Column(
        children: <Widget>[
          SafeArea(
            child: Card(
              margin: const EdgeInsets.all(20.0),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0))),
              child: Image(
                image: NetworkImage(imgList[counterNumOfImg]), //fdbfdb
              ),
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              textList[counterNumOfImg],
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
            ),
          ),
          Image.asset('assets/images/file.png')
        ],
      ),
    );
  }
}
