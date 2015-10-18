var Bars = new Mongo.Collection('bars');
var BarInfo = new Mongo.Collection('barinfo');
var Offers = new Mongo.Collection('offers');

Template.bars.helpers({
  bars: function () {
    return Bars.find({}, {sort: {name: 1}});
  }
});

Template.bars.events({
  'click li': function (evt, tpl) {
    Session.set('current_barid', this._id);
  }
});

Template.bar.helpers({
  bar: function() {
    var b = Session.get('current_barid');
    var barinfo;
    if (b) {
      barinfo = BarInfo.findOne({id:Bars.findOne(b).id});
    }
    return barinfo;
  }
});
