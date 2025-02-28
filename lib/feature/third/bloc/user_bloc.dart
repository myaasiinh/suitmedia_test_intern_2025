

// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'package:bloc/bloc.dart';
import '../../../data/auth/datasource/auth_datasource.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthDataSource authDataSource;

  UserBloc({required this.authDataSource}) : super(UserInitial()) {
    on<LoadUserEvent>(_onLoadUser);
  }

  Future<void> _onLoadUser(
      LoadUserEvent event, Emitter<UserState> emit) async {
    emit(UserLoading());
    try {
      final userResponses =
          await authDataSource.getUser(event.page, event.perPage);
      if (userResponses != null) {
        emit(UserLoaded(userResponses: userResponses));
      } else {
        emit(const UserError(errorMessage: 'Gagal memuat data user'));
      }
    } catch (e) {
      emit(UserError(errorMessage: e.toString()));
    }
  }

  void updateSelectedUser(String name) {
    emit(UpdateSelectedName(name));
  }
}
