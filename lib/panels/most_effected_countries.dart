import 'package:flutter/material.dart';


class MostAffectedPanel extends StatelessWidget {

  final List? countryData;
  const MostAffectedPanel({Key? key, this.countryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: Row(
              children: <Widget>[
                Image.network(countryData![index]['countryInfo']['flag'], height: 30, width: 30,),
                SizedBox(width: 10,),
                Text(countryData![index]['country'], style: TextStyle(fontWeight: FontWeight.bold), ),
                SizedBox(width: 10,),
                Text(countryData![index]['deaths'].toString(),
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold
                ),
                )

              ],
            ),
          );
        },
        itemCount: 5,
      ),
    );
  }
}
