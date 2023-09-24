import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  const CampoTexto({super.key});

  @override
  State<CampoTexto> createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: TextFormField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              filled: true,
              hintText: "SEARCH",
              hintStyle: TextStyle(
                color: Colors.black,
                fontSize: 16
              ),
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none),
            ),
          ),
        ),
      ),
    );
  }
}
