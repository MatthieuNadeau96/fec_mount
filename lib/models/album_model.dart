import 'package:flutter/cupertino.dart';

class Album {
  final String? artistName;
  final String? albumName;
  final String? albumImage;
  final double? albumPrice;
  final DateTime? releaseDate;
  bool isFavorite = false;

// artistName - (Artist Name)
// collectionName - (Album Name)
// artworkUrl160 - (Smaller Image)
// artworkUrl1100 - (Larger Image)
// collectionPrice - (Album Price)
// releaseDate - (Album Release)

  Album({
    this.artistName,
    this.albumName,
    this.albumImage,
    this.albumPrice,
    this.releaseDate,
    this.isFavorite = false,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      artistName: json['artistName'] ?? 'Error',
      albumName: json['collectionName'] ?? 'Error',
      albumImage: json['artworkUrl100'] ?? '',
      albumPrice: json['collectionPrice'] ?? 0.00,
      releaseDate: DateTime.parse(json['releaseDate']),
    );
  }
}
