import 'package:fec_mount/services/album_service.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {
            await AlbumService().getHttp();
          },
          child: Text('Tap me'),
        ),
      ),
    );
  }
}
