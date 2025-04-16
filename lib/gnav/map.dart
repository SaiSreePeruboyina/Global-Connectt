import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart'; // Import geocoding for converting address to coordinates
import 'package:myapp/userspage.dart'; // Import the UsersPage

class mapexe extends StatefulWidget {
  const mapexe({super.key});

  @override
  _mapexeState createState() => _mapexeState();
}

class _mapexeState extends State<mapexe> {
  late GoogleMapController mapController;
  TextEditingController searchController = TextEditingController();
  TextEditingController tagController = TextEditingController();
  static const LatLng _center = LatLng(37.7749, -122.4194); // San Francisco coordinates
  final Set<Marker> _markers = {};
  String currentPlace = '';

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _onSearch() async {
    String searchTerm = searchController.text;
    if (searchTerm.isNotEmpty) {
      // Convert the search term to coordinates
      List<Location> locations = await locationFromAddress(searchTerm);
      if (locations.isNotEmpty) {
        final location = locations.first;
        LatLng latLng = LatLng(location.latitude, location.longitude);
        setState(() {
          _markers.clear();
          currentPlace = searchTerm;
          _markers.add(
            Marker(
              markerId: MarkerId(searchTerm),
              position: latLng,
              infoWindow: InfoWindow(
                title: searchTerm,
                snippet: 'Example Marker',
              ),
              icon: BitmapDescriptor.defaultMarker,
            ),
          );
        });
        mapController.animateCamera(CameraUpdate.newLatLngZoom(latLng, 12.0));
        _showTagDialog(); // Show the dialog to enter a tag after searching
      }
    }
  }

  void _showTagDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Enter Tag/Label'),
          content: TextField(
            controller: tagController,
            decoration: const InputDecoration(hintText: 'Tag/Label'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _searchUsersByTag(tagController.text);
              },
              child: const Text('Search'),
            ),
          ],
        );
      },
    );
  }

  void _searchUsersByTag(String tag) {
    // Navigate to a new page with the tag and place
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UsersPage(place: currentPlace, tag: tag),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          decoration: InputDecoration(
            hintText: 'Search for a place...',
            border: InputBorder.none,
            contentPadding: const EdgeInsets.only(left: 15.0, top: 15.0),
            suffixIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: _onSearch,
              iconSize: 30.0,
            ),
          ),
          onSubmitted: (value) {
            _onSearch();
          },
        ),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
        markers: _markers,
      ),
    );
  }
}
