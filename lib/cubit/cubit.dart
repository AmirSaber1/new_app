import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/business/business_news.dart';
import 'package:news_app/modules/science/science_news.dart';

import '../modules/sports/sports_news.dart';
import '../shared/network/dio_helper/dio_helper.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsIntialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int BottomNavIndex = 0;

  List<Widget> screen = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  void changeBottomNavBar(int index) {
    BottomNavIndex = index;
    if (index == 1) getSportsData();
    if (index == 2) getScienceData();

    emit(NewsBottomNavBarState());
  }

  List<dynamic> business = [];
  List<dynamic> sports = [];
  List<dynamic> science = [];

  void getBusinessData() {
    emit(NewsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
    }).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewGetBusinessDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewGetBusinessDataErrorState(error.toString()));
    });
  }

  void getSportsData() {
    emit(NewsSportsLoadingState());

    if (sports.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
      }).then((value) {
        sports = value.data['articles'];
        print(sports[0]['title']);
        emit(NewGetSportsDataSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewGetSportsDataErrorState(error.toString()));
      });
    } else {
      emit(NewGetSportsDataSuccessState());
    }
  }

  void getScienceData() {
    emit(NewsScienceLoadingState());

    if (science.length == 0) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
      }).then((value) {
        science = value.data['articles'];
        print(science[0]['title']);
        emit(NewGetScienceDataSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewGetScienceDataErrorState(error.toString()));
      });
    } else {
      emit(NewGetScienceDataSuccessState());
    }
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsSearchLoadingState());

    search = [];

    DioHelper.getData(url: 'v2/everything', query: {
      'q': '$value',
      'apiKey': '65f7f556ec76449fa7dc7c0069f040ca'
    }).then((value) {
      search = value.data['articles'];
      print(science[0]['title']);
      emit(NewGetSearchDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewGetSearchDataErrorState(error.toString()));
    });
  }
}
