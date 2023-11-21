import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:projeto_integrador4/app/users/user_store.dart';
import 'package:projeto_integrador4/injectable.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  final userStore = injector.get<UserStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedBuilder(
        store: userStore,
        onState: (context, state) => Center(
          child: Container(
            width: 300,
            height: 300,
            color: Colors.red,
            child: ListView.builder(
                itemCount: userStore.state.length,
                itemBuilder: (context, index) {
                  final user = userStore.state[index];
                  return Container(
                      color: Colors.blue,
                      child: Text('${user.login} AQQQQQQQQ'));
                }),
          ),
        ),
      ),
    );
  }
}
