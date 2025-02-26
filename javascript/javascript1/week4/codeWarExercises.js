//Return the number (count) of vowels in the given string.
function getCount(str) {
  let count = 0;
  const vowels = "aeiou";
  for (let char of str) {
    if (vowels.includes(char)) {
      count++;
    }
  }
  return count;
}
console.log(getCount("hello world"));
//In this kata, you are asked to square every digit of a number and concatenate them.
function squareDigits(num) {
  return Number(
    num
      .toString()
      .split("")
      .map((digit) => digit ** 2)
      .join("")
  );
}
console.log(squareDigits(9119));
console.log(squareDigits(765));
console.log(squareDigits(0));
//In this little assignment you are given a string of space separated numbers, and have to return the highest and lowest number.
function highAndLow(numbers) {
  const numArray = numbers.split(" ").map(Number);
  return `${Math.max(...numArray)} ${Math.min(...numArray)}`;
}

console.log(highAndLow("1 2 3 4 5")); // Output: "5 1"
console.log(highAndLow("1 2 -3 4 5")); // Output: "5 -3"
console.log(highAndLow("1 9 3 4 -5")); // Output: "9 -5"
console.log(highAndLow("42")); // Output: "42 42"
