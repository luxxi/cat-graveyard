App.reservations = App.cable.subscriptions.create "ReservationsChannel",
  connected: ->
    $(document).on 'turbolinks:load', ->
      $('#date').datepicker()
    $(document).on 'changeDate', "#date", (ev) =>
      @perform 'reserve', date: ev.date

  received: (data) ->
    $('#slots').html(data['slots'])
