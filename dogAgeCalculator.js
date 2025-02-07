const dogYearOfBirth = 2017;
const dogYearFuture = 2027;
const shouldShowResultInDogYears = false;

const humanAge = dogYearFuture - dogYearOfBirth;
const dogAge = humanAge * 7;

if (shouldShowResultInDogYears) {
    console.log(`Your dog will be ${dogAge} dog years old in ${dogYearFuture}.`);
} else {
    console.log(`Your dog will be ${humanAge} human years old in ${dogYearFuture}.`);
}
