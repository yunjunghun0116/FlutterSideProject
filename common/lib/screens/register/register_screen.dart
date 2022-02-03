import 'dart:async';
import 'package:common/controllers/connect_controller.dart';
import 'package:common/controllers/database_controller.dart';
import 'package:common/controllers/gathering_controller.dart';
import 'package:common/controllers/local_controller.dart';
import 'package:common/screens/main/main_screen.dart';
import 'package:common/screens/register/components/register_screen_password_page.dart';
import 'package:flutter/material.dart';
import '../../utils.dart';
import 'package:get/get.dart';
import 'components/register_screen_name_page.dart';
import 'components/register_screen_phone_page.dart';
import '../../constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int _currentPageIndex = 0;

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _certificationController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordCheckController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  bool _phoneChecked = false;
  bool _passwordChecked = false;

  bool _phoneEnabled = false;
  bool _certificationEnabled = false;
  bool _passwordEnabled = false;
  bool _passwordCheckEnabled = false;
  bool _nameEnabled = false;

  String _phoneGuideLine = '';
  String _certificationGuideLine = '';
  String _passwordGuideLine = '';
  String _passwordCheckGuideLine = '';

  String certificationNumber = '1234';
  int currentSecond = 180;

  Timer? timer;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Color _getButtonColor() {
    switch (_currentPageIndex) {
      case 0:
        if (_phoneChecked) {
          if (_certificationEnabled) {
            return kBlueColor;
          }
          return kGreyColor;
        } else {
          if (_phoneEnabled) {
            return kBlueColor;
          }
          return kGreyColor;
        }
      case 1:
        if (_passwordChecked) {
          if (_passwordCheckEnabled) {
            return kBlueColor;
          }
          return kGreyColor;
        } else {
          if (_passwordEnabled) {
            return kBlueColor;
          }
          return kGreyColor;
        }
      default:
        if (_nameEnabled) {
          return kBlueColor;
        }
        return kGreyColor;
    }
  }

  void _phoneRefreshFunction() {
    setState(() {
      _phoneController.clear();
      _certificationController.clear();
      _passwordController.clear();
      _passwordCheckController.clear();
      _nameController.clear();
      _phoneChecked = false;
      _passwordChecked = false;
      _phoneEnabled = false;
      _certificationEnabled = false;
      _passwordEnabled = false;
      _passwordCheckEnabled = false;
      _nameEnabled = false;
      _phoneGuideLine = '';
      _certificationGuideLine = '';
      _passwordGuideLine = '';
      _passwordCheckGuideLine = '';
      certificationNumber = '1234';
      currentSecond = 180;
      timer?.cancel();
    });
  }

  void _passwordRefreshFunction() {
    setState(() {
      _passwordController.clear();
      _passwordCheckController.clear();
      _nameController.clear();
      _passwordChecked = false;
      _passwordEnabled = false;
      _passwordCheckEnabled = false;
      _nameEnabled = false;
      _passwordGuideLine = '';
      _passwordCheckGuideLine = '';
    });
  }

  void sendCertificationNumber() async {
    DateTime nowDateTime = DateTime.now();
    String? lastSendCertificationTime =
        await LocalController.to.getCertificationTime();
    if (lastSendCertificationTime != null &&
        nowDateTime
                .difference(DateTime.parse(lastSendCertificationTime))
                .inSeconds <
            60) {
      setState(() {
        _certificationGuideLine = '인증번호는 1분뒤 다시 전송할수있습니다';
      });
      return;
    }

    String _newCertificationNumber = getNewCertificationNumber();
    LocalController.to.setCertificationTime(nowDateTime);
    ConnectController.to
        .sendSMS(_phoneController.text, _newCertificationNumber);
    setState(() {
      currentSecond = 180;
      certificationNumber = _newCertificationNumber;
      _certificationGuideLine = '';
    });

    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return;
      if (currentSecond <= 0) timer?.cancel();
      if (currentSecond < 0 && !_certificationEnabled) {
        setState(() {
          _certificationGuideLine = '인증번호 입력 시간이 초과되었습니다';
        });
      }
      setState(() {
        currentSecond--;
      });
    });
  }

  Widget _getRegisterPage() {
    switch (_currentPageIndex) {
      case 0:
        return RegisterScreenPhonePage(
          phoneController: _phoneController,
          phoneChecked: _phoneChecked,
          phoneEnabled: _phoneEnabled,
          phoneGuideLine: _phoneGuideLine,
          certificationController: _certificationController,
          certificationEnabled: _certificationEnabled,
          certificationGuideLine: _certificationGuideLine,
          certificationNumber: certificationNumber,
          currentSeconds: currentSecond,
          buttonColor: _getButtonColor(),
          phoneEnabledFunction: () {
            setState(() {
              _phoneEnabled = true;
              _phoneGuideLine = '';
            });
          },
          phoneDisabledFunction: () {
            setState(() {
              _phoneEnabled = false;
              _phoneGuideLine = '휴대폰 번호를 다시 한번 확인해주세요';
            });
          },
          sendCertificationNumberFunction: sendCertificationNumber,
          certificationCheckFunction: (String s) {
            if (s.length == 4) {
              setState(() {
                if (s == certificationNumber) {
                  _certificationGuideLine = '인증번호가 확인되었습니다';
                  _certificationEnabled = true;
                } else {
                  _certificationGuideLine = '인증번호가 일치하지 않습니다';
                  _certificationEnabled = false;
                }
              });
            }
          },
          buttonPressedFunction: () async {
            if (_phoneChecked && _certificationEnabled) {
              if(await DatabaseController.to.checkPhoneNumberIsDuplicated(_phoneController.text)){
                setState(() {
                  ++_currentPageIndex;
                });
              }else{
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      title: const Text('이미 가입된 번호입니다'),
                      actions: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Container(
                              alignment: Alignment.center,
                              child: const Text(
                                '확인',
                                style: TextStyle(
                                  color: kBlueColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
            } else {
              if (_phoneEnabled) {
                setState(() {
                  _phoneChecked = true;
                  sendCertificationNumber();
                });
              }
            }
          },
          phoneRefreshFunction: _phoneRefreshFunction,
        );
      case 1:
        return RegisterScreenPasswordPage(
          passwordController: _passwordController,
          passwordChecked: _passwordChecked,
          passwordEnabled: _passwordEnabled,
          passwordGuideLine: _passwordGuideLine,
          passwordCheckController: _passwordCheckController,
          passwordCheckEnabled: _passwordCheckEnabled,
          passwordCheckGuideLine: _passwordCheckGuideLine,
          buttonColor: _getButtonColor(),
          passwordEnabledFunction: () {
            setState(() {
              _passwordEnabled = true;
              _passwordGuideLine = '사용가능한 비밀번호입니다';
            });
          },
          passwordDisabledFunction: () {
            setState(() {
              _passwordEnabled = false;
              _passwordGuideLine = '6~14자리 비밀번호를 입력해주세요';
            });
          },
          passwordCheckEnabledFunction: () {
            setState(() {
              _passwordCheckEnabled = true;
              _passwordCheckGuideLine = '비밀번호가 일치합니다';
            });
          },
          passwordCheckDisabledFunction: () {
            setState(() {
              _passwordCheckEnabled = false;
              _passwordCheckGuideLine = '사용한 비밀번호와 동일한 비밀번호를 입력해주세요';
            });
          },
          buttonPressedFunction: () {
            if (_passwordChecked) {
              if (_passwordCheckEnabled) {
                setState(() {
                  ++_currentPageIndex;
                });
              }
            } else {
              if (_passwordEnabled) {
                setState(() {
                  _passwordChecked = true;
                });
              }
            }
          },
          passwordRefreshFunction: _passwordRefreshFunction,
        );
      default:
        return RegisterScreenNamePage(
          nameController: _nameController,
          nameEnabled: _nameEnabled,
          buttonColor: _getButtonColor(),
          nameCheckFunction: (String s) {
            setState(() {
              if (s.length > 1) {
                _nameEnabled = true;
              } else {
                _nameEnabled = false;
              }
            });
          },
          registerFunction: () async {
            Map<String, dynamic> body = {
              'name': _nameController.text,
              'phoneNumber': _phoneController.text,
              'password': _passwordController.text,
              'university': '충남대학교',
              'job': '',
              'imageUrl': noPersonImage,
              'kakaoLinkUrl': '',
              'userTagList': [],
              'applyGatheringList': [],
              'openGatheringList': [],
              'likeGathering': [],
              'likeUser': [],
              'timeStamp': DateTime.now().toString(),
            };
            String id = await DatabaseController.to.makeUser(body);
            await LocalController.to.setId(id);
            GatheringController.to.setGatheringList();
            Get.offAll(() => const MainScreen());
          },
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        foregroundColor: kBlackColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () async {
            if (_currentPageIndex == 0) {
              Get.back();
            } else {
              setState(() {
                --_currentPageIndex;
              });
            }
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('회원가입'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: _getRegisterPage(),
      ),
    );
  }
}
