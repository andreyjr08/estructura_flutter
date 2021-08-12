import 'package:estructura_flutter/data/service/services.dart';
import 'package:estructura_flutter/device/Location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrentLocation extends StatefulWidget {
  @override
  _CurrentLocationState createState() => _CurrentLocationState();
}

class _CurrentLocationState extends State<CurrentLocation> {
  late String currentLocation = "";
  late Location location;
  late AuthService authService;

  @override
  void initState() {
    super.initState();
    this.location = Location();
    this.authService = AuthService();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
        leading: IconButton(
          icon: Icon(Icons.login_outlined),
          onPressed: () {
            authService.logout();
            Navigator.pushReplacementNamed(context, 'login');
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(color: Colors.teal[50]),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(Icons.location_on),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Location',
                                ),
                                (currentLocation != null)
                                    ? Text(currentLocation)
                                    : Container(),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                    ],
                  )),
              RaisedButton(
                color: Colors.blue[50],
                onPressed: () async {
                  List id = await this.location.getCurrentLocation();
                  print(id);
                },
                child: Text("Get Location"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
