const seriesDurations = [
  {
    title: "Stranger Things",
    days: 3,
    hours: 1,
    minutes: 0,
  },
  {
    title: "Wild Wild Country",
    days: 3,
    hours: 14,
    minutes: 0,
  },
  {
    title: "Money Heist",
    days: 2,
    hours: 12,
    minutes: 0,
  },
  {
    title: "Breaking Bad",
    days: 2,
    hours: 14,
    minutes: 0,
  },
];

function formatPercentage(value) {
  return value.toFixed(3);
}

function logOutSeriesText() {
  const avgLifespanInMinutes = 80 * 365 * 24 * 60;
  let totalPercentage = 0;

  seriesDurations.forEach((series) => {
    const seriesTimeInMinutes =
      series.days * 24 * 60 + series.hours * 60 + series.minutes;
    const percentage = (seriesTimeInMinutes / avgLifespanInMinutes) * 100;
    totalPercentage += percentage;
    console.log(
      `${series.title} took ${formatPercentage(percentage)}% of my life`
    );
  });

  console.log(
    `In total that is ${formatPercentage(totalPercentage)}% of my life`
  );
}

logOutSeriesText();
