import 'package:flutter/material.dart';
import 'package:geo_test/provider/tile_finder.dart';
import 'package:provider/provider.dart';

class TileImage extends StatelessWidget {
  const TileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<TileFinder>();

    return Image.network(
      model.url,
      fit: BoxFit.contain,
      width: 300,
      height: 300,
      errorBuilder: (context, obj, _) {
        return Container(
          height: 300,
          width: 300,
          alignment: Alignment.center,
          child: const Text(
            'Tile not found',
            style: TextStyle(fontSize: 30),
          ),
        );
      },
    );
  }
}
