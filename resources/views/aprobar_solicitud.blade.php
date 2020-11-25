@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
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
                                <input type="checkbox" class="form-check-input" id="exampleCheck1" checked="true">
                                @else
                                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                @endif
                              
                            </td>
                            <td>{{$solicitud -> nombre_estado }}</td>
                            <td>{{$solicitud -> nombre_servicio }}</td>
                            <td>{{$solicitud -> capacidad }}</td>
                            <td>
                                <div class="btn-group btn-group-sm" role="group" aria-label="First group">
                                    <button type="button" class="btn btn-primary">Editar</button>
                                    <button type="button" class="btn btn-danger" >Eliminar</button>
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



@endsection
@push('scripts')
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/js/bootstrap.min.js"></script>
@endpush
