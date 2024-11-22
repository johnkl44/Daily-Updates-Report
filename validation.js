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
            return true;
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
            return true;
        }
    }

   

    function checkConfirmPassword() {
        const passwordInput = document.getElementById("password");
        const confirmPasswordInput = document.getElementById("confirm-password");

        const passwordValue = passwordInput.value.trim();
        const confirmPasswordValue = confirmPasswordInput.value.trim();

        if (confirmPasswordValue === "") {
            setError(confirmPasswordInput, "Please confirm your password.");
        }

        else if (confirmPasswordValue !== passwordValue) {
            setError(confirmPasswordInput, "Passwords do not match.");
        }
        else {
            setSuccess(confirmPasswordInput);
        }
    }

    //Username validation

    function checkUser() {
        const userInput = document.getElementById("username");
        const userValue = userInput.value.trim();

    // Regular expression for validating username format
        const userRegex = /^[a-zA-Z]+$/;

        if (userValue === "") {
            setError(userInput, "user name required.");
        } else if (!userRegex.test(userValue)) {
            setError(userInput, "Enter a valid name.");
        } else {
            setSuccess(userInput);
        }
    }

    //first name Validation
    function checkFirstName() {
        const userInput = document.getElementById("first-name");
        const userValue = userInput.value.trim();

    // Regular expression for validating username format
        const userRegex = /^[a-zA-Z]+$/;

        if (userValue === "") {
            setError(userInput, "Name required.");
        } else if (!userRegex.test(userValue)) {
            setError(userInput, "Enter a valid name.");
        } else {
            setSuccess(userInput);
        }
    }

//    Last name validation
function checkLastName() {
    const userInput = document.getElementById("last-name");
    const userValue = userInput.value.trim();

    // Regular expression for validating username format
    const userRegex = /^[a-zA-Z]+$/;

    if (userValue === "") {
        setError(userInput, "Name required.");
    } else if (!userRegex.test(userValue)) {
        setError(userInput, "Enter a valid name.");
    } else {
        setSuccess(userInput);
    }
}

   // Phone Number Validation
function checkPhone() {
    const phoneInput = document.getElementById("phone");
    const phoneValue = phoneInput.value.trim();

    // Regular expression for validating phone number (digits only)
    const phoneRegex = /^[0-9]+$/;

     if (phoneValue === "") {
        setError(phoneInput, "Phone number is required.");
    } else if (!phoneRegex.test(phoneValue)) {
        setError(phoneInput, "Enter a valid phone number (digits only).");
    } else if (phoneValue.length < 10 || phoneValue.length > 15) {
        setError(phoneInput, "Phone number must be between 10 and 15 digits.");
    } else {
        setSuccess(phoneInput);
    }
}



    // Function to set error state
    function setError(input, message) {
        input.style.borderColor = "red";
        let errorElement = input.nextElementSibling;  //its a DOM property (nextElemntSibling)
        if (!errorElement || errorElement.tagName !== "SMALL") { // SMALL because DOM understand small as SMALL
            errorElement = document.createElement("small"); // creating a smll element to print the message
            input.parentNode.insertBefore(errorElement, input.nextSibling);
        }
        errorElement.innerText = message;
        errorElement.style.color = "red";
    }

    // Function to set success state
    function setSuccess(input) {
        input.style.borderColor = "green"; 
        let errorElement = input.nextElementSibling; 
        if (errorElement && errorElement.tagName === "SMALL") {
            errorElement.innerText = ""; 
        }
    }

    //Verification minor date of birth

    var todayDate = new Date();
    var month = todayDate.getMonth() + 1;
    var year = todayDate.getUTCFullYear() - 18;
    var tDate = todayDate.getDay() + 17 ;
    if (month < 10) {
        month = '0' + month;
    }
    if (tDate < 10) {
        tDate = '0' + tDate;
    }

    var maxDate = year + '-' + month + '-' + tDate;

    document.getElementById("dob").setAttribute("max", maxDate)



    //Responsive Dropdown

    var stateCityObject = { // objects with nested array
        "Kerala": ["Thiruvananthapuram", "Kochi", "Kozhikode", "Thrissur"],
        "Tamil Nadu": ["Chennai", "Coimbatore", "Madurai", "Tiruchirappalli"],
        "Karnataka": ["Bengaluru", "Mysuru", "Mangaluru", "Hubballi"],
        "Mumbai": ["Andheri", "Borivali", "Dadar", "Colaba"]
    };

        window.onload = function () {
         var stateSel = document.getElementById("state");
         var citySel = document.getElementById("city");

         for (var state in stateCityObject) {
             stateSel.options[stateSel.options.length] = new Option(state, state);
         }

        stateSel.onchange = function () {

            citySel.length = 1;

            var selectedState = this.value;
            if (selectedState in stateCityObject) {
                var cities = stateCityObject[selectedState];
                for (var i = 0; i < cities.length; i++) {
                    citySel.options[citySel.options.length] = new Option(cities[i], cities[i]);
                }
            }
        }
    }

