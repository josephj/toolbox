$view = $('#sql')
return unless $view.length

$textarea = $view.find('textarea')

$view.on 'submit', (e) ->
  e.preventDefault()
  sql = $textarea.val()

  regExp = /(`[^`]+`)/g
  columns = sql.match(regExp)
  table = columns.shift()
  columns.shift()
  regExp = /('[^']+')/g
  values = sql.match(regExp)
  values.push(1)

  sql = "UPDATE #{table} SET\n"
  fields = []
  for column, i in columns
    fields.push("  #{column} = #{values[i]}")

  sql += fields.join(',\n') + "\nWHERE `id` = 2"
  $view.find('.result').codeeditor('val', sql)

  return

