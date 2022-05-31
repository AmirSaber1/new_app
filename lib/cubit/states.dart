abstract class NewsState {}

class NewsIntialState extends NewsState {}

class NewsBottomNavBarState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewGetBusinessDataSuccessState extends NewsState {}

class NewGetBusinessDataErrorState extends NewsState {
  final String error;

  NewGetBusinessDataErrorState(this.error);
}



class NewsSportsLoadingState extends NewsState {}

class NewGetSportsDataSuccessState extends NewsState {}

class NewGetSportsDataErrorState extends NewsState {
  final String error;

  NewGetSportsDataErrorState(this.error);
}



class NewsScienceLoadingState extends NewsState {}

class NewGetScienceDataSuccessState extends NewsState {}

class NewGetScienceDataErrorState extends NewsState {
  final String error;

  NewGetScienceDataErrorState(this.error);
}

class ChangeModeState extends NewsState {}


class NewsSearchLoadingState extends NewsState {}

class NewGetSearchDataSuccessState extends NewsState {}

class NewGetSearchDataErrorState extends NewsState {
  final String error;

  NewGetSearchDataErrorState(this.error);
}

