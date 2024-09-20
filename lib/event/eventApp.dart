import 'package:flutter/material.dart';

class MyAppd extends StatelessWidget {
  const MyAppd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Card Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            EventCard(
              title: 'Flutter Conference 2024',
              date: '24 September 2024',
              time: '10:00 AM - 5:00 PM',
              location: 'Cairo Convention Center',
              imageUrl:
              'https://media.istockphoto.com/id/2037006388/photo/technology-and-financial-advisory-services-concept-business-teamwork-and-working-on-digital.webp?s=1024x1024&w=is&k=20&c=wJlsiQ-En9Zmls259NPlVXPxCoLciXB6htt228VBsdw=', // استبدل برابط صورة فعلي
            ),
            EventCard(
              title: 'Flutter Conference 2024',
              date: '24 September 2024',
              time: '10:00 AM - 5:00 PM',
              location: 'Cairo Convention Center',
              imageUrl:
              'https://media.istockphoto.com/id/2037006388/photo/technology-and-financial-advisory-services-concept-business-teamwork-and-working-on-digital.webp?s=1024x1024&w=is&k=20&c=wJlsiQ-En9Zmls259NPlVXPxCoLciXB6htt228VBsdw=', // استبدل برابط صورة فعلي
            ),
            EventCard(
              title: 'Flutter Conference 2024',
              date: '24 September 2024',
              time: '10:00 AM - 5:00 PM',
              location: 'Cairo Convention Center',
              imageUrl:
              'https://media.istockphoto.com/id/2037006388/photo/technology-and-financial-advisory-services-concept-business-teamwork-and-working-on-digital.webp?s=1024x1024&w=is&k=20&c=wJlsiQ-En9Zmls259NPlVXPxCoLciXB6htt228VBsdw=', // استبدل برابط صورة فعلي
            ),
          ],

        ),
      ),

    );
  }
}

class EventCard extends StatelessWidget {
  final String title;
  final String date;
  final String time;
  final String location;
  final String imageUrl;

  const EventCard({
    required this.title,
    required this.date,
    required this.time,
    required this.location,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
            child: Image.network(
              imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(date),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.access_time, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(time),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.location_on, size: 16, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(location),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}