@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-auto">
            <div class="card">
                <div class="card-header d-flex">
                    Gestión de Parques naturales
                    <a href="/gestion-parques/nuevo-registro" class="btn btn-primary btn-sm ml-auto">Registrar Parque</a>
                </div>
                <div class="card-body">
                    <table class="table table-borderless">
                        <thead>
                        <tr>
                            <th scope="col">NIT</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Decreto No.</th>
                            <th scope="col">Ubicación</th>
                            <th scope="col">Extensión (m2)</th>
                            <th scope="col">Altitud</th>
                            <th scope="col">Temperatura</th>
{{--                            <th scope="col">Comunidades indigenas</th>--}}
{{--                            <th scope="col">Especies vegetales</th>--}}
{{--                            <th scope="col">Especies animales</th>--}}
                            <th scope="col">Estado</th>
                            <th scope="col">Abierto al público</th>
                            <th scope="col">Valor ingreso</th>
                            <th scope="col">Auditorio</th>
                            <th scope="col">Opciones</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($parque as $pnRow)
                        <tr>
                            <th scope="row">{{$pnRow -> id_parque }}</th>
                            <td>{{$pnRow -> nombre_parque }}</td>
                            <td>{{$pnRow -> DECRETO_num_decreto }}</td>
                            <td>{{$pnRow -> ubicacion_parque }}</td>
                            <td>{{$pnRow -> extension_parque }}</td>
                            <td>{{$pnRow -> altitud_parque }}</td>
                            <td>{{$pnRow -> temperatura_parque }} °C</td>
                            <td>
                                @if(($pnRow -> estado_parque)==1)
                                activo
                                @else
                                inactivo
                                @endif
                            </td>
                            <td>
                                @if(($pnRow -> abierto_publico)==1)
                                    <input type="checkbox" checked="true" disabled="true">
                                @else
                                    <input type="checkbox" checked="false" disabled="true">
                                @endif
                            </td>
                            <td>
                                Adultos: ${{App\ValorIngreso::where('id_valor_ingreso',[$pnRow->id_parque])->value('valor_adultos')}}
                                Niños: ${{App\ValorIngreso::where('id_valor_ingreso',[$pnRow->id_parque])->value('valor_niños')}}
                            </td>
                            <td>
                                @if(($pnRow -> servicio_auditorio)==1)
                                    <input type="checkbox" checked="true" disabled="true">
                                @else
                                    <input type="checkbox" checked="false" disabled="true">
                                @endif
                            </td>
                            <td>
                                <a href="/gestion-car/formulario_editar_car/{{$pnRow -> id_parque}}" class="btn btn-primary btn-sm">Editar</a>
{{--                                <a href="/gestion-car/formulario_editar_car/" class="btn btn-primary btn-sm">Editar</a>--}}
                                <a href="/gestion-parques/eliminar/{{$pnRow -> id_parque}}" class="btn btn-danger btn-sm" onclick="return confirm('El parque se va a eliminar permanentemente')">Eliminar</a>
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

<!-- Modal -->
<div class="modal fade" id="respuesta_solicitud" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="staticBackdropLabel">Realizado</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
            <span id="respuesta"></span>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
    </div>
  </div>

@endsection
@push('scripts')
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/js/bootstrap.min.js"></script>

@endpush
