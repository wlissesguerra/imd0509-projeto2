class Course {
  int course_id;
  String title;
  String description;
  String image;

  Course({
    required this.course_id,
    required this.title,
    required this.description,
    required this.image,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
        course_id: json['course_id'],
        title: json['title'],
        description: json['description'],
        image: json['image']);
  }
}
