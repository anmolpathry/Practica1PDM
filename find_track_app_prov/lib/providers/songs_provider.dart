import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

import 'package:find_track_app/http_request.dart';

class Songs_Provider extends ChangeNotifier {
  bool _isRecording = false;
  List<dynamic> get getSongList => _songsList;

  List<dynamic> _songsList = [];
  bool get isRecording => _isRecording;

  void setRecording() {
    _isRecording = !_isRecording;
    notifyListeners();
  }

  Future<dynamic> searchSong(songString) async {
        print("Making POST");

        var response = await HttpRequest().postToAPI(songString);

        print(response);

        print("Obtaining Response");

        if (response.statusCode == 200) {
          //print(response.body);
          var res = jsonDecode(response.body);
          //dynamic obj = res["result"];
          notifyListeners();
          return res;
        }
    }
  
  void addFavorite(dynamic song) {
    if (!_songsList.contains(song)) {
      _songsList.add(song);
    }
    //print(_songsList);
    notifyListeners();
  }

  void deleteFavorite(dynamic song) {
    if (_songsList.contains(song)) {
      _songsList.remove(song);
    }
    //print(_songsList);
    notifyListeners();
  }
}
