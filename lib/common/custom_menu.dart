import 'package:flutter/material.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';
import 'package:projeto_integrador4/app/login/login_store.dart';
import 'package:projeto_integrador4/injectable.dart';
import 'package:routefly/routefly.dart';

import '../routes.dart';

class CustomMenu extends StatefulWidget {
  final Widget widget;
  const CustomMenu({super.key, required this.widget});

  @override
  State<CustomMenu> createState() => _CustomMenuState();
}

class _CustomMenuState extends State<CustomMenu> {
  final controller = SideMenuController();
  final infoLogin = injector.get<LoginStore>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SideMenu(
              controller: controller,
              hasResizer: false,
              backgroundColor: const Color(0xFF3e20dc),
              builder: (data) => SideMenuData(
                header: SizedBox(
                    height: 100, child: Image.asset('assets/images/lgac.png')),
                items: [
                  SideMenuItemDataTile(
                    borderRadius: BorderRadius.circular(10),
                    margin: const EdgeInsetsDirectional.only(
                      top: 16,
                      bottom: 16,
                      start: 4,
                      end: 4,
                    ),
                    isSelected: true,
                    onTap: () => Routefly.navigate(routePaths.users.user),
                    title: 'Usuários',
                    titleStyle: const TextStyle(color: Colors.white),
                    icon: const Icon(Icons.groups),
                    hoverColor: Colors.white10,
                  ),
                  SideMenuItemDataTile(
                    borderRadius: BorderRadius.circular(10),
                    margin: const EdgeInsetsDirectional.only(
                      top: 16,
                      bottom: 16,
                      start: 4,
                      end: 4,
                    ),
                    isSelected: true,
                    onTap: () => Routefly.navigate(routePaths.carros.allCarros),
                    title: 'Carros',
                    titleStyle: const TextStyle(color: Colors.white),
                    icon: const Icon(
                      Icons.no_crash_sharp,
                    ),
                    hoverColor: Colors.white10,
                  ),
                  SideMenuItemDataTile(
                    borderRadius: BorderRadius.circular(10),
                    margin: const EdgeInsetsDirectional.only(
                      top: 16,
                      bottom: 16,
                      start: 4,
                      end: 4,
                    ),
                    isSelected: true,
                    onTap: () =>
                        Routefly.navigate(routePaths.carros.interesseCarro),
                    title: 'Interesse de carros',
                    icon: const Icon(Icons.home),
                    hoverColor: Colors.white10,
                    //   highlightSelectedColor: const Color.fromARGB(90, 0, 0, 0),
                  ),
                  SideMenuItemDataTile(
                    borderRadius: BorderRadius.circular(10),
                    margin: const EdgeInsetsDirectional.only(
                      top: 16,
                      bottom: 16,
                      start: 4,
                      end: 4,
                    ),
                    isSelected: true,
                    onTap: () =>
                        Routefly.navigate(routePaths.carros.reservarCarro),
                    title: 'Reserva de carros',
                    icon: const Icon(Icons.home),
                    hoverColor: Colors.white10,
                    //   highlightSelectedColor: const Color.fromARGB(90, 0, 0, 0),
                  )
                ],
                footer: IconButton(
                  color: Colors.white,
                  icon: const Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ),
                  splashRadius: 20,
                  tooltip: 'Sair',
                  onPressed: () => Routefly.navigate(routePaths.login),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: widget.widget,
        ),
      ],
    );
  }
}
