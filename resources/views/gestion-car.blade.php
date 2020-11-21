@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-9">
            <div class="card">
                <div class="card-header d-flex">
                    Gestión de Corporaciones Autonomas Regionales
                    <a href="/gestion-car/nuevo-registro" class="btn btn-primary btn-sm ml-auto">Registrar CAR</a>
                </div>
                <div class="card-body">
                    <table class="table table-borderless">
                        <thead>
                        <tr>
                            <th scope="col">NIT</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Ubicación</th>
                            <th scope="col">Estado</th>
                            <th scope="col">Decreto No.</th>
                            <th scope="col">Opciones</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th scope="row">113345678</th>
                            <td>Corpoamazonia</td>
                            <td>Leticia,Amazonas</td>
                            <td>Activo</td>
                            <td>12334</td>
                            <td>
                                <div class="btn-group btn-group-sm" role="group" aria-label="First group">
                                    <button type="button" class="btn btn-primary">Editar</button>
                                    <button type="button" class="btn btn-danger" >Eliminar</button>
                                </div>
                            </td>
                        </tr>

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
          <h5 class="modal-title" id="staticBackdropLabel">Solicitud</h5>
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
