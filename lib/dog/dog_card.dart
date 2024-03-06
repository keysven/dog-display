import 'package:flutter/material.dart';

import 'dog_model.dart';


class DogCard extends StatefulWidget {
  final Dog dog;

  DogCard(this.dog);

  @override
  _DogCardState createState() => _DogCardState(dog); 
}

class _DogCardState extends State<DogCard> {
  Dog dog;

  _DogCardState(this.dog);

  void initState() {
    super.initState();
    renderDogPic();
  }

  void renderDogPic() async {
    await dog.getImageUrl();
    if (mounted) {
      setState(() {
        renderUrl = dog.imageUrl;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(widget.dog.name);
  }

  Widget get dogImage {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(renderUrl ?? ''),
        ),
      ),
    );
  }

  Widget get dogCard {
    return Container(
      width: 290.0,
      height: 115.0,
      child: Card(
        color: Colors.black87,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
            left: 64.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(widget.dog.name,
              style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(widget.dog.location,
              style: Theme.of(context).textTheme.subhead,),
              Row(
                children: <Widget>[
                  Icon(
                    Icon.star,
                  ),
                  Text(': ${widget.dog.rating} / 10')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}