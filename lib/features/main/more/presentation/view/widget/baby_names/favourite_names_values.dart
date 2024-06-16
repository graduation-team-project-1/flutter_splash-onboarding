
import 'package:app/core/resource/color_manager.dart';
import 'package:flutter/material.dart';

class FavoriteNames extends StatelessWidget {
  final String babyGender;
  final List<String> names;
  FavoriteNames({
    Key? key,
    required this.babyGender,
    required this.names,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return names.length > 0
        ? Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: babyGender == "Boy"
                      ? ColorManager.boyBabybackGround
                      : ColorManager.girlBabybackGround,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, left: 15, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        babyGender,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: babyGender == "Boy"
                              ? ColorManager.boyBabyName
                              : ColorManager.girlBabyName,
                          height: 12 / 20,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 3,
                          child: ListView.builder(
                            itemCount: names.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(bottom: 20),
                                child: Text(
                                  names[index],
                                  style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: babyGender == "Boy"
                                        ? ColorManager.boyBabyName
                                        : ColorManager.girlBabyName,
                                    height: 19 / 16,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : Container();
  }
}
