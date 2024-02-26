import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/models/user.dart';

class UserCubit extends Cubit<User> {
  UserCubit(User initialState) : super(initialState);
  void setUser(User user) {
    emit(user);
  }
}
