// Flight Booking Fullname Function
function getFullname(firstname, surname, useFormalName = false) {
    if (!firstname || !surname) return "Invalid input";  // Handle empty input
    if (useFormalName) {
      return `Lord ${firstname} ${surname}`;
    } else {
      return `${firstname} ${surname}`;
    }
  }
  
  const fullname1 = getFullname("Benjamin", "Hughes", true); // "Lord Benjamin Hughes"
  const fullname2 = getFullname("Benjamin", "Hughes", false); // "Benjamin Hughes"
  document.getElementById("fullname1").textContent = fullname1;
  document.getElementById("fullname2").textContent = fullname2;
  
  // Event Application Function
  function getEventWeekday(daysFromToday) {
    const today = new Date();
    const currentDay = today.getDay();  // Get current day (0: Sunday, 1: Monday, ..., 6: Saturday)
    const eventDay = (currentDay + daysFromToday) % 7;  // Calculate event day using modulo to wrap around the week
    const weekdays = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
    return weekdays[eventDay];
  }
  
  document.getElementById("eventWeekday").textContent = getEventWeekday(9); // "Thursday"
  
  // Weather Wear Function
  function whatToWear(temperature) {
    if (temperature < 0) return "wear a thick winter coat, scarf, and gloves";
    if (temperature < 10) return "wear a jacket";
    if (temperature < 20) return "wear a sweater or long-sleeve shirt";
    if (temperature < 30) return "wear shorts and a t-shirt";
    return "wear a swimsuit";
  }
  
  document.getElementById("clothes").textContent = whatToWear(18); // "wear a sweater or long-sleeve shirt"
  
  // Student Manager (Add Student Function)
  const class07Students = [];
  
  function addStudentToClass(studentName) {
    if (studentName === "") {
      console.log("Cannot add empty name to class");
      return;
    }
    if (class07Students.length >= 6 && studentName !== "Queen") {
      console.log("Cannot add more students to class 07");
    } else if (class07Students.includes(studentName)) {
      console.log(`Student ${studentName} is already in the class`);
    } else {
      class07Students.push(studentName);
      console.log(`Added ${studentName} to the class`);
    }
  }
  
  function getNumberOfStudents() {
    return class07Students.length;
  }
  
  addStudentToClass("Alice");
  addStudentToClass("Bob");
  addStudentToClass("Queen");
  addStudentToClass("Alice");
  addStudentToClass("David");
  addStudentToClass("Eva");
  addStudentToClass("Frank");
  addStudentToClass("Grace");
  
  document.getElementById("studentNumber").textContent = `Total students: ${getNumberOfStudents()}`;
  
  // Candy Helper (Add Candy Function)
  const boughtCandyPrices = [];
  
  function addCandy(candyType, weight) {
    const prices = {
      sweet: 0.5,
      chocolate: 0.7,
      toffee: 1.1,
      "chewing-gum": 0.03,
    };
  
    if (prices[candyType]) {
      boughtCandyPrices.push(prices[candyType] * weight);
    } else {
      console.log("Invalid candy type");
    }
  }
  
  function canBuyMoreCandy() {
    const totalPrice = boughtCandyPrices.reduce((sum, price) => sum + price, 0);
    const amountToSpend = Math.random() * 100;
    if (totalPrice < amountToSpend) {
      console.log("You can buy more, so please do!");
      return true;
    } else {
      console.log("Enough candy for you!");
      return false;
    }
  }
  
  addCandy("sweet", 20); // Adds 10
  addCandy("chocolate", 30); // Adds 21
  document.getElementById("candyStatus").textContent = canBuyMoreCandy() ? "You can buy more, so please do!" : "Enough candy for you!";
  