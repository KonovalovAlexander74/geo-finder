import 'package:flutter/material.dart';
import 'package:geo_test/models/coordinates.dart';
import 'package:geo_test/widgets/coordinate_element.dart';
import 'package:geo_test/widgets/tile_find_button.dart';
import 'package:geo_test/widgets/tile_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: const Text('TileFinder'),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(
              height: 40,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                CoordinateElementWidget(
                  coordinate: Coordinates.longitude,
                  title: 'Longitude',
                  height: 100,
                  width: 250,
                ),
                SizedBox(
                  height: 20,
                ),
                CoordinateElementWidget(
                  coordinate: Coordinates.latitude,
                  title: 'Latitude',
                  height: 100,
                  width: 250,
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const TileImage(),
            const SizedBox(
              height: 40,
            ),
            const Center(
              child: TileFindButtonWidget(),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
