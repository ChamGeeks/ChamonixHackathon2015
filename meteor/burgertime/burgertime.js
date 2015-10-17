var baseURL = 'https://chamonix-hackathon-2015.herokuapp.com';

if (Meteor.isClient) {
  Template.bars.helpers({
    all: HTTP.get(baseURL + '/bars', function (err, res) {
      if (err) {
        console.log(err);
        return 'Error finding bars';
      }
      console.log(res.data);
      return res.data;
    })
  });
}
