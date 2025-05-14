const args = process.argv.slice(2);
if (args.length === 0) {
  console.log("please provide a number");
  process.exit(1);
}
const numbers = args.map(Number);

if (numbers.some(isNaN)) {
  console.log("please provide only numbers");
  process.exit(1);
}
const sum = numbers.reduce((acc, num) => acc + num, 0); //First time: a = 0 (the initial value), b = 10 → a + b = 10,Second time: a = 10, b = 20 → a + b = 30,Third time: a = 30, b = 30 → a + b = 60
const avg = sum / numbers.length;
console.log(`The average of ${numbers.join(", ")} is ${avg}`);
