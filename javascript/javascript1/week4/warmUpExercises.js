/*
//0.1 Running your Javascript
console.log("hello world");
console.warn("Something is about to happen...");
console.error("KABOOM");
//0.2 Variables & Scope
const name = "Alice";
const age = 16;
const country = "USA";
const isStudent = true; // New variable

let status = ""; // Changed from const to let
let message = ""; // Changed from const to let

if (age < 18) {
  status = "minor";
} else {
  status = "adult";
}

message = `${name} is a ${status} from ${country}.`;

console.log(message); // Alice is a minor from USA.
console.log(isStudent); // true

//0.3 Data types
const team = "Team 31"; // String
const noOfPeople = 5; // Number
const isActive = true; // Boolean
let projectDeadline; // Undefined (not assigned yet)
const nextMeeting = null; // Null (no meeting scheduled yet)
const teamLeader = { name: "Alice", role: "Team Lead" }; // Object
const teamMembers = ["Alice", "Bob", "Charlie", "David", "Eve"]; // Array

console.log(team);
console.log(noOfPeople);
console.log(isActive);
console.log(projectDeadline);
console.log(nextMeeting);
console.log(teamLeader);
console.log(teamMembers);
//Use typeof to check and print the type of each variable.
console.log("team:", typeof team);
console.log("membersCount:", typeof membersCount);
console.log("isActive:", typeof isActive);
console.log("projectDeadline:", typeof projectDeadline);
console.log("nextMeeting:", typeof nextMeeting); // Special case, returns "object"
console.log("teamLeader:", typeof teamLeader);
console.log("members:", typeof members);
//Guess the output, then run the code to see if you got it right.
const a = 10;
const b = -10;
const c = "100";
const d = "no";
const e = true;
const f = false;
const g = null;
console.log("#1", a + a, typeof (a + a)); //20 number
console.log("#2", a + b, typeof (a + b)); //0 number
console.log("#3", a + c, typeof (a + c)); //10100 string
console.log("#4", a + d, typeof (a + d)); //10no string
console.log("#5", a + e, typeof (a + e)); //Boolean
console.log("#6", a + f, typeof (a + f)); //boolean
console.log("#7", a + g, typeof (a + g)); //10null string
//0.4 Conditions

function userAge(age) {
  if (age < 12) {
    console.log("User is a Child and is " + age + " years");
  } else if (age >= 13 && age <= 19) {
    console.log("User is a Teenager " + age + " years");
  } else if (age > 19) {
    console.log("User is an Adult " + age + " years");
  }
}

userAge(10);
userAge(14);
userAge(25);
//Create a function that asks for a number and prints whether it is positive, negative, or zero.
// 
function whatIsNumber(number) {
  if (number > 0) {
    console.log("The Number is Positive " + number);
  } else if (number == 0) {
    console.log("The Number is a Zero " + number);
  } else if (number < 0) {
    console.log("The Number is Negative " + number);
  }
}
whatIsNumber(0);
whatIsNumber(1);
whatIsNumber(-1);

function isItLeapYear(year) {
  if (year % 4 === 0) {
    //
    console.log("It is a Leap Year and the year is " + year);
  } else {
    console.log("No its not a Leap Year " + year);
  }
}
isItLeapYear(2024);
isItLeapYear(2025);

//0.5 Loops
//1.Numbers from 1 to 10 using a for loop
for (let i = 1; i <= 10; i++) {
  console.log(i);
}
//countdown from 10 to 1 using a for loop
for (let i = 10; i >= 1; i--) {
  console.log(i);
}
//even numbers between 1 and 20 using a for loop
for (let i = 2; i <= 20; i += 2) {
  console.log(i);
}

//a for...of loop to print each value in the array
const names = ["john", "jane", "joe"];

for (let name of names) {
  console.log(name);
}


//0.6 Arrays

const favoriteFoods = ["pizza", "pasta", "burger", "barbecue", "pancakes"];
for (let favoriteFood of favoriteFoods) {
  console.log(favoriteFood);
}
  
const array = [5, 10, -98, 17.5, 365, -2.5];
function sumOfElements() {
  let sum = 0;
  for (element of array) {
    sum = sum + element;
  }
  console.log(sum);
}
sumOfElements(array);

let numbers = [10, 20, 30, 40, 50];
numbers.pop();
numbers.push(60);
console.log(numbers);

let numbers = [10, 20, 30, 40, 50];
console.log(Math.max(...numbers));

//0.7 Objects
//Create an object representing a book with properties: title, author, and yearPublished.
const book = {
  title: "The Great Gatsby",
  author: "F. Scott Fitzgerald",
  yearPublished: 1925,
};
console.log(book);

//Write a function that takes a book object and returns a string: {title} by {author}, published in {yearPublished}
function getBookInfo(book) {
  return `${book.title} by ${book.author}, published in ${book.yearPublished}`;
}

const book = {
  title: "The Great Gatsby",
  author: "F. Scott Fitzgerald",
  yearPublished: 1925,
};

console.log(getBookInfo(book));
// Output: "The Great Gatsby by F. Scott Fitzgerald, published in 1925"

//Add a method getAge to the book object that returns how old the book is based on the current year.
const book = {
  title: "The Great Gatsby",
  author: "F. Scott Fitzgerald",
  yearPublished: 1925,

  getAge: function () {
    const currentYear = new Date().getFullYear(); // Get the current year
    return currentYear - book.yearPublished; // Subtract published year from current year
  },
};

console.log(`${book.title} is ${book.getAge()} years old.`);
*/
//Write a function that takes an array of book objects and returns an array of all book titles.
function getBookTitles(books) {
  const titles = [];
  for (let i = 0; i < books.length; i++) {
    titles.push(books[i].title);
  }
  return titles;
}

const books = [
  {
    title: "The Great Gatsby",
    author: "F. Scott Fitzgerald",
    yearPublished: 1925,
  },
  { title: "1984", author: "George Orwell", yearPublished: 1949 },
  { title: "To Kill a Mockingbird", author: "Harper Lee", yearPublished: 1960 },
];

console.log(getBookTitles(books));
// Output: [ 'The Great Gatsby', '1984', 'To Kill a Mockingbird' ]
//0.8 Functions
//Write a function greet that takes a name as a parameter and returns a greeting message
function greet(name) {
  return `Hello, ${name}!`;
}

console.log(greet("Alice")); // Output: "Hello, Alice!"
//
//Write a function add that takes two numbers and returns their sum
function add(num1, num2) {
  return num1 + num2;
}

console.log(add(5, 3)); // Output: 8
//Write a function square that returns the square of a number. Then, write another function sumOfSquares that takes two numbers and returns the sum of their squares.
function square(num) {
  return num * num; // or num ** 2
}

function sumOfSquares(num1, num2) {
  return square(num1) + square(num2); // Uses square() to calculate the sum of squares
}

console.log(sumOfSquares(3, 4)); // Output: 25 (3² + 4² = 9 + 16)
