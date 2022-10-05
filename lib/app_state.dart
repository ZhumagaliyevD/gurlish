import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _favPost =
        prefs.getStringList('ff_favPost')?.map((path) => path.ref).toList() ??
            _favPost;
    _showPost = prefs.getBool('ff_showPost') ?? _showPost;
    _showLocation = prefs.getBool('ff_showLocation') ?? _showLocation;
    _subscribeDate = prefs.containsKey('ff_subscribeDate')
        ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_subscribeDate')!)
        : null;
  }

  late SharedPreferences prefs;

  String usertype = '0';

  List<String> image = [];

  DateTime? time;

  List<String> categoryList = [
    'Nails',
    'Make-up',
    'Hair',
    'Tatoo artist',
    'Spa & Facials',
    'Waxing',
    'Lashes & Eyebrows',
    'Kiddies'
  ];

  String categoryCreatePost = '0';

  List<String> imgCreate = [];

  List<DocumentReference> _favPost = [];
  List<DocumentReference> get favPost => _favPost;
  set favPost(List<DocumentReference> _value) {
    _favPost = _value;
    prefs.setStringList('ff_favPost', _value.map((x) => x.path).toList());
  }

  void addToFavPost(DocumentReference _value) {
    _favPost.add(_value);
    prefs.setStringList('ff_favPost', _favPost.map((x) => x.path).toList());
  }

  void removeFromFavPost(DocumentReference _value) {
    _favPost.remove(_value);
    prefs.setStringList('ff_favPost', _favPost.map((x) => x.path).toList());
  }

  String role = '0';

  String salonType = '0';

  String email = '0';

  String password = '0';

  String name = '0';

  String photoURL = '';

  bool _showPost = false;
  bool get showPost => _showPost;
  set showPost(bool _value) {
    _showPost = _value;
    prefs.setBool('ff_showPost', _value);
  }

  bool _showLocation = false;
  bool get showLocation => _showLocation;
  set showLocation(bool _value) {
    _showLocation = _value;
    prefs.setBool('ff_showLocation', _value);
  }

  String storiesID = '0';

  String sortby = '0';

  List<DocumentReference> linkCatergory = [];

  DocumentReference? currentCategory;

  LatLng? CurrentUserLocation;

  bool avatar = false;

  DateTime? _subscribeDate;
  DateTime? get subscribeDate => _subscribeDate;
  set subscribeDate(DateTime? _value) {
    if (_value == null) {
      return;
    }
    _subscribeDate = _value;
    prefs.setInt('ff_subscribeDate', _value.millisecondsSinceEpoch);
  }

  bool filterIsSet = false;
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
