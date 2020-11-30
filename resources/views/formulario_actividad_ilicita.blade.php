@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-9">
                <div class="card">
                    <div class="card-header">Registro Actividad Ilícita</div>

                    <div class="card-body">
                        <form method="post" id="actividad_ilicita">
                            @csrf
                            <div class="form-group">
                                <input type="text" class="form-control" id="asunto" name="asunto"
                                    placeholder="Asunto">
                            </div>
                            <div class="form-group">
                                <textarea class="form-control" id="descripcion" name="descripcion"
                                    placeholder="Descripción" rows="3"></textarea>
                            </div>
                            
                            <button type="submit" class="btn btn-primary">Registrar</button>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="respuesta_actividad" data-backdrop="static" data-keyboard="false" tabindex="-1"
        aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Registro</h5>
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
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/js/bootstrap.min.js">
    </script>
    <script>
        $(document).ready(function() {


            $('#actividad_ilicita').on('submit', function(event) {

                event.preventDefault();
                var action_url = "/actividad-ilicita/registrar";



                $.ajax({
                    url: action_url,
                    method: "POST",
                    data: $(this).serialize(),
                    dataType: "json",
                    success: function(data) {
                        var html = '';
                        if (data.errors) {
                            html = '<div class="alert alert-danger">';
                            for (var count = 0; count < data.errors.length; count++) {
                                html += '<p>' + data.errors[count] + '</p>';
                            }
                            html += '</div>';
                        }
                        if (data.success) {
                            html = '<div class="alert alert-success">' + data.success +
                            '</div>';
                            $('#actividad_ilicita')[0].reset();

                        }
                        $('#respuesta').html(html);
                        $("#respuesta_actividad").modal("show");

                    }
                });
            });
        });

    </script>
@endpush
