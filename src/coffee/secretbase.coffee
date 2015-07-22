((W, L) ->
  ###
  Notes = new Store('notes')
  Notes.set 'title', 'some title'
  Notes.inc 'views', 1
  ...
  ###
  __Types =
    'String': ''
    'Object': {}
    'Array': []

  Store = (collection, type) ->
    Store.prototype.init collection, type

  Store.prototype =
    constructor: Store
    init: (collection, type) ->
      self = @
      # Type could be String or Array or Object
      self.type = type or 'String'
      self.collection = collection
      # set content if null
      stored = JSON.parse L.getItem self.collection
      if not stored
        L.setItem self.collection, JSON.stringify(__Types[self.type])
      self
    get: (key) ->
      self = @
      switch self.type
        when 'String'
          L.getItem self.collection
          self
        when 'Array'
          stored = JSON.parse L.getItem self.collection
          result = if key then stored[key] else stored
          console.log result
      self
    set: (key, value) ->
      self = @
      switch self.type
        # for String, you can only do .set('some random string'), use key as value
        when 'String' then L.setItem self.collection, key
        when 'Array'
        # for Array, use key as index of item in the Array
        # two special ones are 'first', 'last'
          stored = JSON.parse L.getItem self.collection
          stored[key] = value
          L.setItem self.collection, JSON.stringify stored
      self

  W.Store = Store

) window, localStorage
