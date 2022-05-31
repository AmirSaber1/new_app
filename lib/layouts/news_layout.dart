import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/modules/search/search.dart';
import 'package:news_app/shared/Theme/theme_cubit/cubit.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/network/dio_helper/dio_helper.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('Alkhabar',style: TextStyle(color: Colors.deepOrange),),
            actions: [
              IconButton(onPressed: () {
                navigateTo(context, SearchScreen());

              }, icon: Icon(Icons.search)),
              IconButton(onPressed: () {
                AppThemeCubit.get(context).chaneMode();

              }, icon: Icon(Icons.brightness_2_sharp))
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.BottomNavIndex,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.business_rounded), label: 'Business'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.sports), label: 'Sports'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.science_outlined), label: 'Science'),
               ]),
          body: cubit.screen[cubit.BottomNavIndex],
        );
      },
    );
  }
}
