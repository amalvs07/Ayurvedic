class Patient {
  final String name;
  final String package;
  final String date;
  final String bookedBy;

  Patient({
    required this.name,
    required this.package,
    required this.date,
    required this.bookedBy,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      name: json['name'] ?? '',
      package: json['package'] ?? '',
      date: json['date'] ?? '',
      bookedBy: json['bookedBy'] ?? '',
    );
  }
}