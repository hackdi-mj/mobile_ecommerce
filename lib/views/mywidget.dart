import 'package:flutter/material.dart';

class MyWidget {
  Widget imageTile({
    required String img,
    required String price,
  }) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: iconText(
              mainAxisAlignment: MainAxisAlignment.start,
              icon: Icons.attach_money,
              value: price,
            ),
          ),
          Container(
            height: 120,
            width: 120,
            margin: EdgeInsets.only(
              top: 10,
            ),
            child: Image.network(
              img,
            ),
          )
        ],
      ),
    );
  }

  Widget cardTile({
    required String title,
    required String description,
  }) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              title,
              maxLines: 2,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            child: Text(
              description,
              maxLines: 4,
              textAlign: TextAlign.justify,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget iconText({
    required IconData icon,
    required String value,
    required MainAxisAlignment mainAxisAlignment,
  }) {
    return Container(
      child: Row(
        mainAxisAlignment: mainAxisAlignment,
        children: [
          Container(
            height: 15,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Icon(
                icon,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 2,
            ),
            height: 15,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                value,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
