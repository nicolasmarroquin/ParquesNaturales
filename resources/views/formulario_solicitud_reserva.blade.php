@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-9">
            <div class="card">
                <div class="card-header">Solicitud de reserva</div>

                <div class="card-body">
                    <form method="post" id="solicitud_reserva">
                        @csrf
                        <div class="form-group">
                          <input type="text" class="form-control" id="nombres" name="nombres" placeholder="Nombres y Apellidos">
                        </div>
                        <div class="form-group">
                            <input type="number" class="form-control" id="identificacion" name="identificacion" placeholder="Identificación">
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control" id="email" name="email" placeholder="correo@correo.com">
                        </div>
                        <div class="form-group">
                            <label for="fecha_nacimiento">Fecha de Nacimiento</label>
                            <input type="date" class="form-control" id="fecha_nacimiento" name="fecha_nacimiento" >
                        </div>
                        <div class="form-group">
                          <label for="genero">Género</label>
                          <select class="form-control" id="genero" name="genero">
                            <option value="Masculino">Masculino</option>
                            <option value="Femenino">Femenino</option>
                            <option value="Otro">Otro</option>
                          </select>
                        </div>
                        <div class="form-group">
                            <input type="number" class="form-control" id="telefono" name="telefono" placeholder="Teléfono de contacto">
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlSelect1">Servicios Disponibles</label>
                            <select class="form-control" id="servicio" name="servicio">
                                @foreach ($servicios as $servicio )
    
    
                                <option value="{{$servicio -> id_servicio }}">{{$servicio -> nombre_servicio }}</option>
                            
                            
                                @endforeach
                            </select>
                          </div>
                          <div class="form-group">
                            <input type="number" class="form-control" id="cantidad_acompanantes" name="cantidad_acompanantes" placeholder="Cantidad de acompañantes">
                        </div>
                        <div class="form-group">
                            <label for="inicio_reserva">Inicio de la reserva</label>
                            <input type="datetime-local" class="form-control" id="inicio_reserva" name="inicio_reserva" >
                        </div>
                        <div class="form-group">
                            <label for="fin_reserva">Fin de la reserva</label>
                            <input type="datetime-local" class="form-control" id="fin _reserva" name="fin_reserva">
                        </div>
                        <button type="submit" class="btn btn-primary">Solicitar</button>
                      </form>
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
    <script>
        $(document).ready(function(){


$('#solicitud_reserva').on('submit',function(event){

event.preventDefault();
var action_url = "/solicitar";



$.ajax({
url: action_url,
method:"POST",
data:$(this).serialize(),
dataType:"json",
success:function(data)
{
var html = '';
if(data.errors)
{
 html = '<div class="alert alert-danger">';
 for(var count = 0; count < data.errors.length; count++)
 {
  html += '<p>' + data.errors[count] + '</p>';
 }
 html += '</div>';
}
if(data.success)
{
 html = '<div class="alert alert-success">' + data.success + '</div>';
 $('#solicitud_reserva')[0].reset();
 
}
$('#respuesta').html(html);
$("#respuesta_solicitud").modal("show");

}
});
});







});

    </script>
@endpush
