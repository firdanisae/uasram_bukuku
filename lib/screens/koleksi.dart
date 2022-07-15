import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class koleksi extends StatefulWidget {
  const koleksi({Key? key}) : super(key: key);

  @override
  State<koleksi> createState() => _HomeState();
}

class _HomeState extends State<koleksi> {
  final List buku = [
    "buku1",
    "buku2",
    "buku3",
    "buku4",
    "buku5",
    "buku6",
    "buku7",
    "buku8",
    "buku9",
    "buku10",
    "buku11",
    "buku12"
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.blueAccent,
          items: <Widget>[
            Icon(Icons.library_books, size: 30),
            Icon(Icons.home, size: 30),
            Icon(Icons.store, size: 30),
          ],
          onTap: (index) {
            //Handle button tap
          },
        ),
        body: ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                      title: Text(
                        buku[index],
                        style: TextStyle(fontSize: 25),
                      ),
                      subtitle: Text(buku[index]),
                      leading: CircleAvatar(
                        child: Text(buku[index][0]),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.delete)),
                          IconButton(onPressed: () {}, icon: Icon(Icons.star))
                        ],
                      )));
            },
            itemCount: buku.length),
      ),
    );
  }
}
