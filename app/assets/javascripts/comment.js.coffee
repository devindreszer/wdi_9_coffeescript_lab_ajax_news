class Comment
  constructor: ->
    $('#new-comment').on  'submit', (event) =>
      this.submitComment

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
    .done => this.addComment;

  addComment: ->
    $(document).find('.notice').text('Comment added!');
    $(document).find('body').append(HandlebarsTemplates.comment_post(comment));





# var Comment = {
#   initialize: function(){
#     $('#new_comment').submit($.proxy(this.submitComment, this));
#   },

#   submitComment: function(event) {
#     var $form = $(event.currentTarget),
#       $body = $form.find("#comment_body"),
#       newComment;

#     body_value = $body.val();

#     if(body_value === "") {
#       $(document).find('.alert').text("Body can't be blank");
#     }

#     $body.val("");

#     event.preventDefault();

#     $.ajax({
#       url: $(this).attr('action'),
#       type: 'POST',
#       dataType: 'json',
#       data: { comment: { body: body_value } },
#     })
#     .done($.proxy(this.addComment, this));
#   },

#   addComment: function(comment) {
#     $(document).find('.notice').text('Comment added!');
#     $(document).find('body').append(HandlebarsTemplates.comment_post(comment));
#   }
# };
