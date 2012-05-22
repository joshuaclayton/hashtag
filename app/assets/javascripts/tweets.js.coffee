$ ->
  $('#search_form').submit (e)->
    e.preventDefault()
    searchTerm = $('#search_term').val()
    window.location.replace("/#{searchTerm}")
