// Peter's house details
const peterHouseWidth = 8;
const peterHouseDepth = 10;
const peterHouseHeight = 10;
const peterHouseGardenSize = 100;
const peterHouseCost = 2500000;

// Julia's house details
const juliaWidth = 5;
const juliaDepth = 11;
const juliaHeight = 8;
const juliaGardenSize = 70;
const juliaHouseCost = 1000000;

// House price formula: volume * 2.5 * 1000 + garden size * 300
const peterHousePrice = (peterWidth * peterDepth * peterHeight * 2.5 * 1000) + (peterGardenSize * 300);
const juliaHousePrice = (juliaWidth * juliaDepth * juliaHeight * 2.5 * 1000) + (juliaGardenSize * 300);

// Checking if Peter is paying too much or too little
if (peterHousePrice > peterHouseCost) {
    console.log("Peter is paying too little. The house is worth " + peterHousePrice + ".");
} else if (peterHousePrice < peterHouseCost) {
    console.log("Peter is paying too much. The house is worth " + peterHousePrice + ".");
} else {
    console.log("Peter is paying the right price.");
}

// Checking if Julia is paying too much or too little
if (juliaHousePrice > juliaHouseCost) {
    console.log("Julia is paying too little. The house is worth " + juliaHousePrice + ".");
} else if (juliaHousePrice < juliaHouseCost) {
    console.log("Julia is paying too much. The house is worth " + juliaHousePrice + ".");
} else {
    console.log("Julia is paying the right price.");
}