var baseURL = 'https://chamonix-hackathon-2015.herokuapp.com';

Meteor.methods({
  //Get the list of all bars
  'bars': function () {
    // avoid blocking other method calls from the same client
    this.unblock();
    // asynchronous call to the dedicated API calling function
    return Meteor.wrapAsync(apiCall)(baseURL + '/bars');
  },
  //Get info on one bar
  'bar': function (id) {
    this.unblock();
    return Meteor.wrapAsync(apiCall)(baseURL + '/bars/' + id);
  }
});

var apiCall = function (apiUrl, callback) {
  // try…catch allows you to handle errors
  try {
    var response = HTTP.get(apiUrl).data;
    // A successful API call returns no error
    // but the contents from the JSON response
    callback(null, response);
  } catch (error) {
    // If the API responded with an error message and a payload
    var errorCode, errorMessage;
    if (error.response) {
      errorCode = error.response.data.code;
      errorMessage = error.response.data.message;
      // Otherwise use a generic error message
    } else {
      errorCode = 500;
      errorMessage = 'Cannot access the API';
    }
    // Create an Error object and return it via callback

    console.log('Creating an API error', errorCode, errorMessage, error);
    var myError = new Meteor.Error(errorCode, errorMessage);
    console.log('Creating an API error...');
    callback(myError, null);
  }
};

if (Meteor.isClient) {
  Template.bars.helpers({
    people: function() {
      return [{name: "Bob"}, {name: "Frank"}, {name: "Alice"}];
    }
    //all: Meteor.call('bars', function (err, res) {
    //  if (err) {
    //    return 'Error finding bars';
    //  }
    //  return {"hello":"world"};//res[0];
    //})
  });
}
