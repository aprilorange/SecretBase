# SecretBase

var notes = new SB('notes', 'Array') // localStorage


**WIP. Sample CoffeeScript code**

```coffeescript
notes = new SB 'notes', 'Array'

# returns the SB instance
notes.get()
# returns []
notes.set(0, 'first item')
# the collection `notes` is set to be ['first item']

# the query result is locked to be just One item
notes
  .find 'id', 'hjasiJJ'
  .set 'content', 'I love SOX'
  .inc 'views', 1
```
