import 'package:flutter/material.dart';

class DoctorSearchDelegate extends SearchDelegate<String> {
  final List<String> doctors;

  DoctorSearchDelegate(this.doctors);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final filteredDoctors = doctors.where((doctor) => doctor.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: filteredDoctors.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredDoctors[index]),
          onTap: () {
            close(context, filteredDoctors[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filteredDoctors = doctors.where((doctor) => doctor.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: filteredDoctors.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredDoctors[index]),
          onTap: () {
            query = filteredDoctors[index];
            showResults(context);
          },
        );
      },
    );
  }
}
