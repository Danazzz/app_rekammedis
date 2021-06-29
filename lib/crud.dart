import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:app_uas/main.dart';

class AddEditPage extends StatefulWidget {
  final List list;
  final int index;
  AddEditPage({this.list,this.index});
  @override
  _AddEditPageState createState() => _AddEditPageState();
}

class _AddEditPageState extends State<AddEditPage> {

  TextEditingController nama_dokter = TextEditingController();
  TextEditingController spesialis = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController no_telp = TextEditingController();

  bool editMode = false;


  addUpdateData(){
    if(editMode){
      var url = 'http://192.168.18.45/app_uas/dokter/edit.php';
      http.post(url,body: {
        'id' : widget.list[widget.index]['id'],
        'Nama' : nama_dokter.text,
        'Spesialis' : spesialis.text,
        'Alamat' : alamat.text,
        'Telepon' : no_telp.text,
      });
    }else{
      var url = 'http://192.168.18.45/app_uas/dokter/add.php';
      http.post(url,body: {
        'Nama' : nama_dokter.text,
        'Spesialis' : spesialis.text,
        'Alamat' : alamat.text,
        'Telepon' : no_telp.text,
      });
    }

  }


  @override
  void initState() {
    super.initState();
    if(widget.index != null){
      editMode = true;
      nama_dokter.text = widget.list[widget.index]['Nama'];
      spesialis.text = widget.list[widget.index]['Spesialis'];
      alamat.text = widget.list[widget.index]['Alamat'];
      no_telp.text = widget.list[widget.index]['Telepon'];
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(editMode ? 'Update' :'Add Data'),),
      body: ListView(
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nama_dokter,
              decoration: InputDecoration(
                labelText: 'Nama Dokter',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: spesialis,
              decoration: InputDecoration(
                labelText: 'Spesialis',
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: alamat,
              decoration: InputDecoration(
                labelText: 'Alamat',
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: no_telp,
              decoration: InputDecoration(
                labelText: 'No.Telp',
              ),
            ),
          ),

          Padding(padding: EdgeInsets.all(8),
            child: RaisedButton(
              onPressed: (){
                setState(() {
                  addUpdateData();
                });
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(),),);
                debugPrint('Clicked RaisedButton Button');
              },
              color: Colors.blue,
              child: Text(editMode ? 'Update' :'Save',style: TextStyle(color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }
}