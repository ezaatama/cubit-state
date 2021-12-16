import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubit_states.dart';
import 'package:flutter_cubit/cubit/app_cubits.dart';
import 'package:flutter_cubit/theme/colors.dart';
import 'package:flutter_cubit/widgets/app_button.dart';
import 'package:flutter_cubit/widgets/app_large_text.dart';
import 'package:flutter_cubit/widgets/app_text.dart';
import 'package:flutter_cubit/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailState detail = state as DetailState;
      return Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                      width: double.maxFinite,
                      height: 350,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  "http://mark.bslmeiyu.com/uploads/" +
                                      detail.place.img),
                              fit: BoxFit.cover)))),
              SingleChildScrollView(
                child: Container(
                    margin: const EdgeInsets.only(top: 300),
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 100,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(
                              text: detail.place.name,
                              color: Colors.black54.withOpacity(0.8),
                            ),
                            AppLargeText(
                              text: "\$" + detail.place.price.toString(),
                              color: AppColors.mainColor,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: AppColors.mainColor),
                            const SizedBox(
                              width: 5,
                            ),
                            AppText(
                                text: detail.place.location,
                                color: AppColors.textColor1)
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Wrap(
                                children: List.generate(
                                    5,
                                    (index) => Icon(Icons.star,
                                        color: index < detail.place.stars
                                            ? AppColors.starColor
                                            : AppColors.textColor2))),
                            const SizedBox(width: 10),
                            AppText(
                                text: detail.place.stars.toString(),
                                color: AppColors.textColor2)
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        AppLargeText(
                          text: "People",
                          color: Colors.black.withOpacity(0.8),
                          size: 20,
                        ),
                        const SizedBox(height: 5),
                        AppText(
                            text: "Number of people in your group",
                            color: AppColors.mainTextColor),
                        const SizedBox(height: 10),
                        Wrap(
                            children: List.generate(
                                5,
                                (index) => InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = index;
                                        });
                                      },
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        child: AppButton(
                                          backgroundColor:
                                              selectedIndex == index
                                                  ? Colors.black
                                                  : AppColors.buttonBackground,
                                          borderColor: selectedIndex == index
                                              ? Colors.black
                                              : AppColors.buttonBackground,
                                          color: selectedIndex == index
                                              ? Colors.white
                                              : Colors.black,
                                          size: 50,
                                          text: (index + 1).toString(),
                                        ),
                                      ),
                                    ))),
                        const SizedBox(height: 20),
                        AppLargeText(
                            text: "Description",
                            color: Colors.black.withOpacity(0.8),
                            size: 20),
                        const SizedBox(height: 10),
                        AppText(
                            text: detail.place.description,
                            color: AppColors.mainTextColor),
                        Expanded(
                          child: Row(
                            children: [
                              AppButton(
                                  size: 60,
                                  color: AppColors.textColor1,
                                  backgroundColor: Colors.white,
                                  borderColor: AppColors.textColor1,
                                  isIcon: true,
                                  icon: Icons.favorite_border),
                              const SizedBox(width: 20),
                              ResponsiveButton(
                                isResponsive: true,
                              )
                            ],
                          ),
                        )
                      ],
                    )),
              ),
              Positioned(
                  left: 20,
                  top: 50,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<AppCubits>(context).goHome();
                        },
                        icon: Icon(Icons.menu),
                        color: Colors.white,
                      )
                    ],
                  )),
            ],
          ),
        ),
      );
    });
  }
}
