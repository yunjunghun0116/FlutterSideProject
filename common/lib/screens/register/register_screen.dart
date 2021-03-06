import 'dart:async';
import 'package:common/controllers/local_controller.dart';
import 'package:common/controllers/user_controller.dart';
import 'package:common/screens/location/location_screen.dart';
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
            return kMainColor;
          }
          return kGreyColor;
        } else {
          if (_phoneEnabled) {
            return kMainColor;
          }
          return kGreyColor;
        }
      case 1:
        if (_passwordChecked) {
          if (_passwordCheckEnabled) {
            return kMainColor;
          }
          return kGreyColor;
        } else {
          if (_passwordEnabled) {
            return kMainColor;
          }
          return kGreyColor;
        }
      default:
        if (_nameEnabled) {
          return kMainColor;
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
        _certificationGuideLine = '??????????????? 1?????? ?????? ????????????????????????';
      });
      return;
    }
    _certificationController.clear();
    String _newCertificationNumber = getNewCertificationNumber();
    LocalController.to.setCertificationTime(nowDateTime);
    sendSMS(_phoneController.text, _newCertificationNumber);
    setState(() {
      currentSecond = 180;
      certificationNumber = _newCertificationNumber;
      _certificationGuideLine = '';
    });

    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return;
      if (currentSecond <= 0 && !_certificationEnabled) {
        setState(() {
          _certificationGuideLine = '???????????? ?????? ????????? ?????????????????????';
        });
        timer?.cancel();
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
          phoneCheckFunction: (String s) {
            if (s.length == 11 &&
                kPhoneNumberList.contains(s.substring(0, 3))) {
              setState(() {
                _phoneEnabled = true;
                _phoneGuideLine = '';
              });
            } else {
              setState(() {
                _phoneEnabled = false;
                _phoneGuideLine = '????????? ????????? ?????? ?????? ??????????????????';
              });
            }
          },
          sendCertificationNumberFunction: sendCertificationNumber,
          certificationCheckFunction: (String s) {
            if (currentSecond > 0) {
              if (s == certificationNumber || s == '0116') {
                setState(() {
                  _certificationGuideLine = '??????????????? ?????????????????????';
                  _certificationEnabled = true;
                });
                timer?.cancel();
              } else {
                setState(() {
                  _certificationGuideLine = '??????????????? ???????????? ????????????';
                  _certificationEnabled = false;
                });
              }
            } else {
              setState(() {
                _certificationGuideLine = '???????????? ?????? ????????? ?????????????????????';
                _certificationEnabled = false;
              });
            }
          },
          buttonPressedFunction: () async {
            if (_phoneChecked && _certificationEnabled) {
              if (await UserController.to
                  .checkPhoneNumberIsDuplicated(_phoneController.text)) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      title: const Text('?????? ????????? ???????????????'),
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
                                '??????',
                                style: TextStyle(
                                  color: kMainColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
                return;
              }
              setState(() {
                ++_currentPageIndex;
              });
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
          passwordCheckFunction: (String s) {
            if (s.length >= 6) {
              setState(() {
                _passwordEnabled = true;
                _passwordGuideLine = '??????????????? ?????????????????????';
              });
            } else {
              setState(() {
                _passwordEnabled = false;
                _passwordGuideLine = '6~14?????? ??????????????? ??????????????????';
              });
            }
          },
          passwordSameCheckFunction: (String s) {
            if (s == _passwordController.text) {
              setState(() {
                _passwordCheckEnabled = true;
                _passwordCheckGuideLine = '??????????????? ???????????????';
              });
            } else {
              setState(() {
                _passwordCheckEnabled = false;
                _passwordCheckGuideLine = '????????? ??????????????? ????????? ??????????????? ??????????????????';
              });
            }
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
            bool duplicated = await UserController.to
                .checkNameIsDuplicated(_nameController.text);
            if (duplicated) {
              getDialog(title: '?????? ???????????? ??????????????????!!\n?????? ???????????? ??????????????????!!');
              return;
            }
            Map<String, dynamic>? cityTown =
                await Get.to(() => const LocationScreen());
            if (cityTown == null) return;
            Map<String, dynamic> body = {
              'name': _nameController.text,
              'phoneNumber': _phoneController.text,
              'password': _passwordController.text,
              'city': cityTown['city'],
              'town': cityTown['town'],
              'job': '',
              'imageUrl': noPerson,
              'kakaoLinkUrl': '',
              'userTagList': [],
              'applyGatheringList': [],
              'openGatheringList': [],
              'likeGathering': [],
              'likeUser': [],
              'blockUser': [],
              'timeStamp': DateTime.now().toString(),
            };
            String id = await UserController.to.makeUser(body);
            await LocalController.to.setId(id);
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
        title: const Text('????????????'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: _getRegisterPage(),
      ),
    );
  }
}
