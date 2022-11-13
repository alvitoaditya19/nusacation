part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();
}

class OnInitialPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnGetStartedPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSignInPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSignUpPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSplashPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnLanding extends PageState {
  @override
  List<Object> get props => [];
}

class OnStartMenu extends PageState {
  @override
  List<Object> get props => [];
}

class OnRegistrationPage extends PageState {
  final RegistrationData registrationData;

  OnRegistrationPage(this.registrationData);

  @override
  List<Object> get props => [];
}

class OnPreferencePage extends PageState {
  final RegistrationData registrationData;

  OnPreferencePage(this.registrationData);

  @override
  List<Object> get props => [];
}

class OnAccountConfirmationPage extends PageState {
  final RegistrationData registrationData;

  OnAccountConfirmationPage(this.registrationData);

  @override
  List<Object> get props => [];
}

class OnMenuPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnProfilePage extends PageState {
  @override
  List<Object> get props => [];
}

class OnFavoritPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnHotelsPage extends PageState {
  @override
  List<Object> get props => [];
}
class OnTransportationPage extends PageState {
  @override
  List<Object> get props => [];
}
class OnGuideTourPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnInfoPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnDetailInfoPage extends PageState {
    final InfoModel info;

  OnDetailInfoPage(this.info);
  @override
  List<Object> get props => [info];
}

class OnSearchPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnDetailDestinationPage extends PageState {
  final DestinationModel destination;

  OnDetailDestinationPage(this.destination);

  @override
  List<Object> get props => [destination];
}

class OnDetailHotelPage extends PageState {
  final DestinationModel hotel;

  OnDetailHotelPage(this.hotel);

  @override
  List<Object> get props => [hotel];
}

class OnDetailPaketPage extends PageState {
  final DestinationModel paket;

  OnDetailPaketPage(this.paket);

  @override
  List<Object> get props => [paket];
}

class OnMainPage extends PageState {
  final int bottomNavBarIndex;

  OnMainPage({this.bottomNavBarIndex = 0});

  @override
  List<Object> get props => [bottomNavBarIndex];
}

class OnEditProfilePage extends PageState {
  final UserModel user;

  OnEditProfilePage(this.user);

  @override
  List<Object> get props => [user];
}
