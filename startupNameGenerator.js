
const firstWords = ["Easy", "Awesome", "Corporate", "Smart", "Innovative", "Brilliant", "Agile", "Rapid", "Dynamic", "Creative"];
const secondWords = ["Solutions", "Technologies", "Ventures", "Systems", "Enterprises", "Developers", "Labs", "Corporation", "Networks", "Startups"];

const randomNumber1 = Math.floor(Math.random() * 10); // First word index
const randomNumber2 = Math.floor(Math.random() * 10); // Second word index

const startupName = `${firstWords[randomNumber1]} ${secondWords[randomNumber2]}`;

// To find the number of characters in the startup name
const nameLength = startupName.length;

console.log(`The startup: "${startupName}" contains ${nameLength} characters.`);
