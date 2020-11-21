@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-9">
            <div class="card">
                <div class="card-header">Registrar nueva CAR</div>
                <div class="card-body">
                    <form>
                        <div class="form-group">
                            <label for="nit">NIT</label>
                            <input type="number" class="form-control" id="nit">
                            <label for="nombre">Nombre</label>
                            <input type="text" class="form-control" id="nombre">
                            <label for="ubicacion">Ubicación</label>
                            <input type="text" class="form-control" id="ubicacion">
                            <label for="decreto">Decreto No.</label>
                            <input type="text" class="form-control" id="decreto">
                            <label for="fechaDecreto">Fecha decreto</label>
                            <input type="date" class="form-control" id="fechaDecreto">
                        </div>
                        <button type="submit" class="btn btn-success">Registrar</button>
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
