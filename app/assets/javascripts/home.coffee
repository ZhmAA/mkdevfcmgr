timer_block = (block, speed) ->
  milliSec = 30000
  timer_block = setInterval((->
    milliSec -= 1000
    $('#' + block).html milliSec / 1000
    if milliSec == 0
      clearInterval timer_block
  ), speed)

$(document).ready ->
  timer_block 'timer_block', '1000'
  $(".btn").click ->
    time = $('#timer_block').html()
