import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:t20_worldcup/models/schedulemodel.dart';
import 'package:t20_worldcup/models/venuesmodel.dart';
import 'package:t20_worldcup/utility/venuesdatahandler.dart';

class VenuesScreen extends StatelessWidget {
  const VenuesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Venues'),
        backgroundColor: Colors.purple,
      ),
      body: FutureBuilder<List<VenuesModel>>(
        future: VenuesDataHAndler.getAllVenues(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<VenuesModel> data = snapshot.data;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                VenuesModel venues = snapshot.data[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 220,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          'Country:${venues.country}',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        SizedBox(height: 25),
                        Text(
                          'City${venues.city}',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        Text(
                          venues.stadium,
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                        ClipRRect(
                          child: Image.asset(
                            venues.image,
                            height: 115,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
