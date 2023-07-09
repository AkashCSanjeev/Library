
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:library_management/global_variable.dart';
import 'package:library_management/services/auth_service.dart';
import 'package:library_management/utils.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpClient extends Mock implements Client{}
class MockBuildContext extends Mock implements BuildContext{}


void main(){

  late AuthService authService;
  late MockHttpClient mockHttpClient;
  late MockBuildContext mockBuildContext;

  setUp(() {
    authService = AuthService();
    mockHttpClient = MockHttpClient();
    mockBuildContext = MockBuildContext();
  });

  group("signInUser Function", () { 
    
    test("Sign in test", ()async {
        // when(() => mockHttpClient.post(Uri.parse(
        //       '${GlobalVariable.URL}${GlobalVariable.lendingPORT}/lending/api/v1/auth/login'),
        //   body: jsonEncode({"email": "akash@codehomies.com ", "password": "123456"}),
        //   headers: <String, String>{'Content-Type': 'application/json'},) ,).thenAnswer((invocation) async => Response("""""", 200));


        //   String result = await authService.signInUser(context: mockBuildContext, email: "akash@codehomies.com", password: "123456");

        //   expect(result, "Success");
    });
  });
  

}