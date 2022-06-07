import 'package:flutter/material.dart';
import 'package:geo_test/models/coordinates.dart';
import 'package:geo_test/provider/tile_finder.dart';
import 'package:provider/provider.dart';

class CoordinateElementWidget extends StatelessWidget {
  const CoordinateElementWidget({
    Key? key,
    required this.coordinate,
    this.height = 50,
    this.width = 50,
    this.title = '',
  }) : super(key: key);

  final Coordinates coordinate;
  final String title;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<TileFinder>();

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          border: Border.all(width: 0),
          borderRadius: BorderRadius.circular(15),
          color: Colors.blueGrey.withOpacity(0.3)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Text(title, style: const TextStyle(fontSize: 16)),
          ),
          Expanded(
            child: Center(
              child: TextFormField(
                initialValue: coordinate == Coordinates.latitude
                    ? model.latitude.toString()
                    : model.longitude.toString(),
                onChanged: (value) {
                  double parsedValue = double.tryParse(value) ?? 0;

                  coordinate == Coordinates.latitude
                      ? model.latitude = parsedValue
                      : model.longitude = parsedValue;
                },
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  signed: true,
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
