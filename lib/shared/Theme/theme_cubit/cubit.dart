
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/Theme/theme_cubit/states.dart';

class AppThemeCubit extends Cubit<AppThemeState> {
  AppThemeCubit() : super(IntialState());

  static AppThemeCubit get(context) => BlocProvider.of(context);



  bool isDark = false;

  void chaneMode(){

    isDark = !isDark;
    emit(ChangeModeState());
  }
}