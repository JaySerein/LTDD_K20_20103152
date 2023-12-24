// import 'package:app_login/model/profile.dart';
import 'package:app_login/model/student.dart';
import 'package:app_login/services/api_services.dart';

class StudentRepository {
  final ApiServices api = ApiServices();
  Future<Student> getStudentInfo() async{
    Student student = Student();
    final response = await api.getStudentInfo();
    if(response != null){
      var data = response.data;
      student = Student.fromJson(data);
    }
    return student;
  }
  Future<bool> registerClass() async{
    bool result = false;
    final response = await api.registerClass();
    if(response != null){
      result = true;
    }
    return result;
  }
}
