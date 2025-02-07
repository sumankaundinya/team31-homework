// Peter's house details
const peterHouseWidth = 8;
const peterHouseDepth = 10;
const peterHouseHeight = 10;
const peterHouseGardenSize = 100;
const peterActualHouseCost = 2500000;

// Julia's house details
const juliaHouseWidth = 5;
const juliaHouseDepth = 11;
const juliaHouseHeight = 8;
const juliaHouseGardenSize = 70;
const juliaActualHouseCost = 1000000;

// House price formula: volume * 2.5 * 1000 + garden size * 300
const peterEstimatedHousePrice = (peterHouseWidth * peterHouseDepth * peterHouseHeight * 2.5 * 1000) + (peterHouseGardenSize * 300);
const juliaEstimatedHousePrice = (juliaHouseWidth * juliaHouseDepth * juliaHouseHeight * 2.5 * 1000) + (juliaHouseGardenSize * 300);

// Checking if Peter is paying too much or too little
if (peterEstimatedHousePrice > peterActualHouseCost) {
    console.log(`Peter is paying too little. The house is worth ${peterEstimatedHousePrice}.`);
} else if (peterEstimatedHousePrice < peterActualHouseCost) {
    console.log(`Peter is paying too much. The house is worth ${peterEstimatedHousePrice}.`);
} else {
    console.log("Peter is paying the right price.");
}

// Checking if Julia is paying too much or too little
if (juliaEstimatedHousePrice > juliaActualHouseCost) {
    console.log(`Julia is paying too little. The house is worth ${juliaEstimatedHousePrice}.`);
} else if (juliaEstimatedHousePrice < juliaActualHouseCost) {
    console.log(`Julia is paying too much. The house is worth ${juliaEstimatedHousePrice}.`);
} else {
    console.log("Julia is paying the right price.");
}
