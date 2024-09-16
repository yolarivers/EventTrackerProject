var map;
    var service;
    var infowindow;

    // Initialize the map
    function initMap(location) {
      infowindow = new google.maps.InfoWindow();

      // Create map centered on the provided location
      map = new google.maps.Map(document.getElementById('map'), {
        center: location,
        zoom: 15
      });

      // Search for museums around the given location
      var request = {
        location: location,
        radius: '5000', // Search within a 5km radius
        type: ['museum'], // Filter by 'museum' type
        keyword: 'art'
      };

      // Initialize Places service
      service = new google.maps.places.PlacesService(map);

      // Perform nearby search for art museums
      service.nearbySearch(request, function(results, status) {
        document.getElementById('noResultsAlert').classList.add('d-none'); // Hide no results alert initially
        if (status === google.maps.places.PlacesServiceStatus.OK && results.length > 0) {
          document.getElementById('museumResults').innerHTML = ''; // Clear previous results
          for (var i = 0; i < results.length; i++) {
            createMarker(results[i]);
            displayMuseumInfo(results[i]);
          }
        } else {
          // Show alert when no results are found
          document.getElementById('museumResults').innerHTML = '';
          document.getElementById('noResultsAlert').classList.remove('d-none');
        }
        hideLoadingSpinner();
      });
    }

    // Create marker for each museum found
    function createMarker(place) {
      var marker = new google.maps.Marker({
        map: map,
        position: place.geometry.location
      });

      // On marker click, show information about the place
      google.maps.event.addListener(marker, 'click', function() {
        infowindow.setContent(place.name);
        infowindow.open(map, this);
      });
    }

    // Display museum information in a list
    function displayMuseumInfo(place) {
      var museumResults = document.getElementById('museumResults');
      var museumInfo = `
        <div class="col-md-6 col-lg-4 mb-4">
          <div class="card h-100 shadow-sm">
            <div class="card-body">
              <h5 class="card-title">${place.name}</h5>
              <p class="card-text">${place.vicinity}</p>
              <p class="card-text">Rating: ${place.rating ? place.rating : 'N/A'}</p>
              <a href="https://www.google.com/maps/search/?api=1&query=${encodeURIComponent(place.name)}" target="_blank" class="btn btn-outline-primary">View on Map</a>
            </div>
          </div>
        </div>
      `;
      museumResults.innerHTML += museumInfo;
    }

    // Geocode the city and zip code entered by the user to get the location coordinates
    function geocodeLocation(city, zip) {
      var geocoder = new google.maps.Geocoder();
      var address = city ? city : '';
      address += zip ? `, ${zip}` : '';

      geocoder.geocode({ 'address': address }, function(results, status) {
        if (status === 'OK') {
          // Pass the geocoded location to the map initialization
          initMap(results[0].geometry.location);
        } else {
          alert('Geocode was not successful for the following reason: ' + status);
          hideLoadingSpinner();
        }
      });
    }

    // Show loading spinner
    function showLoadingSpinner() {
      document.getElementById('loadingSpinner').classList.remove('d-none');
    }

    // Hide loading spinner
    function hideLoadingSpinner() {
      document.getElementById('loadingSpinner').classList.add('d-none');
    }

    // Handle form submission
    document.getElementById('museumForm').addEventListener('submit', function(e) {
      e.preventDefault();
      var city = document.getElementById('city').value;
      var zip = document.getElementById('zip').value;

      // Ensure at least one of city or zip is provided
      if (!city && !zip) {
        alert('Please enter a city or zip code.');
        return;
      }

      // Show loading spinner and reset results
      showLoadingSpinner();
      document.getElementById('museumResults').innerHTML = '';
      document.getElementById('noResultsAlert').classList.add('d-none'); // Hide no results alert on new search

      // Geocode the user input and initialize the map with the returned coordinates
      geocodeLocation(city, zip);
    });
