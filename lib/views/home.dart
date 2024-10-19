import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class ApiExample extends StatefulWidget {
  @override
  _ApiExampleState createState() => _ApiExampleState();
}

class _ApiExampleState extends State<ApiExample> {
  String _response = "Response will appear here";

  // GET Request
  Future<void> getData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/2'));
    if (response.statusCode == 200) {
      setState(() {
        _response = 'GET Response: ${json.decode(response.body)}';
      });
    } else {
      setState(() {
        _response = 'Failed to GET data';
      });
    }
  }

  // POST Request
  Future<void> postData() async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: {'Content-Type': 'application/json;charset=UTF-8'},
      body: jsonEncode({'title': 'Flutter POST Request', 'body': 'This is the body of the POST request', 'userId': '1'}),
    );
    if (response.statusCode == 201) {
      setState(() {
        _response = 'POST Response: ${json.decode(response.body)}';
      });
    } else {
      setState(() {
        _response = 'Failed to POST data';
      });
    }
  }

  // PUT Request
  Future<void> putData() async {
    final response = await http.put(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
      headers: {'Content-Type': 'application/json;charset=UTF-8'},
      body: jsonEncode({'title': 'Flutter PUT Request', 'body': 'This is the body of the PUT request', 'userId': '1'}),
    );
    if (response.statusCode == 200) {
      setState(() {
        _response = 'PUT Response: ${json.decode(response.body)}';
      });
    } else {
      setState(() {
        _response = 'Failed to PUT data';
      });
    }
  }

  // DELETE Request
  Future<void> deleteData() async {
    final response = await http.delete(Uri.parse('https://jsonplaceholder.typicode.com/posts/1'));
    if (response.statusCode == 200) {
      setState(() {
        _response = 'DELETE Response: Data deleted successfully';
      });
    } else {
      setState(() {
        _response = 'Failed to DELETE data';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter API Requests'),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
           
              Text(
                _response,
                textAlign: TextAlign.center,
              ),
                  SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(10)),
                child: ElevatedButton(
                  onPressed: getData,
                  child: Text('GET Request'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.blue, backgroundColor: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(10)),
                child: ElevatedButton(
                  onPressed: postData,
                  child: Text('POST Request'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.green, backgroundColor: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(10)),
                child: ElevatedButton(
                  onPressed: putData,
                  child: Text('PUT Request'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.orange, backgroundColor: Colors.white,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
                child: ElevatedButton(
                  onPressed: deleteData,
                  child: Text('DELETE Request'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.red, backgroundColor: Colors.white,
                  ),
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
