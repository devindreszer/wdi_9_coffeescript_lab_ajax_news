class @Comment
  constructor: ->
    $('#new_comment').on 'submit', (event) =>
      event.preventDefault()
      @submitComment()

  submitComment: ->
    $form = $(event.currentTarget)
    $body = $form.find("#comment_body")
    body_value = $body.val()

    if body_value == ""
      $(document).find('.alert').text("Body can't be blank")

    $body.val("")

    event.preventDefault()

    $.ajax(
      url: $(this).attr('action')
      type: 'POST'
      dataType: 'json'
      data: comment: body: body_value
    )
    .done (data) => @addComment(data);

  addComment: (comment) ->
    $(document).find('.notice').text('Comment added!')
    $(document).find('body').append(HandlebarsTemplates.comment_post(comment))
