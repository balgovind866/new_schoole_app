import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

import '../../../data/model/schoole_code.dart';
import '../../../data/repositories/auth_api_repositories.dart';


part 'schoole_code_state.dart';

class SchooleCodeCubit extends Cubit<SchooleCodeState> {
  final AuthApiRepository _authRepository;

  SchooleCodeCubit(this._authRepository) : super(SchooleCodeInitial());

  Future<void> verifySchoolCode(String schoolCode) async {
    emit(SchooleCodeLoading());
    try {
      final result = await _authRepository.verifySchooleCode(schoolCode);

      // If your verifySchooleCode already returns SchooleCodeVerifation instead of OtpModel, adjust this line
      final verification = SchooleCodeVerifation.fromJson(result.toJson());

      emit(SchooleCodeSuccess(result));
    } catch (e) {
      emit(SchooleCodeError(e.toString()));
    }
  }
}

