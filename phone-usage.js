const activities = [];
const usageLimit = 100;

function addActivity(
  activity,
  duration,
  date = new Date().toLocaleDateString()
) {
  if (typeof activity !== "string" || typeof duration !== "number") {
    console.log(
      "Invalid input. Activity must be a string and duration must be a number."
    );
    return;
  }
  activities.push({ date, activity, duration });
}

function showStatus() {
  if (activities.length === 0) {
    console.log("You haven't added any activities yet. Try adding one!");
    return;
  }

  const totalTime = activities.reduce((sum, entry) => sum + entry.duration, 0);
  console.log(
    `You have logged ${activities.length} activities, totaling ${totalTime} minutes of screen time.`
  );

  if (totalTime > usageLimit) {
    console.log(
      "You've exceeded your daily limit! Time to take a break from your phone. 📵"
    );
  }
}

function getMostUsedActivity() {
  if (activities.length === 0) {
    console.log("No activities recorded yet.");
    return;
  }

  const usageMap = {};
  for (const { activity, duration } of activities) {
    usageMap[activity] = (usageMap[activity] || 0) + duration;
  }

  let mostUsed = null;
  let maxTime = 0;

  for (const [activity, time] of Object.entries(usageMap)) {
    if (time > maxTime) {
      mostUsed = activity;
      maxTime = time;
    }
  }

  console.log(
    `Your most used activity is "${mostUsed}" with a total of ${maxTime} minutes.`
  );
}

addActivity("Watching YouTube", 40);
addActivity("Browsing Facebook", 30);
addActivity("Reading News", 20);
showStatus();
getMostUsedActivity();
<!-- Minor change to enable pull request -->