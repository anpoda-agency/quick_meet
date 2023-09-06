import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_meet/core/constants.dart';
import 'package:quick_meet/domain/repository/auth_repository.dart';
import 'package:quick_meet/domain/repository/home_repository.dart';
import 'package:quick_meet/domain/repository/user_repository.dart';
import 'package:quick_meet/domain/router/route_constants.dart';
import 'package:quick_meet/domain/router/route_impl.dart';
import 'package:quick_meet/features/core_widgets/custom_button_widget.dart';
import 'package:quick_meet/features/core_widgets/image_network.dart';
import 'package:quick_meet/features/profile/profile_page/bloc/profile_page_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfilePageBloc(
        authRepository: context.read<GetIt>().get<AuthRepository>(),
        userRepository: context.read<GetIt>().get<UserRepository>(),
        pageState: const PageState(),
      ),
      child: BlocConsumer<ProfilePageBloc, ProfilePageState>(
        listener: (context, state) {
          if (state is ProfilePageLogOutState) {
            context.go(RootRoutes.start.name);
          }
        },
        builder: (context, state) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
            appBar: AppBar(
              toolbarHeight: 0,
              centerTitle: true,
              backgroundColor: Colors.transparent,
              systemOverlayStyle: const SystemUiOverlayStyle(
                systemNavigationBarColor: Colors.black, // Navigation bar
                statusBarColor: Colors.black, // Status bar
              ),
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 120, top: 50),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: () {
                                context
                                    .read<GetIt>()
                                    .get<HomeRepository>()
                                    .changeVisibleNavBar(visible: false);
                                context
                                    .read<RouteImpl>()
                                    .push(ProfileRoutes.profileEdit.name)
                                    .then((value) {
                                  context.read<ProfilePageBloc>().add(ProfilePageUpdate());
                                  context
                                      .read<GetIt>()
                                      .get<HomeRepository>()
                                      .changeVisibleNavBar(visible: true);
                                });
                              },
                              color: Colors.black,
                              icon: const Icon(
                                Icons.edit,
                              )),
                        ],
                      ),
                      Stack(
                        //alignment: AlignmentDirectional.bottomCenter,
                        //textDirection: TextDirection.ltr,

                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 303,
                            decoration: const ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),
                              ),
                              // shadows: [
                              //   BoxShadow(
                              //     color: Color(0x19000000),
                              //     blurRadius: 15,
                              //     offset: Offset(0, 4),
                              //     spreadRadius: 0,
                              //   )
                              // ],
                            ),
                          ),
                          Center(
                            child: Column(
                              children: [
                                if (state.pageState.user.user.avatar.href != 'deleted')
                                  ImageNetworkWithLoader(
                                      width: 128,
                                      height: 128,
                                      fit: BoxFit.cover,
                                      radius: 128,
                                      src:
                                          '${AppConstants.baseImageUrl}file-storage/${state.pageState.user.user.avatar.fileName}'),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  '${state.pageState.user.user.firstName} ${state.pageState.user.user.secondName}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontFamily: 'Comfortaa',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  state.pageState.yearsOld,
                                  style: const TextStyle(
                                    color: Color(0xFF505050),
                                    fontSize: 15,
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  width: 190,
                                  height: 35,
                                  decoration: ShapeDecoration(
                                    color: const Color(0xFFF5F5F5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        // Navigator.pushNamed(
                                        //     context, '/auth_sms_code_page');
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black87,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(18)),
                                      ),
                                      child: const Text(
                                        'ПРЕМИУМ-СТАТУС',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontFamily: 'Comfortaa',
                                          fontWeight: FontWeight.w300,
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                          // НИХУЯ НЕ ДОБАВИЛОСЬ
                          // Container(
                          //   width: 112,
                          //   height: 112,
                          //   decoration: BoxDecoration(
                          //     image: DecorationImage(
                          //       image:
                          //           NetworkImage("https://via.placeholder.com/112x112"),
                          //       fit: BoxFit.fill,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Stack(
                        //alignment: AlignmentDirectional.bottomCenter,
                        //textDirection: TextDirection.ltr,

                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 314,
                            decoration: const ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),
                              ),
                              shadows: [
                                BoxShadow(
                                  color: Color(0x19000000),
                                  blurRadius: 15,
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Column(
                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                  //mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 21,
                                    ),
                                    const Text(
                                      'Номер телефона',
                                      style: TextStyle(
                                        color: Color(0xFF505050),
                                        fontSize: 15,
                                        fontFamily: 'SF Pro Text',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      state.pageState.user.user.phoneNumber,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontFamily: 'SF Pro Text',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 7, 0, 7),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: const ShapeDecoration(
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        width: 0.40,
                                        strokeAlign: BorderSide.strokeAlignCenter,
                                        color: Color(0xFF6B4EFF),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  //mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Электронная почта',
                                      style: TextStyle(
                                        color: Color(0xFF505050),
                                        fontSize: 15,
                                        fontFamily: 'SF Pro Text',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      state.pageState.user.user.email,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontFamily: 'SF Pro Text',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Container(
                                      width: 168,
                                      height: 27,
                                      decoration: ShapeDecoration(
                                        color: const Color(0xFFF5F5F5),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(18),
                                        ),
                                      ),
                                      child: ElevatedButton(
                                          onPressed: () {
                                            // Navigator.pushNamed(
                                            //     context, '/auth_sms_code_page');
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(255, 202, 202, 202),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10)),
                                          ),
                                          child: const Text(
                                            'Подтвердить почту',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontFamily: 'SF Pro Text',
                                              fontWeight: FontWeight.w300,
                                            ),
                                          )),
                                    ),
                                    const SizedBox(
                                      height: 17,
                                    ),
                                    const Text(
                                      'О себе',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontFamily: 'SF Pro Text',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    SizedBox(
                                      width: 335,
                                      height: 88,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(18),
                                            borderSide: const BorderSide(
                                                width: 0.50, color: Color(0xFF6B4EFF)),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(18),
                                            borderSide: const BorderSide(
                                                width: 0.50, color: Color(0xFF6B4EFF)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    CustomButtonWidget(
                                        onPressed: () => context
                                            .read<ProfilePageBloc>()
                                            .add(ProfilePageLogOut()),
                                        title: 'Выйти',
                                        backgroundColor: Colors.white,
                                        widthPadding: 20)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
