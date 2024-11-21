    // Email validation
    function checkEmail() {
        const emailInput = document.getElementById("email");
    const emailValue = emailInput.value.trim();

    // Regular expression for validating email format
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (emailValue === "") {
        setError(emailInput, "Email is required.");
        } else if (!emailRegex.test(emailValue)) {
        setError(emailInput, "Enter a valid email address.");
        } else {
        setSuccess(emailInput);
        }
    }

    // Password validation
    function checkPassword() {
        const passwordInput = document.getElementById("password");
    const passwordValue = passwordInput.value.trim();

    if (passwordValue === "") {
        setError(passwordInput, "Password is required.");
        } else if (passwordValue.length < 8) {
        setError(passwordInput, "Password must be at least 8 characters long.");
        } else {
        setSuccess(passwordInput);
        }
    }

    // Function to set error state
    function setError(input, message) {
        input.style.borderColor = "red"; // Set red border for error
    let errorElement = input.nextElementSibling; // Find the next sibling for error message
    if (!errorElement || errorElement.tagName !== "SMALL") {
        errorElement = document.createElement("small");
    input.parentNode.insertBefore(errorElement, input.nextSibling);
        }
    errorElement.innerText = message;
    errorElement.style.color = "red";
    }

    // Function to set success state
    function setSuccess(input) {
        input.style.borderColor = "green"; // Set green border for success
    let errorElement = input.nextElementSibling; // Find the next sibling for error message
    if (errorElement && errorElement.tagName === "SMALL") {
        errorElement.innerText = ""; // Clear the error message
        }
    }

