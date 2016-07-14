#= require active_admin/base

$ ->
  $('.btn-toggle').click (event) ->
    $(this).next().toggle();