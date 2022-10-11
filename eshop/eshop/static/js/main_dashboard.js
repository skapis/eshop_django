// chart for sales by category
const renderChart = (data, labels) =>{
    const ctx = document.getElementById('SalesByCategory').getContext('2d');
const myChart = new Chart(ctx, {
    type: 'doughnut',
    data: {
        labels: labels,
        datasets: [{
            label: 'Sales',
            data: data,
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        responsive: true,
        title: {
          display: false,
          text: "Sales by category or product",
        },
        legend: {
            position: "bottom",
            align: 'center',
            labels:{
                fontSize: 12,
                boxWidth: 10
            }
        }
      },
    });
  };

const getLineChartData = () => {
    console.log("fetching");
    fetch("sales?by=category")
      .then((res) => res.json())
      .then((results) => {
        console.log("results", results.data);
        const [labels, data] = [
            Object.keys(results.data),
            Object.values(results.data)
        ];

        renderChart(data, labels);
    });
};

document.onload = getLineChartData();


const performance = (data, labels) =>{
    const ctx = document.getElementById('salesByDate').getContext('2d');
const myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: labels,
        datasets: [{
            label: 'Sales',
            data: data,
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        responsive: true,
        maintainAspectRatio: false,
        title: {
          display: false,
          text: "Sales by Date",
        },
        legend: {
            display: false,
            position: "right",
        }
      },
    });
  };

  const getPerformanceChartData = () => {
    console.log("fetching");
    fetch("sales")
      .then((res) => res.json())
      .then((results) => {
        console.log("results", results);
        const [labels, data] = [
            Object.keys(results.by_date),
            Object.values(results.by_date)
        ];
        document.getElementById('totalSales').innerText = results.total
        performance(data, labels);
    });
};

document.onload = getPerformanceChartData()


const productChart = (data, labels) =>{
    const ctx = document.getElementById('SalesByProduct').getContext('2d');
const myChart = new Chart(ctx, {
    type: 'doughnut',
    data: {
        labels: labels,
        datasets: [{
            label: 'Sales',
            data: data,
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        responsive: true,
        title: {
          display: false,
          text: "Sales by product",
        },
        legend: {
            position: "bottom",
            align: 'center',
            labels:{
                fontSize: 12,
                boxWidth: 10
            }
        }
      },
    });
  };

const getChartData = () => {
    console.log("fetching");
    fetch("sales?by=product")
      .then((res) => res.json())
      .then((results) => {
        console.log("results", results.data);
        const [labels, data] = [
            Object.keys(results.data),
            Object.values(results.data)
        ];

        productChart(data, labels);
    });
};

document.onload = getChartData();

