window.MathHelper =

  pointIsInTriangle: (p, p1, p2, p3) ->
    alpha = ((p2.y - p3.y)*(p.x - p3.x) + (p3.x - p2.x)*(p.y - p3.y)) /
      ((p2.y - p3.y)*(p1.x - p3.x) + (p3.x - p2.x)*(p1.y - p3.y))
    beta = ((p3.y - p1.y)*(p.x - p3.x) + (p1.x - p3.x)*(p.y - p3.y)) /
      ((p2.y - p3.y)*(p1.x - p3.x) + (p3.x - p2.x)*(p1.y - p3.y))
    gamma = 1.0 - alpha - beta
    alpha > 0 and beta > 0 and gamma > 0

  pointIsInRectangle: (p, rectangleStartPoint, rectangleWidth, rectangleHeight) ->
    rectangleStartPoint.x < p.x and p.x < rectangleStartPoint.x + rectangleWidth and
      rectangleStartPoint.y < p.y and p.y < rectangleStartPoint.y + rectangleHeight


