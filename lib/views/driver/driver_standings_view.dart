// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:formula_one_app/views/driver/driver_standings_view_model.dart';

import '../../core/theme/theme.dart';
import '../../utils/constants/assets_constants.dart';

class DriverStandingsView extends DriverViewModel {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(size),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
            left: size.width * 0.009, right: size.width * 0.009),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.02),
              child:
                  const Text('Drivers', style: const TextStyle(fontSize: 60)),
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: models.length,
                  itemBuilder: ((context, index) => Padding(
                        padding: EdgeInsets.only(
                            left: size.width * 0.03,
                            right: size.width * 0.03,
                            top: size.width * 0.025),
                        child: Container(
                          height: size.height * 0.27,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.black,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: size.width * 0.05),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(height: size.height * 0.06,),
                                            Text(models[index].rank, style: TextStyle(color: Colors.white,fontSize: 30, fontWeight: FontWeight.bold),),
                                            SizedBox(width: size.width * 0.2,),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: size.width * 0.03),
                                              child: Image.network(
                                                models[index].flag,
                                                height: size.height * 0.04,
                                                fit: BoxFit.fitHeight,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: size.height * 0.035,
                                        ),
                                        Text(
                                          models[index].name,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        Text(
                                          models[index].surname,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: size.height * 0.005,
                                        right: size.width * 0.045),
                                    child: Container(
                                      width: size.width * 0.3,
                                      height: size.height * 0.14,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          child: Image.network(
                                            models[index].photo,
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                height: size.height * 0.05,
                                thickness: 1,
                                endIndent: 20,
                                indent: 20,
                                color: Colors.white,
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.only(bottom: size.width * 0.02),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: size.height * 0.03,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[600],
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: size.width * 0.02),
                                          child: Text(
                                              '${models[index].point} Puan',
                                              style: themeData
                                                  .textTheme.headline4),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: size.height * 0.03,
                                        decoration: BoxDecoration(
                                            color: Colors.grey[600],
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: size.width * 0.02),
                                          child: Text(
                                              models[index].team,
                                              style: themeData
                                                  .textTheme.headline4),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey[600],
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.network(
                                          models[index].driverNumber,
                                          height: size.height * 0.03,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ))),
            )
          ],
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  AppBar CustomAppBar(Size size) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: EdgeInsets.only(left: size.width * 0.02),
        child: Image.asset(ImagesConstant.logoImage),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.home_max_outlined),
          onPressed: () {},
          color: themeData.primaryColor,
        ),
      ],
    );
  }
}
