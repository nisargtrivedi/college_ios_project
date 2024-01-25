
class EventModel{

  String id;
  String title;
  String content;
  String schedule;
  String banner;

  EventModel({required this.id,required this.title,required this.content,  required this.schedule,required this.banner});

  EventModel.fromMap(Map<String, dynamic> item):
        id=item["id"], title= item["title"],content= item["content"],schedule= item["schedule"],banner= item["banner"];


  Map<String, Object> toMap(){
    return {'id':id,'title': title,'content': content,'schedule': schedule,'banner': banner};
  }
}