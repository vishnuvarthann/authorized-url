import 'dart:async';
import 'package:notes_rea/Modules/Screens/Notes/Notes/CitizenserviceModel.dart';
import 'package:notes_rea/Modules/Service/ApiResponse.dart';
import '../../../Service/ApiBase.dart';

class NotesBloc {

final controller = StreamController<ApiResponse>();
 static var filter ='filter';
  static var format ='format';

//  fetchNotes() async{
//   ApiResponse response = ApiResponse.loading("Loading");
//   controller.sink.add(response);
//   response = await ServiceManager('todos').get('');
//   List<Notes> notes = List<Notes>();
//   final tempNotes = response.data;
//   tempNotes.map((obj) => notes.add(Notes.fromJson(obj))).toList();
//   response.data = notes;
//   controller.sink.add(response);
// }

// fetchPostNotes() async{
//   ApiResponse response = ApiResponse.loading("Loading");
//   controller.sink.add(response);
//   response = await ServiceManager('todos').get('');
//   List<Notes> notes = List<Notes>();
//   final tempNotes = response.data;
//   tempNotes.map((obj) => notes.add(Notes.fromJson(obj))).toList();
//   response.data = notes;
//   controller.sink.add(response);
// }

fetchNotes() async{
  ApiResponse response = ApiResponse.loading("Loading");
  controller.sink.add(response);
  response = await ServiceManager('%24format=json&sap-client=830&%24filter=ServiceID%20eq%20%27SER_UBSAN%27').get();
  List<CitizenserviceModel> notes = List<CitizenserviceModel>();
  final tempNotes = response.data;
  tempNotes.map((obj) => notes.add(CitizenserviceModel.fromJson(obj))).toList();
  response.data = notes;
  controller.sink.add(response);
}
}