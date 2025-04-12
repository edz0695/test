class JobsModel {
  final List<Job2Data>? data;

  JobsModel({this.data});

  factory JobsModel.fromJson(Map<String, dynamic> json) {
    return JobsModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Job2Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((e) => e.toJson()).toList(),
    };
  }
}

class Job2Data {
  final String? department;
  final String? city;
  final String? locality;
  final Job2MonthlySalary? monthlySalary;
  final int? staff;
  final String? totalExperience;
  final Job2Experience? experience;
  final String? qualification;
  final String? gender;
  final String? englishSpeaking;
  final List<String>? skill;
  final String? callsFrom;
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

  Job2Data({
    this.description,
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
    this.skill,
    this.callsFrom,
    this.workFromHome,
    this.jobRole,
    this.workTiming,
    this.interviewTiming,
    this.company,
    this.recruiter,
    this.email,
    this.phone,
    this.address,
    this.id,
  });

  factory Job2Data.fromJson(Map<String, dynamic> json) {
    return Job2Data(
      department: json['department'] as String?,
      city: json['city'] as String?,
      locality: json['locality'] as String?,
      monthlySalary: json['monthly_salary'] != null
          ? Job2MonthlySalary.fromJson(
              json['monthly_salary'] as Map<String, dynamic>)
          : null,
      staff: json['staff'] as int?,
      totalExperience: json['total_experience'] as String?,
      experience: json['experience'] != null
          ? Job2Experience.fromJson(json['experience'] as Map<String, dynamic>)
          : null,
      qualification: json['qualification'] as String?,
      gender: json['gender'] as String?,
      englishSpeaking: json['english_speaking'] as String?,
      skill:
          (json['skill'] as List<dynamic>?)?.map((e) => e as String).toList(),
      callsFrom: json['calls_from'] as String?,
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
      'skill': skill,
      'calls_from': callsFrom,
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

class Job2MonthlySalary {
  final int? min;
  final int? max;
  final String? id;

  Job2MonthlySalary({this.min, this.max, this.id});

  factory Job2MonthlySalary.fromJson(Map<String, dynamic> json) {
    return Job2MonthlySalary(
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

class Job2Experience {
  final String? min;
  final String? max;
  final String? id;

  Job2Experience({this.min, this.max, this.id});

  factory Job2Experience.fromJson(Map<String, dynamic> json) {
    return Job2Experience(
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
