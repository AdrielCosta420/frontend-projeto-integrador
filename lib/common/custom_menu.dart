import 'package:flutter/material.dart';
import 'package:flutter_side_menu/flutter_side_menu.dart';
import 'package:routefly/routefly.dart';

import '../routes.dart';

class CustomMenu extends StatelessWidget {
  final Widget widget;
  const CustomMenu({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SideMenu(
              backgroundColor: const Color(0xFF3e20dc),
              builder: (data) => SideMenuData(
                  //    header: const Text('Auto Connect'),
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
                      icon: const Icon(Icons.groups),
                      hoverColor: Colors.white10,
                      highlightSelectedColor: const Color.fromARGB(90, 0, 0, 0),
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
                      onTap: () => Routefly.navigate(routePaths.carros.path),
                      title: ' Carros',
                      icon: const Icon(
                        Icons.no_crash_sharp,
                      ),
                      hoverColor: Colors.white10,
                      highlightSelectedColor: const Color.fromARGB(90, 0, 0, 0),
                    ),
                    SideMenuItemDataTile(
                      borderRadius: BorderRadius.circular(10),
                      margin: const EdgeInsetsDirectional.only(
                        top: 16,
                        bottom: 16,
                        start: 4,
                        end: 4,
                      ),
                      isSelected: false,
                      onTap: () {},
                      title: 'Item 1',
                      icon: const Icon(Icons.home),
                      hoverColor: Colors.white10,
                      highlightSelectedColor: const Color.fromARGB(90, 0, 0, 0),
                    ),
                  ],
                  footer: Row(
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.supervised_user_circle,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'nome do adm',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                                maxLines: 1,
                              ),
                              Text(
                                'admin@email.com',
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: 10,
                                ),
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          icon: Icon(
                            Icons.exit_to_app,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? Colors.blue
                                    : Colors.blue,
                          ),
                          splashRadius: 20,
                          tooltip: 'Sair',
                          onPressed: () {},
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ),
        Expanded(
          child: widget,
        ),
      ],
    );
  }
}
