drawImage = (canvas, obj) ->
  context = canvas.getContext('2d')
  imageX = 69
  imageY = 50
  imageWidth = obj.width
  imageHeight = obj.height

  context.drawImage(obj, imageX, imageY, (imageWidth / 2), (imageHeight / 2))

  imageData = context.getImageData imageX, imageY, (imageWidth / 2), (imageHeight / 2)
  data = imageData.data

  i = 0
  n = data.length
  while i < n
    red = data[i]
    green = data[i + 1]
    blue = data[i + 2]
    alpha = data[i + 3]

    i += 4

  context.putImageData(imageData, imageX, imageY)

writeMessage = (canvas, message) ->
  context = canvas.getContext('2d');
  context.clearRect(0, 0, 300, 50);
  context.font = '18pt Calibri';
  context.fillStyle = 'black';
  context.fillText(message, 10, 25);

getMousePos = (canvas, evt) ->
  rect = canvas.getBoundingClientRect();
  return {
    x: evt.clientX - rect.left,
    y: evt.clientY - rect.top
  }

canvas = document.getElementById('canvas-sample')

canvas.addEventListener 'mousemove', (evt)->
  mousePos = getMousePos(canvas, evt)
  message = 'Mouse position: ' + mousePos.x + ',' + mousePos.y
  writeMessage(canvas, message);
,false


imageObj = new Image()
imageObj.onload = ->
  drawImage(canvas, this)

imageObj.src = 'http://localhost:3000/images/doggy.jpg'

# Kinetic JS Test

stage = new Kinetic.Stage {
  container: 'kinetic-sample',
  width: 400,
  height: 400
                          }

layer = new Kinetic.Layer

rect = new Kinetic.Rect {
  x: 100,
  y: 75,
  width: 100,
  height: 50,
  fill: 'green',
  stroke: 'black',
  strokeWidth: 4,
  draggable: true
                        }

rect.on 'mouseenter', ->
  this.setFill 'yellow';
  layer.draw()

rect.on 'mouseleave', ->
  this.setFill 'black';
  layer.draw()

rect.on 'mouseover', ->
  this.setFill 'blue'
  layer.draw()
  document.body.style.cursor = 'pointer';

rect.on 'mouseout', ->
  this.setFill 'green'
  layer.draw()
  document.body.style.cursor = 'default'

textpath = new Kinetic.TextPath {
  x: 10,
  y: 100,
  fill: '#333',
  fontSize: '24',
  fontFamily: 'Arial',
  text: "These lyrics heard a thousand times, just plush.",
  data: 'M10,10 C0,0 10,150 100,100 S300,150 400,50'
                                }

layer.add(rect)
layer.add(textpath)

stage.add(layer)

