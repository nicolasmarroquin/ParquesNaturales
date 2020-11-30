@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-13">
                <div class="card">
                    <div class="card-header">Estado de solicitud de reserva</div>

                    <div class="card-body">
                        <table class="table table-borderless">
                            <thead>
                                <tr>
                                    <th scope="col">Identificación</th>
                                    <th scope="col">Nombre</th>
                                    <th scope="col">Teléfono</th>
                                    <th scope="col">Id solicitud</th>
                                    <th scope="col">Fecha inicio</th>
                                    <th scope="col">Fecha fin</th>
                                    <th scope="col">Adelanto</th>
                                    <th scope="col">Estado</th>
                                    <th scope="col">Servicio</th>
                                    <th scope="col">Capacidad</th>
                                    <th scope="col">Opciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($solicitudes as $solicitud)
                                    <tr>
                                        <th scope="row">{{ $solicitud->SOLICITANTE_id_solicitante }}</th>
                                        <td>{{ $solicitud->nombre_solicitante }}</td>
                                        <td>{{ $solicitud->telefono_solicitante }}</td>
                                        <td>{{ $solicitud->id_solicitud }}</td>
                                        <td>{{ $solicitud->inicio_reserva }}</td>
                                        <td>{{ $solicitud->fin_reserva }}</td>
                                        <td>
                                            @if ($solicitud->adelanto_reserva == 1)
                                                <input type="checkbox" class="form-check-input" name="checkbox_pago"
                                                    id="{{ $solicitud->id_solicitud }}" checked="true">
                                            @else
                                                <input type="checkbox" class="form-check-input" name="checkbox_pago"
                                                    id="{{ $solicitud->id_solicitud }}">
                                            @endif

                                        </td>
                                        <td>{{ $solicitud->nombre_estado }}</td>
                                        <td>{{ $solicitud->nombre_servicio }}</td>
                                        <td>{{ $solicitud->capacidad }}</td>
                                        <td>
                                            <div class="btn-group btn-group-sm" role="group" aria-label="First group">
                                                <button type="button" class="btn btn-primary" name="button_aprobar"
                                                    id="{{ $solicitud->id_solicitud }}">Aprobar</button>
                                                <button type="button" class="btn btn-danger" name="button_rechazar"
                                                    id="{{ $solicitud->id_solicitud }}">Rechazar</button>
                                            </div>
                                        </td>
                                    </tr>
                                @endforeach

                            </tbody>
                        </table>

                    </div>
                </div>

            </div>
        </div>
    </div>


    <div id="confirmacion_pago" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title">Confirmación de pago</h2>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <span id="adelanto_pago_confirmacion"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" name="ok_button" id="ok_button" class="btn btn-danger">OK</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                </div>
            </div>
        </div>
    </div>

    <div id="confirmacion_aprobar" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="modal-title">Confirmar aprobación</h2>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="alert alert-success">
                    <spam id="adelanto_confirmar"></spam>
                </div>
                <div class="modal-footer">
                    <button type="button" name="ok_buttoncp" id="ok_buttoncp" class="btn btn-danger ">OK</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                </div>
            </div>
        </div>
    </div>



@endsection
@push('scripts')
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/js/bootstrap.min.js">
    </script>
    <script>
        $(document).ready(function() {

            let pago_adelanto;
            let id_solicitud;
            $("input[name='checkbox_pago']").change(function() {
                pago_adelanto = $(this).prop("checked");
                id_solicitud = $(this).prop("id");
                let html;
                if (pago_adelanto) {
                    html = '<div class="alert alert-danger">' +
                        '¿Desea marcar la solicitud con adelanto de pago?' + '</div>';

                } else {
                    html = '<div class="alert alert-danger">' +
                        '¿Desea desmarcar la solicitud con adelanto de pago?' + '</div>';
                }
                $('#adelanto_pago_confirmacion').html(html);
                $('#confirmacion_pago').modal('show');
            });


            $('#ok_button').click(function() {
                event.preventDefault();
                var action_url = "/PagoSolicitud/" + id_solicitud + "/" + pago_adelanto;
                $.ajax({
                    url: action_url,
                    data: $(this).serialize(),
                    success: function(data) {
                        var html = '';
                        html = '<div class="alert alert-danger">';
                        html += '<p>' + 'ok' + '</p>';
                        html += '</div>';
                        $('#adelanto_pago_confirmacion').html(html);
                        $("#confirmacion_pago").modal("show");
                        location.reload();
                    }
                });
            });

            $("button[name='button_aprobar']").click(function() {
                id_solicitud = $(this).prop("id");
                event.preventDefault();
                var checkbox_pago="input[name='checkbox_pago']";
                var action_url = "/AprobarSolicitud/" + id_solicitud;

                console.log($(checkbox_pago).prop("checked"));
                if($(checkbox_pago).prop("checked")==true){
                $.ajax({
                    url: action_url,
                    data: $(this).serialize(),
                    success: function(data) {
                        var html = '';
                        html = '<div class="alert alert-danger">';
                        html += '<p>' + 'Solicitud aprobada correctamente' + '</p>';
                        html += '</div>';
                        $('#adelanto_confirmar').html(html);
                        $("#confirmacion_aprobar").modal("show");
                    }
                });
                }
                else{
                        var html = '';
                        html = '<div class="alert alert-danger">';
                        html += '<p>' +'No puede aprobar una solicitud sin tener el adelanto pagado.' + '</p>';
                        html += '</div>';
                        $('#adelanto_confirmar').html(html);
                        $("#confirmacion_aprobar").modal("show");
                }

            });

           $("button[name='button_rechazar']").click(function() {
                id_solicitud = $(this).prop("id");
                event.preventDefault();
                var checkbox_pago="input[name='checkbox_pago']";
                var action_url = "/RechazarSolicitud/" + id_solicitud;

                console.log($(checkbox_pago).prop("checked"));
                $.ajax({
                    url: action_url,
                    data: $(this).serialize(),
                    success: function(data) {
                        var html = '';
                        html = '<div class="alert alert-danger">';
                        html += '<p>' + 'Solicitud rechazada correctamente.' + '</p>';
                        html += '</div>';
                        $('#adelanto_confirmar').html(html);
                        $("#confirmacion_aprobar").modal("show");
                    }
                });
            });
            $('#ok_buttoncp').click(function() {
                        location.reload();
            });

        });

    </script>
@endpush
