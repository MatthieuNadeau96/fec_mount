import 'package:fec_mount/services/album_service.dart';
import 'package:fec_mount/widgets/album_card.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Object>(
          future: AlbumService().getHttp(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return const Center(
                  child: SizedBox(
                    height: 200,
                    // width: 200,
                    child: AlbumCard(),
                  ),
                );
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
