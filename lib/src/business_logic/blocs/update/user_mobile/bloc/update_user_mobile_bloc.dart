import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'update_user_mobile_event.dart';
part 'update_user_mobile_state.dart';

class UpdateUserMobileBloc extends Bloc<UpdateUserMobileEvent, UpdateUserMobileState> {
  UpdateUserMobileBloc() : super(UpdateUserMobileInitial()) {
    on<UpdateUserMobileEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
