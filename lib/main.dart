import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:news_app/layouts/news_layout.dart';
import 'package:news_app/shared/Theme/theme_cubit/cubit.dart';
import 'package:news_app/shared/Theme/theme_cubit/states.dart';
import 'package:news_app/shared/bloc_observer.dart';
import 'package:news_app/shared/network/dio_helper/dio_helper.dart';

import 'cubit/cubit.dart';

void main() {
  BlocOverrides.runZoned(
    () {},
    blocObserver: MyBlocObserver(),
  );

  DioHelper.init();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (BuildContext context) => NewsCubit()..getBusinessData(),
      ),
      BlocProvider(
        create: (BuildContext context) => AppThemeCubit(),
      )
    ],
    child: BlocConsumer<AppThemeCubit, AppThemeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return MaterialApp(
          theme: ThemeData(
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black)),
              primarySwatch: Colors.deepOrange,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  elevation: 20.0,
                  selectedItemColor: Colors.deepOrange),
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                  backwardsCompatibility: false,
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  iconTheme: IconThemeData(color: Colors.black),
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark),
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold))),
          darkTheme: ThemeData(
              primarySwatch: Colors.deepOrange,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  unselectedItemColor: Colors.grey,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: HexColor('333739'),
                  elevation: 20.0,
                  selectedItemColor: Colors.deepOrange),
              appBarTheme: AppBarTheme(
                  backwardsCompatibility: false,
                  backgroundColor: HexColor('333739'),
                  elevation: 0.0,
                  iconTheme: IconThemeData(color: Colors.white),
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: HexColor('333739'),
                      statusBarIconBrightness: Brightness.light),
                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold)),
              scaffoldBackgroundColor: HexColor('333739'),
              textTheme: TextTheme(
                  bodyText1: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white))),
          themeMode: AppThemeCubit.get(context).isDark
              ? ThemeMode.dark
              : ThemeMode.light,
          home: NewsLayout(),
          debugShowCheckedModeBanner: false,
        );
      },
    ),
  ));
}
