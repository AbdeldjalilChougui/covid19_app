import 'package:covid19app/widgets/line_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoCard extends StatelessWidget {

  final String? title;
  final int? effectedNum;
  final Color? iconColor;
  final Function()? press;
  final cardColor;
  final Map? historyData;

  InfoCard({this.title, this.effectedNum, this.iconColor, this.press, this.cardColor,this.historyData});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          margin: EdgeInsets.all(5),
          child: GestureDetector(
            onTap: press!,
            child: Container(
              width: (MediaQuery.of(context).size.width / 2) - 10,
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: iconColor!.withOpacity(0.12),
                              shape: BoxShape.circle
                            ),
                            child: SvgPicture.asset(
                              "assets/images/running-icon.svg",
                              width: 12,
                              height: 12,
                              color: iconColor,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text(
                            title!,
                            maxLines: 1,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(color: Color(0xFF1E2432)),
                                children: [
                                  TextSpan(
                                    text: "$effectedNum \n",
                                    style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: "People",
                                    style: TextStyle(
                                      fontSize: 12,
                                      height: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: LineChartReport(
                              historyData: historyData!,
                              title: this.title!,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
