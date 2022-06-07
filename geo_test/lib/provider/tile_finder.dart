import 'dart:math';

import 'package:flutter/material.dart';

class TileFinder extends ChangeNotifier {
  double longitude = 0.0;
  double latitude = 0.0;
  int _xCoord = 0;
  int _yCoord = 0;
  String _url = '';

  String get url => _url;
  String get x => _xCoord.toString();
  String get y => _yCoord.toString();

  void findTile() {
    final merc = _latLongToMerc();
    final pixels = _mercToPixels(merc);

    int x = pixels['x'] ?? 1;
    int y = pixels['y'] ?? 1;
    y -= 1;
    x -= 1;

    _url =
        'https://core-carparks-renderer-lots.maps.yandex.net/maps-rdr-carparks/tiles?l=carparks&x=$x&y=$y&z=19&scale=1&lang=ru_RU&v=20220606-203012&experimental_data_poi=postprocess_poi_density_v3';

    _xCoord = x;
    _yCoord = y;

    notifyListeners();
  }

  Map<String, double> _latLongToMerc() {
    if (latitude > 89.5) {
      latitude = 89.5;
    }
    if (latitude < -89.5) {
      latitude = -89.5;
    }

    final radLat = latitude * pi / 180;
    final radLong = longitude * pi / 180;

    var a = 6378137.0;
    var b = 6356752.3142;
    var f = (a - b) / a;

    final e = sqrt(2 * f - pow(f, 2));

    final x = a * radLong;
    final y = a *
        log(tan(pi / 4 + radLat / 2) *
            pow((1 - e * sin(radLat)) / (1 + e * sin(radLat)), e / 2));

    return {'x': x, 'y': y};
  }

  Map<String, int> _mercToPixels(Map<String, double> mercPoint) {
    const equatorLength = 40075016.685578488;
    const z = 19;
    final worldSize = pow(2, z);
    final a = worldSize / equatorLength;
    const b = equatorLength / 2;

    final x = ((b + mercPoint['x']!) * a).round();
    final y = ((b - mercPoint['y']!) * a).round();

    return {'x': x, 'y': y};
  }
}
