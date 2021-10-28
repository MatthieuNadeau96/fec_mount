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
          const Placeholder(
            fallbackHeight: 160,
            fallbackWidth: 130,
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    'Album Name',
                    style: theme.textTheme.headline5,
                  ),
                ),
                const Spacer(flex: 2),
                Text(
                  'Release Date',
                  style: theme.textTheme.bodyText1,
                ),
                const Spacer(flex: 1),
                Text(
                  'Price: \$0.00',
                  style: theme.textTheme.bodyText2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
