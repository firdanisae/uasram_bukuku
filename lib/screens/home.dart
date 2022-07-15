import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_bookapp/models/model.dart';
import 'package:flutter_bookapp/screens/detail.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:http/http.dart' as http;

class home extends StatefulWidget {
  @override
  _homeState createState() => new _homeState();
}

class _homeState extends State<home> {
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
    // print(AmbilDataBuku);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.blueAccent,
            items: <Widget>[
              GestureDetector(
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => home()));
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
          appBar: AppBar(
            title: Text("Buku"),
          ),
          body: GridView(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
            children: <Widget>[
              ImageSlideshow(
                /// Width of the [ImageSlideshow].
                width: double.infinity,

                /// Height of the [ImageSlideshow].
                height: 10,

                /// The page to show when first creating the [ImageSlideshow].
                initialPage: 0,

                /// The color to paint the indicator.
                indicatorColor: Colors.blue,

                /// The color to paint behind th indicator.
                indicatorBackgroundColor: Colors.grey,

                /// The widgets to display in the [ImageSlideshow].
                /// Add the sample image file into the images folder
                children: [
                  Image.asset(
                    'assets/images/1.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/2.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/3.jpg',
                    fit: BoxFit.cover,
                  ),
                ],

                /// Called whenever the page in the center of the viewport changes.
                onPageChanged: (value) {
                  print('Page changed: $value');
                },

                /// Auto scroll interval.
                /// Do not auto scroll with null or 0.
                autoPlayInterval: 3000,

                /// Loops back to first slide.
                isLoop: true,
              ),
              GridView.count(
                crossAxisCount: 3,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(20),
                children: List.generate(img.length, (index) {
                  return Card(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Detail(
                                      desc: description[index],
                                      gmbr: img[index],
                                      title: judul[index],
                                      pnls: penulis[index],
                                    )));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage("${img[index]}"),
                                fit: BoxFit.fitWidth,
                                alignment: Alignment.topCenter,
                                opacity: 15)),
                        child: Image.network('${img[index]}'),
                      ),
                    ),
                  );
                }),
              ),
            ],
          )),
    );
  }
}
