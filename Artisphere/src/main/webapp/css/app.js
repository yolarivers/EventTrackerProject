document.getElementById('login-btn').addEventListener('click', function() {
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;


    console.log("Logging in...");


    const url = "http://3.128.118.154:8080//TodoREST/authenticate";
    
    fetch(url, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            username: username,
            password: password
        })
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            console.log(`_id: ${data.id}, username: '${data.username}', enabled: ${data.enabled}`);
       
            console.log('Login successful:', data);

   
            loadTodos();
        } else {
            console.error("Login failed:", data.message);
        }
    })
    .catch(error => {
        console.error('Error during login:', error);
    });
});

function loadTodos() {
    const todosUrl = "http://3.128.118.154:8080//TodoREST/api/todos";

  
    console.log("XHR finished loading:", todosUrl);
    fetch(todosUrl)
    .then(response => response.json())
    .then(data => {
        console.log("Todos loaded:", data);
    })
    .catch(error => {
        console.error("Error loading todos:", error);
    });
}


document.querySelectorAll('input[type="password"]').forEach(input => {
    if (!input.hasAttribute('autocomplete')) {
        console.warn(`Input elements should have autocomplete attributes (suggested: "current-password")`, input);
    }
});


setTimeout(function() {
    console.warn('Violation: `setTimeout` handler took longer than expected.');
}, 55);
