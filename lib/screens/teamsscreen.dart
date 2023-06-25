import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:t20_worldcup/models/teamsmodel.dart';
import 'package:t20_worldcup/utility/teamsdatahandler.dart';

class Teamsscreen extends StatelessWidget {
  const Teamsscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teams'),
        backgroundColor: Colors.purple,
      ),
      body: FutureBuilder<List<TeamsModel>>(
        future: TeamsDataHandler.getAllTeams(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<TeamsModel> data = snapshot.data;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                TeamsModel teams = snapshot.data[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        ClipRRect(
                          child: Image.asset(
                            teams.flag,
                            height: 220,
                            width: 120,
                            
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        SizedBox(width: 10),
                        Text(
                          teams.fullName,
                          style: TextStyle(color: Colors.white, fontSize: 24),
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
