import 'dart:js';

import 'package:flutter/material.dart';

import 'dog_model.dart';


class DogList extends StatelessWidget {
  final List<Dog> doggos;
  DogList(this.doggos);


  @override
  Widget build(BuildContext) {
    return _buildList(context);
  }

  ListView _buildList(context) {
    return ListView.builder(
        itemCount: doggos.length,
        itemBuilder: (context, int){
          return DogCard(doggos[int]);
        },
      );
  }
}