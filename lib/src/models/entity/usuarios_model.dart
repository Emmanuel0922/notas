import 'package:objectbox/objectbox.dart';

@Entity()
class Users {
  @Id()
  int id = 0;

  String name;
  @Unique()
  String email;
  String pass;

  Users({required this.name, required this.email, required this.pass});
}