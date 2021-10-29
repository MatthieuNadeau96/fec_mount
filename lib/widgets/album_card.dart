import 'package:fec_mount/models/album_model.dart';
import 'package:fec_mount/models/collection_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AlbumCard extends StatelessWidget {
  AlbumCard({
    Key? key,
    required this.album,
  }) : super(key: key);

  Album album;

  @override
  Widget build(BuildContext context) {
    Collection _collection = Provider.of<Collection>(context);
    ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(
            image: NetworkImage(album.albumImage ?? ''),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  album.albumName ?? '',
                  style: theme.textTheme.headline6,
                ),
                const SizedBox(height: 15),
                Text(
                  'Released On: ${DateFormat.yMMMd().format(album.releaseDate!)}',
                  style: theme.textTheme.bodyText1,
                ),
                Text(
                  'Price: \$${album.albumPrice}',
                  style: theme.textTheme.bodyText2,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              _collection.toggleFavorite(album);
            },
            icon: Icon(
              album.isFavorite
                  ? Icons.favorite_rounded
                  : Icons.favorite_border_rounded,
            ),
          ),
        ],
      ),
    );
  }
}
