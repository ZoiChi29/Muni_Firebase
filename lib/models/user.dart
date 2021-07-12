class Users {
  String name;
  String emiratesid;
  String email;
  String id;
  String mobile;
  String phone;
  String dob;
  String password;

  Users();

  Users.fromMap(Map<String, dynamic> data) {
    name = data['Name'];
    email = data['Email;'];
    emiratesid = data['Emirates ID'];
    dob = data['Date Of Birth'];
    mobile = data['Mobile'];
    phone = data['Phone'];
    password = data['Password'];
    id = data['uuid'];
  }

  Map<String, dynamic> toMap() {
    return {
      'Name': name,
      'Email': email,
      'Emirates ID': emiratesid,
      'Date Of Birth': dob,
      'Mobile': mobile,
      'Phone': phone,
      'Password': password,
      'uuid': id
    };
  }
}
