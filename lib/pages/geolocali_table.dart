import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class TableLocation extends StatefulWidget {
  final titreTable;
  final List data;
  const TableLocation({Key key, this.titreTable, this.data}) : super(key: key);

  @override
  _TableLocationState createState() => _TableLocationState();
}

class _TableLocationState extends State<TableLocation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 550,
      // alignment: Alignment.topRight,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.orangeAccent, width: .5),
        boxShadow: [
          BoxShadow(offset: Offset(0, 6), color: Colors.black, blurRadius: 12)
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      margin: EdgeInsets.only(
        bottom: 15,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                "Tableau des étangs et cages",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          DataTable2(
              columnSpacing: 5,
              horizontalMargin: 5,
              columns: [
                DataColumn2(
                  label: Text("Nom"),
                  size: ColumnSize.S,
                ),
                DataColumn(
                  label: Text('Latitude'),
                ),
                DataColumn(
                  label: Text('Longitude'),
                ),
                DataColumn2(label: Text('Action'), size: ColumnSize.S),
              ],
              rows: List<DataRow>.generate(widget.data.length, (index) {
                var data = widget.data[index];

                var latitude = double.parse(data['latitude']);
                var longitude = double.parse(data['longitude']);

                return DataRow(cells: [
                  DataCell(
                    Text(
                      data["nom"],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataCell(
                    Text(
                      data["latitude"],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataCell(
                    Text(
                      data["longitude"],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataCell(
                      Center(
                          child: Icon(
                        Icons.location_on,
                        color: Colors.orangeAccent.shade700,
                      )), onTap: () {
                    // Navigator.pushAndRemoveUntil(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (builder) => GeoLocali(
                    //       lat: latitude,
                    //       lng: longitude,
                    //     ),
                    //   ),
                    //   (route) => false,
                    // );
                    // return FlutterMap(
                    //   options: MapOptions(
                    //     center: LatLng(latitude, longitude),
                    //     zoom: 13.0,
                    //   ),
                    //   layers: [
                    //     TileLayerOptions(
                    //       urlTemplate:
                    //           "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    //       subdomains: ['a', 'b', 'c'],
                    //     ),
                    //     MarkerLayerOptions(
                    //       markers: [
                    //         Marker(
                    //           width: 80.0,
                    //           height: 80.0,
                    //           point: LatLng(latitude, longitude),
                    //           builder: (ctx) => Container(
                    //             child: Icon(Icons.location_on),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ],
                    // );
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return FlutterMap(
                            options: MapOptions(
                              center: LatLng(latitude, longitude),
                              zoom: 13.0,
                            ),
                            layers: [
                              TileLayerOptions(
                                urlTemplate:
                                    "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                                subdomains: ['a', 'b', 'c'],
                              ),
                              MarkerLayerOptions(
                                markers: [
                                  Marker(
                                    width: 80.0,
                                    height: 80.0,
                                    point: LatLng(latitude, longitude),
                                    builder: (ctx) => Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            data['nom'],
                                            style: TextStyle(
                                                color: Colors.red[700],
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                          Icon(
                                            Icons.location_on,
                                            color: Colors.red[800],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        });
                  }),
                ]);
              }).toList()),
        ],
      ),
    );
  }

  String sexe;
}
