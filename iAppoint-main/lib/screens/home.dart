import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:booking_calendar/booking_calendar.dart';
import 'package:iappoint/screens/login.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final _email = LoginPage.getEmail();
  final now = DateTime.now();
  static late BookingService mockBookingService;
  final auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    mockBookingService = BookingService(
        serviceName: 'Booking Service',
        serviceDuration: 60,
        bookingEnd: DateTime(now.year, now.month, now.day, 24, 0),
        bookingStart: DateTime(now.year, now.month, now.day, 9, 0));
  }

  Stream<dynamic>? getBookingStreamMock(
      {required DateTime end, required DateTime start}) {
    return Stream.value([""]);
  }

  Future<dynamic> uploadBookingMock(
      {required BookingService newBooking}) async {
    await Future.delayed(const Duration(seconds: 1));
    converted.add(DateTimeRange(
        start: newBooking.bookingStart, end: newBooking.bookingEnd));

    FirebaseFirestore.instance.collection('users').doc(_email).update({
      'booking_start': newBooking.toJson()['bookingStart'],
      'booking_end': newBooking.toJson()['bookingEnd'],
      'booking_date': DateTime.now(),
      'booking_duration': newBooking.toJson()['serviceDuration'],
    }).then((_) {
      Navigator.pushNamed(context, 'user_details');
    });
  }

  static List<DateTimeRange> converted = [];

  List<DateTimeRange> convertStreamResultMock({required dynamic streamResult}) {
    return converted;
  }

  List<DateTimeRange> pauseSlots = [
    DateTimeRange(
        // this rule force
        start: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day, 0),
        end: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day, 8)),
    DateTimeRange(
        // this rule force
        start: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day, 19),
        end: DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day, 24)),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Appointment Page',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Appointment Page'),
          ),
          body: Center(
            child: BookingCalendar(
              bookingService: mockBookingService,
              convertStreamResultToDateTimeRanges: convertStreamResultMock,
              getBookingStream: getBookingStreamMock,
              uploadBooking: uploadBookingMock,
              pauseSlots: pauseSlots,
              pauseSlotText: 'Not working hours',
              hideBreakTime: false,
            ),
          ),
        ));
  }
}
