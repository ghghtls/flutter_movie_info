import 'package:flutter/material.dart';

class CompanyLogoItem extends StatelessWidget {
  final String logoUrl;

  const CompanyLogoItem({super.key, required this.logoUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      width: 80,
      child: Image.network(logoUrl, fit: BoxFit.contain),
    );
  }
}
