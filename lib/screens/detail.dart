import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bookapp/models/model.dart';
import 'package:flutter_bookapp/screens/home.dart';

class Detail extends StatefulWidget {
  final String? desc;
  final String? gmbr;
  final String? title;
  final String? pnls;
  const Detail({Key? key, this.desc, this.gmbr, this.title, this.pnls})
      : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final List<String?> penulis = <String?>[];
  final List<int?> jmlHal = <int?>[];
  final List<String?> categorie = <String?>[];
  final List<String?> penerbit = <String?>[];
  final List<String?> img = <String?>[];
  final List<String?> judul = <String?>[];
  final List<String?> description = <String?>[];

  void initState() {
    super.initState();
    AmbilDataBuku();
  }

  void AmbilDataBuku() {
    SemuaBuku.getSemuaBuku().then((value) {
      for (int i = 0; i < value.length; i++) {
        penulis.add(value[i].penulis);
        jmlHal.add(value[i].jmlHal);
        categorie.add(value[i].categorie);
        penerbit.add(value[i].penerbit);
        img.add(value[i].img);
        judul.add(value[i].judul);
        description.add(value[i].description);
      }
      setState(() {});
    });
    print(AmbilDataBuku);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.blueAccent,
          items: <Widget>[
            GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (context) => home()));
                },
                child: Icon(Icons.home, size: 30)),
            GestureDetector(
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Detail()));
                },
                child: Icon(Icons.library_books, size: 30)),
            Icon(Icons.store, size: 30),
          ],
          onTap: (index) {
            //Handle button tap
          },
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    widget.title.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                ),
                Text(widget.pnls.toString()),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.network(
                    widget.gmbr.toString(),
                    height: 400,
                    width: 400,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    widget.desc.toString(),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
