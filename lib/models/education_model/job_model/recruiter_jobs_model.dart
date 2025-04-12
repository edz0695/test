class RecruiterJobsModel {
  final List<RecruiterJobData>? data;
  final String? status;

  RecruiterJobsModel({this.data, this.status});

  factory RecruiterJobsModel.fromJson(Map<String, dynamic> json) {
    return RecruiterJobsModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((item) => RecruiterJobData.fromJson(item as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((item) => item.toJson()).toList(),
      'status': status,
    };
  }
}

class RecruiterJobData {
  final String? department;
  final String? city;
  final String? locality;
  final Salary? monthlySalary;
  final int? staff;
  final String? totalExperience;
  final Experience? experience;
  final String? qualification;
  final String? gender;
  final String? englishSpeaking;
  final List<String>? skills;
  final String? workFromHome;
  final String? jobRole;
  final String? workTiming;
  final String? interviewTiming;
  final String? company;
  final String? description;
  final String? recruiter;
  final String? email;
  final String? phone;
  final String? address;
  final String? id;

  RecruiterJobData({
    this.department,
    this.city,
    this.locality,
    this.monthlySalary,
    this.staff,
    this.totalExperience,
    this.experience,
    this.qualification,
    this.gender,
    this.englishSpeaking,
    this.skills,
    this.workFromHome,
    this.jobRole,
    this.workTiming,
    this.interviewTiming,
    this.company,
    this.description,
    this.recruiter,
    this.email,
    this.phone,
    this.address,
    this.id,
  });

  factory RecruiterJobData.fromJson(Map<String, dynamic> json) {
    return RecruiterJobData(
      department: json['department'] as String?,
      city: json['city'] as String?,
      locality: json['locality'] as String?,
      monthlySalary: json['monthly_salary'] != null
          ? Salary.fromJson(json['monthly_salary'] as Map<String, dynamic>)
          : null,
      staff: json['staff'] as int?,
      totalExperience: json['total_experience'] as String?,
      experience: json['experience'] != null
          ? Experience.fromJson(json['experience'] as Map<String, dynamic>)
          : null,
      qualification: json['qualification'] as String?,
      gender: json['gender'] as String?,
      englishSpeaking: json['english_speaking'] as String?,
      skills: (json['skills'] as List<dynamic>?)
          ?.map((item) => item as String)
          .toList(),
      workFromHome: json['work_from_home'] as String?,
      jobRole: json['job_role'] as String?,
      workTiming: json['work_timing'] as String?,
      interviewTiming: json['interview_timing'] as String?,
      company: json['company'] as String?,
      description: json['description'] as String?,
      recruiter: json['recruiter'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'department': department,
      'city': city,
      'locality': locality,
      'monthly_salary': monthlySalary?.toJson(),
      'staff': staff,
      'total_experience': totalExperience,
      'experience': experience?.toJson(),
      'qualification': qualification,
      'gender': gender,
      'english_speaking': englishSpeaking,
      'skills': skills,
      'work_from_home': workFromHome,
      'job_role': jobRole,
      'work_timing': workTiming,
      'interview_timing': interviewTiming,
      'company': company,
      'description': description,
      'recruiter': recruiter,
      'email': email,
      'phone': phone,
      'address': address,
      'id': id,
    };
  }
}

class Salary {
  final int? min;
  final int? max;
  final String? id;

  Salary({this.min, this.max, this.id});

  factory Salary.fromJson(Map<String, dynamic> json) {
    return Salary(
      min: json['min'] as int?,
      max: json['max'] as int?,
      id: json['_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'min': min,
      'max': max,
      '_id': id,
    };
  }
}

class Experience {
  final String? min;
  final String? max;
  final String? id;

  Experience({this.min, this.max, this.id});

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      min: json['min'] as String?,
      max: json['max'] as String?,
      id: json['_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'min': min,
      'max': max,
      '_id': id,
    };
  }
}
