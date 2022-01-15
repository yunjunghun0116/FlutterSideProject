import 'dart:async';
import 'package:flutter/material.dart';
import 'package:freeview/controller/designer_controller.dart';
import 'package:freeview/models/designer.dart';
import 'package:freeview/models/place.dart';
import 'package:freeview/models/place_detail.dart';
import 'package:freeview/utils/google_map_services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  final Set<Marker> _markers = {};
  final Completer<GoogleMapController> _controller = Completer();
  final TextEditingController _locationTextController = TextEditingController();
  final DesignerController _designerController = DesignerController.to;

  LatLng? userLatLng;
  Uuid uuid = const Uuid();
  String? sessionToken;
  List<Place>? suggestPlaces;
  GoogleMapServices? googleMapServices;

  bool isLocationSelected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentPosition();
    //GoogleMapServices 사용하기 위한 작업
    setState(() {
      sessionToken ??= uuid.v4();
      googleMapServices = GoogleMapServices(sessionToken: sessionToken!);
    });
  }

  // 현재 위치를 가져오는 함수
  Future<void> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    try {
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return;
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.always ||
          permission == LocationPermission.whileInUse) {
        Position currentPosition = await Geolocator.getCurrentPosition();
        setState(() {
          userLatLng =
              LatLng(currentPosition.latitude, currentPosition.longitude);
          _markers.add(
            Marker(
              draggable: true,
              position: userLatLng!,
              markerId: const MarkerId('UserPosition'),
              infoWindow: const InfoWindow(title: '내 위치'),
            ),
          );
        });
      } else {
        return;
      }
    } catch (e) {
      return;
    }
  }

  final CameraPosition _kInitialPosition = const CameraPosition(
    target: LatLng(36.474243247298, 127.25537504683),
    zoom: 15,
  );

  Future<LatLng> getMapScreenPosition() async {
    GoogleMapController controller = await _controller.future;
    double? lat;
    double? lng;
    await controller.getVisibleRegion().then((value) {
      lat = ((value.southwest.latitude + value.northeast.latitude) / 2);
      lng = ((value.southwest.longitude + value.northeast.longitude) / 2);
    });
    return LatLng(lat!, lng!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.width * 0.5,
          child: Stack(
            children: [
              GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: _kInitialPosition,
                markers: _markers,
                myLocationButtonEnabled: false,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
              isLocationSelected
                  ? Container(
                      padding: const EdgeInsets.only(bottom: 15),
                      width: double.infinity,
                      height: MediaQuery.of(context).size.width * 0.5,
                      child:
                          const Center(child: Icon(Icons.location_on_outlined)),
                    )
                  : Container(),
            ],
          ),
        ),
        TextField(
          controller: _locationTextController,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () async {
                suggestPlaces = await googleMapServices!
                    .getSuggestions(_locationTextController.text);
                setState(() {});
              },
              child: const Text('찾기'),
            ),
            ElevatedButton(
              onPressed: () async {
                LatLng position = await getMapScreenPosition();
                print(
                    '현재 카메라 위치는 (${position.latitude},${position.longitude}) 입니다.');
              },
              child: const Text('현재 카메라 위치'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (isLocationSelected) {
                  LatLng position = await getMapScreenPosition();
                  _markers.add(
                    Marker(
                      draggable: true,
                      markerId: const MarkerId('UserPosition'),
                      position: position,
                      infoWindow: const InfoWindow(title: '내 위치'),
                    ),
                  );
                }
                setState(() {
                  isLocationSelected = !isLocationSelected;
                });
              },
              child: isLocationSelected
                  ? const Text('설정완료')
                  : const Text('위치 설정하기'),
            ),
          ],
        ),
        suggestPlaces != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: suggestPlaces!.map((Place place) {
                  return InkWell(
                    onTap: () async {
                      PlaceDetail detail = await googleMapServices!
                          .getPlaceDetail(place.placeId, sessionToken!);
                      GoogleMapController controller = await _controller.future;
                      controller.animateCamera(
                        CameraUpdate.newLatLng(
                          LatLng(detail.lat, detail.lng),
                        ),
                      );
                      List<Designer> filteredDesignerList =
                          _designerController.filterWithLocation(
                              LatLng(detail.lat, detail.lng),
                              _designerController.designerList,
                              1);
                      setState(() {
                        _markers.clear();
                        _markers.add(
                          Marker(
                            draggable: true,
                            markerId: const MarkerId('UserPosition'),
                            position: LatLng(detail.lat, detail.lng),
                            infoWindow: const InfoWindow(title: '내 위치'),
                          ),
                        );
                        //markerId가 겹칠경우 마지막에 추가한 마커만 생김
                        //마커를 추가하는 부분
                        int i = 0;
                        for (Designer designer in filteredDesignerList) {
                          _markers.add(
                            Marker(
                              markerId:
                                  MarkerId('${designer.designerName}/${i++}'),
                              position:
                                  LatLng(designer.shopLat, designer.shopLng),
                              infoWindow: InfoWindow(
                                title:
                                    '${designer.designerName} | ${designer.shopName}',
                                snippet: designer.shopAddress,
                              ),
                            ),
                          );
                        }
                      });
                    },
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text(place.decription),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              )
            : Container(),
      ],
    );
  }
}
