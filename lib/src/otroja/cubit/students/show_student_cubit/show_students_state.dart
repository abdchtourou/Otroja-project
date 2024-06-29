
import '../../../data/models/student_model/show_students.dart';

sealed class ShowStudentsState {}

final class ShowStudentsInitial extends ShowStudentsState {}

final class ShowStudentsLoading extends ShowStudentsState {}

final class ShowStudentsLoaded extends ShowStudentsState {
 List<ShowStudentsModel> students = [ShowStudentsModel(gender: "Mail", name: Name(title: "Islam", first: "first", last: "last"), location: Location(street: Street(number: "number", name: "name"), city: "city", state: "state", country: "country", postcode: "postcode"), email: "email", phone: "phone", cell: "cell", picture: Picture(large: "large", medium: "medium", thumbnail: "thumbnail")),
 ShowStudentsModel(gender: "Mail", name: Name(title: "Abd", first: "first", last: "last"), location: Location(street: Street(number: "number", name: "name"), city: "city", state: "state", country: "country", postcode: "postcode"), email: "email", phone: "phone", cell: "cell", picture: Picture(large: "large", medium: "medium", thumbnail: "thumbnail"))];

  ShowStudentsLoaded(this.students);
}
