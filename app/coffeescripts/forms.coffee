# Methods for forms

# Input fields with the class 'required' will complain if you try to post an empty value
document.on 'ajax:before', 'form', (e, form) ->
  form.select('.required').each (input) ->
    if input.value.strip().empty()
      e.stop()
      input.previous('label').toggleClassName('error')
      input.insert after: "<span class='error'>(#{ input.getAttribute('error_message') })</span>"
      input.highlight duration: 1, color: 'red'
