import 'package:flutter/material.dart';

class CompanyLogo extends StatelessWidget {
  const CompanyLogo(this.logoUrl, {super.key});

  final String logoUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(logoUrl)),
      ),
    );
  }
}
