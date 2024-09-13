window.addEventListener('load',function(){
	init()
	
	
	
})
function init(){
	loadAllMuseums();
	
}
function loadAllMuseums(){    
let xhr = new XMLHttpRequest();
    xhr.open('GET', 'api/museums');
    
    xhr.onreadystatechange = function() {
        if (xhr.readyState === xhr.DONE) {
            if (xhr.status === 200) {
                let museums = JSON.parse(xhr.responseText);
                console.log(museums);
                displayMuseumsList(museums);
            } else {
                console.error('Error: Unable to load museums.');
              
            }
        }
    };
    
    xhr.send();
}

function displayMuseumsList(museumList) {
    let tbody = document.getElementById('museumListBody');
    


		}
