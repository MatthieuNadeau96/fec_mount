import 'package:fec_mount/models/album_model.dart';
import 'package:flutter/cupertino.dart';

class Collection extends ChangeNotifier {
  int _totalFavorites = 0;

  int get totalFavorites => _totalFavorites;

  void favorite() {
    _totalFavorites++;
    notifyListeners();
  }

  void unfavorite() {
    _totalFavorites--;
    notifyListeners();
  }

  List<Album> albumList = [];

  List<Album> get getAlbumList => albumList;

  void toggleFavorite(Album album) {
    int index =
        albumList.indexWhere((element) => element.albumName == album.albumName);
    if (albumList[index].isFavorite) {
      unfavorite();
      albumList[index].isFavorite = false;
    } else {
      favorite();
      albumList[index].isFavorite = true;
    }
  }
}
