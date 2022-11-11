import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:nusacation/models/destination_model.dart';
import 'package:nusacation/models/models.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  PageBloc()
      : super(
          OnInitialPage(),
        ) {
    on<PageEvent>(mapEventToState);
  }

  @override
  void mapEventToState(PageEvent event, Emitter<PageState> emit) async {
    if (event is GoToSplashPage) {
      emit(OnSplashPage());
    } else if (event is GoToGetStartedPage) {
      emit(OnGetStartedPage());
    } else if (event is GoToSignInPage) {
      emit(OnSignInPage());
    } else if (event is GoToSignUpPage) {
      emit(OnSignUpPage());
    } else if (event is GoToRegistrationPage) {
      emit(OnRegistrationPage(event.registrationData));
    } else if (event is GoToPreferencePage) {
      emit(OnPreferencePage(event.registrationData));
    } else if (event is GoToAccountConfirmationPage) {
      emit(OnAccountConfirmationPage(event.registrationData));
    } else if (event is GoToMainPage) {
      emit(OnMainPage(bottomNavBarIndex: event.bottomNavBarIndex));
    } else if (event is GoToDetailDestinationPage) {
      emit(OnDetailDestinationPage(event.destination));
    } else if (event is GoToProfilePage) {
      emit(OnProfilePage());
    } else if (event is GoToFavoritPage) {
      emit(OnFavoritPage());
    } else if (event is GoToHotelsPage) {
      emit(OnHotelsPage());
    } else if (event is GoToInfoPage) {
      emit(OnInfoPage());
    } else if (event is GoToSearchPage) {
      emit(OnSearchPage());
    } else if (event is GoToDetailInfoPage) {
      emit(OnDetailInfoPage());
    } else if (event is GoToEditProfilePage) {
      emit(OnEditProfilePage(event.user));
    }
  }
}
