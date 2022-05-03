import 'package:covid19app/widgets/info_card.dart';
import 'package:flutter/material.dart';

class WorldWidePanel extends StatelessWidget {

  final Map worldWide;
  final Map historyData;

  const WorldWidePanel({Key key, this.worldWide,this.historyData}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5
        ),
        children: <Widget>[
          InfoCard(
            title: 'CONFIRMED',
            effectedNum: worldWide['cases'],
            iconColor: Colors.red,
            press: () {},
            cardColor: Colors.red[100],
            historyData: historyData,
          ),
          InfoCard(
            title: 'ACTIVE',
            effectedNum: worldWide['active'],
            iconColor: Colors.blue,
            press: () {},
            cardColor: Colors.blue[100],
            historyData: null,
          ),
          InfoCard(
            title: 'RECOVERD',
            effectedNum: worldWide['recovered'],
            iconColor: Colors.green,
            press: () {},
            cardColor: Colors.green[100],
            historyData: historyData,
          ),
          InfoCard(
            title: 'DEATHS',
            effectedNum: worldWide['deaths'],
            iconColor: Colors.grey,
            press: () {},
            cardColor: Colors.grey[100],
            historyData: historyData,
          ),
        ],
      ),
    );
  }
}

class StatusPanel extends StatelessWidget {

  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const StatusPanel({Key key, this.panelColor, this.textColor, this.title, this.count}) : super(key: key);@override


  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return Container(
      margin: EdgeInsets.all(10),
      height: 80,
      width: width / 2,
      color: panelColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center ,
        children: <Widget>[
          Text(title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: textColor
            ),
          ),
          Text(count,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: textColor
            ),
          )
        ],
      ),
    );
  }
}

