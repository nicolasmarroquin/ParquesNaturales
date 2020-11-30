@extends('layouts.app')

@section('content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-9">
                <div class="card">
                    <div class="card-header">Registrar nuevo parque natural</div>
                    <div class="card-body">
                        <form method="post" id="formularioRegistroParque">
                            @csrf
                            <div class="form-group">
                                <label for="car">CAR</label>
                                <select class="custom-select" id="car" name="car">
                                    @foreach($car as $carRow)
                                    <option value="{{$carRow -> nit_CAR }}">{{$carRow -> nombre_CAR }}</option>
                                    @endforeach
                                </select>
                                <label for="nit">NIT</label>
                                <input type="number" class="form-control" id="nit" name="nit">
                                <label for="nombre">Nombre</label>
                                <input type="text" class="form-control" id="nombre" name="nombre">
                                <label for="decreto">Decreto No.</label>
                                <input type="number" class="form-control" id="decreto" name="decreto">
                                <label for="fechaDecreto">Fecha decreto</label>
                                <input type="date" class="form-control" id="fechaDecreto" name="fechaDecreto">
                                <label for="ubicacion">Ubicación</label>
                                <input type="text" class="form-control" id="ubicacion" name="ubicacion">
                                <label for="extension">Extensión (m2)</label>
                                <input type="number" class="form-control" id="extension" name="extension">
                                <label for="altitud">Altitud</label>
                                <input type="number" class="form-control" id="altitud" name="altitud">
                                <label for="temperatura">Temperatura (°C)</label>
                                <input type="number" class="form-control" id="temperatura" name="temperatura">
                                <label for="comindigenas">Comunidades indigenas</label>
                                <select class="custom-select" id="comindigenas" name="comindigenas">
                                    <option value="1">Si</option>
                                    <option value="0">No</option>
                                </select>
                                <label for="espvegetales">Especies vegetales</label>
                                <input type="number" class="form-control" id="espvegetales" name="espvegetales">
                                <label for="espanimales">Especies animales</label>
                                <input type="number" class="form-control" id="espanimales" name="espanimales">
                                <label for="abierto">Abierto al público</label>
                                <select class="custom-select" id="abierto" name="abierto">
                                    <option value="1">Si</option>
                                    <option value="0">No</option>
                                </select>
                                <label for="vingresoad">Valor ingreso adultos</label>
                                <input type="number" class="form-control" id="vingresoad" name="vingresoad">
                                <label for="vingresoni">Valor ingreso niños</label>
                                <input type="number" class="form-control" id="vingresoni" name="vingresoni">
                                <label for="srvcauditorio">Servicio de auditorio</label>
                                <select class="custom-select" id="srvcauditorio" name="srvcauditorio">
                                    <option value="1">Si</option>
                                    <option value="0">No</option>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-success">Registrar</button>
                        </form>
                    </div>

                </div>

            </div>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="confirmacionDeRegistro" data-backdrop="static" data-keyboard="false" tabindex="-1"
        aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel">Confirmación de registro</h5>
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


            $('#formularioRegistroParque').on('submit', function(event) {
                event.preventDefault();
                var action_url = "/gestion-parques/post-nuevo-registro";
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
                            $('#formularioRegistroParque')[0].reset();

                        }
                        $('#respuesta').html(html);
                        $("#confirmacionDeRegistro").modal("show");

                    }
                });
            });


        });

    </script>
@endpush
