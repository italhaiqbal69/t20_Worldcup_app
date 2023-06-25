import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:t20_worldcup/models/historymodel.dart';
import 'package:t20_worldcup/utility/historydatahandler.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        backgroundColor: Colors.purple,
      ),
      body: FutureBuilder<List<HistoryModel>>(
        future: HistoryDataHandler.getAllHistory(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<HistoryModel> data = snapshot.data;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                HistoryModel history = snapshot.data[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 220,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Hosted By ${history.host}',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Winner',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(
                            'Runnerup',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  'assets/flags/${history.winnerFlag}',
                                  height: 50,
                                  width: 80,
                                ),
                              ),
                              SizedBox(width: 10,),
                              Text(
                                history.winner,
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(width: 10,),
                          Text('Vs', style: TextStyle(color: Colors.white)),
                          SizedBox(width: 10,),
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  'assets/flags/${history.runnerUpFlag}',
                                  height: 50,
                                  width: 80,
                                ),
                              ),
                              SizedBox(width: 10,),
                              Text(history.runnerUp , style: TextStyle(color: Colors.white),),
                            ],
                          ),
                        ],
                      ),
                    ]),
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
