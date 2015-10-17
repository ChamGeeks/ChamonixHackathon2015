var baseURL = 'https://chamonix-hackathon-2015.herokuapp.com';

if (Meteor.isClient) {
  Template.bars.helpers({
    getall: HTTP.get(baseURL + '/bars', function (err, res) {
      if (err) {
        Session.set('barlist', {error: err});
      } else {
        Session.set('barlist', res.data);
      }
    }),
    bars : function () {
      return Session.get('barlist') || [{ name: 'Loading' }];
    }
  });
}
