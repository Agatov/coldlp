$ ->

  $("form").on "submit", ->

    email = $("input[name=email]").val()
    code = $("input[name=code").val()


    shake_fields = []
    r = /^\w+@\w+\.\w{2,4}$/i


    unless r.test(email)
      shake_fields.push $("input[name=email]")

    if code.length != 4
      shake_fields.push $("input[name=code")

    if shake_fields.length > 0
      validate_field(field) for field in shake_fields
      return false

    $.post("/orders",
      {
        email: email
        code: code
      },
      (data) =>
        if data.status == "success"
          $(".index").hide()
          $(".success").show()

        if data.status == "error"
          $(".index").hide()
          $(".error").show()

    )

    false


  $("input").on "change", ->
    $(@).removeClass "validation-error" if $(@).hasClass("validation-error")


  $(".back-button").on "click", ->
    $(".error").hide()
    $(".success").hide()
    $(".index").show()


window.validate_field = (field) ->
  $(field).addClass "validation-error"