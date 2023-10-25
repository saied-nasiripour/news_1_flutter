import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_1_flutter/core/constants/palette.dart';
import 'package:news_1_flutter/core/services_locator.dart';
import 'package:news_1_flutter/features/show_news/presentation/news_cubit/news_cubit.dart';
import 'package:news_1_flutter/features/show_news/presentation/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return NewsCubit();
          }),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          /*colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),*/
          colorScheme: const ColorScheme.light().copyWith(
            secondary: Palette.deepBlue,
          ),
          useMaterial3: true,
          fontFamily: 'Avenir',
        ),
        home: const HomePage(),
      ),
    );
  }
}
