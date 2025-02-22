function removeName(namesArray, nameToRemove) {
  return namesArray.filter((name) => name !== nameToRemove);
}

const names = [
  "Peter",
  "Ahmad",
  "Yana",
  "kristina",
  "Rasmus",
  "Samuel",
  "katrine",
  "Tala",
];
const nameToRemove = "Ahmad";

const updatedNames = removeName(names, nameToRemove);

console.log(updatedNames);
// Output: ["Peter", "Yana", "kristina", "Rasmus", "Samuel", "katrine", "Tala"]
<!-- Minor change to enable pull request  -->