App.reservations = App.cable.subscriptions.create "ReservationsChannel",
  connected: ->
    $(document).on 'changeDate', "#date", (ev) =>
      @perform 'reserve', date: ev.date

  received: (data) ->
    $('#slots').append(data['slots'])
