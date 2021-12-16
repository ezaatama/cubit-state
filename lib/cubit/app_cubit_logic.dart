import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubits.dart';
import 'package:flutter_cubit/screens/bottom_navpages/main_page.dart';
import 'package:flutter_cubit/screens/detail_page.dart';
import 'package:flutter_cubit/screens/home_page.dart';
import 'package:flutter_cubit/screens/welcome_screen.dart';

import 'app_cubit_states.dart';

class AppCubitLogic extends StatefulWidget {
  const AppCubitLogic({ Key? key }) : super(key: key);

  @override
  _AppCubitLogicState createState() => _AppCubitLogicState();
}

class _AppCubitLogicState extends State<AppCubitLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state){
          if(state is DetailState){
            return const DetailPage();
          }if(state is WelcomeState){
            return const WelcomeScreen();
          }if(state is LoadedState){
            return const MainPage();
          }if(state is LoadingState){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else{
            return Container();
          }
        }),
    );
  }
}