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
                      @foreach($solicitudes as $solicitud)
                        <tr>
                            <th scope="row">{{$solicitud -> SOLICITANTE_id_solicitante }}</th>
                            <td>{{$solicitud -> nombre_solicitante }}</td>
                            <td>{{$solicitud -> telefono_solicitante }}</td>
                            <td>{{$solicitud -> id_solicitud }}</td>
                            <td>{{$solicitud -> inicio_reserva }}</td>
                            <td>{{$solicitud -> fin_reserva }}</td>
                            <td>
                                @if(($solicitud -> adelanto_reserva)==1)
                            <input type="checkbox" class="form-check-input" name="checkbox_pago" id="{{$solicitud -> id_solicitud }}" checked="true">
                                @else
                                <input type="checkbox" class="form-check-input" name="checkbox_pago" id="{{$solicitud -> id_solicitud }}">
                                @endif
                              
                            </td>
                            <td>{{$solicitud -> nombre_estado }}</td>
                            <td>{{$solicitud -> nombre_servicio }}</td>
                            <td>{{$solicitud -> capacidad }}</td>
                            <td>
                                <div class="btn-group btn-group-sm" role="group" aria-label="First group">
                                    <button type="button" class="btn btn-primary">Aprobar</button>
                                    <button type="button" class="btn btn-danger" >Rechazar</button>
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
        pago_adelanto=$( this ).prop( "checked" );
        id_solicitud=$( this ).prop( "id" );
        let html;
        if(pago_adelanto){
            html = '<div class="alert alert-danger">' + '¿Desea marcar la solicitud con adelanto de pago?' + '</div>';
            
        }else{
            html = '<div class="alert alert-danger">' + '¿Desea desmarcar la solicitud con adelanto de pago?' + '</div>';
        }
        $('#adelanto_pago_confirmacion').html(html);
        $('#confirmacion_pago').modal('show');  
    });
    
});

</script>
@endpush
