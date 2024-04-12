import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poll_app/provider/main_provider.dart';
import 'package:poll_app/view/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return MainProvider();
          },
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: TextTheme(
            displayLarge: const TextStyle(
              color: Colors.white,
            ),
            titleLarge: GoogleFonts.poppins(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
            bodyMedium: GoogleFonts.poppins(
              color: Colors.white,
            ),
            displaySmall: GoogleFonts.poppins(
              color: Colors.white,
            ),
          ),
        ),
        home: const MainScreen(),
      ),
    );
  }
}
