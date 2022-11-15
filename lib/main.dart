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
      title: 'DFS',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'DFS'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List siswa = [
    {'nama': 'andika', 'kelas': 'semester 1', 'hoby': 'sepak bola'},
    {'nama': 'citra', 'kelas': 'semester 2', 'hoby': 'badminton'},
    {'nama': 'jaka', 'kelas': 'semester 3', 'hoby': 'basket'},
  ];

  Map hasilcari = {};

  final TextEditingController cari = TextEditingController();

  void caridata() {
    if (cari.text != '') {
      for (Map data in siswa) {
        if (data['nama'].contains(cari.text)) {
          hasilcari = data;
          break;
        } else if (data['kelas'].contains(cari.text)) {
          hasilcari = data;
          break;
        } else if (data['hoby'].contains(cari.text)) {
          hasilcari = data;
          break;
        }
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: cari,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), label: Text('Cari Data :')),
              ),
              ElevatedButton(onPressed: caridata, child: Text('Cari')),
              SizedBox(height: 15),
              if (hasilcari.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hasil Pencarian"),
                    Text("Nama : ${hasilcari['nama']}"),
                    Text("Kelas : ${hasilcari['kelas']}"),
                    Text("Mata Kuliah : ${hasilcari['hoby']}"),
                  ],
                ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
