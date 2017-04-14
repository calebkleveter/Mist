var ctx = document.getElementById("analytics-chart");

var data = {
labels: [
         "Viewers",
         "Readers",
         "Subscribers"
         ],
datasets: [
           {
           data: [300, 79, 21],
           backgroundColor: [
                             "#FF6384",
                             "#36A2EB",
                             "#FFCE56"
                             ],
           hoverBackgroundColor: [
                                  "#FF6384",
                                  "#36A2EB",
                                  "#FFCE56"
                                  ]
           }]
};

var myDoughnutChart = new Chart(ctx, {
                                type: 'doughnut',
                                data: data,
                                options: {responsive: false}
                                });

console.log(ctx);
console.log(myDoughnutChart);
