class APIQueries {
  constructir(model, query) {
    this.model = model;
    this.query = query;
  }

  filter() {
    const queryObj = { ...this.query };
    console.log(queryObj);
  }
}

module.exports = APIQueries;
