import 'package:flutter/material.dart';
import 'package:flutter_pokedex/pages/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(387.4, 731.4),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PokeDex',
        theme:
            ThemeData.dark().copyWith(textTheme: GoogleFonts.latoTextTheme()),
        home: const HomePage(),
      ),
    );
  }
}
