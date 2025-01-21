//cloning an object

class Person {
  String name;
  int age;

  Person(this.name, this.age);

  Person clone() {
    return Person(name, age);
  }

  @override
  String toString() {
    return 'Person{name: $name, age: $age}';
  }
}

void main() {
  final person = Person('John', 30);
  final personClone = person.clone();

  print(person == personClone); // false
  print(person.name == personClone.name); // true
  print(person.age == personClone.age); // true
}
