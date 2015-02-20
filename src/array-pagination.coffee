isPositiveNumber = (num) ->
  return parseInt(num) if !isNaN(parseFloat(num)) && isFinite(num) && (num>0)
  return false

class Pagination
  contructor: ->
    @perPage = 10
    @page = 1
    @items = []
    @count = 0
    @pages = 0

  @paginate: (data = {}) ->
    @perPage = isPositiveNumber(data.perPage) or 10
    @page = isPositiveNumber(data.page) or 1
    @items = data.items or []
    @count = data.items.length
    @pages = Math.ceil(@count/@perPage)

    paging:
      page: @page
      perPage: @perPage
      count: @count
      pages: @pages
    items: data.items.slice((@page-1)*@perPage, @page*@perPage)

module.exports = Pagination