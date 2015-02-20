(function() {
  var Pagination, isPositiveNumber;

  isPositiveNumber = function(num) {
    if (!isNaN(parseFloat(num)) && isFinite(num) && (num > 0)) {
      return parseInt(num);
    }
    return false;
  };

  Pagination = (function() {
    function Pagination() {}

    Pagination.prototype.contructor = function() {
      this.perPage = 10;
      this.page = 1;
      this.items = [];
      this.count = 0;
      return this.pages = 0;
    };

    Pagination.paginate = function(data) {
      if (data == null) {
        data = {};
      }
      this.perPage = isPositiveNumber(data.perPage) || 10;
      this.page = isPositiveNumber(data.page) || 1;
      this.items = data.items || [];
      this.count = data.items.length;
      this.pages = Math.ceil(this.count / this.perPage);
      return {
        paging: {
          page: this.page,
          perPage: this.perPage,
          count: this.count,
          pages: this.pages
        },
        items: data.items.slice((this.page - 1) * this.perPage, this.page * this.perPage)
      };
    };

    return Pagination;

  })();

  module.exports = Pagination;

}).call(this);
