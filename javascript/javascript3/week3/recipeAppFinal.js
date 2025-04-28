let recipeArray = [];

async function fetchRecipes() {
  try {
    const response = await fetch(
      "https://raw.githubusercontent.com/sumankaundinya/sumankaundinya.github.io/main/recipes.json"
    );
    if (!response.ok) {
      throw new Error("Network response was not ok");
    }
    const data = await response.json();
    recipeArray = data;
    console.log(recipeArray);
    displayRecipe(recipeArray);
  } catch (error) {
    console.error("There was a problem with the fetch operation:", error);
  }
}

function displayRecipe(recipeArray) {
  const container = document.getElementById("recipe-container");
  container.innerHTML = "";
  recipeArray.forEach((recipe) => {
    const recipeCard = document.createElement("div");
    recipeCard.classList.add("recipe-card");

    recipeCard.innerHTML = `
      <h2>${recipe.title}</h2>
      <img src="${recipe.picture_url}" alt="${recipe.title}" width="200">
      <p>${recipe.description}</p>
      <h3>Ingredients:</h3>
      <ul class="ingredient-list"></ul>
    `;

    const ingredientList = recipeCard.querySelector(".ingredient-list");
    recipe.ingredients.forEach((ingredient) => {
      const li = document.createElement("li");
      li.innerText = `${ingredient.NAME}: ${ingredient.AMOUNT}, Price: ${ingredient.PRICE}`;
      ingredientList.appendChild(li);
    });

    container.appendChild(recipeCard);
  });
}

document.getElementById("sort-button").addEventListener("click", function () {
  const sortedRecipes = [...recipeArray].sort(
    (a, b) => a.ingredients.length - b.ingredients.length
  );
  displayRecipe(sortedRecipes);
});

document.getElementById("search-input").addEventListener("input", function () {
  const searchTerm = this.value.toLowerCase();
  if (!searchTerm) {
    displayRecipe(recipeArray);
    return;
  }
  const filteredRecipes = recipeArray.filter((recipe) =>
    recipe.title.toLowerCase().includes(searchTerm)
  );
  displayRecipe(filteredRecipes);
});

document
  .getElementById("search-ingredient")
  .addEventListener("input", function () {
    const searchTerm = this.value.toLowerCase();
    if (!searchTerm) {
      displayRecipe(recipeArray);
      return;
    }
    const filteredRecipes = recipeArray.filter((recipe) =>
      recipe.ingredients.some((ingredient) =>
        ingredient.NAME.toLowerCase().includes(searchTerm)
      )
    );
    displayRecipe(filteredRecipes);
  });

function createIngredientInput(value = "", amount = "", price = "") {
  const div = document.createElement("div");
  div.classList.add("ingredient-entry");
  div.innerHTML = `
        <input type="text" class="ingredient-input" placeholder="Ing.Name" value="${value}" required>
        <input type="text" class="ingredient-amount" placeholder="Amount" value="${amount}" required>
        <input type="text" class="ingredient-price" placeholder="Price" value="${price}" required>
    `;

  return div;
}

const ingredientContainer = document.getElementById("ingredient-container");
for (let i = 0; i < 5; i++) {
  ingredientContainer.appendChild(createIngredientInput());
}

document
  .getElementById("add-ingredient")
  .addEventListener("click", function () {
    ingredientContainer.appendChild(createIngredientInput());
  });

document
  .getElementById("recipe-form")
  .addEventListener("submit", function (event) {
    event.preventDefault();

    const title = document.getElementById("title").value;
    const description = document.getElementById("description").value;
    const picture = document.getElementById("picture").value;
    const ingredientInputs = document.querySelectorAll(".ingredient-input");
    const ingredientAmounts = document.querySelectorAll(".ingredient-amount");
    const ingredientPrices = document.querySelectorAll(".ingredient-price");
    if (ingredientInputs.length < 5) {
      alert("Please add at least 5 ingredients.");
      return;
    }

    let ingredients = [];
    ingredientInputs.forEach((input, index) => {
      ingredients.push({
        NAME: input.value,
        AMOUNT: ingredientAmounts[index].value,
        PRICE: ingredientPrices[index].value,
      });
    });

    const newRecipe = {
      id: Date.now(),
      title,
      picture_url: picture,
      ingredients,
      description,
    };
    recipeArray.push(newRecipe);
    displayRecipe(recipeArray);
    document.getElementById("recipe-form").reset();

    ingredientContainer.innerHTML = "";
    ingredientContainer.appendChild(createIngredientInput());
  });
const timerInput = document.getElementById("timerInput");
const startButton = document.getElementById("startTimer");
const timerDisplay = document.getElementById("timerDisplay");
timerInput.addEventListener("focus", () => {
  if (timerInput.value === "") {
    timerInput.placeholder = "";
  }
});

const alertSound = new Audio("beep.wav");

let countdown;

startButton.addEventListener("click", function () {
  let timeLeft = parseFloat(timerInput.value) * 60; // Convert minutes to seconds
  if (isNaN(timeLeft) || timeLeft <= 0) {
    alert("Please enter a valid number of minutes.");
    return;
  }

  clearInterval(countdown);
  updateTimerDisplay(timeLeft);

  countdown = setInterval(() => {
    timeLeft--;
    updateTimerDisplay(timeLeft);

    if (timeLeft <= 0) {
      clearInterval(countdown);
      timerDisplay.textContent = "Time's up!";

      alertSound.play();

      setTimeout(() => {
        alert("Time's up!");
      }, 100);
    }
  }, 1000);
});

function updateTimerDisplay(timeLeft) {
  const minutes = Math.floor(timeLeft / 60);
  const seconds = timeLeft % 60;
  timerDisplay.textContent = `Time left: ${minutes}m ${seconds}s`;
}
const backToTopButton = document.getElementById("backToTopBtn"); // When the user scrolls down 20px from the top, show the button
window.onscroll = function () {
  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
    backToTopButton.style.display = "block";
  } else {
    backToTopButton.style.display = "none";
  }
};
backToTopButton.addEventListener("click", function () {
  window.scrollTo({ top: 0, behavior: "smooth" });
});
let timeSpent = 0;
setInterval(() => {
  timeSpent++;
  const minutes = Math.floor(timeSpent / 60);
  const seconds = timeSpent % 60;
  document.getElementById("timeSpent").textContent = `${minutes}m ${seconds}s`;
}, 1000);
fetchRecipes();
