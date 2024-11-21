class Dog {
  final int? id;
  final String dogName;
  final String description;
  final int age;
  final String image;

  Dog({
    this.id,
    required this.dogName,
    required this.description,
    required this.age,
    required this.image,
  });

  // Convertir a Map para SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'dogName': dogName,
      'description': description,
      'age': age,
      'image': image,
    };
  }

  // Convertir de Map a Dog
  factory Dog.fromMap(Map<String, dynamic> map) {
    return Dog(
      id: map['id'],
      dogName: map['dogName'],
      description: map['description'],
      age: map['age'],
      image: map['image'],
    );
  }
}
