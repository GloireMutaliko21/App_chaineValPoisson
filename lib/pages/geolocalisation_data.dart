import 'package:amidacode/models/usersModel/data_source.dart';
import 'package:amidacode/pages/geolocali_table.dart';
import 'package:flutter/material.dart';

class GeoLocData extends StatefulWidget {
  const GeoLocData({Key key}) : super(key: key);

  @override
  _GeoLocDataState createState() => _GeoLocDataState();
}

class _GeoLocDataState extends State<GeoLocData> {
  List latlong = <dynamic>[];

  Future<void> getLocation() async {
    await DataSource.getInstance
        .getCurrentData(params: {"event": "FIND_LOCATION"}).then((data) {
      if (mounted)
        setState(() {
          latlong = data;
        });
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                    // height: 300,
                    child: SingleChildScrollView(
                        child: TableLocation(
                  data: latlong,
                ))),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
