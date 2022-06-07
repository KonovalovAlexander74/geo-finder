import 'package:flutter/material.dart';
import 'package:geo_test/provider/tile_finder.dart';
import 'package:provider/provider.dart';

class TileFindButtonWidget extends StatelessWidget {
  const TileFindButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<TileFinder>();

    return SizedBox(
      width: 140,
      height: 60,
      child: ElevatedButton(
        onPressed: model.findTile,
        child: const Text(
          'Find tile',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
      ),
    );
  }
}
