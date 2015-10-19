var baseURL = 'https://chamonix-hackathon-2015.herokuapp.com';
var Bars = new Mongo.Collection('bars');
var BarInfo = new Mongo.Collection('barinfo');
var Offers = new Mongo.Collection('offers');

Meteor.startup(function () {
  if (Bars.find().count() === 0) {
    HTTP.get(baseURL + '/bars', function (err, res) {
      if (err) return console.log(err);
      for (var i = 0; i < res.data.length; i++) {
        console.log(res.data[i]);
        Bars.insert(res.data[i]);
        HTTP.get(baseURL + '/bars/' + res.data[i].id, function (err, res) {
          if (err) return console.log(err);
          for (var j = 0; j < res.data.length; j++) {
            console.log(res.data[j]);
            BarInfo.insert(res.data[j]);
          }
        });
      }
    });
    HTTP.get(baseURL + '/offers', function (err, res) {
      if (err) {
        console.log(err);
      } else {
        for (var i = 0; i < res.data.length; i++) {
          console.log(res.data[i]);
          Offers.insert(res.data[i]);
        }
      }
    });
  }
});
