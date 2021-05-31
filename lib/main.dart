import 'package:camera_app/screens/view_image_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/take_pic_screen.dart';
import './screens/tabs_screen.dart';
import './providers/pictures.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Pictures>(create: (_) => Pictures()),
      ],
      child: Container(
        child: MaterialApp(
          title: 'Camera App',
          theme: ThemeData(
            primarySwatch: Colors.teal,
            accentColor: Colors.teal,
            fontFamily: 'Lato',
            textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.bold,
                  ),
                ),
          ),
          routes: {
            '/': (ctx) => TabsScreen(),
            TakePicScreen.routeName: (ctx) => TakePicScreen(),
            ViewImages.routeName: (ctx) => ViewImages(),
          },
        ),
      ),
    );
  }
}
