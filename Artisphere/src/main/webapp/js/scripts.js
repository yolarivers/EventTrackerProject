
document.getElementById('allDay').addEventListener('change', function() {
    const startTime = document.getElementById('startTime');
    const endTime = document.getElementById('endTime');
    
    if (this.checked) {
        startTime.disabled = true;
        endTime.disabled = true;
    } else {
        startTime.disabled = false;
        endTime.disabled = false;
    }
});
