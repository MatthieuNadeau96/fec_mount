import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fec_mount/models/album_model.dart';

class AlbumService {
  Future<List<Album>> getHttp() async {
    String edSheeran = '183313439';
    String uri = 'https://itunes.apple.com/lookup?id=$edSheeran&entity=album';
    List<Album> albumList = [];

    try {
      var response = await Dio().get(uri);
      Map<String, dynamic> decodedList = jsonDecode(response.data.toString());
      List results = decodedList['results'];
      for (var album in results) {
        if (album['collectionType'] == 'Album') {
          albumList.add(Album.fromJson(album));
        }
      }
    } catch (e) {
      // Error Handle
    }

    return albumList;
  }
}
