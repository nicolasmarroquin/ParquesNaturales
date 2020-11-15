@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-9">
            <div class="card">
                <div class="card-header">{{ __('Solicitud de reserva') }}</div>

                <div class="card-body">
                    <form>
                        <div class="form-group">
                          <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Nombres y Apellidos">
                        </div>
                        <div class="form-group">
                            <input type="number" class="form-control" id="exampleFormControlInput1" placeholder="Identificación">
                        </div>
                        <div class="form-group">
                            <input type="email" class="form-control" id="exampleFormControlInput1" placeholder="correo@correo.com">
                        </div>
                        <div class="form-group">
                            <label for="fecha_nacimiento">Fecha de Nacimiento</label>
                            <input type="date" class="form-control" id="fecha_nacimiento" >
                        </div>
                        <div class="form-group">
                          <label for="exampleFormControlSelect1">Género</label>
                          <select class="form-control" id="exampleFormControlSelect1">
                            <option>Masculino</option>
                            <option>Femenino</option>
                            <option>Otro</option>
                          </select>
                        </div>
                        <div class="form-group">
                            <input type="number" class="form-control" id="exampleFormControlInput1" placeholder="Teléfono de contacto">
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlSelect1">Servicios Disponibles</label>
                            <select class="form-control" id="exampleFormControlSelect1">
                                @foreach ($servicios as $servicio )
    
    
                                <option value="{{$servicio -> id_servicio }}">{{$servicio -> nombre_servicio }}</option>
                            
                            
                                @endforeach
                            </select>
                          </div>
                          <div class="form-group">
                            <input type="number" class="form-control" id="exampleFormControlInput1" placeholder="Cantidad de acompañantes">
                        </div>
                        <div class="form-group">
                            <label for="inicio_reserva">Inicio de la reserva</label>
                            <input type="datetime-local" class="form-control" id="inicio_reserva" >
                        </div>
                        <div class="form-group">
                            <label for="fin_reserva">Fin de la reserva</label>
                            <input type="datetime-local" class="form-control" id="fin _reserva" >
                        </div>
                        <button type="submit" class="btn btn-primary">Solicitar</button>
                      </form>
                </div>
            </div>

        </div>
    </div>
</div>
@endsection
