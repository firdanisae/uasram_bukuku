import 'package:http/http.dart' as http;
import 'dart:convert';

class SemuaBuku {
  String? penulis;
  int? jmlHal;
  String? categorie;
  String? penerbit;
  String? img;
  String? judul;
  String? description;

  SemuaBuku(
      {this.penulis,
      this.jmlHal,
      this.categorie,
      this.penerbit,
      this.img,
      this.judul,
      this.description});

  factory SemuaBuku.createBuku(Map<String, dynamic> object) {
    return SemuaBuku(
        penulis: object["penulis"],
        jmlHal: object["jmlHal"],
        categorie: object["categorie"],
        penerbit: object["penerbit"],
        img: object["img"],
        judul: object["judul"],
        description: object["description"]);
  }

  static Future<List<SemuaBuku>> getSemuaBuku() async {
    String apiURL = "https://api.npoint.io/e69f15611e99eb8d9d23/buku";

    var apiResult = await http.get(Uri.parse(apiURL));
    var decodeutf = utf8.decode(apiResult.bodyBytes);
    var jsonObject = json.decode(apiResult.body);

    List<dynamic> listSemuaBuku = jsonObject;
    List<SemuaBuku> buku = [];
    for (int i = 0; i < listSemuaBuku.length; i++) {
      buku.add(SemuaBuku.createBuku(listSemuaBuku[i]));
    }
    print('buku: $buku');
    return buku;
  }
}
