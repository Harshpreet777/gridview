import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void incrementCounter() {}
  List<int> mylist = List.generate(12, (index) => index + 1);
  // List<String> mylist = ['1','2','3','4','5','6','7','8','9','*','0','#'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Text(
                'List.Generate',
                style: TextStyle(fontSize: 20),
              ),
              Text(mylist.toString()),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'GridView.Builder',
                style: TextStyle(fontSize: 20),
              ),
              Container(
                height: 120,
                padding: const EdgeInsets.all(10),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: mylist.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20),
                  itemBuilder: (BuildContext context, index) {
                    return ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                (index % 2 == 0) ? Colors.amber : Colors.blue),
                            elevation: const MaterialStatePropertyAll(3)),
                        onPressed: () {},
                        child: Text(mylist[index].toString()));
                  },
                ),
              ),
              const Text(
                'GridView.count',
                style: TextStyle(fontSize: 20),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                height: 100,
                child: GridView.count(
                  crossAxisCount: 5,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 10,
                  children: List.generate(15, (index) {
                    return ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                (index % 2 == 0)
                                    ? Colors.blue
                                    : Colors.deepOrange)),
                        onPressed: null,
                        child: Text('${index+1}'));
                  }),
                ),
              ),
              const Text(
                'GridView.extent',
                style: TextStyle(fontSize: 20),
              ),
              Container(
                padding: const EdgeInsets.all(30),
                height: 200,
                child: GridView.extent(
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  maxCrossAxisExtent: 200,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  shrinkWrap: true,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.yellow,
                      child:
                          const Text('First', style: TextStyle(fontSize: 20)),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.blue,
                      child:
                          const Text('Second', style: TextStyle(fontSize: 20)),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.blue,
                      child:
                          const Text('Third', style: TextStyle(fontSize: 20)),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.yellow,
                      child: const Text('Four', style: TextStyle(fontSize: 20)),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.yellow,
                      child:
                          const Text('Fifth', style: TextStyle(fontSize: 20)),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      color: Colors.blue,
                      child: const Text('Six', style: TextStyle(fontSize: 20)),
                    ),
                  ],
                ),
              ),
              const Text(
                'GridView.custom',
                style: TextStyle(fontSize: 20),
              ),
              Container(
                height: 200,
                width: 500,
                padding: const EdgeInsets.all(10),
                child: GridView.custom(
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      mainAxisExtent: 200,
                      crossAxisCount: 2),
                  childrenDelegate:
                      SliverChildBuilderDelegate((context, index) {
                    return FloatingActionButton(
                      onPressed: null,
                      backgroundColor:
                          (index % 2 == 0) ? Colors.blue : Colors.amber,
                      child: Text(mylist[index].toString()),
                    );
                  }, childCount: mylist.length),
                ),
              ),
              const Text(
                'ClipRRect',
                style: TextStyle(fontSize: 20),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(1000),
                    topRight: Radius.elliptical(500, 500)),
                child: Container(
                  height: 300,
                  width: 300,
                  color: Colors.blue,
                  child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Container with ClipRRect',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
              const SizedBox(height: 40,)
            ],
          ),
        ),
      ),
    );
  }
}
