document.getElementById('allDay').addEventListener('change', function() {
    const startTime = document.getElementById('startTime');
    const endTime = document.getElementById('endTime');
    
    startTime.disabled = this.checked;
    endTime.disabled = this.checked;
});

// Exhibition Form
document.getElementById('eventForm').addEventListener('submit', function(event) {
    event.preventDefault();

    const eventName = document.getElementById('eventName').value;
    const startDate = document.getElementById('startDate').value;
    const imageFile = document.getElementById('imageFile').files[0];

    const reader = new FileReader();
    reader.onload = function(e) {
        const exhibitionList = document.querySelector('.exhibition-list');
        const newExhibition = document.createElement('div');
        newExhibition.classList.add('exhibition-item');

        newExhibition.innerHTML = `
            <img src="${e.target.result}" alt="${eventName}">
            <h3>${eventName}</h3>
            <p>${new Date(startDate).toDateString()}</p>
        `;

        exhibitionList.appendChild(newExhibition);
    };

    if (imageFile) {
        reader.readAsDataURL(imageFile);
    }
});

var map, service, infowindow;

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
    service.nearbySearch(request, handleMuseumSearchResults);
}

function handleMuseumSearchResults(results, status) {
    const museumResults = document.getElementById('museumResults');
    museumResults.innerHTML = '';

    if (status === google.maps.places.PlacesServiceStatus.OK) {
        if (results.length === 0) {
            museumResults.innerHTML = '<p class="text-danger">No museums found in this area.</p>';
        } else {
            results.forEach(result => {
                createMarker(result);
                displayMuseumInfo(result);
            });
        }
    } else {
        museumResults.innerHTML = '<p class="text-danger">No museums found in this area.</p>';
    }
    hideLoadingSpinner();
}

function createMarker(place) {
    const marker = new google.maps.Marker({
        map: map,
        position: place.geometry.location
    });

    google.maps.event.addListener(marker, 'click', function() {
        infowindow.setContent(place.name);
        infowindow.open(map, this);
    });
}

function displayMuseumInfo(place) {
    const museumResults = document.getElementById('museumResults');
    const photoUrl = place.photos ? place.photos[0].getUrl({ maxWidth: 200, maxHeight: 200 }) : 'https://via.placeholder.com/200';

    const museumInfo = `
        <div class="museum-card d-flex">
            <img src="${photoUrl}" alt="${place.name}">
            <div class="museum-card-body">
                <h5 class="museum-title">${place.name}</h5>
                <p class="museum-location">${place.vicinity}</p>
                <p class="museum-rating">Rating: ${place.rating ? place.rating : 'N/A'}</p>
                <a href="https://www.google.com/maps/search/?api=1&query=${encodeURIComponent(place.name)}" target="_blank" class="view-on-map-btn">View on Map</a>
            </div>
        </div>
    `;
    museumResults.innerHTML += museumInfo;
}

function geocodeLocation(city, zip) {
    const geocoder = new google.maps.Geocoder();
    let address = city ? city : '';
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
    const city = document.getElementById('city').value;
    const zip = document.getElementById('zip').value;

    if (!city && !zip) {
        alert('Please enter a city or zip code.');
        return;
    }

    showLoadingSpinner();
    document.getElementById('museumResults').innerHTML = '';

    geocodeLocation(city, zip);
});



document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('museumForm').addEventListener('submit', function(e) {
        e.preventDefault();
        const city = document.getElementById('city').value;
        const zip = document.getElementById('zip').value;

        if (!city && !zip) {
            alert('Please enter a city or zip code.');
            return;
        }

        showLoadingSpinner();
        document.getElementById('museumResults').innerHTML = '';

        geocodeLocation(city, zip);
    });
});

