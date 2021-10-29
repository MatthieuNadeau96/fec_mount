import 'package:fec_mount/models/album_model.dart';
import 'package:fec_mount/models/collection_model.dart';
import 'package:fec_mount/services/album_service.dart';
import 'package:fec_mount/widgets/album_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late Future<List<Album>> _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _future = AlbumService().getHttp();
  }

  @override
  Widget build(BuildContext context) {
    Collection _collection = Provider.of<Collection>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Total Likes: ${_collection.totalFavorites}'),
      ),
      body: Center(
        child: FutureBuilder<List<Album>>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                List<Album> albumList = snapshot.data!;
                if (albumList.isNotEmpty) {
                  _collection.albumList = albumList;

                  return ListView.builder(
                    itemCount: albumList.length,
                    itemBuilder: (context, index) {
                      Album album = albumList[index];
                      return AlbumCard(
                        album: album,
                      );
                    },
                  );
                }
              }
              return const Center(
                child: Text('There appears to be no data'),
              );
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
