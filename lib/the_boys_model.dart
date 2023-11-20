// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'dart:io';
import 'dart:async';

class TheBoys {
  final String name;
  String? imageUrl;
  String? apiname;
  String? levelTheBoys;

  int rating = 10;

  TheBoys(this.name);

  Future getImageUrl() async {
    if (imageUrl != null) {
      return;
    }

    HttpClient http = HttpClient();
    try {
      apiname = name.toLowerCase();

      var uri = Uri.parse('https://raw.githubusercontent.com/victordemolini/the_boys/main/theboys.json');
      var request = await http.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(utf8.decoder).join();

      List data = json.decode(responseBody);

      var characterData = data.firstWhere((character) => character["name"] == name, orElse: () => {});

      if (characterData.isNotEmpty) {
        imageUrl = characterData["img"];
        levelTheBoys = characterData["level"];
      }


      //print(levelTheBoys);
    } catch (exception) {
      //print(exception);
    }
  }
}
