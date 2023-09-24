import 'package:flutter/material.dart';

class AtualizarTextos extends StatefulWidget {
  const AtualizarTextos({Key? key});

  @override
  State<AtualizarTextos> createState() => _AtualizarTextosState();
}

class _AtualizarTextosState extends State<AtualizarTextos> {
  double spaceBetweenLabels = 2.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Container(
            child: Text(
              "Username",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: TextFormField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                prefixIcon: Icon(Icons.people_sharp),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Container(
            child: Text(
              "Confirm username",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: TextFormField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                prefixIcon: Icon(Icons.people_sharp),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Container(
            child: Text(
              "Email",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: TextFormField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Container(
            child: Text(
              "Password",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: TextFormField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Container(
            child: Text(
              "Confirm password",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: TextFormField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
