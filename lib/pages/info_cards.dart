import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  final title;
  final value;
  final topColor;
  final isActive;
  final onTap;
  const InfoCard(
      {Key key,
      this.title,
      this.value,
      this.topColor,
      this.isActive = false,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Container(
            height: 136,
            width: 250,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 6),
                      color: Colors.orange.withOpacity(.1),
                      blurRadius: 12)
                ],
                borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      color: topColor ?? Colors.orange,
                      height: 5,
                    ))
                  ],
                ),
                Expanded(child: Container()),
                RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(children: [
                      TextSpan(
                          text: "$title\n",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.brown,
                          )),
                      TextSpan(
                          text: "$value",
                          style: TextStyle(
                              fontSize: 28,
                              color: Colors.blueGrey.shade900,
                              fontWeight: FontWeight.bold)),
                    ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
