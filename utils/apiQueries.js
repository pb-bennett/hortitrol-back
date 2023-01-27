const pick = require('lodash.pick');

class APIQueries {
  constructor(model, query) {
    this.model = model;
    this.query = query;
  }

  filter() {
    console.log(Object.keys(this.model.rawAttributes));
    console.log(this.query);
    const allowed = pick(this.query, Object.keys(this.model.rawAttributes));
    console.log('this is allowed:', allowed);
    return allowed;
  }
}

module.exports = APIQueries;
