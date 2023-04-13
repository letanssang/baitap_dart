void main(List<String> arguments) {
  Map<String, Object> json = {
    "balance": 1000.0,
    "picture": "http://placehold.it/32x32",
    "age": 33,
    "name": " Bird Ramsey",
    "gender": "male",
    "company": "NIMON",
    "email": "birdramsey@nimon.com"
  };
  User user1 = User.fromJson(json);
  print(user1.toString());
  print(user1.toJson());
}

class User {
  double balance;
  String? picture;
  int age;
  String name;
  String gender;
  String? company;
  String? email;

  User({
    this.balance = 0,
    this.picture,
    this.age = 0,
    this.name = '',
    this.gender = 'male',
    this.company,
    this.email,
  });
  factory User.fromJson(Map<String, Object> json) {
    return User(
      balance: json['balance'] as double,
      picture: json['picture'] as String,
      age: json['age'] as int,
      name: json['name'] as String,
      gender: json['gender'] as String,
      company: json['company'] as String,
      email: json['email'] as String,
    );
  }
  @override
  String toString() {
    StringBuffer sb = StringBuffer();
    sb.write('balance: $balance\n');
    sb.write('picture: $picture\n');
    sb.write('age: $age\n');
    sb.write('name: $name\n');
    sb.write('gender: $gender\n');
    sb.write('company: $company\n');
    sb.write('email: $email\n');
    return sb.toString();
  }

  String toJson() {
    return '{"balance": $balance,"picture": "$picture","age": $age,"name": $name,"gender": $gender,"company": $company,"email": $email}';
  }
}
