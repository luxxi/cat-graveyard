App.reservations = App.cable.subscriptions.create "ReservationsChannel",
  connected: ->
    $('#date').datepicker().on 'changeDate', (ev) =>
      @perform 'reserve', date: ev.date

  received: (data) ->
    $('#slots').append(data['slots'])
