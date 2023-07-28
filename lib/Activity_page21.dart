import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Customer {
  final String name;
  final String email;

  Customer({required this.name, required this.email});

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      name: json['name'],
      email: json['email'],
    );
  }

  static List<Customer> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Customer.fromJson(json)).toList();
  }
}

class CustomerListScreen extends StatefulWidget {
  @override
  _CustomerListScreenState createState() => _CustomerListScreenState();
}

class _CustomerListScreenState extends State<CustomerListScreen> {
  Future<List<Customer>>? _customersFuture;

  @override
  void initState() {
    super.initState();
    _customersFuture = fetchCustomers();
  }

  Future<List<Customer>> fetchCustomers() async {
    final response = await http.get(Uri.parse('http://consciousleap.co/customers'));
    if (response.statusCode == 200) {
      return Customer.fromJsonList(json.decode(response.body));
    } else {
      throw Exception('Failed to fetch customers');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer List'),
      ),
      body: FutureBuilder<List<Customer>>(
        future: _customersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                final customer = snapshot.data?[index];
                return ListTile(
                  title: Text(customer?.name ?? 'N/A'),
                  subtitle: Text(customer?.email ?? 'N/A'),
                );
              },
            );
          }
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CustomerListScreen(),
  ));
}
