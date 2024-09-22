var map;
    var service;
    var infowindow;

   
    function initMap(location) {
      infowindow = new google.maps.InfoWindow();

   
      map = new google.maps.Map(document.getElementById('map'), {
        center: location,
        zoom: 15
      });

    
      var request = {
        location: location,
        radius: '5000', 
        type: ['museum'], 
        keyword: 'art'
      };

     
      service = new google.maps.places.PlacesService(map);

      
      service.nearbySearch(request, function(results, status) {
        document.getElementById('noResultsAlert').classList.add('d-none'); // Hide no results alert initially
        if (status === google.maps.places.PlacesServiceStatus.OK && results.length > 0) {
          document.getElementById('museumResults').innerHTML = ''; // Clear previous results
          for (var i = 0; i < results.length; i++) {
            createMarker(results[i]);
            displayMuseumInfo(results[i]);
          }
        } else {
        
          document.getElementById('museumResults').innerHTML = '';
          document.getElementById('noResultsAlert').classList.remove('d-none');
        }
        hideLoadingSpinner();
      });
    }

  
    function createMarker(place) {
      var marker = new google.maps.Marker({
        map: map,
        position: place.geometry.location
      });

     
      google.maps.event.addListener(marker, 'click', function() {
        infowindow.setContent(place.name);
        infowindow.open(map, this);
      });
    }

   
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

    
    function geocodeLocation(city, zip) {
      var geocoder = new google.maps.Geocoder();
      var address = city ? city : '';
      address += zip ? `, ${zip}` : '';

      geocoder.geocode({ 'address': address }, function(results, status) {
        if (status === 'OK') {

          initMap(results[0].geometry.location);
        } else {
          alert('Geocode was not successful for the following reason: ' + status);
          hideLoadingSpinner();
        }
      });
    }

 
    function showLoadingSpinner() {
      document.getElementById('loadingSpinner').classList.remove('d-none');
    }

   
    function hideLoadingSpinner() {
      document.getElementById('loadingSpinner').classList.add('d-none');
    }


    document.getElementById('museumForm').addEventListener('submit', function(e) {
      e.preventDefault();
      var city = document.getElementById('city').value;
      var zip = document.getElementById('zip').value;

   
      if (!city && !zip) {
        alert('Please enter a city or zip code.');
        return;
      }

  
      showLoadingSpinner();
      document.getElementById('museumResults').innerHTML = '';
      document.getElementById('noResultsAlert').classList.add('d-none');

  
      geocodeLocation(city, zip);
    });
