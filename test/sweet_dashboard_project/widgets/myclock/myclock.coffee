class Dashing.Myclock extends Dashing.Widget
  #CONSTANTS
  size = 286
  pi = Math.PI
  radius = size/2
  hourL = 0.5*radius
  minuteL = 0.75*radius
  secondL = 0.9*radius
  
  ready: ->
    setInterval(@drawTime,1000)

  drawTime: =>
    #CLEAN
    $(@node).children("canvas").remove()

    #CURRENT TIME
    today = new Date()
    h = today.getHours()
    m = today.getMinutes()
    s = today.getSeconds()

    #CREATE CANVAS
    canvas = document.createElement('canvas')
    canvas.setAttribute('height',size)
    canvas.setAttribute('width',size)
    $(@node).append(canvas)
    content = canvas.getContext '2d'
    content.translate(radius,radius)

    #DRAW BACKGROUND
    content.beginPath()
    content.arc(0, 0, radius, 0, 2*pi, false)
    content.closePath()
    content.fillStyle = '#cccccc'
    content.fill()
    
    #draw numbers
    content.font = '12px Arial'
    content.fillStyle = '#000'
    content.textAlign = 'center'
    content.textBaseline = 'middle'
    n = 1
    while n <= 12
      theta = (n - 3) * pi * 2 / 12
      x = radius * 0.9 * Math.cos(theta)
      y = radius * 0.9 * Math.sin(theta)
      content.fillText n, x, y
      n++

    #draw second
    content.lineWidth='4'
    content.strokeStyle='rgb(255,0,0)'
    content.lineCap='round'
    content.beginPath()
    content.moveTo(0,0)
    alpha = (s-15)*pi*2/60
    content.lineTo(secondL*Math.cos(alpha),secondL*Math.sin(alpha))
    content.stroke()

    #draw minute
    content.strokeStyle='rgb(0,0,0)'
    content.lineWidth='6'
    content.lineCap='round'
    content.beginPath()
    content.moveTo(0,0)
    beta = (m-15)*pi*2/60
    content.lineTo(minuteL*Math.cos(beta),minuteL*Math.sin(beta))
    content.stroke()

    #draw hour
    content.lineWidth='8'
    content.lineCap='round'
    content.beginPath()
    content.moveTo(0,0)
    #Jumping Hours:
    #gamma = (h-3)*pi*2/12
    #Smooth Hours:
    #gamma = ((h-3)+(m/60))*pi*2/12
    gamma = ((h-3)+(m/60))*pi*2/12
    content.lineTo(hourL*Math.cos(gamma),hourL*Math.sin(gamma))
    content.stroke()