part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();
}

class GoToSplashPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToGetStartedPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToLanding extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToStartMenu extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToSignInPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToSignUpPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToRegistrationPage extends PageEvent {
  final RegistrationData registrationData;

  GoToRegistrationPage(this.registrationData);

  @override
  List<Object> get props => [];
}

class GoToPreferencePage extends PageEvent {
  final RegistrationData registrationData;

  GoToPreferencePage(this.registrationData);

  @override
  List<Object> get props => [];
}

class GoToAccountConfirmationPage extends PageEvent {
  final RegistrationData registrationData;

  GoToAccountConfirmationPage(this.registrationData);

  @override
  List<Object> get props => [];
}

class GoToMenuPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToProfilePage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToFavoritPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToMainPage extends PageEvent {
  final int bottomNavBarIndex;

  GoToMainPage({this.bottomNavBarIndex = 0});

  @override
  List<Object> get props => [bottomNavBarIndex];
}

class GoToHotelsPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToInfoPage extends PageEvent {



  GoToInfoPage();
  @override
  List<Object> get props => [];
}
class GoToTranportationPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToSuccessPage extends PageEvent {
  final UserModel user;
  
  GoToSuccessPage(this.user);
  @override
  List<Object> get props => [];
}

class GoToGuideTourPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToDetailInfoPage extends PageEvent {
    final InfoModel info;

  GoToDetailInfoPage(this.info);
  @override
  List<Object> get props => [info];
}

class GoToSearchPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToDetailDestinationPage extends PageEvent {
  final DestinationModel destination;

  GoToDetailDestinationPage(this.destination);

  @override
  List<Object> get props => [destination];
}

class GoToDetailHotelPage extends PageEvent {
  final DestinationModel hotel;

  GoToDetailHotelPage(this.hotel);

  @override
  List<Object> get props => [hotel];
}

class GoToDetailPaketPage extends PageEvent {
  final DestinationModel paket;

  GoToDetailPaketPage(this.paket);

  @override
  List<Object> get props => [paket];
}

class GoToBookingPage extends PageEvent {
  final DestinationModel booking;

  GoToBookingPage(this.booking);

  @override
  List<Object> get props => [booking];
}

class GoToEditProfilePage extends PageEvent {
  final UserModel user;

  GoToEditProfilePage(this.user);

  @override
  List<Object> get props => [user];
}
