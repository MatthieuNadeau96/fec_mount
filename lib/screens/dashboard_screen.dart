import 'package:fec_mount/models/album_model.dart';
import 'package:fec_mount/services/album_service.dart';
import 'package:fec_mount/widgets/album_card.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Total Likes: 0'),
      ),
      body: Center(
        child: FutureBuilder<List<Album>>(
          future: AlbumService().getHttp(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                List<Album> albumList = snapshot.data!;

                return ListView.builder(
                    itemCount: albumList.length,
                    itemBuilder: (context, index) {
                      Album album = albumList[index];
                      return AlbumCard(
                        albumImage: album.albumImage!,
                        albumName: album.albumName!,
                        releaseDate: album.releaseDate!,
                        albumPrice: album.albumPrice!,
                      );
                    });
              }
              // TODO: Handle if no data

            }
            return const Center(
              child: Text('Something went wrong...'),
            );
          },
        ),
      ),
    );
  }
}
