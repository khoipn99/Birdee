function triggerModal() {
    const myModalEl = document.getElementById("productModel");
    const modal = new mdb.Modal(myModalEl);
    modal.toggle();
}

function myFunction() {
    alert("KAKAKA");
}


function validatePhone(input) {
// Remove non-digit characters
    var value = input.value.replace(/\D/g, '');
    // Limit the length to 10 characters
    if (value.length > 10) {
        value = value.slice(0, 10);
    }

// Update the input value
    input.value = value;
}



function handleKeyDown(event) {
// Allow only arrow key codes (37: left, 38: up, 39: right, 40: down)
    if (event.keyCode < 37 || event.keyCode > 40) {
        event.preventDefault();
    }
}

function handlePaste(event) {
    event.preventDefault();
}