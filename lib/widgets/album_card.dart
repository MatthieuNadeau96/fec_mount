import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AlbumCard extends StatelessWidget {
  AlbumCard({
    Key? key,
    required this.albumImage,
    required this.albumName,
    required this.releaseDate,
    required this.albumPrice,
  }) : super(key: key);

  String albumImage;
  String albumName;
  DateTime releaseDate;
  double albumPrice;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      child: Row(
        children: [
          Flexible(
            child: Image(
              image: NetworkImage(albumImage),
            ),
          ),
          const SizedBox(width: 15),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  albumName,
                  style: theme.textTheme.headline6,
                ),
                const SizedBox(height: 15),
                Text(
                  'Released On: ${DateFormat.yMMMd().format(releaseDate)}',
                  style: theme.textTheme.bodyText1,
                ),
                // const Spacer(flex: 1),
                Text(
                  'Price: \$$albumPrice',
                  style: theme.textTheme.bodyText2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
