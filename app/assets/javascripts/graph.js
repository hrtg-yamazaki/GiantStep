$(document).on('turbolinks:load', function(){

  $(function(){

    var canvas = $("#cumulative-radar")[0];
    var context = canvas.getContext("2d");
    
    var sleep = $('#status_sleep').val();
    var study = $('#status_study').val();
    var exercise = $('#status_exercise').val();
    var diet = $('#status_diet').val();
    var habit = $('#status_habit').val();
    var aim = $('#status_aim').val();
    var login = $('#status_login').val();
    var statusArray = [sleep, study, exercise, diet, habit, aim, login]

    var cumRadarChart = new Chart(context, {
      type: 'radar',
      data: {
        labels: ['睡眠', '運動', '勉強', '食事', '悪癖', '目標', '継続'],
        datasets: [{
          label: '累計実績',
          data: statusArray,
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
          borderWidth: 2
        }]
      },
      options: {
        responsive: true,
        maintainAspectRatio: false,
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