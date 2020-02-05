$(document).on('turbolinks:load', function(){

  $(function(){

    var canvas = $("#cumulative-radar")[0];
    var context = canvas.getContext("2d");

    var cumRadarChart = new Chart(context, {
      type: 'radar',
      data: {
        labels: ['睡眠', '運動', '勉強', '食事', '悪癖', '目標', '継続'],
        datasets: [{
          label: '累計実績',
          data: [12, 10, 9, 28, 10, 4, 8],
          // backgroundColor: [
          //   'white',
          //   'whitesmoke',
          //   'white',
          //   'whitesmoke',
          //   'white',
          //   'whitesmoke',
          //   'silver'
          // ],
          borderColor: [
            'red',
            'blue',
            'yellow',
            'purple',
            'green',
            'orange',
            'steelblue'
          ],
          borderWidth: 1
        }]
      },
      options: {
        responsive: true,
        scale: {
          ticks: {
            display: true,
            fontSize: 12,
            min: 0,
            beginAtZero: true
          }
        }
          // ticks: {
          //   min: 0
          // }
          // // yAxes: [{
          // //   ticks: {
          // //     min:0
          // //   }
          // // }]
          // // xAxes: [{
          // //   ticks: {
          // //     min: 0
          // //   }
          // // }]
        // },
        
        
      }
    });
  })

})