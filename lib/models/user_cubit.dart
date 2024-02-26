import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/models/user.dart';

class UserCubit extends Cubit<User?> { // Change the type to User?
  UserCubit() : super(null); // Change the initial state to null
  void setUser(User user) {
    emit(user);
  }
}
