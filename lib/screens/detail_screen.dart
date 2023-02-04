import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mini_covid19_menus/constant.dart';
import 'package:mini_covid19_menus/widgets/weekly_chart.dart';

class DetailScreens extends StatelessWidget {
  const DetailScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar
      appBar: buildDetailBar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // item top
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                // bg color
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 21),
                      blurRadius: 53,
                      color: Colors.black.withOpacity(.05),
                    ),
                  ],
                ),
                // item
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // top
                    buildTitlenIconMore(),
                    // middle
                    SizedBox(
                      height: 15,
                    ),
                    buildCaseNumber(context),
                    // bottom
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "From Health Center",
                      style: TextStyle(
                        fontWeight: FontWeight.w200,
                        color: kTextMediumColor,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    WeeklyChart(),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buildInfoTextWithPercentage(
                          percentage: '6.43',
                          title: 'From Last Week',
                        ),
                        buildInfoTextWithPercentage(
                          percentage: '9.43',
                          title: 'Recovery Rate',
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 21),
                      blurRadius: 54,
                      color: Colors.black.withOpacity(.05),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Global Map",
                          style: TextStyle(fontSize: 15),
                        ),
                        SvgPicture.asset("assets/icons/more.svg")
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SvgPicture.asset("assets/icons/map.svg"),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  RichText buildInfoTextWithPercentage(
      {required String title, required String percentage}) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "$percentage%\n",
            style: TextStyle(
              fontSize: 20,
              color: kPrimaryColor,
            ),
          ),
          TextSpan(
            text: title,
            style: TextStyle(
              color: kTextMediumColor,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Row buildCaseNumber(BuildContext context) {
    return Row(
      children: [
        Text(
          "547 ",
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: kPrimaryColor, height: 1.2),
        ),
        Text(
          "5.9% ",
          style: TextStyle(
            color: kPrimaryColor,
          ),
        ),
        SvgPicture.asset("assets/icons/increase.svg")
      ],
    );
  }

  Row buildTitlenIconMore() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // title
        Text(
          "New Cases",
          style: TextStyle(
            color: kTextMediumColor,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
        // icon
        SvgPicture.asset("assets/icons/more.svg"),
      ],
    );
  }

  AppBar buildDetailBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: kPrimaryColor,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      backgroundColor: kBackgroundColor,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/search.svg"),
        ),
      ],
    );
  }
}
