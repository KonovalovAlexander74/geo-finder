import 'package:flutter/material.dart';
import 'package:geo_test/core/themes/app_theme.dart';
import 'package:geo_test/provider/tile_finder.dart';
import 'package:geo_test/widgets/home_page.dart';
import 'package:provider/provider.dart';

class GeoApp extends StatelessWidget {
  const GeoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<TileFinder>(
        create: (context) => TileFinder(),
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: const HomePage(),
        ),
      ),
    );
  }
}
