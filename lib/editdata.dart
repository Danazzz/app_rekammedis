import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:http/http.dart' as http;

class Edit extends StatefulWidget {
  final List list;
  final int index;

  Edit({this.list, this.index});

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  TextEditingController nama;
  TextEditingController spesialis;
  TextEditingController alamat;
  TextEditingController notelp;

  void editData() {
    var url = "hhttp://192.168.18.45/app_uas/_api/edit.php";
    http.post(url, body: {
      'id': widget.list[widget.index]['id'],
      'nama': nama.text,
      'spesialis': spesialis.text,
      'alamat': alamat.text,
      'notelp': notelp.text,
    });
  }

  @override
  void initState() {
    nama = TextEditingController(text: widget.list[widget.index]['nama']);
    spesialis = TextEditingController(text: widget.list[widget.index]['spesialis']);
    alamat = TextEditingController(text: widget.list[widget.index]['alamat']);
    notelp = TextEditingController(text: widget.list[widget.index]['notelp']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Data ${widget.list[widget.index]['name']}"),
      ),
      body: ListView(
        children: [
          TextField(
            controller: nama,
            decoration: InputDecoration(
                hintText: "Enter Nama Dokter", labelText: "Enter Nama Dokter"),
          ),
          TextField(
            controller: spesialis,
            decoration: InputDecoration(
                hintText: "Enter Spesialis Dokter", labelText: "Enter Spesialis Dokter"),
          ),
          TextField(
            controller: alamat,
            decoration: InputDecoration(
                hintText: "Enter Alamat Dokter", labelText: "Enter Alamat Dokter"),
          ),
          TextField(
            controller: notelp,
            decoration: InputDecoration(
                hintText: "Enter Nomor Telepon Dokter", labelText: "Enter Nomor Telepon Dokter"),
          ),
          MaterialButton(
            child: Text("Edit Data"),
            onPressed: () {
              editData();
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => Home()),
              );
            },
          )
        ],
      ),
    );
  }
}
