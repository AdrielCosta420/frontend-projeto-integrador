import 'package:flutter_triple/flutter_triple.dart';
import 'package:projeto_integrador4/injectable.dart';
import 'package:projeto_integrador4/modules/user/domain/entities/user_data.dart';
import 'package:projeto_integrador4/modules/user/domain/repositories/user_repository.dart';

class UserStore extends Store<List<UserData>> {
  final repository = injector.get<UserRepository>();
  UserStore() : super([]) {
    getAllUser();
  }
  

  Future<void> getAllUser() async {
    setLoading(true);
    final response = await repository.getAllUsers();

    response.fold(
      (error) => error.messageError,
      (success) => success,
    );
    setLoading(false);
  }


}
