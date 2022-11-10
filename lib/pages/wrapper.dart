part of 'pages.dart';

class Wrapper extends StatefulWidget {
  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    auth.User? firebaseUser = Provider.of<auth.User?>(context);

    if (firebaseUser == null) {
      if (!(prevPageEvent is GoToSplashPage)) {
        prevPageEvent = GoToSplashPage();
        context.read<PageBloc>().add(prevPageEvent!);
      }
    } else {
      if (!(prevPageEvent is GoToMainPage)) {
        context.read<UserBloc>().add(LoadUser(firebaseUser.uid));

        prevPageEvent = GoToMainPage();
        context.read<PageBloc>().add(prevPageEvent!);
      }
    }


    return BlocBuilder<PageBloc, PageState>(
        builder: (_, pageState) => (pageState is OnSplashPage)
            ? SplashPage()
            : (pageState is OnGetStartedPage)
                ? GetStartedPage()
                : (pageState is OnSignInPage)
                    ? SignInPage()
                    : (pageState is OnRegistrationPage)
                        ? SignUpPage(pageState.registrationData)
                        : (pageState is OnAccountConfirmationPage)
                            ? AccountConfirmationPage(
                                pageState.registrationData)
                            : (pageState is OnDetailDestinationPage)
                                ? DetailDestinationPage(pageState.destination)
                                : (pageState is OnProfilePage)
                                    ? ProfilePage()
                                    : (pageState is OnFavoritPage)
                                        ? FavoritPage()
                                        : (pageState is OnEditProfilePage)
                                            ? EditProfilePage(pageState.user)
                                            : MainPage());
  }
}
