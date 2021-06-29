import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app_uas/crud.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD Dokter',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  Future getData()async{
    var url = 'http://192.168.18.45/app_uas/dokter/getdata.php';
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }


  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD Dokter'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddEditPage(),),);
          debugPrint('Clicked FloatingActionButton Button');
        },
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context,snapshot){
          if(snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context,index){
                List list = snapshot.data;
                return ListTile(
                  leading: GestureDetector(child: Icon(Icons.edit),
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AddEditPage(list: list,index: index,),),);
                    debugPrint('Edit Clicked');
                  },),
                  title: Text(list[index]['Spesialis']),
                  subtitle: Text(list[index]['No.telp']),
                  trailing: GestureDetector(child: Icon(Icons.delete),
                    onTap: (){
                      setState(() {
                        var url = 'http://192.168.18.45/app_uas/dokter/del.php';
                        http.post(Uri.parse(url),body: {
                          'id' : list[index]['id'],
                        });
                      });
                      debugPrint('delete Clicked');
                    },),
                );
              }
          )
              : CircularProgressIndicator();
        },
      ),
    );
  }
}