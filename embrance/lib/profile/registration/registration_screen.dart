import 'package:embrance/profile/model/course_entity.dart';
import 'package:embrance/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../component/util.dart';

class RegistrationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return GetBuilder<ProfileController>(
        init: Get.put<ProfileController>(ProfileController()),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(backgroundColor: const Color(0xff25503f),title:Text("Registration",style: TextStyle(color: Colors.white),),leading: IconButton(
              icon: const Icon(Icons.arrow_back,color: Colors.white),
              onPressed: () => Get.back(),
            ),),
            backgroundColor: const Color(0xff25503f),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Text(
                        "First Name",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: controller.firstName,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "First Name",
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 0.0),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Last Name",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: controller.lastName,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Last Name",
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 0.0),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Phone",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        keyboardType: TextInputType.phone,
                        controller: controller.phone,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Phone",
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 0.0),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Email",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: controller.email,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Email",
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 0.0),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Password",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        controller: controller.password,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        keyboardType: TextInputType.visiblePassword,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Password",
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.white, width: 0.0),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      const Text(
                        "Are you Alumni/Student ?",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: width,
                        height: 50,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                          child: Obx(
                                ()=> DropdownButton<String>(
                              hint: Text(controller.alumni_student.value.isNotEmpty?controller.alumni_student.value:"------Select------",style: TextStyle(color: Colors.black),),
                              items: controller.typelist.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (data) {
                                controller.alumni_student.value = data!;
                                controller.enroll_year.value="";
                                print(data);
                              },
                            ),
                          ),

                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      Obx(
                        ()=> Text(
                          (controller.alumni_student.value=="Alumni")?"Graduation Year":"Enrollment Year",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: width,
                        height: 50,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                          child: Obx(
                                ()=> DropdownButton<String>(
                              hint: Text(controller.enroll_year.value.isNotEmpty?controller.enroll_year.value:"------Select------",style: TextStyle(color: Colors.black),),
                              items: (controller.alumni_student.value=="Alumni")? controller.aluenrollmentYear.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList() : controller.currentenrollmentYear.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (data) {
                                controller.enroll_year.value = data!;
                                print(data);
                              },
                            ),
                          ),

                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),


                       Text(
                        "Interested Course",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: width,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                          child: Obx(
                            ()=> DropdownButton<String>(
                                hint: Text(controller.course.value.isNotEmpty?controller.courseList.obs.value.firstWhere((element) => element.id==controller.course.value).course:"Select Course",style: TextStyle(color: Colors.black),),
                                items: controller.courseList.obs.value.map((CourseEntity value) {
                                  return DropdownMenuItem<String>(
                                    value: value.id,
                                    child: Text(value.course),
                                  );
                                }).toList(),
                                onChanged: (data) {
                                  controller.course.value = data!;
                                  print(data);
                                },
                              ),
                          ),

                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),





                      SizedBox(
                        width: width,
                        height: 50,
                        child: Obx(
                          () => controller.isDataLoading.value
                              ? SizedBox(width:50,height:50,child: const CircularProgressIndicator())
                              : MaterialButton(
                                  onPressed: () {
                                     if (controller.firstName.text.isEmpty){
                                        Util.showMessage(context,"Please enter firstname");
                                      }else if (controller.lastName.text.isEmpty){
                                        Util.showMessage(context,"Please enter lastname");
                                      }else if (controller.phone.text.isEmpty){
                                        Util.showMessage(context,"Please enter phone");
                                      }else if (controller.email.text.isEmpty){
                                       Util.showMessage(context,"Please enter email");
                                     }else if (controller.password.text.isEmpty){
                                       Util.showMessage(context,"Please enter password");
                                     }else if (controller.enroll_year.value.isEmpty){
                                       Util.showMessage(context,"Please select any enrollment year or graduation year");
                                     }else if (controller.course.value.isEmpty){
                                        Util.showMessage(context,"Please select any course");
                                      }else{
                                       controller.registrationAPI(context);
                                      }

                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ),
                                  color: Colors.green,
                                ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
