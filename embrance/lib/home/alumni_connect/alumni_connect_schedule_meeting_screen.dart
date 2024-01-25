import 'dart:math';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:embrance/component/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'alumni_controller.dart';

class AlumniConnectMeetingView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;


    return GetBuilder<AlumniController>(
        init: Get.put<AlumniController>(AlumniController()),
        builder: (controller) {
          controller.loadData();
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.green,
                title: Text(
                  "Meeting Schedule",
                  style: TextStyle(color: Colors.white),
                ),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Get.back(),
                ),
              ),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Select Date",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        color: Colors.white,
                        child: SizedBox(
                          height: 100,
                          child: DatePicker(
                            DateTime.now(),
                            initialSelectedDate: DateTime.now(),
                            selectionColor: Colors.green,
                            selectedTextColor: Colors.white,
                            onDateChange: (date) {
                              // New date selected
                              controller.selectedDate.value = "${date.day}-${date.month}-${date.year}";
                              print("${date.day}-${date.month}-${date.year}");
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Select Time",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),


                      InkWell(onTap: (){
                        bottomPicker(controller,context,height);
                      },child: Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Container(
                          width: width,
                          child: Card(
                              elevation: 5,
                              child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Obx(() => Text(controller.selectedTime.value,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,),)),
                          )),
                        ),
                      )),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Meeting Mode",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      (controller.data.type=="2")?
                        Obx(() =>
                            RadioListTile(value: "1",
                                groupValue: controller.groupValue.value,
                                onChanged: (value) {
                                  controller.groupValue.value = value!;
                                  // print(value.toString());
                                },
                                title: Text("In Person", style: TextStyle(
                                    color: Colors.black, fontSize: 15),),
                                selected: false,
                                activeColor: Colors.green,
                                selectedTileColor: Colors.green),
                        )
                      :Text(""),
                      Obx(() => RadioListTile(value: "0",groupValue: controller.groupValue.value, onChanged:(value){
                          controller.groupValue.value = value!;
                          //print(value.toString());
                        },title: Text("Virtual",style: TextStyle(color: Colors.black,fontSize: 15)),selected: false,activeColor: Colors.green,fillColor: MaterialStatePropertyAll(Colors.green)),
                      ),

                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Meeting Notes",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(
                          controller: controller.msgController,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 0.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey, width: 0.0),
                              )),
                          keyboardType: TextInputType.multiline,
                          minLines: 1, //Normal textInputField will be displayed
                          maxLines: 5, // when user presses enter it will adapt to it
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0,top:20,right: 10.0),
                        child: MaterialButton(onPressed: (){

                          if(controller.msgController.text.isEmpty){
                            Util.showMessage(context, "Please enter meeting notes");
                          }else{
                            controller.saveMeeting(controller.data.aluId);
                          }
                        },child: const Text("Save",style: TextStyle(fontSize: 18),),elevation: 10,color: Colors.green,textColor: Colors.white,height: 50,minWidth: width,),
                      ),
                    ],
                  ),
                ),
              ));
        });
  }

  commonData(String key, String value) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(key,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start),
          SizedBox(
            width: 10,
          ),
          Text(
            value,
            style: TextStyle(
              color: Colors.black,
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }

  bottomPicker(AlumniController controller,BuildContext context,double height){
    showModalBottomSheet(context: context, builder: (BuildContext context){
        return SizedBox(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              CupertinoTimerPicker(
                  mode: CupertinoTimerPickerMode.hm,
                  initialTimerDuration: Duration(
                      hours: DateTime.now().hour,
                      minutes: DateTime.now().minute,),
                  onTimerDurationChanged: (value) {
                    controller.selectedTime.value = "${value.toString().substring(0,5)}";
                    print(value.toString().substring(0,5));
                  }),
            ],
          ),
        );
    });
  }
}
