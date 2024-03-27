import 'package:flutter/material.dart';

@immutable
class Person {
  final String name;
  final String age;
  final String emoji;
  const Person({
    required this.name,
    required this.age,
    required this.emoji,
  });
}

List<Person> people = const [
  Person(name: "Ganesh", age: "30", emoji: "🧑‍💻"),
  Person(name: "Durga", age: "50", emoji: "🤴"),
  Person(name: "Sanju", age: "60", emoji: "👸"),
];

class HeroAnimationExample4 extends StatelessWidget {
  const HeroAnimationExample4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: people.length,
        itemBuilder: (context, index) {
          final person = people[index];

          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return PersonPage(person: person);
                  },
                ),
              );
            },
            title: Text(person.name),
            leading: Hero(
              // ! here flight shuttle builder is used to control hero  widget to decide what will happen between hero movements
              flightShuttleBuilder: (
                flightContext,
                animation,
                flightDirection,
                fromHeroContext,
                toHeroContext,
              ) {
                switch (flightDirection) {
                  case HeroFlightDirection.push:
                    return Material(
                      color: Colors.transparent,
                      child: ScaleTransition(
                        scale: animation.drive(
                          Tween<double>(begin: 0.0, end: 3.0).chain(
                            CurveTween(
                              curve: Easing.emphasizedAccelerate,
                            ),
                          ),
                        ),
                        child: toHeroContext.widget,
                      ),
                    );
                  case HeroFlightDirection.pop:
                    return Material(
                      color: Colors.transparent,
                      child: ScaleTransition(
                        scale: animation.drive(
                          Tween<double>(begin: 0.0, end: 5.0).chain(
                            CurveTween(
                              curve: Easing.emphasizedAccelerate,
                            ),
                          ),
                        ),
                        child: fromHeroContext.widget,
                      ),
                    );
                }
                // return const Material(
                //     color: Colors.transparent,
                //     child: Text(
                //       "🔥",
                //       style: TextStyle(fontSize: 40),
                //     ));
              },
              tag: person.name,
              child: Text(
                person.emoji,
                style: const TextStyle(fontSize: 40),
              ),
            ),
            subtitle: Text("${person.age} years old  "),
            textColor: Colors.white,
          );
        },
      ),
    );
  }
}

class PersonPage extends StatelessWidget {
  final Person person;
  const PersonPage({
    super.key,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: person.name,
          child: Text(
            person.emoji,
            style: const TextStyle(
              fontSize: 50,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              person.name,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              person.age,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
