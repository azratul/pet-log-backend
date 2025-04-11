function boomErrorHandler(err, req, res, next) {
  if (err.isBoom) {
    const { output } = err;
    res.status(output.statusCode).json(output.payload);
  } else {
    next(err);
  }
}

function errorHandler(err, req, res, next) {
  if (res.headersSent) {
    return next(err); // Dejá que Express maneje el error si ya respondió
  }

  res.status(500).json({
    // message: err.message,
    message: 'Internal server error'
  });
}

module.exports = { errorHandler, boomErrorHandler }
