void main(List<String> args) {
  Parent dad = Parent('dad', 40, Gender.male, 'Teacher');
  dad.showInfo();
  dad.canDrink();
  Parent mom = Parent('mom', 35, Gender.female, 'Doctor');
  mom.showInfo();
  mom.canDrive();
  Child child1 = Child('Child 1', 10, Gender.other, 'School 1');
  child1.showInfo();
  child1.doMath();
}

enum Gender { male, female, other }

extension on Gender {
  String getGender() {
    switch (this) {
      case Gender.male:
        return 'male';
      case Gender.female:
        return 'female';
      case Gender.other:
        return 'other';
    }
  }
}

abstract class Person {
  String name;
  int age;
  Gender gender;
  Person(this.name, this.age, this.gender);
  void showInfo();
}

abstract class Over18 {
  void canDrive();
  void canDrink();
}

mixin doHomework {
  void doMath() {
    print('Do math');
  }

  void doEnglish() {
    print('Do English');
  }
}

class Parent extends Person implements Over18 {
  String? job;
  Parent(String name, int age, Gender gender, this.job)
      : super(name, age, gender);
  @override
  void showInfo() {
    print('Name: $name, Age: $age, Gender: ${gender.getGender()} Job: $job');
  }

  @override
  void canDrive() {
    print('Can drive');
  }

  @override
  void canDrink() {
    print('Can drink');
  }
}

class Child extends Person with doHomework {
  String? school;
  Child(String name, int age, Gender gender, this.school)
      : super(name, age, gender);
  @override
  void showInfo() {
    print(
        'Name: $name, Age: $age, Gender: ${gender.getGender()} School: $school');
  }
}
