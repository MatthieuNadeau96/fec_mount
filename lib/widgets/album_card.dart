import 'package:flutter/material.dart';

class AlbumCard extends StatelessWidget {
  const AlbumCard({Key? key}) : super(key: key);

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
          const Placeholder(),
          Column(
            children: [
              Text(
                'Album Name',
                style: theme.textTheme.headline3,
              ),
              Text(
                'Release Date',
                style: theme.textTheme.headline6,
              ),
              Text(
                'Price: \$0.00',
                style: theme.textTheme.bodyText1,
              ),
            ],
          )
        ],
      ),
    );
  }
}
