import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:nusacation/models/models.dart';
import 'package:nusacation/services/services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc()
      : super(
          UserInitial(),
        ){

    on<UserEvent>(mapEventToState);

        }
  @override
  void mapEventToState(
    UserEvent event, Emitter<UserState> emit)
  async {
    if (event is LoadUser) {
      UserModel user = await UserServices.getUser(event.id);

      emit( UserLoaded(user));
    } else if (event is SignOut) {
      emit(UserInitial());
    } else if (event is UpdateData) {
      UserModel updatedUser = (state as UserLoaded)
          .user
          .copyWith(name: event.name!, profilePicture: event.profileImage!);

      await UserServices.updateUser(updatedUser);

      emit( UserLoaded(updatedUser));
    }
  }
}
