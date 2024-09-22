async function loadExhibitions() {
  try {
    const response = await fetch("/api/exhibitions");
    if (response.ok) {
      const exhibitions = await response.json();
      const exhibitionList = document.querySelector(".exhibition-list");

      exhibitionList.innerHTML = ""; 

      exhibitions.forEach(exhibition => {
        exhibitionList.innerHTML += `
      
        `;
      });
    } else {
      console.error("Failed to load exhibitions:", response.statusText);
    }
  } catch (error) {
    console.error("Error loading exhibitions:", error);
  }
}

window.onload = loadExhibitions;

document.querySelector("form").addEventListener("submit", async function(event) {
  event.preventDefault(); 
  const formData = new FormData();
  formData.append("file", document.querySelector("#fileInput").files[0]);
  formData.append("title", document.querySelector("#eventTitle").value);
  formData.append("startDate", document.querySelector("#startDate").value);
  formData.append("endDate", document.querySelector("#endDate").value);
  formData.append("description", document.querySelector("#description").value);

  try {
    const response = await fetch("/api/exhibitions/upload", {
      method: "POST",
      body: formData
    });

    if (response.ok) {
      const result = await response.json();
      alert("Exhibition submitted successfully!");

      location.reload(); 
    } else {
      alert("Error submitting exhibition: " + response.statusText);
    }
  } catch (error) {
    console.error("Error:", error);
    alert("There was an error submitting your exhibition.");
  }
});
document.querySelector("form").addEventListener("submit", async function(event) {
  event.preventDefault(); // Prevent default form submission behavior


  const formData = new FormData();
  formData.append("file", document.querySelector("#fileInput").files[0]);
  formData.append("title", document.querySelector("#eventTitle").value);
  formData.append("startDate", document.querySelector("#startDate").value);
  formData.append("endDate", document.querySelector("#endDate").value);
  formData.append("description", document.querySelector("#description").value);

  try {
    const response = await fetch("/api/exhibitions/upload", {
      method: "POST",
      body: formData
    });

    if (response.ok) {
      const result = await response.json();
      alert("Exhibition submitted successfully!");

      // Optionally refresh the exhibition list here or redirect the user
      location.reload(); // Refresh the page to update the list of exhibitions
    } else {
      alert("Error submitting exhibition: " + response.statusText);
    }
  } catch (error) {
    console.error("Error:", error);
    alert("There was an error submitting your exhibition.");
  }
});