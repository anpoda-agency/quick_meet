import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_meet/domain/repository/home_repository.dart';
import 'package:quick_meet/domain/repository/user_repository.dart';

class ScaffoldNavBar extends StatelessWidget {
  const ScaffoldNavBar({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldNavBar'));

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          navigationShell,
          context.read<GetIt>().get<HomeRepository>().isShowNavBar
              ? Positioned(
                  left: 0,
                  right: 0,
                  bottom: 20,
                  child: Container(
                    height: 89,
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        const Color(0xff4779BC),
                        const Color(0xff1B65C8).withOpacity(0.6),
                      ]),
                      color: Colors.lightBlueAccent[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: BottomNavigationBar(
                      backgroundColor: Colors.transparent,
                      showUnselectedLabels: true,
                      type: BottomNavigationBarType.fixed,
                      elevation: 0,
                      items: <BottomNavigationBarItem>[
                        const BottomNavigationBarItem(
                            icon: Icon(
                              Icons.list,
                              color: Colors.white,
                            ),
                            label: 'Meets'),
                        const BottomNavigationBarItem(
                            icon: Icon(
                              Icons.map,
                              color: Colors.white,
                            ),
                            label: 'Map'),
                        const BottomNavigationBarItem(
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            label: 'Profile'),
                        if (context.read<GetIt>().get<UserRepository>().isBusiness)
                          const BottomNavigationBarItem(
                              icon: Icon(
                                Icons.work,
                                color: Colors.black,
                              ),
                              label: 'Business'),
                      ],
                      currentIndex: navigationShell.currentIndex,
                      onTap: (int index) => _onTap(context, index),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
      
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
